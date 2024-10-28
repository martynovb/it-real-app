class RouteItem {
  const RouteItem({required this.path, required this.name});

  final String path;
  final String name;
}

class RouteConstants {
  static Set<String> unauthRoutes = {
    RouteConstants.signIn.path,
    RouteConstants.signUp.path,
    RouteConstants.onboarding.path,
    RouteConstants.forgotPassword.path,
  };

  static const RouteItem splash = RouteItem(
    path: '/splash',
    name: 'Splash',
  );

  static const RouteItem onboarding = RouteItem(
    path: '/onboarding',
    name: 'Onboarding',
  );
  static const RouteItem signIn = RouteItem(
    path: '/sign-in',
    name: 'Sign in',
  );
  static const RouteItem signUp = RouteItem(
    path: '/sign-up',
    name: 'Sign up',
  );
  static const RouteItem home = RouteItem(
    path: '/',
    name: 'Home',
  );

  static const RouteItem settings = RouteItem(
    path: '/settings',
    name: 'Settings',
  );

  static const RouteItem products = RouteItem(
    path: '/products',
    name: 'Products',
  );
  
  static const RouteItem forgotPassword = RouteItem(
    path: '/forgot-password',
    name: 'Forgot Password',
  );
  
  static const RouteItem resetPassword = RouteItem(
    path: '/reset-password',
    name: 'Reset Password',
  );
}
