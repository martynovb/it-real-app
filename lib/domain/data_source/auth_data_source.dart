import 'package:it_real_app/data/models/user/user_model.dart';

enum AuthenticationStatus { authenticated, unauthenticated, none }

abstract class AuthDataSource {

  Future<UserModel> getCurrentUser();

  Future<AuthenticationStatus> getAuthStatus();

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signInWithGoogle();

  Future<void> logout();

  Future<void> deleteAccount();

  Future<void> sendPasswordResetEmail({
    required String email,
  });
  

  Future<void> setSessionFromUri(Uri uri);

  Future<void> resetPassword({
    required String password,
    required String confirmPassword,
  });
}
