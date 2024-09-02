
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/presentation/feature/products/bloc/products_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/device_layout_builder.dart';
import 'package:it_real_app/presentation/shared/widgets/footer.dart';
import 'package:it_real_app/presentation/shared/widgets/header.dart';

part 'products_page_mobile.dart';
part 'products_page_desk.dart';

class ProdcutsPage extends StatelessWidget {
  const ProdcutsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<ProductsBloc>()
          ..add(
            const ProductsEvent.started(),
          ),
        child: DeviceLayoutBuilder(
          layoutBuilder: (isMobile) => Scaffold(
            body: isMobile
                ? const ProductsPageMobile()
                : const ProductssPageDesk(),
          ),
        ));
  }

  static Widget buyPackageBtn(BuildContext context, {bool isMobile = false}) {
    final selectedProduct = context.read<ProductsBloc>().state.selectedProduct;
    return btnFilledWithIcon(
      isMobile: isMobile,
      onPressed: selectedProduct != null
          ? () {
              context.read<ProductsBloc>().add(
                    ProductsEvent.buyProduct(
                      productModel: selectedProduct,
                    ),
                  );
            }
          : null,
      context: context,
      text: LocaleKeys.buyPackage.tr(),
      postfixWidget: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Center(
          child: SvgPicture.asset(
            AppIcons.iconArrowRight,
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.onPrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
