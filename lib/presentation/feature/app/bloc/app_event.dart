part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.appStarted() = _AppStarted;
  const factory AppEvent.contactSupport() = _ContactSupport;
  const factory AppEvent.openTermsOfService() = _OpenTermsOfService;
  const factory AppEvent.openPrivacyPolicy() = _OpenPrivacyPolicy;
}
