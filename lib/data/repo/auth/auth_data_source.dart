enum AuthenticationStatus { authenticated, unauthenticated, none }

abstract class AuthDataSource {
  Future<AuthenticationStatus> getAuthStatus();
}
