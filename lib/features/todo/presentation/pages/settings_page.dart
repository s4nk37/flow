import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/app_config.dart';
import '../../../../core/i18n/strings.g.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/utils/theme/cubit/theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.settings)),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ListTile(
            title: Text(t.change_language),
            trailing: const Icon(Icons.language),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: AppLocale.values.map((locale) {
              AppLocale activeLocale = LocaleSettings.currentLocale;
              bool active = activeLocale == locale;
              return LanguageChip(active: active, locale: locale);
            }).toList(),
          ),
          ListTile(
            title: Text(context.t.change_theme),
            trailing: const Icon(Icons.color_lens),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, state) {
              return GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                shrinkWrap: true,
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ThemeChip(themeMode: ThemeMode.light, activeThemeMode: state),
                  ThemeChip(themeMode: ThemeMode.dark, activeThemeMode: state),
                  ThemeChip(
                    themeMode: ThemeMode.system,
                    activeThemeMode: state,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class LanguageChip extends StatelessWidget {
  const LanguageChip({super.key, required this.active, required this.locale});

  final bool active;
  final AppLocale locale;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LocaleSettings.setLocale(locale);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: active ? 2 : 1,
            color: active
                ? AppTheme.of(context).primary
                : AppTheme.of(context).secondaryBackground,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          locale.name == kLocaleEnglish
              ? t.English
              : locale.name == kLocaleGujarati
              ? t.Gujarati
              : t.Hindi,
        ),
      ),
    );
  }
}

class ThemeChip extends StatelessWidget {
  const ThemeChip({
    super.key,
    required this.themeMode,
    required this.activeThemeMode,
  });
  final ThemeMode themeMode;
  final ThemeMode activeThemeMode;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ThemeCubit>().changeTheme(themeMode),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(
            width: activeThemeMode == themeMode ? 2 : 1,
            color: activeThemeMode == themeMode
                ? AppTheme.of(context).primary
                : AppTheme.of(context).secondaryBackground,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Icon(
              themeMode == ThemeMode.dark
                  ? Icons.nightlight_round
                  : themeMode == ThemeMode.light
                  ? Icons.wb_sunny
                  : Icons.brightness_auto_sharp,
            ),
            const SizedBox(width: 10),
            Text(
              themeMode == ThemeMode.dark
                  ? 'Dark'
                  : themeMode == ThemeMode.light
                  ? 'Light'
                  : 'System',
            ),
          ],
        ),
      ),
    );
  }
}
