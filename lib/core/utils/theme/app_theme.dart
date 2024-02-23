import 'package:flutter/material.dart';

abstract class AppTheme {
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
}

class LightTheme implements AppTheme {
  @override
  Color primary = const Color(0xFF6200EE);
  @override
  Color secondary = const Color(0xFF03DAC6);
  @override
  Color tertiary = const Color(0xFF018786);
  @override
  Color alternate = const Color(0xFF03DAC6);
  @override
  Color primaryText = const Color(0xFF000000);
  @override
  Color secondaryText = const Color(0xFF000000);
  @override
  Color primaryBackground = const Color(0xFFFFFFFF);
  @override
  Color secondaryBackground = const Color(0xFFE5E5E5);
  @override
  Color accent1 = const Color(0xFFE0E0E0);
  @override
  Color accent2 = const Color(0xFFBDBDBD);
  @override
  Color accent3 = const Color(0xFF828282);
  @override
  Color accent4 = const Color(0xFF4F4F4F);
  @override
  Color success = const Color(0xFF00C853);
  @override
  Color warning = const Color(0xFFFFD600);
  @override
  Color error = const Color(0xFFD50000);
  @override
  Color info = const Color(0xFF2979FF);
}

class DarkTheme implements AppTheme {
  @override
  Color primary = const Color(0xFFBB86FC);
  @override
  Color secondary = const Color(0xFF03DAC6);
  @override
  Color tertiary = const Color(0xFF03DAC6);
  @override
  Color alternate = const Color(0xFF03DAC6);
  @override
  Color primaryText = const Color(0xFFFFFFFF);
  @override
  Color secondaryText = const Color(0xFFFFFFFF);
  @override
  Color primaryBackground = const Color(0xFF121212);
  @override
  Color secondaryBackground = const Color(0xFF1E1E1E);
  @override
  Color accent1 = const Color(0xFF2D2D2D);
  @override
  Color accent2 = const Color(0xFF3A3A3A);
  @override
  Color accent3 = const Color(0xFF4F4F4F);
  @override
  Color accent4 = const Color(0xFF828282);
  @override
  Color success = const Color(0xFF00C853);
  @override
  Color warning = const Color(0xFFFFD600);
  @override
  Color error = const Color(0xFFD50000);
  @override
  Color info = const Color(0xFF2979FF);
}
