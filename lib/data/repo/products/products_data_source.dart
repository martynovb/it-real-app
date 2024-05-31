import 'package:it_real_app/data/models/payment_metadata/payment_metadata_model.dart';
import 'package:it_real_app/data/models/product/product_model.dart';

abstract class ProductsDataSource {
  Future<List<ProductModel>> getAllProducts();

  Future<PaymentMetadaModel> buyProduct({
    required ProductModel productModel,
  });
}
