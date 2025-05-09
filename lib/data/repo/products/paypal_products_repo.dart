import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/payment_metadata/payment_metadata_model.dart';

import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../domain/data_source/products_data_source.dart';
import '../../../domain/exceptions/exceptions.dart';
import '../../../presentation/shared/di/names/checkout_name.dart';
import '../../../targets/run_configurations.dart';
import '../../network/network_constants.dart';

@Named(CheckoutName.paypal)
@Singleton(as: ProductsDataSource)
class PaypalProductsRepo extends ProductsDataSource {
  final SupabaseClient supabaseClient;

  PaypalProductsRepo({
    required this.supabaseClient,
  });
  @override
  Future<T> buyProduct<T extends PaymentMetadaModel>({
    required ProductModel productModel,
  }) async {
    final response = await supabaseClient.functions.invoke(
      SupabaseConstants.edgeFuncPaddleCreatePayment,
      method: HttpMethod.post,
      body: {
        'priceId': productModel.priceId,
        'quantity': productModel.quantity,
        'redirectUrl': RunConfigurations.redirectUrl,
      },
    );

    if (response.data is Map) {
      return PaymentMetadaModel.stripe(
        paymentLink: response.data['paymentLink'],
      ) as T;
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
