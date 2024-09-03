import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';

const Duration _snackBarDuration = Duration(seconds: 2);

void dismissSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
}

void showTopSnackBar({
  required BuildContext context,
  required String message,
  SnackBarType snackBarType = SnackBarType.info,
  Duration duration = _snackBarDuration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    _getSnackBar(
      context: context,
      message: message,
      snackBarType: snackBarType,
      duration: duration,
    ),
  );
}

SnackBar _getSnackBar({
  required String message,
  required SnackBarType snackBarType,
  required Duration duration,
  required BuildContext context,
}) {
  final icon = _mapSnackBarTypeToIcon(snackBarType);

  return SnackBar(
    duration: duration,
    backgroundColor: AppColors.transparent,
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.up,
    margin: EdgeInsets.only(
      bottom: MediaQuery.of(context).size.height - AppDimensions.snackBarH * 2,
    ),
    content: Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: [
          const Spacer(),
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(16),
            constraints: const BoxConstraints(
              minWidth: 200,
            ),
            decoration: BoxDecoration(
              color: _mapSnackBarTypeToColor(snackBarType),
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            child: icon == null
                ? Text(
                    message,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: AppColors.white,
                        ),
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      icon,
                      const SizedBox(width: 8),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: AppColors.white,
                            ),
                      ),
                    ],
                  ),
          ),
          const Spacer(),
        ],
      ),
    ),
  );
}

Animation<double> _snackBarAnimation(BuildContext context) {
  return Tween<double>(begin: 0, end: 1).animate(
    CurvedAnimation(
      parent: CurvedAnimation(
        parent: AnimationController(
          vsync: ScaffoldMessenger.of(context),
          duration: const Duration(milliseconds: 500),
        ),
        curve: Curves.easeIn,
      ),
      curve: Curves.easeIn,
    ),
  );
}

Color _mapSnackBarTypeToColor(SnackBarType snackBarType) {
  switch (snackBarType) {
    case SnackBarType.success:
      return AppColors.green;
    case SnackBarType.error:
      return AppColors.almostBlack;
    case SnackBarType.warning:
      return AppColors.almostBlack;
    case SnackBarType.info:
      return AppColors.purple;
  }
}

Widget? _mapSnackBarTypeToIcon(SnackBarType snackBarType) {
  switch (snackBarType) {
    case SnackBarType.error:
      return const Icon(
        Icons.close_rounded,
        color: AppColors.red,
      );
    case SnackBarType.warning:
      return const Icon(
        Icons.warning,
        color: Colors.orange,
      );
    case SnackBarType.info:
      return const Icon(
        Icons.info,
        color: AppColors.almostBlack,
      );
    default:
      return null;
  }
}

enum SnackBarType {
  success,
  error,
  warning,
  info,
}
