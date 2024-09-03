import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/sign_up/bloc/sign_up_bloc.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/input_field.dart';
import 'package:it_real_app/presentation/shared/widgets/snack_bar.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatPasswordController =
      TextEditingController();

  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignUpBloc>(),
      child: BlocConsumer<SignUpBloc, SignUpState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            context.go(RouteConstants.home.path);
          } else if (state.status == FormzSubmissionStatus.failure &&
              state.errorMessage != null) {
            showTopSnackBar(
              context: context,
              message: state.errorMessage ?? LocaleKeys.somethingWentWrong.tr(),
              snackBarType: SnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppDimensions.deskSidePadding),
                    child: Column(
                      children: [
                        AppDimensions.sBoxH32,
                        Text(
                          LocaleKeys.signUp.tr(),
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                        AppDimensions.sBoxH32,
                        Column(
                          children: [
                            AppInputField(
                              key: UniqueKey(),
                              controller: _emailController,
                              lable: LocaleKeys.email.tr(),
                              hintText: LocaleKeys.enterYourEmailAdress.tr(),
                              errorText: state.emailError?.message,
                            ),
                            AppDimensions.sBoxH24,
                            AppInputField(
                              key: UniqueKey(),
                              controller: _passwordController,
                              lable: LocaleKeys.password.tr(),
                              hintText: LocaleKeys.enterYourPassword.tr(),
                              showPasswordToggle: true,
                              errorText: state.passwordError?.message,
                            ),
                            AppDimensions.sBoxH24,
                            AppInputField(
                              key: UniqueKey(),
                              controller: _repeatPasswordController,
                              lable: LocaleKeys.repeatPassword.tr(),
                              hintText: LocaleKeys.enterYourPassword.tr(),
                              showPasswordToggle: true,
                              errorText: state.repeatPasswordError?.message,
                            ),
                            AppDimensions.sBoxH24,
                            SizedBox(
                              width: double.infinity,
                              child: btnFilled(
                                loading: state.status ==
                                    FormzSubmissionStatus.inProgress,
                                context: context,
                                text: LocaleKeys.signUp.tr(),
                                onPressed: () => context.read<SignUpBloc>().add(
                                      SignUpEvent.signUp(
                                        email: _emailController.text,
                                        password: _passwordController.text,
                                        repeatPassword:
                                            _repeatPasswordController.text,
                                      ),
                                    ),
                              ),
                            ),
                            AppDimensions.sBoxH24,
                            SizedBox(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Divider(
                                      height: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                  ),
                                  AppDimensions.sBoxW8,
                                  Text(
                                    LocaleKeys.orSignUpWithGoogle.tr(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary,
                                        ),
                                  ),
                                  AppDimensions.sBoxW8,
                                  Expanded(
                                    child: Divider(
                                      height: 1,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            AppDimensions.sBoxH24,
                            SizedBox(
                              width: double.infinity,
                              child: btnOutlinedWithIcon(
                                postfixWidget: SvgPicture.asset(
                                  AppIcons.iconGoogle,
                                  width: 24,
                                ),
                                context: context,
                                text: LocaleKeys.continueWithGoogle.tr(),
                                onPressed: () => context.read<SignUpBloc>().add(
                                      const SignUpEvent.countinueWithGoogle(),
                                    ),
                              ),
                            ),
                            AppDimensions.sBoxH24,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                        color: AppColors.grey4,
                                      ),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${LocaleKeys.bySigningUpYouAgreeToOur.tr()} ',
                                    ),
                                    TextSpan(
                                      text: LocaleKeys.termsOfService.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                    TextSpan(
                                      text: ' ${LocaleKeys.and.tr()} ',
                                    ),
                                    TextSpan(
                                      text: LocaleKeys.privacyPolicy.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onPrimary,
                                          ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {},
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    height: 70,
                    width: double.infinity,
                    color: AppColors.grey2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          LocaleKeys.haveAnAccount.tr(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        AppDimensions.sBoxW8,
                        InkWell(
                          onTap: () => context.go(RouteConstants.signIn.path),
                          child: Text(
                            LocaleKeys.signIn.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.hyperlink,
                                ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
