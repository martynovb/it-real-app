import 'package:flutter/material.dart';

class AppTextStyleMobile {
  static const TextStyle _titleLarge = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _titleMedium = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _mobileH1 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _mobileH2 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _mobileH3 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _mobileBody1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _mobileBody2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _captionMediumMobile = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static TextTheme get textTheme => const TextTheme(
        //H
        displayLarge: _mobileH1,
        displayMedium: _mobileH2,
        displaySmall: _mobileH2,
        headlineMedium: _mobileH3,
        headlineSmall: _mobileH3,
        // Body
        bodyLarge: _mobileBody1,
        bodyMedium: _mobileBody2,
        bodySmall: _mobileBody2,
        // lable
        labelSmall: _mobileBody2,
        // title
        titleSmall: _captionMediumMobile,
        titleLarge: _titleLarge,
        titleMedium: _titleMedium,
      );
}
