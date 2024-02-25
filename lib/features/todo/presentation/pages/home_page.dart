import 'package:flow/core/utils/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/theme/app_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            icon: const Icon(Icons.light),
            onPressed: () => context.read<ThemeCubit>().changeTheme(),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: AppTheme.of(context).primaryBackground,
            title: Text(
              'Task $index',
              style: TextStyle(color: AppTheme.of(context).primaryText),
            ),
            subtitle: Text(
              'Description $index',
              style: TextStyle(color: AppTheme.of(context).secondaryText),
            ),
          );
        },
      ),
    );
  }
}
