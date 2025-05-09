import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/components/round_button_border.dart';

class CancelButtonWidget extends StatelessWidget {
  const CancelButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButtonBorder(
      borderColor: AppColor.background,
      textColor: AppColor.background,
      width: 119,
      height: 40,
      radius: 30,
      fontSize: 16,
      title: 'no'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
