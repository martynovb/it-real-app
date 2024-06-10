import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/shared/dialogs/simple_dialog.dart'
    as simple_dialog;
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

abstract class DialogsManager {
  static void showNotEnoughBalanceDialog({
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return simple_dialog.SimpleDialog(
          title: Text(
            LocaleKeys.notEnoughTokens.tr(),
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: AppColors.red,
                ),
            textAlign: TextAlign.center,
          ),
          description: Text(
            LocaleKeys.notEnoughTokensDescription.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          actions: [
            btnOutlined(
              padding: 0,
              minWidth: 150,
              context: context,
              text: LocaleKeys.cancel.tr(),
              onPressed: () => context.pop(),
            ),
            AppDimensions.sBoxW24,
            btnFilled(
              padding: 0,
              minWidth: 150,
              context: context,
              text: LocaleKeys.buyTokens.tr(),
              onPressed: () => context.go(RouteConstants.products.path),
            )
          ],
        );
      },
    );
  }

  static void showErrorDialog({
    required BuildContext context,
    String? title,
    String? description,
    void Function()? onTap,
    List<Widget>? actions,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return simple_dialog.SimpleDialog(
          title: title != null
              ? Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: AppColors.red,
                      ),
                  textAlign: TextAlign.center,
                )
              : null,
          description: description != null
              ? Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                )
              : null,
          actions: actions ??
              [
                btnFilled(
                  padding: 0,
                  minWidth: 150,
                  context: context,
                  text: LocaleKeys.ok.tr(),
                  onPressed: onTap ?? () => context.pop(),
                ),
              ],
        );
      },
    );
  }
}
