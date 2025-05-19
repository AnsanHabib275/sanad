import 'package:flutter/material.dart';
import 'package:sanad/res/colors/app_color.dart';

import '../../utils/utils.dart';

class AppThemes {
  static ThemeData lightTheme(double height) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColor.primaryColor,
      scaffoldBackgroundColor: AppColor.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.background,
        titleTextStyle: TextStyle(
          color: AppColor.textPrimaryColor,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          fontSize: height * Utils.getResponsiveSize(24),
        ),
        iconTheme: IconThemeData(color: AppColor.secondaryIconColor),
      ),
      dividerColor: AppColor.borderPrimaryColor,
      dividerTheme: DividerThemeData(
        color: AppColor.borderPrimaryColor,
        thickness: height * Utils.getResponsiveHeight(1),
      ),
      cardTheme: CardThemeData(
        color: AppColor.borderPrimaryColor,
        surfaceTintColor: AppColor.borderPrimaryColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppColor.textPrimaryColor),
        bodyMedium: TextStyle(color: AppColor.textSecondaryColor),
        bodySmall: TextStyle(color: AppColor.textBodyColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColor.textSecondaryColor,
          fontSize: height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
        ),
        errorStyle: TextStyle(
          color: AppColor.redColor,
          fontSize: height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(
            color: AppColor.borderSecondaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(
            color: AppColor.borderSecondaryColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(
            color: AppColor.borderSecondaryColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(color: AppColor.redColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(color: AppColor.redColor, width: 1.0),
        ),
      ),
      iconTheme: IconThemeData(color: AppColor.secondaryIconColor),
      buttonTheme: ButtonThemeData(buttonColor: AppColor.secondaryButtonColor),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(color: AppColor.secondaryButtonTextColor),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.background,
        selectedItemColor: AppColor.selectedBnTextColor,
        unselectedItemColor: AppColor.unselectedBnTextColor,
        selectedIconTheme: IconThemeData(color: AppColor.primaryIconColor),
        unselectedIconTheme: IconThemeData(color: AppColor.secondaryIconColor),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
        surface: AppColor.surface,
        onSurface: AppColor.blackColor,
      ),
    );
  }

  static ThemeData darkTheme(double height) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColor.primaryDarkColor,
      scaffoldBackgroundColor: AppColor.darkSurface,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColor.darkBackground,
        titleTextStyle: TextStyle(
          color: AppColor.textPrimaryDarkColor,
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w600,
          fontSize: height * Utils.getResponsiveSize(24),
        ),
        iconTheme: IconThemeData(color: AppColor.secondaryIconDarkColor),
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColor.tabsBorderColor,
        overlayColor: WidgetStateProperty.all(AppColor.tabsBgColor),
      ),
      dividerColor: AppColor.borderPrimaryDarkColor,
      dividerTheme: DividerThemeData(
        color: AppColor.borderPrimaryDarkColor,
        thickness: height * Utils.getResponsiveHeight(1),
      ),
      cardTheme: CardThemeData(
        color: AppColor.darkBackground,
        surfaceTintColor: AppColor.borderPrimaryDarkColor,
      ),
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: AppColor.textPrimaryDarkColor),
        bodyMedium: TextStyle(color: AppColor.textSecondaryDarkColor),
        bodySmall: TextStyle(color: AppColor.textBodyDarkColor),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: AppColor.textSecondaryDarkColor,
          fontSize: height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
        ),
        errorStyle: TextStyle(
          color: AppColor.redColor,
          fontSize: height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(
            color: AppColor.borderSecondaryDarkColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(
            color: AppColor.borderSecondaryDarkColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(
            color: AppColor.borderSecondaryDarkColor,
            width: 1.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(color: AppColor.redColor, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(height * Utils.getResponsiveSize(8)),
          ),
          borderSide: BorderSide(color: AppColor.redColor, width: 1.0),
        ),
      ),
      iconTheme: IconThemeData(color: AppColor.secondaryIconDarkColor),
      buttonTheme: ButtonThemeData(
        buttonColor: AppColor.secondaryButtonDarkColor,
        hoverColor: AppColor.secondaryButtonDarkColor,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          textStyle: WidgetStateProperty.all(
            TextStyle(color: AppColor.secondaryButtonTextDarkColor),
          ),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkBackground,
        selectedItemColor: AppColor.selectedBnTextColor,
        unselectedItemColor: AppColor.unselectedBnTextDarkColor,
        selectedIconTheme: IconThemeData(color: AppColor.primaryIconColor),
        unselectedIconTheme: IconThemeData(
          color: AppColor.secondaryIconDarkColor,
        ),
      ),
      colorScheme: ColorScheme.dark(
        primary: AppColor.primaryDarkColor,
        surface: AppColor.darkSurface,
        onSurface: AppColor.whiteColor,
      ),
    );
  }
}
