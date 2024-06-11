part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required FormzSubmissionStatus status,
    required String? errorMessage,
    FieldValidationErrorModel? emailError,
  }) = _ForgotPasswordState;
}
