part of 'sign_in_bloc.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState({
    required FormzSubmissionStatus status,
    required String? errorMessage,
    FieldValidationErrorModel? emailError,
    FieldValidationErrorModel? passwordError,
  }) = _SignInState;
}
