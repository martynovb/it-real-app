import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart';
import 'package:it_real_app/presentation/shared/app_constants.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/navigation/go_router.dart';
import 'package:easy_localization/easy_localization.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      path: AppConstants.translatesPath,
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: BlocProvider(
        create: (context) => getIt.get<AppBloc>()
          ..add(
            const AppEvent.appStarted(),
          ),
        child: BlocBuilder<AppBloc, AppState>(
          builder: (context, state) => MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            theme: state.themeData,
            routerConfig: router,
          ),
        ),
      ),
    );
  }
}
