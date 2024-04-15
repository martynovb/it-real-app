import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/feature/home/home_page.dart';
import 'package:it_real_app/presentation/feature/onboarding/oboarding_page.dart';
import 'package:it_real_app/presentation/feature/settings/settings_page.dart';
import 'package:it_real_app/presentation/feature/sign_in/sign_in_page.dart';
import 'package:it_real_app/presentation/feature/sign_up/sign_up_page.dart';
import 'package:it_real_app/presentation/feature/splash/splash_page.dart';
import 'package:it_real_app/presentation/feature/tokens/tokens_page.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/presentation/shared/widgets/error_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routerNeglect: true,
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  initialLocation: RouteConstants.signUp.path,
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
        child: const SignInPage(),
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
        child: const SignUpPage(),
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
      path: RouteConstants.tokens.path,
      pageBuilder: (context, state) => NoTransitionPage(
        key: state.pageKey,
        child: const TokensPage(),
      ),
    ),
  ],
);
