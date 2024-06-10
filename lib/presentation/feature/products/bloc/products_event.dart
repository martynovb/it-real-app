part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.started() = _Started;

  const factory ProductsEvent.selectProduct({required ProductModel productModel}) = _SelectProduct;

  const factory ProductsEvent.buyProduct({required ProductModel productModel}) = _BuyProduct;

  const factory ProductsEvent.error() = _Error;
}
