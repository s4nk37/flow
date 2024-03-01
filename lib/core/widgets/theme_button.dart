import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/theme/cubit/theme_cubit.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) {
        if (state == ThemeMode.dark) {
          return const Icon(Icons.nightlight_round);
        } else if (state == ThemeMode.light) {
          return const Icon(Icons.wb_sunny);
        } else {
          return const Icon(Icons.brightness_auto_sharp);
        }
      }),
      onPressed: () => context.read<ThemeCubit>().changeTheme(),
    );
  }
}
