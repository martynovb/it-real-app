part of 'reset_password_bloc.dart';

@freezed
class ResetPasswordState with _$ResetPasswordState {
  const factory ResetPasswordState({
    required FormzSubmissionStatus status,
    required bool isExpired,
    String? errorMessage,
    FieldValidationErrorModel? passwordError,
    FieldValidationErrorModel? repeatPasswordError,
  }) = _ResetPasswordState;

}
