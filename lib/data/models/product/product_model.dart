import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required String productId,
    required String priceId,
    required String name,
    required int quantity,
    required double price,
  }) = _ProductModel;

  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  factory ProductModel.fromSupabase(Map<String, dynamic> json) => 
      ProductModel(
        productId: json['id'] ?? '',
        priceId:json['priceId'] ?? '',
        name: json['name'] as String,
        quantity: int.tryParse((json['quantity'] ?? '0')) ?? 0,
        price: (json['price'] as num).toDouble(),
      );

  static const empty = ProductModel(
    productId: '',
    priceId: '',
    name: '',
    quantity: 0,
    price: 0,
  );
}
