class RunConfigurations {
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
}
