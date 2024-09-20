import 'dart:io';

import 'package:flutter/foundation.dart';


class AppUtils {
  static bool get isMobile => isMobileBrowser || isMobileOS;

  static bool get isMobileBrowser =>
      kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  static bool get isMobileOS => !kIsWeb && (Platform.isAndroid || Platform.isIOS);
}
