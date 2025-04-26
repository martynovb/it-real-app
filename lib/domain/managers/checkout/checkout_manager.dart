import 'dart:async';

import 'package:it_real_app/data/models/user/user_model.dart';

import '../../../data/models/product/product_model.dart';

abstract class CheckoutManager {
  Future<bool> openPaymentCheckout({
    required UserModel currentUser,
    required ProductModel productModel,
  });
}
