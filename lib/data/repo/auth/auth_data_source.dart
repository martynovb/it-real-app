import 'package:it_real_app/data/models/user/user_model.dart';

enum AuthenticationStatus { authenticated, unauthenticated, none }

abstract class AuthDataSource {
  Future<AuthenticationStatus> getAuthStatus();

  Future<UserModel> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserModel> signUpWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
  });

  Future<UserModel> signInWithGoogle();

  Future<void> logout();
}
