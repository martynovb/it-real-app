part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required FormzSubmissionStatus status,
    required UserModel userModel,
    required String? errorMessage,
    required bool showTokensPurchaseDialog,
  }) = _HomeState;
}
