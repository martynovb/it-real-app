part of 'app_bloc.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required FormzSubmissionStatus status,
    required ThemeMode themeMode,
    required String? errorMessage,
  }) = _AppState;
}
