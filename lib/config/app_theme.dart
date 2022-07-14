import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_responsive_ui/config/app_colors.dart';

bool isDarkMode(BuildContext context) {
  return window.platformBrightness == Brightness.dark;
}

class AppTheme {
  static final lightTheme = ThemeData(
    fontFamily: null,
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundLightColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
  );
  static final darkTheme = ThemeData(
    fontFamily: null,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: backgroundDarkColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
  );
}
