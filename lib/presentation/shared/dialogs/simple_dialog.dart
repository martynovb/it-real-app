import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';

class SimpleDialog extends StatelessWidget {
  final Widget? title;
  final Widget? description;
  final List<Widget> actions;

  const SimpleDialog({
    super.key,
    this.title,
    this.description,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Container(
        constraints: const BoxConstraints(maxWidth: 350),
        color: Theme.of(context).colorScheme.background,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              title ?? const SizedBox.shrink(),
              AppDimensions.sBoxH16,
              description ?? const SizedBox.shrink(),
              AppDimensions.sBoxH24,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: actions,
              )
            ],
          ),
        ),
      ),
    );
  }
}
