import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:it_real_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/styles/app_styles.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<OnboardingBloc>(),
      child: BlocBuilder<OnboardingBloc, OnboardingState>(
        builder: (context, state) {
          return Scaffold(
            body: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _header(context),
                  Text(
                    LocaleKeys.oboardingTitleDescription.tr(),
                    style: AppTextStyle.h1Semibold_36.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.white
                          : AppColors.almostBlack,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 215,
                    child: btnWithRightArrow(
                      brightness: Theme.of(context).brightness,
                      text: LocaleKeys.getStartedNow.tr(),
                      onPressed: () {},
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

  Widget _header(BuildContext context) {
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
            Text(
              LocaleKeys.appName.tr(),
              style: AppTextStyle.h1Semibold_36.copyWith(
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.white
                    : AppColors.almostBlack,
              ),
            ),
            const Spacer(),
            btnOutlined(
              brightness: Theme.of(context).brightness,
              text: LocaleKeys.signIn.tr(),
              onPressed: () {},
            ),
            AppDimensions.sBoxW16,
            btnFilled(
              brightness: Theme.of(context).brightness,
              text: LocaleKeys.signUp.tr(),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
