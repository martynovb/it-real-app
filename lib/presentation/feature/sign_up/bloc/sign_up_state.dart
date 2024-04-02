part of 'sign_up_bloc.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState({
    required FormzSubmissionStatus status,
    required String? errorMessage,
  }) = _SignUpState;
}
