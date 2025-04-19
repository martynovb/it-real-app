import 'dart:async';
import 'dart:js_interop';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';

import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/payment_metadata/payment_metadata_model.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/domain/data_source/products_data_source.dart';
import 'package:it_real_app/targets/run_configurations.dart';

import '../../../data/models/product/product_model.dart';
import '../../../presentation/shared/di/names/checkout_name.dart';
import 'checkout_manager.dart';

@JS('Paddle.Environment.set')
external void setEnvironment(String environment);

@JS('Paddle.Initialize')
external void paddleInitialize(JSObject? options);

@JS('Paddle.Checkout.open')
external void openCheckout(JSObject? options);

@JS('Paddle.Checkout.close')
external void closeCheckout();

@Named(CheckoutName.paddle)
@Injectable(as: CheckoutManager)
class PaddleCheckoutManager implements CheckoutManager {
  final ProductsDataSource productsDataSource;

  PaddleCheckoutManager({
    @Named(CheckoutName.paddle) required this.productsDataSource,
  });

  void initPaddleOnJS(String token) {
    setEnvironment('sandbox');
    paddleInitialize(jsify({
      'token': token,
    }));
  }

  Future<void> purchaseSubscription({
    required String transactionId,
    required String email,
    required String userId,
  }) async {
    final completer = Completer<void>();
    final checkoutOptions = jsify({
      'transactionId': transactionId,
      'email': email,
      'passthrough': userId,
      'successCallback': allowInterop((event) => completer.complete()),
      'closeCallback':
          allowInterop((event) => completer.completeError('Checkout closed')),
      'errorCallback': allowInterop((event) {
        closeCheckout();
        completer.completeError(
          'Checkout error: ${event['error'] ?? 'Unknown error'}',
        );
      }),
    });
    openCheckout(checkoutOptions);
    return completer.future;
  }

  @override
  Future<void> openPaymentCheckout({
    required UserModel currentUser,
    required ProductModel productModel,
  }) async {
    try {
      initPaddleOnJS(RunConfigurations.paddleToken);

      final paymentMetadata =
          await productsDataSource.buyProduct<PaddlePaymentMetadaModel>(
        productModel: productModel,
      );

      await purchaseSubscription(
        transactionId: paymentMetadata.transactionId,
        email: currentUser.email,
        userId: currentUser.id,
      );
    } catch (e) {
      rethrow;
    }
  }
}
