import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../colors/app_color.dart';

class RoundButtonBorder extends StatelessWidget {
  const RoundButtonBorder(
      {super.key,
      this.buttonColor = AppColor.transparent,
      this.borderColor = AppColor.blue,
      this.textColor = AppColor.blue,
      this.progressColor = AppColor.whiteColor,
      required this.title,
      required this.onPress,
      this.width = double.infinity,
      this.height = 50,
      this.fontSize = 16,
      this.fontWeight = FontWeight.w500,
      this.radius = 30,
      this.borderWidth = 1,
      this.loading = false});

  final bool loading;
  final String title;
  final double borderWidth;
  final double height, width, fontSize, radius;
  final FontWeight fontWeight;
  final VoidCallback onPress;

  final Color textColor, buttonColor, borderColor, progressColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: Get.height * Utils.getResponsiveHeight(height),
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          border: Border.all(
            color: borderColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(
              Get.height * Utils.getResponsiveSize(radius)),
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(
                color: progressColor,
              ))
            : Center(
                child: Text(
                  title,
                  style: TextStyle(
                      fontFamily: 'Manrope',
                      fontWeight: fontWeight,
                      fontSize: Get.height * Utils.getResponsiveSize(fontSize),
                      color: textColor),
                ),
              ),
      ),
    );
  }
}
