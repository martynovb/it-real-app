import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/app_utils.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';

class DeviceLayoutBuilder extends StatelessWidget {
  final Widget Function(bool isMobile) layoutBuilder;

  const DeviceLayoutBuilder({
    super.key,
    required this.layoutBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => layoutBuilder(
        constraints.maxWidth <= AppDimensions.maxMobileWidth || AppUtils.isMobile,
      ),
    );
  }
}
