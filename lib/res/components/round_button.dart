import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import '../colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.buttonColor = AppColor.primaryColor,
    this.textColor = AppColor.buttonTextColor,
    this.progressColor = AppColor.whiteColor,
    required this.title,
    required this.onPress,
    this.width = double.infinity,
    this.height = 40,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
    this.radius = 8,
    this.loading = false,
  });

  final bool loading;
  final String title;
  final double height, width, fontSize, radius;
  final FontWeight fontWeight;
  final VoidCallback onPress;

  final Color textColor, buttonColor, progressColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: Get.height * Utils.getResponsiveHeight(height),
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            Get.height * Utils.getResponsiveSize(radius),
          ),
        ),
        child:
            loading
                ? Center(child: CircularProgressIndicator(color: progressColor))
                : Center(
                  child: FittedBox(
                    child: Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Manrope',
                        fontWeight: fontWeight,
                        fontSize:
                            Get.height * Utils.getResponsiveSize(fontSize),
                        color: textColor,
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
