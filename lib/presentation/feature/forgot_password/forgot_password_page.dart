import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/forgot_password/bloc/forgot_password_bloc.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';
import 'package:it_real_app/presentation/shared/widgets/input_field.dart';

class ForgotPasswordPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();

  ForgotPasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<ForgotPasswordBloc>(),
      child: BlocConsumer<ForgotPasswordBloc, ForgotPasswordState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.success) {
            DialogsManager.showInfoDialog(
              context: context,
              title: LocaleKeys.success.tr(),
              description: LocaleKeys.resetPasswordLinkSent.tr(),
              onTap: () => context.go(RouteConstants.signIn.path),
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
                      horizontal: AppDimensions.deskSidePadding,
                    ),
                    child: Column(
                      children: [
                        AppDimensions.sBoxH32,
                        Text(
                          LocaleKeys.resetPassword.tr(),
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
                            SizedBox(
                              width: double.infinity,
                              child: btnFilled(
                                loading: state.status ==
                                    FormzSubmissionStatus.inProgress,
                                context: context,
                                text: LocaleKeys.resetPassword.tr(),
                                onPressed: () => context
                                    .read<ForgotPasswordBloc>()
                                    .add(
                                      ForgotPasswordEvent.sendResetPasswordLink(
                                        email: _emailController.text,
                                      ),
                                    ),
                              ),
                            ),
                            AppDimensions.sBoxH24,
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
                          LocaleKeys.remeberYourPassword.tr(),
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
