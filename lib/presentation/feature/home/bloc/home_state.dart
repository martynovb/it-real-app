part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required FormzSubmissionStatus status,
    required int tokens,
    required String? errorMessage,
  }) = _HomeState;
}
