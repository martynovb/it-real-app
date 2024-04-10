import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';

class AppTextStyle {
  static const TextStyle h1Semibold_36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h2Semibold_22 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h3Semibold_18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h4Semibold_16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle h5Semibold_14 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle body1Regular_20 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body2Regular_18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body3Regular_16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body4Regular_14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle body5Regular_12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle captionMedium_12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );
}

class AppButtonStyle {
  static ButtonStyle outlinedBtnStyle(
    Brightness brightness,
  ) =>
      ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.resolveWith(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return AppColors.purple;
            } else if (states.contains(MaterialState.disabled)) {
              return AppColors.grey4;
            } else {
              return brightness == Brightness.dark
                  ? AppColors.almostBlack
                  : AppColors.white;
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
            } else if (brightness == Brightness.dark) {
              return AppColors.white;
            } else {
              return AppColors.almostBlack;
            }
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
                color: brightness == Brightness.dark
                    ? AppColors.white
                    : AppColors.almostBlack,
                width: 1.5,
              ),
            );
          },
        ),
      );

  static ButtonStyle filledBtnStyle({
    required Brightness brightness,
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
            } else {
              return brightness == Brightness.dark
                  ? AppColors.white
                  : AppColors.almostBlack;
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
            } else if (brightness == Brightness.dark) {
              return AppColors.almostBlack;
            } else {
              return AppColors.white;
            }
          },
        ),
        padding: MaterialStateProperty.all(
          padding ?? const EdgeInsets.only(
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

class AppTheme {
  static ThemeData lightThemeData = _themeData(
    _lightColorScheme,
    AppColors.almostBlack,
  );

  static ThemeData darkThemeData = _themeData(
    _darkColorScheme,
    AppColors.white,
  );

  static ThemeData _themeData(
    ColorScheme colorScheme,
    Color focusColor,
  ) {
    return ThemeData(
      fontFamily: 'Switzer',
      colorScheme: colorScheme,
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      focusColor: focusColor,
      useMaterial3: true,
    );
  }

  static ColorScheme get _lightColorScheme {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.white,
      onPrimary: AppColors.almostBlack,
      secondary: AppColors.white,
      onSecondary: AppColors.almostBlack,
      error: AppColors.red,
      onError: AppColors.white,
      background: AppColors.grey2,
      onBackground: AppColors.white,
      // Used as the base color for elevated UI elements like cards, sheets, dialogs, etc.
      surface: AppColors.white,
      // use to color the elements on top of the surface color.
      onSurface: AppColors.almostBlack,
    );
  }

  static ColorScheme get _darkColorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.almostBlack2,
      onPrimary: AppColors.white,
      secondary: AppColors.almostBlack2,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      background: AppColors.almostBlack2,
      onBackground: AppColors.almostBlack2,
      // Used as the base color for elevated UI elements like cards, sheets, dialogs, etc.
      surface: AppColors.almostBlack2,
      // use to color the elements on top of the surface color.
      onSurface: AppColors.white,
    );
  }
}
