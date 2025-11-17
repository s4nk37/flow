import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:timezone/data/latest.dart' as tz;

import 'core/configs/app_config.dart';
import 'core/i18n/strings.g.dart';
import 'core/router/app_router.dart';
import 'core/services/local_notification_service.dart';
import 'core/utils/theme/app_theme.dart';
import 'core/utils/theme/cubit/theme_cubit.dart';
import 'features/todo/presentation/bloc/todo_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocaleSettings.useDeviceLocale();
  await dotenv.load();
  await di.init();
  tz.initializeTimeZones();
  await LocalNotificationService.requestPermission();

  await LocalNotificationService.initialize();

  runApp(TranslationProvider(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(create: (context) => di.sl<ThemeCubit>()),
        BlocProvider<TodoBloc>(
          create: (context) => di.sl<TodoBloc>()..add(GetTodos()),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            title: kAppName,
            debugShowCheckedModeBanner: false,
            theme: lightThemeData,
            darkTheme: darkThemeData,
            themeMode: themeMode,
            locale: TranslationProvider.of(context).flutterLocale,
            supportedLocales: AppLocaleUtils.supportedLocales,
            localizationsDelegates: GlobalMaterialLocalizations.delegates,
            routerConfig: AppRouter.router,
            themeAnimationDuration: Duration.zero,
          );
        },
      ),
    );
  }
}
