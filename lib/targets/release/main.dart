import 'dart:async';

import 'package:fetch_client/fetch_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/feature/app/app.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await EasyLocalization.ensureInitialized();

      await Supabase.initialize(
        url: RunConfigurations.supabaseUrl,
        anonKey: RunConfigurations.supabaseAnonKey,
        httpClient: FetchClient(mode: RequestMode.cors),
      );

      configureDependencies(environment: development);

      // Init crashlytics
      await SentryFlutter.init(
        (options) => options.dsn = RunConfigurations.sentryDsn,
      );
      if (kIsWeb) {
        usePathUrlStrategy();
      }
      runApp(const RealApp());
    },
    (error, stackTrace) async {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    },
  );
}
