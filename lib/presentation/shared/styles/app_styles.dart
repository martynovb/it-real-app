import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        fontFamily: GoogleFonts.poppins().fontFamily,
        colorScheme: colorScheme,
        canvasColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.surface,
        focusColor: focusColor,
        useMaterial3: true,
        textTheme: AppUtils.isMobile
            ? AppTextStyleMobile.textTheme
            : AppTextStyleWeb.textTheme,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: colorScheme.onPrimary,
          selectionColor: AppColors.purple.withValues(alpha: 0.5),
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
      surface: AppColors.grey2,
      onSurface: AppColors.grey4,
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
      surface: AppColors.almostBlack2,
      onSurface: AppColors.almostBlack2,
      tertiary: AppColors.grey3,
      onTertiary: AppColors.grey4,
    );
  }
}
