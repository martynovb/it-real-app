import 'package:it_real_app/data/models/token/token_model.dart';

abstract class TokensDataSource {
  Future<List<TokenModel>> getTokenPrices();

  Future<void> buyTokens({
    required int count,
    required int price,
  });
}
