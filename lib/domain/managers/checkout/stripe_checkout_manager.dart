import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/payment_metadata/payment_metadata_model.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/domain/data_source/products_data_source.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../presentation/shared/di/names/checkout_name.dart';
import 'checkout_manager.dart';

@Named(CheckoutName.stripe)
@Injectable(as: CheckoutManager)
class StripeCheckoutManager implements CheckoutManager {
  final ProductsDataSource productsDataSource;

  StripeCheckoutManager({
    @Named(CheckoutName.stripe) required this.productsDataSource,
  });

  @override
  Future<void> openPaymentCheckout({
    required UserModel currentUser,
    required ProductModel productModel,
  }) async {
    final paymentMetada =
        await productsDataSource.buyProduct<StripePaymentMetadaModel>(
      productModel: productModel,
    );

    launchUrl(
      Uri.parse(paymentMetada.paymentLink),
      webOnlyWindowName: '_self',
    );
  }
}
