import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_real_app/presentation/feature/app/bloc/app_bloc.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/navigation/go_router.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<AppBloc>()
        ..add(
          const AppEvent.appStarted(),
        ),
      child: BlocBuilder<AppBloc, AppState>(
        builder: (context, state) => MaterialApp.router(
          theme: state.themeData,
          routerConfig: router,
        ),
      ),
    );
  }
}
