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
    @JsonKey(name: 'price')
    required int priceInUnits,
  }) = _ProductModel;

  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  static const empty = ProductModel(
    productId: '',
    priceId: '',
    name: '',
    quantity: 0,
    priceInUnits: 0,
  );
}
