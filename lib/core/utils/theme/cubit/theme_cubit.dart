import 'package:flow/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(AppTheme.themeMode);

  void changeTheme(ThemeMode mode) {
    AppTheme.saveThemeMode(mode);
    final newTheme = AppTheme.themeMode;
    emit(newTheme);
  }
}
