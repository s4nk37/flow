import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/i18n/strings.g.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/utils/theme/cubit/theme_cubit.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(t.settings),
      ),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          ListTile(
            title: Text(t.change_language),
            trailing: const Icon(Icons.language),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: AppLocale.values.map((locale) {
              // active locale
              AppLocale activeLocale = LocaleSettings.currentLocale;

              // typed version is preferred to avoid typos
              bool active = activeLocale == locale;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: active
                        ? AppTheme.of(context).secondaryBackground
                        : null,
                  ),
                  onPressed: () {
                    LocaleSettings.setLocale(locale);
                  },
                  child: Text(
                    locale.name == "en" ? t.English : t.Gujarati,
                    style: TextStyle(
                        color: active ? AppTheme.of(context).background : null),
                  ),
                ),
              );
            }).toList(),
          ),
          ListTile(
            title: Text(t.change_theme),
            trailing: const Icon(Icons.color_lens),
          ),
          BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ThemeChip(
                  themeMode: ThemeMode.light,
                  activeThemeMode: state,
                ),
                ThemeChip(
                  themeMode: ThemeMode.dark,
                  activeThemeMode: state,
                ),
                ThemeChip(
                  themeMode: ThemeMode.system,
                  activeThemeMode: state,
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}

class ThemeChip extends StatelessWidget {
  final ThemeMode themeMode;
  final ThemeMode activeThemeMode;
  const ThemeChip({
    super.key,
    required this.themeMode,
    required this.activeThemeMode,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ThemeCubit>().changeTheme(themeMode),
      child: Container(
        padding: const EdgeInsets.all(5),
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
            Icon(themeMode == ThemeMode.dark
                ? Icons.nightlight_round
                : themeMode == ThemeMode.light
                    ? Icons.wb_sunny
                    : Icons.brightness_auto_sharp),
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
