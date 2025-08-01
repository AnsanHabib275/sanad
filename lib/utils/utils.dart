import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static double baseHeight = 932;
  static double baseWidth = 430;
  static double deviceHeight = Get.height;
  static double deviceWidth = Get.width;

  static void fieldFocusChange(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static snackBar(String title, String message) {
    Get.snackbar(title, message);
  }

  // static double getResponsiveHeight(double figmaHeight) {
  //   double scale = deviceHeight / baseHeight;
  //   return figmaHeight * scale;
  // }
  //
  // static double getResponsiveWidth(double figmaWidth) {
  //   double scale = deviceWidth / baseWidth;
  //   return figmaWidth * scale;
  // }
  //
  // static double getResponsiveSize(double figmaSize) {
  //   double scale = min(deviceWidth / baseWidth, deviceHeight / baseHeight);
  //   return figmaSize * scale;
  // }
  static double getResponsiveHeight(BuildContext context, double figmaHeight) {
    final deviceHeight = MediaQuery.of(context).size.height;
    double scale = deviceHeight / baseHeight;
    return figmaHeight * scale;
  }

  static double getResponsiveWidth(BuildContext context, double figmaWidth) {
    final deviceWidth = MediaQuery.of(context).size.width;
    double scale = deviceWidth / baseWidth;
    return figmaWidth * scale;
  }

  static double getResponsiveSize(BuildContext context, double figmaSize) {
    final size = MediaQuery.of(context).size;
    double scale = min(size.width / baseWidth, size.height / baseHeight);
    return figmaSize * scale;
  }

  static String apiFormatDate(String appDate) {
    try {
      final parsedDate = DateFormat('MM-dd-yyyy').parse(appDate);
      return DateFormat('yyyy-MM-dd').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  static String appFormatDate(String apiDate) {
    try {
      DateTime parsedDate = DateTime.parse(apiDate).toLocal();
      return DateFormat('MM-dd-yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  static String scanFormatDate(String apiDate) {
    try {
      DateTime parsedDate = DateTime.parse(apiDate).toLocal();
      return DateFormat('dd MMM,yyyy').format(parsedDate);
    } catch (e) {
      return '';
    }
  }

  static hideKeyboardGlobally() {
    final isKeyboardOpen = MediaQuery.of(Get.context!).viewInsets.bottom > 0;
    if (isKeyboardOpen) {
      // FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

extension StringExtensions on String {
  String toTitleCase() {
    return split(' ')
        .map((word) {
          if (word.isEmpty) return word;
          return word[0].toUpperCase() + word.substring(1).toLowerCase();
        })
        .join(' ');
  }
}
