part of 'products_page.dart';

class ProductsPageMobile extends StatelessWidget {
  const ProductsPageMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              headerMobile(
                context: context,
                user: state.user,
                currentOption: HeaderOption.buy,
              ),
              AppDimensions.sBoxH32,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.mobSidePadding),
                child: Text(
                  LocaleKeys.productsPageDescription.tr(),
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              AppDimensions.sBoxH32,
              state.products.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.purple,
                      ),
                    )
                  : _products(
                      context: context,
                      products: state.products,
                      selectedProduct: state.selectedProduct,
                    ),
              AppDimensions.sBoxH24,
              ProdcutsPage.buyPackageBtn(context),
              AppDimensions.sBoxH24,
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppDimensions.mobSidePadding),
                child: Text(
                  LocaleKeys.productsPageDescription2.tr(),
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onTertiary,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              const Spacer(),
              footer(context),
            ],
          ),
        );
      },
    );
  }

  Widget _products({
    required BuildContext context,
    required List<ProductModel> products,
    ProductModel? selectedProduct,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: products.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) => _productItem(
          context: context,
          product: products[index],
          selectedProduct: selectedProduct,
        ),
      ),
    );
  }

  Widget _productItem({
    required BuildContext context,
    required ProductModel product,
    required ProductModel? selectedProduct,
  }) {
    bool isSelected = selectedProduct?.productId == product.productId;

    return GestureDetector(
      onTap: () {
        context.read<ProductsBloc>().add(
              ProductsEvent.selectProduct(
                productModel: product,
              ),
            );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          border: Border.all(
            color: isSelected
                ? AppColors.purple
                : Theme.of(context).colorScheme.onTertiary,
            width: 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(27)),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.purple.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ]
              : [],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio<ProductModel?>(
                      value: selectedProduct,
                      groupValue: product,
                      onChanged: (value) {
                        context.read<ProductsBloc>().add(
                              ProductsEvent.selectProduct(
                                productModel: product,
                              ),
                            );
                      },
                      activeColor: AppColors.purple,
                    ),
                    const Spacer(),
                    _productTitle(
                      context: context,
                      product: product,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _productTitle({
    required BuildContext context,
    required ProductModel product,
  }) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text:
            '${product.quantity} ${product.quantity <= 1 ? LocaleKeys.verification.tr() : LocaleKeys.verifications.tr()}',
        style: Theme.of(context).textTheme.displayMedium?.copyWith(
              color: AppColors.grey5,
              decorationStyle: TextDecorationStyle.solid,
            ),
        children: [
          TextSpan(
            text: ' = ${product.priceInUnits / 100}\$',
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
          ),
        ],
      ),
    );
  }
}