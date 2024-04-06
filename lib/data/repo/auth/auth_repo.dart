import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: AuthDataSource)
class AuthRepo extends AuthDataSource {
  final SupabaseClient supabaseClient;

  AuthRepo({
    required this.supabaseClient,
  });

  @override
  Future<AuthenticationStatus> getAuthStatus() async {
    return AuthenticationStatus.authenticated;
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  }) {
    throw UnimplementedError();
  }
}
