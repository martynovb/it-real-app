part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.appStarted() = _AppStarted;
  const factory AppEvent.contactSupport() = _ContactSupport;
}
