import 'package:collection/collection.dart';
import 'package:cross_file/cross_file.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart';
import 'package:it_real_app/presentation/feature/drag_and_drop/bloc/drag_and_drop_bloc.dart';
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:it_real_app/presentation/feature/drag_and_drop/drag_and_drop_area.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/feature/photo_verification/photo_verification_view.dart';
import 'package:it_real_app/presentation/shared/app_constants.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/app_loading_widget.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/device_layout_builder.dart';
import 'package:it_real_app/presentation/shared/widgets/footer.dart';

part 'home_page_mobile.dart';
part 'home_page_desk.dart';

class HomePage extends StatelessWidget {
  static const String _logoutOption = 'logoutOption';
  static const String _deleteAccountOption = 'deleteAccountOption';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DeviceLayoutBuilder(
      layoutBuilder: (isMobile) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => getIt.get<HomeBloc>()
                ..add(
                  const HomeEvent.started(),
                ),
            ),
            BlocProvider(
              create: (context) => getIt.get<DragAndDropBloc>(),
            ),
          ],
          child: Scaffold(
            body: isMobile ? const HomePageMobile() : const HomePageDesk(),
          ),
        );
      },
    );
  }

  static Future<void> showAccountMenu({
    required GlobalKey menuKey,
    required BuildContext context,
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
      DialogsManager.showErrorDialog(
        context: context,
        title: LocaleKeys.deleteAccountDialogTitle.tr(),
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
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.deleteAccount());
              context.go(RouteConstants.onboarding.path);
            },
          )
        ],
      );
    } else if (selectedOption == _logoutOption) {
      DialogsManager.showErrorDialog(
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
            onPressed: () {
              context.read<AuthBloc>().add(const AuthEvent.logout());
              context.go(RouteConstants.onboarding.path);
            },
          )
        ],
      );
    }
  }

  static Widget _menuOptionItem({
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
}
