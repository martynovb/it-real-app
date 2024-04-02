import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/feature/app/app_widget.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: RunConfigurations.supabaseUrl,
    anonKey: RunConfigurations.supabaseAnonKey,
  );

  configureDependencies(environment: development);

  runApp(const AppWidget());
}
