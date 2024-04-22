import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/verification/verification_data_source.dart';

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
            photoVerificationStatus: PhotoVerificationStatus.aiCheck,
            status: FormzSubmissionStatus.inProgress,
          ),
        ) {
    on<_VerifyPhoto>(_onVerifyPhoto);
  }

  Future<void> _onVerifyPhoto(
    _VerifyPhoto event,
    Emitter<PhotoVerificationState> emit,
  ) async {
    emit(
      const PhotoVerificationState(
        photoVerificationStatus: PhotoVerificationStatus.aiCheck,
        status: FormzSubmissionStatus.inProgress,
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
        photoVerificationStatus: report.aiGenerated
            ? PhotoVerificationStatus.aiCheck
            : PhotoVerificationStatus.databaseCheck,
        status: report.aiGenerated
            ? FormzSubmissionStatus.failure
            : FormzSubmissionStatus.inProgress,
      ),
    );

    if (report.aiGenerated) {
      return;
    }

    await Future.delayed(_checkDuration);

    emit(
      PhotoVerificationState(
        photoVerificationStatus: report.matchInDb
            ? PhotoVerificationStatus.databaseCheck
            : PhotoVerificationStatus.resultPreparation,
        status: report.aiGenerated
            ? FormzSubmissionStatus.failure
            : FormzSubmissionStatus.inProgress,
      ),
    );

    await Future.delayed(_checkDuration);

    emit(
      const PhotoVerificationState(
        photoVerificationStatus: PhotoVerificationStatus.resultPreparation,
        status: FormzSubmissionStatus.success,
      ),
    );
  }
}
