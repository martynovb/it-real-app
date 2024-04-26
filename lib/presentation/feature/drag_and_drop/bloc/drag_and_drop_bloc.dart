import 'dart:typed_data';

import 'package:cross_file/cross_file.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';

part 'drag_and_drop_bloc.freezed.dart';

part 'drag_and_drop_event.dart';

part 'drag_and_drop_state.dart';

@Injectable()
class DragAndDropBloc extends Bloc<DragAndDropEvent, DragAndDropState> {
  static final Map<FileFormat, String> formats = {
    Formats.jpeg: '.jpeg',
    Formats.png: '.png',
    Formats.heic: '.heic',
  };

  DragAndDropBloc()
      : super(
          const DragAndDropState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
          ),
        ) {
    on<_PerformDrop>(_onPerformDrop);
    on<_UpdateProgress>(_onUpdateProgress);
    on<_Reset>(_onReset);
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
    emit(
      state.copyWith(
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
          final fileSize = file.fileSize;
          final fileName = file.fileName?.split('.').first;
          if (fileSize == null) {
            emit(
              const DragAndDropState(
                status: FormzSubmissionStatus.failure,
                errorMessage: null,
              ),
            );
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
                fileSize: fileSize,
                progress: progressPercent,
                status: FormzSubmissionStatus.inProgress
              ),
            );
          }

          if (bytes.isEmpty) {
            emit(
              const DragAndDropState(
                status: FormzSubmissionStatus.failure,
                errorMessage: null,
              ),
            );
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
        },
        onError: (error) {
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              errorMessage: 'File size is null',
            ),
          );
        },
      );
    }
  }
}
