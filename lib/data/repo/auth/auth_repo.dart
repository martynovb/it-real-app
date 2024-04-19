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
    return AuthenticationStatus.unauthenticated;
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> signInWithGoogle() async {
    await supabaseClient.auth.signInWithOAuth(
      OAuthProvider.google,
    );
  }

  @override
  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signUp(
      email: email,
      password: password,
    );

    return UserModel(
      id: response.user?.id ?? '',
      email: response.user?.email ?? '',
      tokens: int.tryParse(
            response.user?.userMetadata?['tokens'] ?? '0',
          ) ??
          0,
    );
  }
}
