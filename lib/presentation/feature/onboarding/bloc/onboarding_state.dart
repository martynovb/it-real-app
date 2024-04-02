part of 'onboarding_bloc.dart';

@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState({
    required FormzSubmissionStatus status,
    required String? errorMessage,
  }) = _OnboardingState;
}
