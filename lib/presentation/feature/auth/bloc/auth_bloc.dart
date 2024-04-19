import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

part 'auth_bloc.freezed.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@Singleton()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthDataSource authDataSource;
  final supabase.SupabaseClient supabaseClient;

  StreamSubscription<supabase.AuthState>? _authStateChangesSubscription;

  AuthBloc({
    required this.authDataSource,
    required this.supabaseClient,
  }) : super(
          const AuthState(
            authStatus: AuthenticationStatus.none,
          ),
        ) {
    on<_AuthenticationStatusChanged>(_onAuthenticationStatusChanged);
    on<_Logout>(_onLogout);

    _subscribeToAuthStateChanges();
  }

  void _subscribeToAuthStateChanges() {
    _authStateChangesSubscription?.cancel();
    _authStateChangesSubscription =
        supabaseClient.auth.onAuthStateChange.listen(
      (authState) {
        if (authState.event == supabase.AuthChangeEvent.signedIn) {
          add(
            const AuthEvent.authenticationStatusChanged(
              authenticationStatus: AuthenticationStatus.authenticated,
            ),
          );
        } else if (authState.event == supabase.AuthChangeEvent.signedOut ||
            authState.event == supabase.AuthChangeEvent.userDeleted) {
          add(
            const AuthEvent.authenticationStatusChanged(
              authenticationStatus: AuthenticationStatus.unauthenticated,
            ),
          );
        }
      },
    );
  }

  Future<void> _onAuthenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    emit(
      state.copyWith(
        authStatus: event.authenticationStatus,
      ),
    );
  }

  Future<void> _onLogout(event, emit) async {
    await authDataSource.logout();
  }

  @override
  Future<void> close() {
    _authStateChangesSubscription?.cancel();
    return super.close();
  }
}
