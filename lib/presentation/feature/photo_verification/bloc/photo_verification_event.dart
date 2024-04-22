part of 'photo_verification_bloc.dart';

@freezed
class PhotoVerificationEvent with _$PhotoVerificationEvent {
  const factory PhotoVerificationEvent.verifyPhoto({required XFile photoFile}) = _VerifyPhoto;

  const factory PhotoVerificationEvent.error() = _Error;
}