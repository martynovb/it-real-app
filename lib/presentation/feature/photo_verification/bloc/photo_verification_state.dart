part of 'photo_verification_bloc.dart';

enum PhotoVerificationStatus {
  aiCheck,
  databaseCheck,
  resultPreparation,
}

@freezed
class PhotoVerificationState with _$PhotoVerificationState {
  const factory PhotoVerificationState({
    required FormzSubmissionStatus status,
    required PhotoVerificationStatus photoVerificationStatus,
  }) = _PhotoVerificationState;
}
