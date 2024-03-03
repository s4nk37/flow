import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/theme/cubit/theme_cubit.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: BlocBuilder<ThemeCubit, ThemeMode>(builder: (context, state) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            state == ThemeMode.dark
                ? const Icon(Icons.nightlight_round)
                : state == ThemeMode.light
                    ? const Icon(Icons.wb_sunny)
                    : const Icon(Icons.brightness_auto_sharp),
            const SizedBox(width: 10),
            Text(
              state == ThemeMode.dark
                  ? 'Dark'
                  : state == ThemeMode.light
                      ? 'Light'
                      : 'System',
            ),
          ],
        );
      }),
      onPressed: () => context.read<ThemeCubit>().changeTheme(),
    );
  }
}
