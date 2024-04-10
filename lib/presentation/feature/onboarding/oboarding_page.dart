import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:it_real_app/presentation/feature/onboarding/bloc/onboarding_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
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
            appBar: AppBar(
              title: const Text('Onboarding'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    LocaleKeys.oboardingTitleDescription.tr(),
                    style: AppTextStyle.h1Semibold_36.copyWith(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? AppColors.white
                          : AppColors.almostBlack,
                    ),
                  ),
                  btnOutlined(
                    Theme.of(context).brightness,
                    LocaleKeys.signIn.tr(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  btnFilled(
                    Theme.of(context).brightness,
                    LocaleKeys.signUp.tr(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  btnWithRightArrow(
                    Theme.of(context).brightness,
                    LocaleKeys.getStartedNow.tr(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
