import 'package:flutter/material.dart';

class ResponsiveUtils {
  final BuildContext context;
  late final MediaQueryData _mediaQuery;
  late final double _screenWidth;
  late final double _screenHeight;

  ResponsiveUtils(this.context) {
    _mediaQuery = MediaQuery.of(context);
    _screenWidth = _mediaQuery.size.width;
    _screenHeight = _mediaQuery.size.height;
  }

  double wp(double percentage) {
    return _screenWidth * (percentage / 100);
  }

  double hp(double percentage) {
    return _screenHeight * (percentage / 100);
  }

  double sp(double size) {
    return size * (_screenWidth / 375);
  }

  bool get isTablet => _screenWidth >= 768;

  bool get isMobile => _screenWidth < 768;

  double get screenWidth => _screenWidth;

  double get screenHeight => _screenHeight;
}