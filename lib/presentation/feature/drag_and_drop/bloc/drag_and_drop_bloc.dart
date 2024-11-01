import 'dart:async';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/presentation/shared/utils/bytes_converter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:image_picker/image_picker.dart';
part 'drag_and_drop_bloc.freezed.dart';

part 'drag_and_drop_event.dart';

part 'drag_and_drop_state.dart';

@Injectable()
class DragAndDropBloc extends Bloc<DragAndDropEvent, DragAndDropState> {
  static const maxFileSizeInBytes = 10 * 1024 * 1024;
  static const chunkLoadingDelay = Duration(milliseconds: 500);
  static final Map<FileFormat, String> formats = {
    Formats.jpeg: '.jpeg',
    Formats.png: '.png',
    Formats.heic: '.heic',
  };

  final ImagePicker imagePicker;
  Completer? imageUploadingCompleter;

  DragAndDropBloc({
    required this.imagePicker,
  }) : super(
          const DragAndDropState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        ) {
    on<_PickImage>(_onPickImage);
    on<_PickImageIosWeb>(_onPickImageIosWeb);
    on<_PerformDrop>(_onPerformDrop);
    on<_UpdateProgress>(_onUpdateProgress);
    on<_Reset>(_onReset);
  }

  Future<void> _onPickImageIosWeb(
    _PickImageIosWeb event,
    Emitter<DragAndDropState> emit,
  ) async {
    if (state.status == FormzSubmissionStatus.inProgress) {
      return;
    }

    final imageFile = event.image;

    emit(
      const DragAndDropState(
        status: FormzSubmissionStatus.inProgress,
        errorMessage: null,
        photoFile: null,
        progress: null,
        fileName: null,
        fileFormat: null,
      ),
    );

    if (imageFile == null) {
      add(const _Reset());
      return;
    }

    final fileName = imageFile.name.split('.').first;
    final fileFormat = formats.entries
        .firstWhere(
          (entry) => imageFile.name.endsWith(entry.value),
          orElse: () => formats.entries.first,
        )
        .key;
    final bytes = await imageFile.readAsBytes();

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
        photoFile: imageFile,
        fileName: fileName,
        fileFormat: fileFormat,
        fileSizeInMb: BytesConverter.formatBytes(bytes.length, 2),
      ),
    );
  }

  Future<void> _onPickImage(
    _PickImage event,
    Emitter<DragAndDropState> emit,
  ) async {
    if (state.status == FormzSubmissionStatus.inProgress) {
      return;
    }

    final XFile? imageFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    emit(
      const DragAndDropState(
        status: FormzSubmissionStatus.inProgress,
        errorMessage: null,
        photoFile: null,
        progress: null,
        fileName: null,
        fileFormat: null,
      ),
    );

    if (imageFile == null) {
      add(const _Reset());
      return;
    }

    final fileName = imageFile.name.split('.').first;
    final fileFormat = formats.entries
        .firstWhere(
          (entry) => imageFile.name.endsWith(entry.value),
          orElse: () => formats.entries.first,
        )
        .key;
    final bytes = await imageFile.readAsBytes();

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.success,
        photoFile: imageFile,
        fileName: fileName,
        fileFormat: fileFormat,
        fileSizeInMb: BytesConverter.formatBytes(bytes.length, 2),
      ),
    );
  }

  Future<void> _onUpdateProgress(
    _UpdateProgress event,
    Emitter<DragAndDropState> emit,
  ) async {
    emit(
      state.copyWith(
        progress: event.progress,
      ),
    );
  }

  Future<void> _onReset(
    _Reset onResetEvent,
    Emitter<DragAndDropState> emit,
  ) async {
    if (imageUploadingCompleter?.isCompleted == false) {
      imageUploadingCompleter?.complete();
    }
    emit(
      const DragAndDropState(
        status: FormzSubmissionStatus.initial,
        errorMessage: null,
        photoFile: null,
        progress: null,
        fileName: null,
        fileFormat: null,
      ),
    );
  }

  Future<void> _onPerformDrop(
    _PerformDrop onPerformDropEvent,
    Emitter<DragAndDropState> emit,
  ) async {
    if (state.status == FormzSubmissionStatus.inProgress) {
      return;
    }

    if (imageUploadingCompleter?.isCompleted == false) {
      imageUploadingCompleter?.complete();
    }

    emit(
      state.copyWith(
        status: FormzSubmissionStatus.inProgress,
        errorMessage: null,
        photoFile: null,
        progress: null,
        fileName: null,
        fileFormat: null,
      ),
    );

    imageUploadingCompleter = Completer<void>();

    final event = onPerformDropEvent.event;

    final item = event.session.items.first;

    final reader = item.dataReader;
    if (reader == null) {
      return;
    }

    for (FileFormat format in formats.keys) {
      if (!reader.canProvide(format)) continue;
      reader.getFile(
        format,
        (file) async {
          try {
            final fileSize = file.fileSize;
            final fileName = file.fileName?.split('.').first;
            if (fileSize == null || fileSize > maxFileSizeInBytes) {
              emit(
                const DragAndDropState(
                  status: FormzSubmissionStatus.failure,
                  errorMessage: null,
                ),
              );
              imageUploadingCompleter?.completeError('Error');
              return;
            }

            final bytes = <int>[];

            int progressPercent = 0;
            await for (final chunk in file.getStream()) {
              bytes.addAll(chunk);
              progressPercent = (bytes.length / fileSize * 100).toInt();
              emit(
                state.copyWith(
                  fileName: fileName ?? 'file',
                  fileFormat: format,
                  fileSizeInMb: BytesConverter.formatBytes(fileSize, 2),
                  progress: progressPercent,
                  status: FormzSubmissionStatus.inProgress,
                ),
              );

              await Future.delayed(chunkLoadingDelay);
            }

            if (bytes.isEmpty) {
              emit(
                const DragAndDropState(
                  status: FormzSubmissionStatus.failure,
                  errorMessage: null,
                ),
              );
              imageUploadingCompleter?.completeError('Error');
              return;
            }

            final image = XFile.fromData(
              Uint8List.fromList(bytes),
              name: file.fileName,
            );

            emit(
              state.copyWith(
                status: FormzSubmissionStatus.success,
                photoFile: image,
                progress: 100,
              ),
            );
            imageUploadingCompleter?.complete();
          } catch (e) {
            await Sentry.captureException(e);
            imageUploadingCompleter?.completeError(e);
            emit(
              state.copyWith(
                status: FormzSubmissionStatus.failure,
                errorMessage: e.toString(),
              ),
            );
          }
        },
        onError: (error) {
          imageUploadingCompleter?.completeError(error);
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              errorMessage: 'File size is null',
            ),
          );
        },
      );

      await imageUploadingCompleter?.future;
    }
  }
}
