part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState({
    required FormzSubmissionStatus status,
    required AuthenticationStatus authStatus,
    required String? errorMessage,
  }) = _AuthState;
}
