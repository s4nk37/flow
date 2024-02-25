import 'package:flow/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/app_config.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(AppTheme.themeMode);

  void changeTheme() {
    AppTheme.saveThemeMode(AppTheme.themeMode == ThemeMode.light
        ? ThemeMode.dark
        : ThemeMode.light);
    final newTheme = AppTheme.themeMode;
    emit(newTheme);
  }

  @override
  void onChange(Change<ThemeMode> change) {
    logger.e("Theme changed to ${change.nextState.name}");
    super.onChange(change);
  }
}
