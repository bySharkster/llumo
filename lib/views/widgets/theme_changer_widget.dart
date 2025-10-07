import 'package:flutter/material.dart';
import 'package:flutter_app/data/notifiers.dart';

class ThemeChangerWidget extends StatelessWidget {
  const ThemeChangerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isDarkModeNotifier,
      builder: (context, value, child) {
        return IconButton(
          icon: Icon(value ? Icons.dark_mode : Icons.light_mode),
          tooltip: value ? 'Light mode' : 'Dark mode',
          onPressed: () {
            isDarkModeNotifier.value = !isDarkModeNotifier.value;
          },
        );
      },
    );
  }
}