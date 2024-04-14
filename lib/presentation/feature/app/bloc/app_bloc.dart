import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/data/repo/auth/auth_data_source.dart';

part 'app_bloc.freezed.dart';

part 'app_event.dart';

part 'app_state.dart';

@Singleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  final AuthDataSource authDataSource;

  AppBloc({
    required this.authDataSource,
  }) : super(
          const AppState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
            authStatus: AuthenticationStatus.none,
            themeMode: ThemeMode.light,
          ),
        ) {
    on<_AppStarted>(_onAppStarted);
  }

  Future<void> _onAppStarted(event, emit) async {
    final authStatus = await authDataSource.getAuthStatus();
    emit(
      state.copyWith(authStatus: authStatus),
    );
  }
}
