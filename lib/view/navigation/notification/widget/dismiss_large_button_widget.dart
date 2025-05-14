import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/components/round_button_border.dart';

import '../../../../res/components/round_button.dart';

class DismissLargeButtonWidget extends StatelessWidget {
  const DismissLargeButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: AppColor.appBarLightBackground,
      textColor: AppColor.textPrimaryColor,
      width: 306,
      height: 40,
      title: 'dismiss'.tr,
      onPress: () {
        // Get.back();
      },
    );
  }
}
