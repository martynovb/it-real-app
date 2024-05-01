import 'dart:io';

import 'package:flutter/foundation.dart';

@Deprecated('Use DeviceLayoutBuilder instead')
//final isMobile = isMobileBrowser || isMobileOS;
//final isMobile = true;

final isMobileBrowser = kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);

final isMobileOS = !kIsWeb && (Platform.isAndroid || Platform.isIOS);
