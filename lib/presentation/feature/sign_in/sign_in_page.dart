import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_real_app/presentation/feature/sign_in/bloc/sign_in_bloc.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SignInBloc>(),
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Sign In'),
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Sign In Page'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
