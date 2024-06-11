import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/forgot_password/forgot_password_page.dart';
import 'package:it_real_app/presentation/feature/home/home_page.dart';
import 'package:it_real_app/presentation/feature/onboarding/oboarding_page.dart';
import 'package:it_real_app/presentation/feature/settings/settings_page.dart';
import 'package:it_real_app/presentation/feature/sign_in/sign_in_page.dart';
import 'package:it_real_app/presentation/feature/sign_up/sign_up_page.dart';
import 'package:it_real_app/presentation/feature/splash/splash_page.dart';
import 'package:it_real_app/presentation/feature/products/products_page.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/widgets/error_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router({
  required String initialLocation,
}) =>
    GoRouter(
      routerNeglect: true,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: initialLocation,
      redirect: ((context, GoRouterState state) {
        return null;
      }),
      errorBuilder: (context, state) {
        return const ErrorPage();
      },
      routes: [
        GoRoute(
          path: RouteConstants.splash.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SplashPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.signIn.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: SignInPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.onboarding.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const OnboardingPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.signUp.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: SignUpPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.forgotPassword.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: ForgotPasswordPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.home.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const HomePage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.settings.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SettingsPage(),
          ),
        ),
        GoRoute(
          path: RouteConstants.products.path,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const ProdcutsPage(),
          ),
        ),
      ],
    );
