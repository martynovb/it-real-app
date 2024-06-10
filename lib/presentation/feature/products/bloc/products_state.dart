part of 'products_bloc.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    required FormzSubmissionStatus status,
    required String? errorMessage,
    required UserModel user,
    ProductModel? selectedProduct,
    required List<ProductModel> products,
  }) = _ProductsState;
}
