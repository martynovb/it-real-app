import 'dart:async';
import 'dart:js_interop';
// ignore: avoid_web_libraries_in_flutter
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/payment_metadata/payment_metadata_model.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/domain/data_source/products_data_source.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:rxdart/rxdart.dart';

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
@Singleton(as: CheckoutManager)
class PaddleCheckoutManager implements CheckoutManager {
  final BehaviorSubject<String> _paddleEventStream = BehaviorSubject<String>();
  StreamSubscription<String>? _paddleEventSubscription;
  final ProductsDataSource productsDataSource;
  bool _isInitialized = false;

  PaddleCheckoutManager({
    @Named(CheckoutName.paddle) required this.productsDataSource,
  });

  void _initPaddleOnJS({
    required String token,
    required String transactionId,
    required String email,
    required String userId,
  }) {
    if (_isInitialized) {
      debugPrint('Paddle already initialized, skipping initialization.');
      return;
    }

    setEnvironment('sandbox');
    _isInitialized = true;
    paddleInitialize(jsify({
      'token': token,
      'eventCallback': allowInterop((event) {
        final eventName = getProperty(event, 'name').toString().toLowerCase();
        _paddleEventStream.add(eventName);
      }),
    }));
  }

  Future<void> _openCheckout({
    required String transactionId,
    required String email,
    required String userId,
  }) async {
    final checkoutOptions = jsify({
      'transactionId': transactionId,
      'email': email,
      'passthrough': userId,
    });
    openCheckout(checkoutOptions);
  }

  @override
  Future<bool> openPaymentCheckout({
    required UserModel currentUser,
    required ProductModel productModel,
  }) async {
    final completer = Completer<bool>();

    _initPaddleOnJS(
      token: RunConfigurations.paddleToken,
      transactionId: productModel.priceId,
      email: currentUser.email,
      userId: currentUser.id,
    );

    _paddleEventSubscription = _paddleEventStream
        .skip(1)
        .debounceTime(const Duration(milliseconds: 300))
        .listen((eventName) {
      print('Paddle event: $eventName');

      if (completer.isCompleted) {
        print('Completer already completed, ignoring event: $eventName');
        return;
      }

      if (eventName == 'checkout.loaded') {
      } else if (eventName == 'checkout.closed') {
        closeCheckout();
        completer.complete(false);
        print('Checkout closed');
        return;
      } else if (eventName == 'checkout.completed') {
        closeCheckout();
        completer.complete(true);
        return;
      }
    });

    final paymentMetadata =
        await productsDataSource.buyProduct<PaddlePaymentMetadaModel>(
      productModel: productModel,
    );

    _openCheckout(
      transactionId: paymentMetadata.transactionId,
      email: currentUser.email,
      userId: currentUser.id,
    );

    return completer.future.whenComplete(() {
      _paddleEventSubscription?.cancel();
      _paddleEventSubscription = null;
    });
  }
}
