// ignore_for_file: overridden_fields, annotate_overrides
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../configs/app_config.dart';

SharedPreferences? _prefs;

final lightThemeData = ThemeData(
            useMaterial3: true,
            fontFamily: kAppFont,
            brightness: Brightness.light);
final darkThemeData = ThemeData(
            useMaterial3: true,
            fontFamily: kAppFont,
            brightness: Brightness.dark);

abstract class AppTheme {
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();

  static ThemeMode get themeMode {
    final darkMode = _prefs?.getBool(kThemeModeKey);
    return darkMode == null
        ? ThemeMode.system
        : darkMode
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  static void saveThemeMode(ThemeMode mode) => mode == ThemeMode.system
      ? _prefs?.remove(kThemeModeKey)
      : _prefs?.setBool(kThemeModeKey, mode == ThemeMode.dark);

  static AppTheme of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? DarkTheme()
        : LightTheme();
  }

  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary;
  late Color secondary;
  late Color tertiary;
  late Color alternate;
  late Color primaryText;
  late Color secondaryText;
  late Color primaryBackground;
  late Color secondaryBackground;
  late Color accent1;
  late Color accent2;
  late Color accent3;
  late Color accent4;
  late Color success;
  late Color warning;
  late Color error;
  late Color info;

  late Color primaryBtnText;
  late Color lineColor;
  late Color noaktive;
  late Color searchColor;
  late Color grayIcon;
  late Color gray200;
  late Color gray600;
  late Color black600;
  late Color tertiary400;
  late Color textColor;
}

class LightTheme extends AppTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFFFFFFFF);
  late Color secondary = const Color(0xFF6E61FA);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFF640404);
  late Color primaryText = const Color(0xFF101213);
  late Color secondaryText = const Color(0xFF57636C);
  late Color primaryBackground = const Color(0xFFFFFFFF);
  late Color secondaryBackground = const Color(0xFFFFFFFF);
  late Color accent1 = const Color(0xFF616161);
  late Color accent2 = const Color(0xFF757575);
  late Color accent3 = const Color(0xFFE0E0E0);
  late Color accent4 = const Color(0xFFEEEEEE);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color primaryBtnText = const Color(0xFFFFFFFF);
  late Color lineColor = const Color(0xFF6E61FA);
  late Color noaktive = const Color(0xFF757575);
  late Color searchColor = const Color(0xFFEDEDED);
  late Color grayIcon = const Color(0xFF95A1AC);
  late Color gray200 = const Color(0xFFDBE2E7);
  late Color gray600 = const Color(0xFF262D34);
  late Color black600 = const Color(0xFF090F13);
  late Color tertiary400 = const Color(0xFF39D2C0);
  late Color textColor = const Color(0xFF1E2429);
}

class DarkTheme extends AppTheme {
  @Deprecated('Use primary instead')
  Color get primaryColor => primary;
  @Deprecated('Use secondary instead')
  Color get secondaryColor => secondary;
  @Deprecated('Use tertiary instead')
  Color get tertiaryColor => tertiary;

  late Color primary = const Color(0xFF1F1F1F);
  late Color secondary = const Color(0xFF6E61FA);
  late Color tertiary = const Color(0xFFEE8B60);
  late Color alternate = const Color(0xFFE8E8E8);
  late Color primaryText = const Color(0xFFFFFFFF);
  late Color secondaryText = const Color(0xFF95A1AC);
  late Color primaryBackground = const Color(0xFF1A1F24);
  late Color secondaryBackground = const Color(0xFF101213);
  late Color accent1 = const Color(0xFFEEEEEE);
  late Color accent2 = const Color(0xFFE0E0E0);
  late Color accent3 = const Color(0xFF757575);
  late Color accent4 = const Color(0xFF616161);
  late Color success = const Color(0xFF04A24C);
  late Color warning = const Color(0xFFFCDC0C);
  late Color error = const Color(0xFFE21C3D);
  late Color info = const Color(0xFF1C4494);

  late Color primaryBtnText = const Color(0xFFFFFFFF);
  late Color lineColor = const Color(0xFFE8E8E8);
  late Color noaktive = const Color(0xFF757575);
  late Color searchColor = const Color(0xFFEDEDED);
  late Color grayIcon = const Color(0xFF95A1AC);
  late Color gray200 = const Color(0xFFDBE2E7);
  late Color gray600 = const Color(0xFF262D34);
  late Color black600 = const Color(0xFF090F13);
  late Color tertiary400 = const Color(0xFF39D2C0);
  late Color textColor = const Color(0xFF1E2429);
}
