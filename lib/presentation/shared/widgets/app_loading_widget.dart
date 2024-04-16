import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLoadingWidget extends StatefulWidget {
  const AppLoadingWidget({super.key});

  @override
  State<AppLoadingWidget> createState() => _AppLoadingWidgetState();
}

class _AppLoadingWidgetState extends State<AppLoadingWidget> {
  Timer? _timer;
  int _currentIndex = 0;

  final List<String> _imageUrls = [
    'assets/icons/loading/loading1.svg',
    'assets/icons/loading/loading2.svg',
    'assets/icons/loading/loading3.svg',
    'assets/icons/loading/loading4.svg',
    'assets/icons/loading/loading5.svg',
    'assets/icons/loading/loading6.svg',
    'assets/icons/loading/loading7.svg',
    'assets/icons/loading/loading8.svg',
  ];

  @override
  void didChangeDependencies() {
    _startTimer();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      _imageUrls[_currentIndex],
      width: 24,
      height: 24,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (_) {
        setState(() {
          _currentIndex++;
          if (_currentIndex >= _imageUrls.length) {
            _currentIndex = 0;
          }
        });
      },
    );
  }
}
