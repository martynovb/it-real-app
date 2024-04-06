import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppBloc, AppState>(
      listener: (BuildContext context, AppState state) {
        if (state.authStatus == AuthenticationStatus.authenticated) {
          context.go(RouteConstants.home.path);
        } else if (state.authStatus == AuthenticationStatus.unauthenticated) {
          context.go(RouteConstants.signIn.path);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(LocaleKeys.appName).tr(),
        ),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
