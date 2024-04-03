import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:it_real_app/presentation/feature/tokens/bloc/tokens_bloc.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';

class TokensPage extends StatelessWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TokensBloc>(),
      child: BlocBuilder<TokensBloc, TokensState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Tokens'),
            ),
            body: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Tokens Page'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
