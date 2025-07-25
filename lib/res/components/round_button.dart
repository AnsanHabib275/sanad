import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../colors/app_color.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    super.key,
    this.buttonColor = AppColor.primaryButtonColor,
    this.textColor = AppColor.primaryButtonTextColor,
    this.progressColor = AppColor.primaryProgressBarColor,
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
        height: Utils.getResponsiveHeight(context, height),
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(
            Utils.getResponsiveSize(context, radius),
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
                        fontSize: Utils.getResponsiveSize(context, fontSize),
                        color: textColor,
                      ),
                    ),
                  ),
                ),
      ),
    );
  }
}
