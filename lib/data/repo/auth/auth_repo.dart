import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/models/user/user_model.dart';
import 'package:it_real_app/data/network/network_constants.dart';
import 'package:it_real_app/domain/data_source/auth_data_source.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: AuthDataSource)
class AuthRepo extends AuthDataSource {
  final SupabaseClient supabaseClient;

  AuthRepo({
    required this.supabaseClient,
  });

  @override
  Future<AuthenticationStatus> getAuthStatus() async {
    return supabaseClient.auth.currentSession == null
        ? AuthenticationStatus.unauthenticated
        : AuthenticationStatus.authenticated;
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  @override
  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final response = await supabaseClient.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final profile = await supabaseClient
        .from('profiles')
        .select()
        .eq('id', response.user?.id ?? '')
        .maybeSingle();

    return UserModel.fromSupabaseUser(profile);
  }

  @override
  Future<void> signInWithGoogle() async {
    await supabaseClient.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: RunConfigurations.redirectUrl,
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

    final profile = await supabaseClient
        .from('profiles')
        .select()
        .eq('id', response.user?.id ?? '')
        .maybeSingle();

    return UserModel.fromSupabaseUser(profile);
  }

  @override
  Future<void> deleteAccount() async {
    await supabaseClient.functions.invoke(
      SupabaseConstants.edgeFuncDeleteUser,
    );
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final User? user = supabaseClient.auth.currentUser;

    final profile = await supabaseClient
        .from('profiles')
        .select()
        .eq('id', user?.id ?? '')
        .maybeSingle();

    return UserModel.fromSupabaseUser(profile);
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) {
    return supabaseClient.auth.resetPasswordForEmail(
      email,
      redirectTo:
          RunConfigurations.redirectUrl + RouteConstants.resetPassword.path,
    );
  }

  @override
  Future<void> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    await supabaseClient.auth.updateUser(
      UserAttributes(password: password),
    );
  }

  @override
  Future<void> setSessionFromUri(Uri uri) async {
    await supabaseClient.auth.getSessionFromUrl(uri);
  }
}
