import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';

class AppButtonStyle {
  static ButtonStyle outlinedBtnStyle({
    required BuildContext context,
    required TextStyle? textStyle,
  }) =>
      ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.purple;
            } else if (states.contains(MaterialState.disabled)) {
              return AppColors.grey4;
            } else {
              return Theme.of(context).colorScheme.primary;
            }
          },
        ),
        shadowColor: MaterialStateProperty.all(AppColors.grey1),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.white;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.white;
            }
            return Theme.of(context).colorScheme.onPrimary;
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            if (states.contains(MaterialState.hovered)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            return textStyle?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            );
          },
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.only(
            left: 30,
            right: 30,
            top: 20,
            bottom: 20,
          ),
        ),
        shape: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.hovered)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: AppColors.purple,
                  width: 1.5,
                ),
              );
            } else if (states.contains(MaterialState.disabled)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: AppColors.grey4,
                  width: 1.5,
                ),
              );
            }
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                color: Theme.of(context).colorScheme.onPrimary,
                width: 1.5,
              ),
            );
          },
        ),
      );

  static ButtonStyle filledBtnStyle({
    required BuildContext context,
    required TextStyle? textStyle,
    EdgeInsets? padding,
  }) =>
      ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.purple;
            } else if (states.contains(MaterialState.disabled)) {
              return AppColors.grey4;
            }
            return Theme.of(context).colorScheme.onPrimary;
          },
        ),
        shadowColor: MaterialStateProperty.all(AppColors.grey1),
        foregroundColor: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.white;
            }
            if (states.contains(MaterialState.hovered)) {
              return AppColors.white;
            }
            return Theme.of(context).colorScheme.primary;
          },
        ),
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.disabled)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            if (states.contains(MaterialState.hovered)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            return textStyle?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            );
          },
        ),
        padding: MaterialStateProperty.all(
          padding ??
              const EdgeInsets.only(
                left: 30,
                right: 30,
                top: 20,
                bottom: 20,
              ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
