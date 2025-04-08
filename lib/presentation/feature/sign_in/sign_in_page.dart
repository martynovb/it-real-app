import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart';
import 'package:it_real_app/presentation/feature/forgot_password/forgot_password_page.dart';
import 'package:it_real_app/presentation/feature/sign_in/bloc/sign_in_bloc.dart';
import 'package:it_real_app/presentation/feature/sign_up/sign_up_page.dart';
import 'package:it_real_app/presentation/shared/app_icons.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/input_field.dart';
import 'package:it_real_app/presentation/shared/widgets/snack_bar.dart';

import '../onboarding/oboarding_page.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final bool isDialog;

  SignInPage({
    super.key,
    this.isDialog = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignInBloc>(),
      child: BlocConsumer<SignInBloc, SignInState>(
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
          return isDialog
              ? _contentDesktop(context, state)
              : _contentMobile(context, state);
        },
      ),
    );
  }

  Widget _contentDesktop(
    BuildContext context,
    SignInState state,
  ) {
    return SingleChildScrollView(
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.deskSidePadding),
              child: Column(
                children: [
                  AppDimensions.sBoxH32,
                  Text(
                    LocaleKeys.signIn.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  AppDimensions.sBoxH32,
                  AppInputField(
                    key: UniqueKey(),
                    controller: _emailController,
                    lable: LocaleKeys.email.tr(),
                    hintText: LocaleKeys.enterYourEmailAdress.tr(),
                    errorText: state.emailError?.message,
                  ),
                  AppDimensions.sBoxH16,
                  AppInputField(
                    key: UniqueKey(),
                    controller: _passwordController,
                    lable: LocaleKeys.password.tr(),
                    hintText: LocaleKeys.enterYourPassword.tr(),
                    showPasswordToggle: true,
                    errorText: state.passwordError?.message,
                  ),
                  AppDimensions.sBoxH16,
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => DialogsManager.showCustomDialog(
                        context: scaffoldOnboardingKey.currentContext ?? context,
                        child: ForgotPasswordPage(
                          isDialog: isDialog,
                        ),
                        asPage: true,
                      ),
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.hyperlink,
                            ),
                      ),
                    ),
                  ),
                  AppDimensions.sBoxH24,
                  SizedBox(
                    width: double.infinity,
                    child: btnFilled(
                      loading: state.status == FormzSubmissionStatus.inProgress,
                      context: context,
                      text: LocaleKeys.signIn.tr(),
                      minHeight: AppDimensions.btnHDesk,
                      onPressed: () => context.read<SignInBloc>().add(
                            SignInEvent.signIn(
                              email: _emailController.text,
                              password: _passwordController.text,
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
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        AppDimensions.sBoxW8,
                        Text(
                          LocaleKeys.orSignInWithGoogle.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.tertiary,
                              ),
                        ),
                        AppDimensions.sBoxW8,
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimensions.sBoxH24,
                  SizedBox(
                    width: double.infinity,
                    child: btnOutlinedWithIcon(
                      minHeight: AppDimensions.btnHDesk,
                      mainAxisAlignment: MainAxisAlignment.center,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(
                          AppIcons.iconGoogle,
                          width: 24,
                        ),
                      ),
                      context: context,
                      text: LocaleKeys.continueWithGoogle.tr(),
                      onPressed: () => context.read<SignInBloc>().add(
                            const SignInEvent.countinueWithGoogle(),
                          ),
                    ),
                  ),
                  AppDimensions.sBoxH24,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.grey4,
                            ),
                        children: [
                          TextSpan(
                            text:
                                '${LocaleKeys.bySigningInYouAgreeToOur.tr()} ',
                          ),
                          TextSpan(
                            text: LocaleKeys.termsOfService.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.read<AppBloc>().add(
                                    const AppEvent.openTermsOfService(),
                                  ),
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
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.read<AppBloc>().add(
                                    const AppEvent.openPrivacyPolicy(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            AppDimensions.sBoxH32,
            _footer(context),
          ],
        ),
      ),
    );
  }

  Widget _contentMobile(
    BuildContext context,
    SignInState state,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.mobSidePadding,
              ),
              child: Column(
                children: [
                  AppDimensions.sBoxH32,
                  Text(
                    LocaleKeys.signIn.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  AppDimensions.sBoxH32,
                  AppInputField(
                    key: UniqueKey(),
                    controller: _emailController,
                    lable: LocaleKeys.email.tr(),
                    hintText: LocaleKeys.enterYourEmailAdress.tr(),
                    errorText: state.emailError?.message,
                  ),
                  AppDimensions.sBoxH16,
                  AppInputField(
                    key: UniqueKey(),
                    controller: _passwordController,
                    lable: LocaleKeys.password.tr(),
                    hintText: LocaleKeys.enterYourPassword.tr(),
                    showPasswordToggle: true,
                    errorText: state.passwordError?.message,
                  ),
                  AppDimensions.sBoxH16,
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => context.go(
                        RouteConstants.forgotPassword.path,
                      ),
                      child: Text(
                        LocaleKeys.forgotPassword.tr(),
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.hyperlink,
                            ),
                      ),
                    ),
                  ),
                  AppDimensions.sBoxH24,
                  btnFilled(
                    loading: state.status == FormzSubmissionStatus.inProgress,
                    context: context,
                    text: LocaleKeys.signIn.tr(),
                    minHeight: AppDimensions.btnHDesk,
                    onPressed: () => context.read<SignInBloc>().add(
                          SignInEvent.signIn(
                            email: _emailController.text,
                            password: _passwordController.text,
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
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        ),
                        AppDimensions.sBoxW8,
                        Text(
                          LocaleKeys.orSignInWithGoogle.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onTertiary,
                              ),
                        ),
                        AppDimensions.sBoxW8,
                        Expanded(
                          child: Divider(
                            height: 1,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  AppDimensions.sBoxH24,
                  SizedBox(
                    width: double.infinity,
                    child: btnOutlinedWithIcon(
                      minHeight: AppDimensions.btnHDesk,
                      mainAxisAlignment: MainAxisAlignment.center,
                      prefixWidget: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: SvgPicture.asset(
                          AppIcons.iconGoogle,
                          width: 24,
                        ),
                      ),
                      context: context,
                      text: LocaleKeys.continueWithGoogle.tr(),
                      onPressed: () => context.read<SignInBloc>().add(
                            const SignInEvent.countinueWithGoogle(),
                          ),
                    ),
                  ),
                  AppDimensions.sBoxH24,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: AppColors.grey4,
                            ),
                        children: [
                          TextSpan(
                            text:
                                '${LocaleKeys.bySigningInYouAgreeToOur.tr()} ',
                          ),
                          TextSpan(
                            text: LocaleKeys.termsOfService.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.read<AppBloc>().add(
                                    const AppEvent.openTermsOfService(),
                                  ),
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
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => context.read<AppBloc>().add(
                                    const AppEvent.openPrivacyPolicy(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                AppDimensions.sBoxH16,
                const Spacer(),
                _footer(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) => Container(
        height: 70,
        width: double.infinity,
        color: AppColors.grey2,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              LocaleKeys.doNotHaveAnAccount.tr(),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            AppDimensions.sBoxW8,
            InkWell(
              onTap: () => isDialog
                  ? DialogsManager.showCustomDialog(
                      context: context,
                      child: SignUpPage(isDialog: isDialog),
                      asPage: true,
                    )
                  : context.go(RouteConstants.signUp.path),
              child: Text(
                LocaleKeys.signUp.tr(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.hyperlink,
                    ),
              ),
            ),
          ],
        ),
      );
}
