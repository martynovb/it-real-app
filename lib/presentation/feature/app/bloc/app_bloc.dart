import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:it_real_app/presentation/shared/app_constants.dart';
import 'package:it_real_app/targets/run_configurations.dart';
import 'package:url_launcher/url_launcher.dart';

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
    on<_ContactSupport>(_onContactSupport);
    on<_OpenTermsOfService>(_onOpenTermsOfService);
    on<_OpenPrivacyPolicy>(_onOpenPrivacyPolicy);
  }

  Future<void> _onAppStarted(event, emit) async {}

  Future<void> _onContactSupport(event, emit) async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: AppConstants.emailSupport,
    );

    if (await canLaunchUrl(emailLaunchUri)) {
      await launchUrl(emailLaunchUri);
    }
  }

  Future<void> _onOpenTermsOfService(event, emit) async {
    final Uri termsOfServiceUri =
        Uri.parse(RunConfigurations.termsOfServiceUrl);

    await launchUrl(termsOfServiceUri);
  }

  Future<void> _onOpenPrivacyPolicy(event, emit) async {
    final Uri privacyPolicyUri = Uri.parse(RunConfigurations.termsOfServiceUrl);

    await launchUrl(privacyPolicyUri);
  }
}
