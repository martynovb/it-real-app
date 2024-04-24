part of 'photo_verification_bloc.dart';

enum PhotoVerificationStatus {
  aiCheck,
  databaseCheck,
  resultPreparation,
}

@freezed
class PhotoVerificationState with _$PhotoVerificationState {
  const factory PhotoVerificationState({
    required Map<PhotoVerificationStatus, FormzSubmissionStatus> steps,
    ReportModel? report,
    required FormzSubmissionStatus status,
    BaseException? exception,
  }) = _PhotoVerificationState;

  static const initialSteps = {
    PhotoVerificationStatus.aiCheck: FormzSubmissionStatus.initial,
    PhotoVerificationStatus.databaseCheck: FormzSubmissionStatus.initial,
    PhotoVerificationStatus.resultPreparation: FormzSubmissionStatus.initial,
  };
}
