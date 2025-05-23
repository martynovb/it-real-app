import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/payment_metadata/payment_metadata_model.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/data/network/network_constants.dart';
import 'package:it_real_app/domain/data_source/products_data_source.dart';
import 'package:it_real_app/domain/exceptions/exceptions.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../presentation/shared/di/names/checkout_name.dart';

@Named(CheckoutName.stripe)
@Singleton(as: ProductsDataSource)
class StripeProductsRepo extends ProductsDataSource {
  final SupabaseClient supabaseClient;

  StripeProductsRepo({
    required this.supabaseClient,
  });

  @override
  Future<T> buyProduct<T extends PaymentMetadaModel>({
    required ProductModel productModel,
  }) async {
    final response = await supabaseClient.functions.invoke(
      SupabaseConstants.edgeFuncStripeCreatePayment,
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
    final response = await supabaseClient.functions.invoke(
      SupabaseConstants.edgeFuncStripeGetAllProducts,
      method: HttpMethod.get,
    );

    if (response.data is Map && response.data['products'] != null) {
      return (response.data['products'] as List)
          .map((entityMap) => ProductModel.fromJson(entityMap))
          .toList()
          .sorted(
            (a, b) => a.quantity.compareTo(b.quantity),
          );
    }

    throw ServerException(message: 'Failed to generate payment metadata');
  }
}
