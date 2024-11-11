class RunConfigurations {

  static String redirectUrl = const String.fromEnvironment(
    'redirectUrl',
  );

  // Supabase
  static String supabaseAnonKey = const String.fromEnvironment(
    'supabaseAnonKey',
  );
  static String supabaseUrl = const String.fromEnvironment(
    'supabaseUrl',
  );

  static String sentryDsn = const String.fromEnvironment(
    'sentryDsn',
  );

  static String privacyPolicyUrl = const String.fromEnvironment(
    'privacyPolicyUrl',
  );

  static String termsOfServiceUrl = const String.fromEnvironment(
    'termsOfServiceUrl',
  );
}
