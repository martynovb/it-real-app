import 'dart:async';

import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/feature/app/app_widget.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Supabase.initialize(
        url: RunConfigurations.supabaseUrl,
        anonKey: RunConfigurations.supabaseAnonKey,
      );

      configureDependencies(environment: development);

      // Init crashlytics
      await SentryFlutter.init(
        (options) => options.dsn = RunConfigurations.sentryDsn,
      );

      runApp(const AppWidget());
    },
    (error, stackTrace) async {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    },
  );
}
