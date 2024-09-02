import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart';
import 'package:it_real_app/presentation/feature/auth/bloc/auth_bloc.dart';
import 'package:it_real_app/presentation/feature/photo_verification/bloc/photo_verification_bloc.dart';
import 'package:it_real_app/presentation/shared/app_constants.dart';
import 'package:it_real_app/presentation/shared/navigation/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/styles/app_styles.dart';

class RealApp extends StatelessWidget {
  const RealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: AppConstants.translatesPath,
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetIt.I.get<AppBloc>()
              ..add(
                const AppEvent.appStarted(),
              ),
          ),
          BlocProvider(
            create: (context) => GetIt.I.get<PhotoVerificationBloc>(),
          ),
          BlocProvider(
            create: (context) => GetIt.I.get<AuthBloc>(),
          ),
        ],
        child: const AppWidget(),
      ),
    );
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, appState) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, authState) {
            return MaterialApp.router(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale: context.locale,
              theme: AppTheme.lightThemeData,
              darkTheme: AppTheme.darkThemeData,
              themeMode: appState.themeMode,
              routerConfig: router(
                initialLocation:
                    authState.authStatus == AuthenticationStatus.authenticated
                        ? RouteConstants.home.path
                        : RouteConstants.onboarding.path,
              ),
            );
          },
        );
      },
    );
  }

  String _initialRoute(AuthenticationStatus authenticationStatus) {
    switch (authenticationStatus) {
      case AuthenticationStatus.authenticated:
        return RouteConstants.home.path;
      case AuthenticationStatus.unauthenticated:
        return RouteConstants.onboarding.path;
      default:
        return RouteConstants.splash.path;
    }
  }
}
