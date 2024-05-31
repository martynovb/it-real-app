import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:it_real_app/presentation/feature/tokens/bloc/tokens_bloc.dart';
import 'package:it_real_app/presentation/shared/di/di.dart';
import 'package:it_real_app/presentation/shared/dialogs/dialogs_manager.dart';
import 'package:it_real_app/presentation/shared/widgets/buttons.dart';

class TokensPage extends StatelessWidget {
  const TokensPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TokensBloc>()
        ..add(
          const TokensEvent.started(),
        ),
      child: BlocConsumer<TokensBloc, TokensState>(
        listener: (context, state) {
          if (state.status == FormzSubmissionStatus.failure) {
            DialogsManager.showErrorDialog(
              context: context,
              title: 'Error',
              description: state.errorMessage ?? 'An error occurred.',
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Tokens'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Tokens Page'),
                  btnFilled(
                    context: context,
                    text: 'Buy Tokens',
                    onPressed: () {
                      context.read<TokensBloc>().add(
                            TokensEvent.buyProduct(
                              productModel: context
                                  .read<TokensBloc>()
                                  .state
                                  .products
                                  .first,
                            ),
                          );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
