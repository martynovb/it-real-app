import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:it_real_app/presentation/shared/navigation/route_constants.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Error',
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(RouteConstants.splash.path),
          child: const Text('Refresh'),
        ),
      ),
    );
  }
}
