import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/app_utils.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/mobile/app_text_style_mobile.dart';
import 'package:it_real_app/presentation/shared/styles/web/app_text_style_web.dart';

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
        textTheme:
            isMobile ? AppTextStyleMobile.textTheme : AppTextStyleWeb.textTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: colorScheme.onPrimary,
          selectionColor: AppColors.purple.withOpacity(0.5),
        ));
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
      onBackground: AppColors.grey4,
      surface: AppColors.white,
      onSurface: AppColors.almostBlack,
      tertiary: AppColors.grey3,
      onTertiary: AppColors.grey4,
    );
  }

  static ColorScheme get _darkColorScheme {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.almostBlack,
      onPrimary: AppColors.white,
      secondary: AppColors.almostBlack2,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      background: AppColors.almostBlack2,
      onBackground: AppColors.almostBlack2,
      surface: AppColors.almostBlack2,
      onSurface: AppColors.white,
      tertiary: AppColors.grey3,
      onTertiary: AppColors.grey4,
    );
  }
}
