
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart';
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

const String _logoutOption = 'logoutOption';
const String _deleteAccountOption = 'deleteAccountOption';
const String _contactSupportOption = 'constctSupportOption';

enum HeaderOption { buy, account, none }

Widget headerDesktop({
  required BuildContext context,
  required UserModel user,
  VoidCallback? onBalanceTap,
  HeaderOption currentOption = HeaderOption.none,
}) {
  final acountBtnGlobalKey = GlobalKey();
  return Padding(
    key: acountBtnGlobalKey,
    padding: const EdgeInsets.only(
      top: 16,
      left: 40,
      right: 40,
    ),
    child: Container(
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 12,
        right: 12,
        left: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.almostBlack
            : AppColors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.faceRecognition,
            width: 48,
          ),
          AppDimensions.sBoxW8,
          GestureDetector(
            onTap: () => context.go(RouteConstants.home.path),
            child: Text(
              LocaleKeys.appName.tr(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          const Spacer(),
          InkWell(
            onTap: onBalanceTap,
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.onTertiary,
                  width: 1.5,
                ),
                borderRadius: BorderRadius.circular(8),
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '${LocaleKeys.verificationsBalance.tr()}: ',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                      children: [
                        TextSpan(
                          text: user.id.isNotEmpty ? user.balance.toString() : '--',
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          AppDimensions.sBoxW16,
          btnOutlinedWithIcon(
            minWidth: 150,
            padding: const EdgeInsets.only(
              left: AppDimensions.btnOutlinedWithIconSidePaddings,
              right: AppDimensions.btnOutlinedWithIconSidePaddings,
            ),
            isMobile: false,
            isSelected: currentOption == HeaderOption.buy,
            prefixWidget: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: SvgPicture.asset(
                AppIcons.iconWallet,
                width: 24,
                colorFilter: ColorFilter.mode(
                  currentOption == HeaderOption.buy
                      ? AppColors.white
                      : AppColors.purple,
                  BlendMode.srcIn,
                ),
              ),
            ),
            context: context,
            text: LocaleKeys.buyVerifications.tr(),
            onPressed: () => context.go(RouteConstants.products.path),
          ),
          AppDimensions.sBoxW16,
          btnOutlinedWithIcon(
            minWidth: 150,
            padding: const EdgeInsets.only(
              left: AppDimensions.btnOutlinedWithIconSidePaddings,
              right: AppDimensions.btnOutlinedWithIconSidePaddings,
            ),
            isMobile: false,
            prefixWidget: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.settings,
                color: AppColors.purple,
                size: 24,
              ),
            ),
            context: context,
            text: LocaleKeys.settings.tr(),
            onPressed: () async {
              await _showAccountMenu(
                menuKey: acountBtnGlobalKey,
                context: context,
                onContactSupport: () {
                  context.read<AppBloc>().add(const AppEvent.contactSupport());
                },
                onDeleteAccount: () {
                  DialogsManager.showDeleteAccountDialog(
                    context: context,
                    isMobile: false,
                    onConfirm: () {
                      context.go(RouteConstants.onboarding.path);
                      context.read<AuthBloc>().add(
                            const AuthEvent.deleteAccount(),
                          );
                    },
                  );
                },
                onLogout: () {
                  DialogsManager.showLogoutDialog(
                    context: context,
                    isMobile: false,
                    onConfirm: () {
                      context.go(RouteConstants.onboarding.path);
                      context.read<AuthBloc>().add(const AuthEvent.logout());
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
  );
}

Widget headerMobile({
  required BuildContext context,
  required UserModel user,
  HeaderOption currentOption = HeaderOption.none,
  VoidCallback? onBalanceTap,
}) {
  final acountBtnGlobalKey = GlobalKey();

  return Padding(
    key: acountBtnGlobalKey,
    padding: const EdgeInsets.only(
      top: 16,
      left: 16,
      right: 16,
    ),
    child: Container(
      height: AppDimensions.headerHMobile,
      padding: const EdgeInsets.only(
        bottom: 12,
        top: 12,
        right: 12,
        left: 12,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).brightness == Brightness.dark
            ? AppColors.almostBlack
            : AppColors.white,
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            AppIcons.faceRecognition,
            width: 48,
          ),
          AppDimensions.sBoxW8,
          GestureDetector(
            onTap: () => context.go(RouteConstants.home.path),
            child: Text(
              LocaleKeys.appName.tr(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          const Spacer(),
          btnOutlinedWithIcon(
            minWidth: AppDimensions.balanceWBtnMobile,
            isSelected: currentOption == HeaderOption.buy,
            prefixWidget: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: SvgPicture.asset(
                AppIcons.iconWallet,
                width: 24,
                colorFilter: ColorFilter.mode(
                  currentOption == HeaderOption.buy
                      ? AppColors.white
                      : AppColors.purple,
                  BlendMode.srcIn,
                ),
              ),
            ),
            context: context,
            text: user.balance.toString(),
            onPressed: () {
              onBalanceTap?.call();
              context.go(RouteConstants.products.path);
            },
          ),
          AppDimensions.sBoxW8,
          btnOutlinedWithIcon(
            minWidth: AppDimensions.settingsWBtnMobile,
            postfixWidget: const Icon(
              Icons.settings,
              color: AppColors.purple,
              size: 24,
            ),
            context: context,
            onPressed: () async {
              await _showAccountMenu(
                menuKey: acountBtnGlobalKey,
                context: context,
                onContactSupport: () {
                  context.read<AppBloc>().add(const AppEvent.contactSupport());
                },
                onDeleteAccount: () {
                  DialogsManager.showDeleteAccountDialog(
                    context: context,
                    isMobile: true,
                    onConfirm: () {
                      context.go(RouteConstants.onboarding.path);
                      context
                          .read<AuthBloc>()
                          .add(const AuthEvent.deleteAccount());
                    },
                  );
                },
                onLogout: () {
                  DialogsManager.showLogoutDialog(
                    context: context,
                    isMobile: true,
                    onConfirm: () {
                      context.go(RouteConstants.onboarding.path);
                      context.read<AuthBloc>().add(const AuthEvent.logout());
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    ),
  );
}

Future<void> _showAccountMenu({
  required GlobalKey menuKey,
  required BuildContext context,
  required void Function() onContactSupport,
  required void Function() onDeleteAccount,
  required void Function() onLogout,
}) async {
  final RenderBox button =
      menuKey.currentContext!.findRenderObject() as RenderBox;
  final RenderBox overlay =
      Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      button.localToGlobal(const Offset(1, 100), ancestor: overlay),
      button.localToGlobal(
          button.size.bottomRight(
            Offset.zero,
          ),
          ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );

  final String? selectedOption = await showMenu<String>(
    context: context,
    position: position,
    items: [
      PopupMenuItem<String>(
        value: _contactSupportOption,
        child: _menuOptionItem(
          context: context,
          text: LocaleKeys.contactUs.tr(),
          icon: Icon(
            Icons.message,
            size: 24,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      PopupMenuItem<String>(
        value: _logoutOption,
        child: _menuOptionItem(
          context: context,
          text: LocaleKeys.logout.tr(),
          icon: Icon(
            Icons.logout,
            size: 24,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      PopupMenuItem<String>(
        value: _deleteAccountOption,
        child: _menuOptionItem(
          context: context,
          text: LocaleKeys.deleteAccount.tr(),
          color: Theme.of(context).colorScheme.error,
          icon: Icon(
            Icons.delete,
            size: 24,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ),
    ],
  );

  if (selectedOption == _deleteAccountOption) {
    onDeleteAccount();
  } else if (selectedOption == _logoutOption) {
    onLogout();
  } else if (selectedOption == _contactSupportOption) {
    onContactSupport();
  }
}

Widget _menuOptionItem({
  required BuildContext context,
  required String text,
  required Widget icon,
  Color? color,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 16,
    ),
    child: Row(
      children: <Widget>[
        icon,
        AppDimensions.sBoxW8,
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: color ?? Theme.of(context).colorScheme.onPrimary,
              ),
        ),
      ],
    ),
  );
}
