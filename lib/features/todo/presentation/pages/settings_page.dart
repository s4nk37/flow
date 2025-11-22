import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/app_config.dart';
import '../../../../core/i18n/strings.g.dart';
import '../../../../core/utils/theme/app_theme.dart';
import '../../../../core/utils/theme/cubit/theme_cubit.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(t.settings)),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [

          /// LANGUAGE SECTION -----------------------------------------
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              t.change_language,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: AppLocale.values.map((locale) {
              final current = LocaleSettings.currentLocale;
              return LanguageChip(
                active: current == locale,
                locale: locale,
              );
            }).toList(),
          ),

          const SizedBox(height: 28),

          /// THEME SECTION --------------------------------------------
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              t.change_theme,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  ThemeChip(themeMode: ThemeMode.light, activeThemeMode: themeMode),
                  ThemeChip(themeMode: ThemeMode.dark, activeThemeMode: themeMode),
                  ThemeChip(themeMode: ThemeMode.system, activeThemeMode: themeMode),
                ],
              );
            },
          ),

          const SizedBox(height: 28),

          /// ACCOUNT SECTION ------------------------------------------
          const Divider(height: 32),

          Text(
            t.account,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),

          const SizedBox(height: 16),

          // Logout Button
          InkWell(
            onTap: () => _confirmLogout(context),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.logout, color: Colors.red.shade700),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      t.logout,
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red.shade400),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),

          // Delete Account Button
          InkWell(
            onTap: () => _confirmDeleteAccount(context),
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.delete_forever, color: Colors.red.shade700),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Delete Account',
                      style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.red.shade400),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _confirmLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(t.logout),
        content: Text(t.logout_confirmation),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(t.cancel),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              context.read<AuthBloc>().add(AuthLogout());
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('You have been logged out successfully'),
                  backgroundColor: Colors.green.shade600,
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            child: Text(t.logout),
          ),
        ],
      ),
    );
  }

  void _confirmDeleteAccount(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
          'Are you sure you want to delete your account? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(t.cancel),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(ctx);
              // TODO: Implement delete account logic
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Delete account feature coming soon'),
                ),
              );
            },
            child: const Text('Delete'),
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
      onTap: () => {
        LocaleSettings.setLocale(locale),
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: active
                ? AppTheme.of(context).primary
                : Colors.grey.shade300,
            width: active ? 2 : 1,
          ),
          color: active
              ? AppTheme.of(context).primary.withOpacity(0.1)
              : null,
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
    final bool selected = themeMode == activeThemeMode;

    return GestureDetector(
      onTap: () => context.read<ThemeCubit>().changeTheme(themeMode),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:
            selected ? AppTheme.of(context).primary : Colors.grey.shade300,
            width: selected ? 2 : 1,
          ),
          color: selected
              ? AppTheme.of(context).primary.withOpacity(0.1)
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              themeMode == ThemeMode.dark
                  ? Icons.dark_mode
                  : themeMode == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.auto_mode,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              themeMode == ThemeMode.dark
                  ? t.dark
                  : themeMode == ThemeMode.light
                  ? t.light
                  : t.system,
            ),
          ],
        ),
      ),
    );
  }
}
