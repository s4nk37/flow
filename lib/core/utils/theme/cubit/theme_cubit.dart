import 'package:flow/core/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../configs/app_config.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(AppTheme.themeMode);

  void changeTheme() {
    ThemeMode newThemeMode;

    if (state == ThemeMode.light) {
      newThemeMode = ThemeMode.dark;
    } else if (state == ThemeMode.dark) {
      newThemeMode = ThemeMode.system;
    } else {
      newThemeMode = ThemeMode.light;
    }

    AppTheme.saveThemeMode(newThemeMode);
    emit(newThemeMode);
  }

  @override
  void onChange(Change<ThemeMode> change) {
    logger.e("Theme changed to ${change.nextState.name}");
    super.onChange(change);
  }
}
