part of 'sign_up_bloc.dart';

@freezed
class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.started() = _Started;
  const factory SignUpEvent.signUp({
    required String email,
    required String password,
    required String repeatPassword,
  }) = _SignUp;
  const factory SignUpEvent.countinueWithGoogle() = _CountinueWithGoogle;
}
