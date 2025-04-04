import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/payment_metadata/payment_metadata_model.dart';

import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/data_source/products_data_source.dart';
import '../../../domain/exceptions/exceptions.dart';
import '../../../targets/run_configurations.dart';
import '../../network/network_constants.dart';

@Named("paypal")
@Singleton(as: ProductsDataSource)
class PaypalProductsRepo extends ProductsDataSource {
  final SupabaseClient supabaseClient;

  PaypalProductsRepo({
    required this.supabaseClient,
  });
  @override
  Future<PaymentMetadaModel> buyProduct({
    required ProductModel productModel,
  }) async {
    final response = await supabaseClient.functions.invoke(
      SupabaseConstants.edgeFuncCreatePaypalOrder,
      method: HttpMethod.post,
      body: {
        'productId': productModel.productId,
        'redirectUrl': RunConfigurations.redirectUrl,
      },
    );

    if (response.data is Map) {
      return PaymentMetadaModel.fromJson(response.data);
    }

    throw ServerException(message: 'Failed to generate payment metadata');
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    final products = await supabaseClient.from('products').select();
    return products
        .map((dataMap) => ProductModel.fromSupabase(dataMap))
        .toList();
  }
}
