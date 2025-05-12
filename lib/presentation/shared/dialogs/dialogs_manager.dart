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
  static BuildContext? _lastDialogContext;

  static void showNotEnoughBalanceDialog({
    required BuildContext context,
    required bool isMobile,
  }) {
    showCustomDialog(
      context: context,
      child: simple_dialog.SimpleDialog(
        isMobile: isMobile,
        title: Text(
          LocaleKeys.notEnoughVerifications.tr(),
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                color: AppColors.red,
              ),
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
            text: LocaleKeys.buyVerifications.tr(),
            onPressed: () => context.go(RouteConstants.products.path),
          )
        ],
      ),
    );
  }

  static void showErrorDialog({
    required BuildContext context,
    String? title,
    String? description,
    void Function()? onTap,
    List<Widget>? actions,
    bool isMobile = false,
  }) {
    showCustomDialog(
      context: context,
      child: simple_dialog.SimpleDialog(
        isMobile: isMobile,
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
      ),
    );
  }

  static void showInfoDialog({
    required BuildContext context,
    String? title,
    String? description,
    void Function()? onTap,
    List<Widget>? actions,
  }) {
    showCustomDialog(
      context: context,
      child: simple_dialog.SimpleDialog(
        isMobile: false,
        title: title != null
            ? Text(
                title,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: AppColors.green,
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
      ),
    );
  }

  static void showCustomDialog({
    required BuildContext context,
    required Widget child,
    bool asPage = false,
  }) {
    if (_lastDialogContext != null && _lastDialogContext!.mounted) {
      Navigator.pop(_lastDialogContext!);
      _lastDialogContext = null;
    }

    showDialog(
      context: context,
      builder: (context) {
        _lastDialogContext = context;
        return asPage
            ? _getPageDialog(
                context: context,
                page: child,
              )
            : child;
      },
    );
  }

  static Widget _getPageDialog({
    required BuildContext context,
    required Widget page,
  }) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: GestureDetector(
                onTap: () {},
                child: AlertDialog(
                  contentPadding: EdgeInsets.zero,
                  content: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppDimensions.borderRadius),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                        maxWidth: AppDimensions.maxMobileWidth,
                        minWidth: AppDimensions.minPageDialogWidth,
                      ),
                      child: page,
                    ),
                  ),
                ))));
  }

  static void showDeleteAccountDialog({
    required BuildContext context,
    required bool isMobile,
    required void Function() onConfirm,
  }) =>
      DialogsManager.showErrorDialog(
        context: context,
        isMobile: isMobile,
        title: LocaleKeys.deleteAccountDialogTitle.tr(),
        actions: [
          btnOutlined(
            padding: 0,
            minWidth: 150,
            context: context,
            text: LocaleKeys.cancel.tr(),
            onPressed: context.pop,
          ),
          AppDimensions.sBoxW24,
          btnFilled(
            padding: 0,
            minWidth: 150,
            context: context,
            text: LocaleKeys.confirm.tr(),
            onPressed: onConfirm,
          )
        ],
      );

  static void showLogoutDialog({
    required BuildContext context,
    required bool isMobile,
    required void Function() onConfirm,
  }) =>
      DialogsManager.showErrorDialog(
        isMobile: isMobile,
        context: context,
        title: LocaleKeys.logoutDialogTitle.tr(),
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
            text: LocaleKeys.confirm.tr(),
            onPressed: onConfirm,
          )
        ],
      );
}
