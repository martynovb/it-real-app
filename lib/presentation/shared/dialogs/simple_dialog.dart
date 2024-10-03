import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';

class SimpleDialog extends StatelessWidget {
  final Widget? title;
  final Widget? description;
  final List<Widget> actions;
  final bool isMobile;

  const SimpleDialog({
    super.key,
    required this.isMobile,
    this.title,
    this.description,
    this.actions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: isMobile ? EdgeInsets.zero : null,
      backgroundColor: Theme.of(context).colorScheme.primary,
      scrollable: true,
      content: Container(
        constraints: const BoxConstraints(maxWidth: 450),
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
                mainAxisSize: MainAxisSize.min,
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
