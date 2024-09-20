import 'package:flutter/material.dart';

class AppTextStyleWeb {
  static const TextStyle _webH1 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _webH2 = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _webH3 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _webH4 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _webH5 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _webBody1 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _webBody2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _webBody3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _webBody4 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  // ignore: unused_field
  static const TextStyle _webBody5 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _webCaption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static TextTheme get textTheme => const TextTheme(
        //H
        displayLarge: _webH1,
        displayMedium: _webH2,
        displaySmall: _webH3,
        headlineMedium: _webH4,
        headlineSmall: _webH5,
        // Body
        bodyLarge: _webBody1,
        bodyMedium: _webBody2,
        bodySmall: _webBody3,

        labelLarge: _webBody2,
        labelMedium: _webBody3,
        labelSmall: _webBody4,

        titleSmall: _webCaption,
      );
}
