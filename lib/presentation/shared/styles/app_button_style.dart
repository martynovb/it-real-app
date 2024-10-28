import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';

class AppButtonStyle {
  static ButtonStyle outlinedBtnStyle({
    required BuildContext context,
    required TextStyle? textStyle,
  }) =>
      ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.resolveWith(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.purple;
            } else if (states.contains(WidgetState.disabled)) {
              return AppColors.grey4;
            } else {
              return Theme.of(context).colorScheme.primary;
            }
          },
        ),
        shadowColor: WidgetStateProperty.all(AppColors.grey1),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.white;
            }
            if (states.contains(WidgetState.hovered)) {
              return AppColors.white;
            }
            return Theme.of(context).colorScheme.onPrimary;
          },
        ),
        textStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            if (states.contains(WidgetState.hovered)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            return textStyle?.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
            );
          },
        ),
        shape: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: const BorderSide(
                  color: AppColors.purple,
                  width: 1.5,
                ),
              );
            } else if (states.contains(WidgetState.disabled)) {
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
  static ButtonStyle outlinedBtnWithIconStyle({
    required BuildContext context,
    required TextStyle? textStyle,
    EdgeInsets? padding,
  }) =>
      ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        shadowColor: WidgetStateProperty.all(AppColors.grey1),
        foregroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.onPrimary,
        ),
        textStyle: WidgetStateProperty.all(textStyle?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        )),
        padding: padding != null
            ? WidgetStateProperty.all(padding)
            : WidgetStateProperty.all(
                const EdgeInsets.only(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                ),
              ),
        shape: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.hovered)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.onPrimary,
                  width: 1,
                ),
              );
            } else if (states.contains(WidgetState.disabled)) {
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
                color: Theme.of(context).colorScheme.onTertiary,
                width: 1.5,
              ),
            );
          },
        ),
      );

  static ButtonStyle outlinedBtnWithIconStyleSelected({
    required BuildContext context,
    required TextStyle? textStyle,
    EdgeInsets? padding,
  }) =>
      ButtonStyle(
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          padding ??
              const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
              ),
        ),
        backgroundColor: WidgetStateProperty.all(
          AppColors.purple,
        ),
        shadowColor: WidgetStateProperty.all(AppColors.grey1),
        foregroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.primary,
        ),
        textStyle: WidgetStateProperty.all(textStyle?.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        )),
        shape: WidgetStateProperty.resolveWith(
          (states) {
            return RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: const BorderSide(
                color: AppColors.purple,
                width: 1,
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
        elevation: WidgetStateProperty.all(0),
        padding: WidgetStateProperty.all(
          padding ??
              const EdgeInsets.only(
                left: 0,
                right: 0,
                top: 0,
                bottom: 0,
              ),
        ),
        backgroundColor: WidgetStateProperty.resolveWith(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.hovered)) {
              return AppColors.purple;
            } else if (states.contains(WidgetState.disabled)) {
              return AppColors.grey4;
            }
            return Theme.of(context).colorScheme.onPrimary;
          },
        ),
        shadowColor: WidgetStateProperty.all(AppColors.grey1),
        foregroundColor: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return AppColors.white;
            }
            if (states.contains(WidgetState.hovered)) {
              return AppColors.white;
            }
            return Theme.of(context).colorScheme.primary;
          },
        ),
        textStyle: WidgetStateProperty.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            if (states.contains(WidgetState.hovered)) {
              return textStyle?.copyWith(
                color: AppColors.white,
              );
            }
            return textStyle?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            );
          },
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
}
