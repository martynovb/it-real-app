part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required FormzSubmissionStatus status,
    required AuthenticationStatus authStatus,
    required ThemeData themeData,
    required String? errorMessage,
  }) = _AppState;
}