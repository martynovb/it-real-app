import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/localization/locale_keys.g.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.appName).tr(),
      ),
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
