import 'package:flow/core/utils/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.light),
            onPressed: () =>
                context.read<ThemeCubit>().changeTheme(ThemeMode.light),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Hello, World!',
          style: TextStyle(
            color: AppTheme.of(context).secondary,
          ),
        ),
      ),
    );
  }
}
