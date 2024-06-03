part of 'tokens_bloc.dart';

@freezed
class TokensState with _$TokensState {
  const factory TokensState({
    required FormzSubmissionStatus status,
    required String? errorMessage,
    required UserModel user,
    required List<ProductModel> products,
  }) = _TokensState;
}
