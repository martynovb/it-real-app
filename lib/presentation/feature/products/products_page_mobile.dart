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
              ),
              const Spacer(),
              ProdcutsPage.buyPackageBtn(
                context,
                isMobile: true,
              ),
              const Spacer(),
              footer(context),
            ],
          ),
        );
      },
    );
  }
}
