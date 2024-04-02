part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.isAuthorized() = _IsAuthorized;

  const factory AuthEvent.loginWithGoogle() = _LoginWithGoogle;

  const factory AuthEvent.logout() = _Logout;
}
