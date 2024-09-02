import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/report/report_model.dart';
import 'package:it_real_app/domain/data_source/verification_data_source.dart';
import 'package:it_real_app/domain/exceptions/exceptions.dart';

part 'photo_verification_bloc.freezed.dart';

part 'photo_verification_event.dart';

part 'photo_verification_state.dart';

@Singleton()
class PhotoVerificationBloc
    extends Bloc<PhotoVerificationEvent, PhotoVerificationState> {
  static const Duration _checkDuration = Duration(seconds: 2);

  final VerificationDataSource verificationDataSource;

  PhotoVerificationBloc({
    required this.verificationDataSource,
  }) : super(
          const PhotoVerificationState(
            steps: PhotoVerificationState.initialSteps,
            status: FormzSubmissionStatus.initial,
          ),
        ) {
    on<_VerifyPhoto>(_onVerifyPhoto);
    on<_Reset>(_onReset);
  }

  Future<void> _onReset(
    _Reset event,
    Emitter<PhotoVerificationState> emit,
  ) async {
    emit(
      const PhotoVerificationState(
        steps: PhotoVerificationState.initialSteps,
        status: FormzSubmissionStatus.initial,
      ),
    );
  }

  Future<void> _onVerifyPhoto(
    _VerifyPhoto event,
    Emitter<PhotoVerificationState> emit,
  ) async {
    try {
      emit(
        const PhotoVerificationState(
          status: FormzSubmissionStatus.inProgress,
          steps: {
            PhotoVerificationStatus.aiCheck: FormzSubmissionStatus.inProgress,
            PhotoVerificationStatus.databaseCheck:
                FormzSubmissionStatus.initial,
            PhotoVerificationStatus.resultPreparation:
                FormzSubmissionStatus.initial,
          },
        ),
      );

      final completer = Completer<void>();

      await Future.delayed(_checkDuration, completer.complete);

      final report = await verificationDataSource.verifyPhoto(
        photoFile: event.photoFile,
      );

      await completer.future;

      emit(
        PhotoVerificationState(
          status: FormzSubmissionStatus.inProgress,
          steps: {
            PhotoVerificationStatus.aiCheck: report.aiGenerated
                ? FormzSubmissionStatus.failure
                : FormzSubmissionStatus.success,
            PhotoVerificationStatus.databaseCheck:
                FormzSubmissionStatus.inProgress,
            PhotoVerificationStatus.resultPreparation:
                FormzSubmissionStatus.initial,
          },
        ),
      );

      await Future.delayed(_checkDuration);

      emit(
        PhotoVerificationState(
          status: FormzSubmissionStatus.inProgress,
          steps: {
            PhotoVerificationStatus.aiCheck: report.aiGenerated
                ? FormzSubmissionStatus.failure
                : FormzSubmissionStatus.success,
            PhotoVerificationStatus.databaseCheck: report.matchInDb
                ? FormzSubmissionStatus.failure
                : FormzSubmissionStatus.success,
            PhotoVerificationStatus.resultPreparation:
                FormzSubmissionStatus.inProgress,
          },
        ),
      );

      await Future.delayed(_checkDuration);

      emit(
        PhotoVerificationState(
          status: FormzSubmissionStatus.success,
          steps: {
            PhotoVerificationStatus.aiCheck: report.aiGenerated
                ? FormzSubmissionStatus.failure
                : FormzSubmissionStatus.success,
            PhotoVerificationStatus.databaseCheck: report.matchInDb
                ? FormzSubmissionStatus.failure
                : FormzSubmissionStatus.success,
            PhotoVerificationStatus.resultPreparation:
                FormzSubmissionStatus.success,
          },
          report: report,
        ),
      );
    } catch (e) {
      emit(
        PhotoVerificationState(
          status: FormzSubmissionStatus.failure,
          steps: PhotoVerificationState.initialSteps,
          exception: handleException(e),
        ),
      );
    }
  }
}
