import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewModels/services/theme_service.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Obx(() {
      return SwitchListTile(
        title: Text(
          themeService.themeMode == ThemeMode.dark
              ? 'Dark Mode'
              : 'Light Mode',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        value: themeService.themeMode == ThemeMode.dark,
        onChanged: (value) {
          themeService.toggleTheme();
        },
      );
    });
  }
}