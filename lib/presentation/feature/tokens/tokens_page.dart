import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/product/product_model.dart';
import 'package:it_real_app/presentation/feature/home/home_page.dart';
import 'package:it_real_app/presentation/feature/tokens/bloc/tokens_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/device_layout_builder.dart';
import 'package:it_real_app/presentation/shared/widgets/footer.dart';
import 'package:it_real_app/presentation/shared/widgets/header.dart';

part 'tokens_page_mobile.dart';
part 'tokens_page_desk.dart';

class TokensPage extends StatelessWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt.get<TokensBloc>()
          ..add(
            const TokensEvent.started(),
          ),
        child: DeviceLayoutBuilder(
          layoutBuilder: (isMobile) => Scaffold(
            body: isMobile ? const TokensPageMobile() : const TokensPageDesk(),
          ),
        ));
  }

  static Widget buyPackageBtn(BuildContext context, {bool isMobile = false}) {
    final selectedProduct = context.read<TokensBloc>().state.selectedProduct;
    return btnFilledWithIcon(
      isMobile: isMobile,
      onPressed: selectedProduct != null
          ? () {
              context.read<TokensBloc>().add(
                    TokensEvent.buyProduct(
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
