import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_real_app/presentation/feature/home/bloc/home_bloc.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<HomeBloc>()
        ..add(
          const HomeEvent.started(),
        ),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Home'),
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Home Page'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}