import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:it_real_app/presentation/feature/sign_in/sign_in_page.dart';
import 'package:it_real_app/presentation/feature/sign_up/sign_up_page.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/device_layout_builder.dart';
import 'package:it_real_app/presentation/shared/widgets/footer.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<OnboardingBloc>(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return DeviceLayoutBuilder(
            layoutBuilder: (isMobile) => Scaffold(
              body: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverToBoxAdapter(
                    child: _header(context, isMobile),
                  ),
                  SliverToBoxAdapter(
                    child: _content(context, isMobile),
                  ),
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      children: [
                        const Spacer(),
                        footer(context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _content(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.only(
        top: isMobile ? 24 : MediaQuery.of(context).size.height * 0.1,
        right: isMobile ? 16 : 44,
        left: isMobile ? 16 : 44,
      ),
      child: Column(
        children: [
          Container(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Text(
              '${LocaleKeys.oboardingTitleDescription.tr()}:',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
          ),
          isMobile ? AppDimensions.sBoxH24 : AppDimensions.sBoxH60,
          _steps(context),
          isMobile ? AppDimensions.sBoxH24 : AppDimensions.sBoxH56,
          btnFilledWithIcon(
            isMobile: isMobile,
            context: context,
            padding: const EdgeInsets.only(left: 24, right: 8),
            minHeight: AppDimensions.getStartedBtnH,
            maxWidth: isMobile
                ? double.infinity
                : AppDimensions.getStartedDesktopBtnWidth,
            text: LocaleKeys.getStartedNow.tr(),
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
            onPressed: () => isMobile
                ? context.go(RouteConstants.signUp.path)
                : DialogsManager.showCustomDialog(
                    context: context,
                    child: SignUpPage(
                      isDialog: true,
                    ),
                    asPage: true,
                  ),
          ),
          AppDimensions.sBoxH24
        ],
      ),
    );
  }

  Widget _header(BuildContext context, bool isMobile) {
    return isMobile ? _headerWebMobile(context) : _headerDesktop(context);
  }

  Widget _headerWebMobile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
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
              width: 40,
            ),
            AppDimensions.sBoxW8,
            Text(
              LocaleKeys.appName.tr(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const Spacer(),
            Expanded(
              child: btnOutlined(
                context: context,
                text: LocaleKeys.signIn.tr(),
                onPressed: () => context.go(RouteConstants.signIn.path),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerDesktop(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 44,
        right: 44,
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
            Text(
              LocaleKeys.appName.tr(),
              style: Theme.of(context).textTheme.displayLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
            ),
            const Spacer(),
            btnOutlined(
              context: context,
              text: LocaleKeys.signIn.tr(),
              isMobile: false,
              onPressed: () => DialogsManager.showCustomDialog(
                context: context,
                child: SignInPage(
                  isDialog: true,
                ),
                asPage: true,
              ),
            ),
            AppDimensions.sBoxW16,
            btnFilled(
              context: context,
              text: LocaleKeys.signUp.tr(),
              isMobile: false,
              onPressed: () => DialogsManager.showCustomDialog(
                context: context,
                child: SignUpPage(
                  isDialog: true,
                ),
                asPage: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _steps(BuildContext context) {
    return DeviceLayoutBuilder(
      layoutBuilder: (isMobile) =>
          isMobile ? _setepsColumn(context) : _stepsRow(context),
    );
  }

  Widget _stepsRow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16,
        left: 16,
        right: 16,
      ),
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _stepDesktop(
              context: context,
              stepTitle: '1 ${LocaleKeys.step.tr()}:',
              stepDescription: LocaleKeys.step1Description.tr(),
              iconPah: AppIcons.iconInsights,
            ),
            AppDimensions.sBoxW24,
            _stepDesktop(
              context: context,
              stepTitle: '2 ${LocaleKeys.step.tr()}:',
              stepDescription: LocaleKeys.step2Description.tr(),
              iconPah: AppIcons.iconSearch,
            ),
            AppDimensions.sBoxW24,
            _stepDesktop(
              context: context,
              stepTitle: '3 ${LocaleKeys.step.tr()}:',
              stepDescription: LocaleKeys.step3Description.tr(),
              iconPah: AppIcons.iconReport,
            ),
          ],
        ),
      ),
    );
  }

  Widget _setepsColumn(BuildContext context) {
    return Column(
      children: [
        _stepMobile(
          context: context,
          stepTitle: '1 ${LocaleKeys.step.tr()}:',
          stepDescription: LocaleKeys.step1Description.tr(),
          iconPah: AppIcons.iconInsights,
        ),
        AppDimensions.sBoxH12,
        _stepMobile(
          context: context,
          stepTitle: '2 ${LocaleKeys.step.tr()}:',
          stepDescription: LocaleKeys.step2Description.tr(),
          iconPah: AppIcons.iconSearch,
        ),
        AppDimensions.sBoxH12,
        _stepMobile(
          context: context,
          stepTitle: '3 ${LocaleKeys.step.tr()}:',
          stepDescription: LocaleKeys.step3Description.tr(),
          iconPah: AppIcons.iconReport,
        ),
      ],
    );
  }

  Widget _stepDesktop({
    required BuildContext context,
    required String stepTitle,
    required String stepDescription,
    required String iconPah,
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
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onPrimary,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SizedBox(
                      child: SvgPicture.asset(
                        iconPah,
                        width: 24,
                        height: 24,
                        colorFilter: const ColorFilter.mode(
                          AppColors.purple,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                AppDimensions.sBoxH16,
                Text(
                  stepTitle,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
                AppDimensions.sBoxH8,
                Text(
                  stepDescription,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _stepMobile({
    required BuildContext context,
    required String stepTitle,
    required String stepDescription,
    required String iconPah,
  }) {
    return Container(
      constraints: const BoxConstraints(minHeight: 120),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        border: Border.all(
          color: Theme.of(context).colorScheme.onTertiary,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(27)),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.all(Radius.circular(16)),
        ),
        child: Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  child: SvgPicture.asset(
                    iconPah,
                    colorFilter: const ColorFilter.mode(
                      AppColors.purple,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
            AppDimensions.sBoxW16,
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stepTitle,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                    ),
                    AppDimensions.sBoxH8,
                    Text(
                      stepDescription,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
