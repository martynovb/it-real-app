part of 'tokens_page.dart';

class TokensPageDesk extends StatelessWidget {
  const TokensPageDesk({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TokensBloc, TokensState>(
      builder: (context, state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              headerDesktop(context, state.user),
              AppDimensions.sBoxH100,
              _products(
                context: context,
                products: state.products,
                selectedProduct: state.selectedProduct,
              ),
              TokensPage.buyPackageBtn(context),
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
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
        ),
        child: IntrinsicHeight(
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            separatorBuilder: (context, index) => const SizedBox(width: 24),
            itemBuilder: (context, index) => _productItem(
              context: context,
              product: products[index],
              isSelected:
                  selectedProduct?.productId == products[index].productId,
            ),
          ),
        ),
      ),
    );
  }

  Widget _productItem({
    required BuildContext context,
    required ProductModel product,
    required bool isSelected,
  }) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      width: (MediaQuery.of(context).size.width -
              AppDimensions.deskSidePadding * 2 -
              24 * 4) /
          3,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        border: Border.all(
          color: Theme.of(context).colorScheme.onTertiary,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(27)),
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
              padding: const EdgeInsets.all(24.0),
              child: Text(
                '${product.quantity} ${product.quantity <= 1 ? LocaleKeys.check.tr() : LocaleKeys.checks.tr()} = ${product.priceInUnits/100}\$',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
