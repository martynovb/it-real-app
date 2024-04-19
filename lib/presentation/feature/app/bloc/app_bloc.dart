import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'app_bloc.freezed.dart';

part 'app_event.dart';

part 'app_state.dart';

@Singleton()
class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc()
      : super(
          const AppState(
            status: FormzSubmissionStatus.initial,
            errorMessage: null,
            themeMode: ThemeMode.light,
          ),
        ) {
    on<_AppStarted>(_onAppStarted);
  }

  Future<void> _onAppStarted(event, emit) async {}
}
