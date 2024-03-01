import 'package:flow/features/todo/presentation/bloc/todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/configs/app_config.dart';
import 'core/utils/theme/app_theme.dart';
import 'core/utils/theme/cubit/theme_cubit.dart';
import 'features/todo/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => di.sl<ThemeCubit>(),
        ),
        BlocProvider<TodoBloc>(
          create: (context) => di.sl<TodoBloc>(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp(
            title: kAppName,
            debugShowCheckedModeBanner: false,
            theme: lightThemeData,
            darkTheme: darkThemeData,
            themeMode: themeMode,
            home: const HomePage(),
            themeAnimationStyle: AnimationStyle(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 1000),
            ),
          );
        },
      ),
    );
  }
}
