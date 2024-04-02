
import 'package:flutter/material.dart';
import 'package:it_real_app/presentation/shared/styles/app_colors.dart';
import 'package:it_real_app/presentation/shared/styles/app_dimensions.dart';

class AppTextStyle {
  static const TextStyle activityLableStyle = TextStyle(
    color: AppColors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle textStyleTitle = TextStyle(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static TextStyle textStyleTitleGrid = TextStyle(
    color: AppColors.white,
    backgroundColor: AppColors.black.withOpacity(0.9),
    fontSize: 22,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );

  static const TextStyle textStyleSubTitleGrid = TextStyle(
    color: AppColors.white,
    backgroundColor: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle textStyleSubTitle = TextStyle(
    color: AppColors.darkGrey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle commentTitleStyle = TextStyle(
    color: AppColors.darkGrey,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle commentTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
}

class AppButtonStyle {
  static final ButtonStyle defButtonStyle = TextButton.styleFrom(
    backgroundColor: AppColors.red,
    minimumSize: const Size(double.infinity, AppDimensions.sizeDefBtnH),
    padding: const EdgeInsets.all(AppDimensions.paddingDef),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.white,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: AppColors.white,
        indicatorColor: AppColors.red.withOpacity(0.08),
        elevation: 4,
        height: AppDimensions.bottomNavigationBarHeight,
        surfaceTintColor: AppColors.white,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(
            color: AppColors.almostBlack,
            fontSize: 12,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.red,
        primary: AppColors.red,
        onPrimary: AppColors.red,
        secondary: AppColors.almostBlack,
        onSecondary: AppColors.almostBlack,
        tertiary: AppColors.red,
        onTertiary: AppColors.red,
        background: AppColors.white,
      ),
      useMaterial3: true,
    );
  }
}
