part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;

  const factory HomeEvent.showTokensPurchaseDialog() =
      _ShowTokensPurchaseDialog;

  const factory HomeEvent.verifyPhoto(XFile photoFile) = _VerifyPhoto;
}
