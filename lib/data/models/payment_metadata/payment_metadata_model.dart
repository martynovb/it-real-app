import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_metadata_model.freezed.dart';
part 'payment_metadata_model.g.dart';

@freezed
class PaymentMetadaModel with _$PaymentMetadaModel {
  const factory PaymentMetadaModel.stripe({
    required String paymentLink,
  }) = StripePaymentMetadaModel;

  const factory PaymentMetadaModel.paddle({
    required String transactionId,
  }) = PaddlePaymentMetadaModel;

  const factory PaymentMetadaModel.paypal({
    required String paymentLink,
  }) = PaypalPaymentMetadaModel;

  const PaymentMetadaModel._();

  factory PaymentMetadaModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentMetadaModelFromJson(json);
}
