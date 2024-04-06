import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/token/token_model.dart';
import 'package:it_real_app/data/repo/tokens/tokens_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: TokensDataSource)
class TokensRepo extends TokensDataSource {
  final SupabaseClient supabaseClient;

  TokensRepo({
    required this.supabaseClient,
  });

  @override
  Future<void> buyTokens({
    required int count,
    required int price,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<List<TokenModel>> getTokenPrices() {
    throw UnimplementedError();
  }
}
