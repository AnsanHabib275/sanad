import 'package:flutter/material.dart';
import 'package:sanad/res/colors/app_color.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColor.primaryButtonColor,
    scaffoldBackgroundColor: AppColor.whiteColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.whiteColor,
      titleTextStyle: TextStyle(
        color: AppColor.textPrimaryColor,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColor.textPrimaryColor),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColor.textPrimaryColor),
      bodyMedium: TextStyle(color: AppColor.textPrimaryColor),
      bodySmall: TextStyle(color: AppColor.textSecondaryColor),
    ),
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryButtonColor,
      surface: AppColor.whiteColor,
      onSurface: AppColor.blackColor,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryDarkColor,
    scaffoldBackgroundColor: AppColor.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.darkBackground,
      titleTextStyle: TextStyle(
        color: AppColor.textPrimaryDarkColor,
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColor.textPrimaryDarkColor),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColor.textPrimaryDarkColor),
      bodyMedium: TextStyle(color: AppColor.textPrimaryDarkColor),
      bodySmall: TextStyle(color: AppColor.textSecondaryDarkColor),
    ),
    colorScheme: ColorScheme.dark(
      primary: AppColor.primaryDarkColor,
      surface: AppColor.darkSurface,
      onSurface: AppColor.whiteColor,
    ),
  );
}