part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordEvent with _$ResetPasswordEvent {
  const factory ResetPasswordEvent.init({
    required Uri resetPasswordUri,
    required String error,
  }) = _Init;

  const factory ResetPasswordEvent.resetPassword({
    required String password,
    required String repeatPassword,
  }) = _ResetPassword;
}
