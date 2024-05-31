part of 'tokens_bloc.dart';

@freezed
class TokensEvent with _$TokensEvent {
  const factory TokensEvent.started() = _Started;

  const factory TokensEvent.buyProduct({required ProductModel productModel}) = _BuyTokens;

  const factory TokensEvent.error() = _Error;
}
