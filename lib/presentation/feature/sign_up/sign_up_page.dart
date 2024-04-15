import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_real_app/presentation/feature/sign_up/bloc/sign_up_bloc.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';
import 'package:it_real_app/presentation/shared/widgets/input_fields.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignUpBloc>(),
      child: BlocBuilder<SignUpBloc, SignUpState>(
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimensions.deskSidePadding),
              child: Column(
                children: [
                  AppDimensions.sBoxH32,
                  Text(
                    LocaleKeys.signUp.tr(),
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  AppDimensions.sBoxH24,
                  Column(
                    children: [
                      AppInputField(
                        lable: LocaleKeys.email.tr(),
                        hintText: LocaleKeys.enterYourEmailAdress.tr(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
