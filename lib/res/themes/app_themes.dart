import 'package:flutter/material.dart';
import 'package:sanad/res/colors/app_color.dart';

import '../../utils/utils.dart';

class AppThemes {
  static ThemeData lightTheme(double height) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: AppColor.primaryColor,
      secondaryHeaderColor: AppColor.secondaryColor,
      splashColor: AppColor.primaryColor,
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
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.background,
        selectedItemColor: AppColor.selectedBnTextColor,
        unselectedItemColor: AppColor.unselectedBnTextColor,
        selectedIconTheme: IconThemeData(color: AppColor.primaryIconColor),
        unselectedIconTheme: IconThemeData(color: AppColor.secondaryIconColor),
      ),
      colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
        secondary: AppColor.secondaryColor,
        surface: AppColor.surface,
        onSurface: AppColor.blackColor,
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppColors(
          bg: AppColor.background,
          buttonBg: AppColor.secondaryButtonColor,
          cardSelectedBg: AppColor.cardSelectedBgColor,
          cardBg: AppColor.cardBgColor,
          tabsBg: AppColor.tabsBgColor,
          containerBg: AppColor.containerBgColor,
          otpText: AppColor.otpTextColor,
          skipText: AppColor.skipTextColor,
          textPrimaryColor: AppColor.textPrimaryColor,
          textSecondaryColor: AppColor.textSecondaryColor,
          textBodyColor: AppColor.textBodyColor,
        ),
      ],
      cardTheme: CardThemeData(
        color: ThemeData.light().extension<AppColors>()?.cardBg,
        surfaceTintColor:
            ThemeData.light().extension<AppColors>()?.cardSelectedBg,
        elevation: 2,
      ),
      tabBarTheme: TabBarThemeData(
        indicator: BoxDecoration(
          color: ThemeData.light().extension<AppColors>()?.tabsBg,
          // border: Border(
          //   bottom: BorderSide(color: Colors.blue, width: 2),
          // ),
        ),
        labelColor: AppColor.tabSelectedTextColor,
        unselectedLabelColor: AppColor.textSecondaryColor,
      ),
    );
  }

  static ThemeData darkTheme(double height) {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: AppColor.primaryDarkColor,
      secondaryHeaderColor: AppColor.secondaryDarkColor,
      splashColor: AppColor.primaryDarkColor,
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
      dividerColor: AppColor.borderPrimaryDarkColor,
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
        secondary: AppColor.secondaryDarkColor,
        surface: AppColor.darkSurface,
        onSurface: AppColor.whiteColor,
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppColors(
          bg: AppColor.darkBackground,
          buttonBg: AppColor.secondaryButtonDarkColor,
          cardSelectedBg: AppColor.cardSelectedBgDarkColor,
          cardBg: AppColor.cardBgDarkColor,
          tabsBg: AppColor.tabsBgDarkColor,
          containerBg: AppColor.containerBgDarkColor,
          otpText: AppColor.otpTextDarkColor,
          skipText: AppColor.skipTextDarkColor,
          textPrimaryColor: AppColor.textPrimaryDarkColor,
          textSecondaryColor: AppColor.textSecondaryDarkColor,
          textBodyColor: AppColor.textBodyDarkColor,
        ),
      ],
      cardTheme: CardThemeData(
        color: ThemeData.dark().extension<AppColors>()?.cardBg,
        surfaceTintColor:
            ThemeData.light().extension<AppColors>()?.cardSelectedBg,
        elevation: 2,
      ),
      tabBarTheme: TabBarThemeData(
        indicator: BoxDecoration(
          color: ThemeData.dark().extension<AppColors>()?.tabsBg,
          // border: Border(
          //   bottom: BorderSide(color: Colors.blue, width: 2),
          // ),
        ),
        labelColor: AppColor.tabSelectedTextColor,
        unselectedLabelColor: AppColor.textSecondaryColor,
      ),
    );
  }
}

class AppColors extends ThemeExtension<AppColors> {
  final Color bg;
  final Color buttonBg;
  final Color cardSelectedBg;
  final Color cardBg;
  final Color tabsBg;
  final Color containerBg;
  final Color otpText;
  final Color skipText;
  final Color textPrimaryColor;
  final Color textSecondaryColor;
  final Color textBodyColor;

  AppColors({
    required this.bg,
    required this.buttonBg,
    required this.cardSelectedBg,
    required this.cardBg,
    required this.tabsBg,
    required this.containerBg,
    required this.otpText,
    required this.skipText,
    required this.textPrimaryColor,
    required this.textSecondaryColor,
    required this.textBodyColor,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? bg,
    Color? buttonBg,
    Color? cardSelectedBg,
    Color? cardBg,
    Color? tabsBg,
    Color? containerBg,
    Color? otpText,
    Color? skipText,
    Color? textPrimaryColor,
    Color? textSecondaryColor,
    Color? textBodyColor,
  }) {
    return AppColors(
      bg: bg ?? this.bg,
      buttonBg: buttonBg ?? this.buttonBg,
      cardSelectedBg: cardSelectedBg ?? this.cardSelectedBg,
      cardBg: cardBg ?? this.cardBg,
      tabsBg: tabsBg ?? this.tabsBg,
      containerBg: containerBg ?? this.containerBg,
      otpText: otpText ?? this.otpText,
      skipText: skipText ?? this.skipText,
      textPrimaryColor: textPrimaryColor ?? this.textPrimaryColor,
      textSecondaryColor: textSecondaryColor ?? this.textSecondaryColor,
      textBodyColor: textBodyColor ?? this.textBodyColor,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      bg: Color.lerp(bg, other.bg, t)!,
      buttonBg: Color.lerp(buttonBg, other.buttonBg, t)!,
      cardSelectedBg: Color.lerp(cardSelectedBg, other.cardSelectedBg, t)!,
      cardBg: Color.lerp(cardBg, other.cardBg, t)!,
      tabsBg: Color.lerp(tabsBg, other.tabsBg, t)!,
      containerBg: Color.lerp(containerBg, other.containerBg, t)!,
      otpText: Color.lerp(otpText, other.otpText, t)!,
      skipText: Color.lerp(skipText, other.skipText, t)!,
      textPrimaryColor:
          Color.lerp(textPrimaryColor, other.textPrimaryColor, t)!,
      textSecondaryColor:
          Color.lerp(textSecondaryColor, other.textSecondaryColor, t)!,
      textBodyColor: Color.lerp(textBodyColor, other.textBodyColor, t)!,
    );
  }
}
