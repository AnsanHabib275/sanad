import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeService extends GetxController {
  final Rx<ThemeMode> _themeMode = ThemeMode.system.obs;
  ThemeMode get themeMode => _themeMode.value;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('theme');

    if (savedTheme == 'light') {
      _themeMode.value = ThemeMode.light;
    } else if (savedTheme == 'dark') {
      _themeMode.value = ThemeMode.dark;
    } else {
      _themeMode.value = ThemeMode.system;
    }
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    _themeMode.value = mode;
    Get.changeThemeMode(mode);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      'theme',
      mode == ThemeMode.light
          ? 'light'
          : mode == ThemeMode.dark
          ? 'dark'
          : 'system',
    );
  }

  Future<void> toggleTheme() async {
    if (_themeMode.value == ThemeMode.light) {
      await changeThemeMode(ThemeMode.dark);
    } else {
      await changeThemeMode(ThemeMode.light);
    }
  }
}
