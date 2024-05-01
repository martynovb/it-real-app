import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@module
abstract class DataModule {
  @singleton
  SupabaseClient get supabase => Supabase.instance.client;
}
