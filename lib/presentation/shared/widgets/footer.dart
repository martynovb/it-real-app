import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:url_launcher/url_launcher.dart';

Widget footer(BuildContext context) {
  return Container(
    width: double.infinity,
    height: AppDimensions.footerHeight,
    color: Theme.of(context).brightness == Brightness.dark
        ? AppColors.grey2
        : AppColors.grey1,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () => context.go(RouteConstants.privacyPolicy.path),
              child: Text(
                LocaleKeys.privacyPolicy.tr(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
              ),
            ),
            TextButton(
              onPressed: () => context.go(RouteConstants.termsOfService.path),
              child: Text(
                LocaleKeys.termsOfService.tr(),
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
              ),
            ),
          ],
        ),
        AppDimensions.sBoxW16,
        Text(
            LocaleKeys.allRightsReserved.tr(args: [
              DateTime.now().year.toString(),
              LocaleKeys.appName.tr()
            ]),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                )),
      ],
    ),
  );
}
