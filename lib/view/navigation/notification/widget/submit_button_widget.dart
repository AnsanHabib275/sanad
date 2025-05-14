import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/components/round_button_border.dart';

import '../../../../res/components/round_button.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 147,
      height: 40,
      title: 'submit'.tr,
      onPress: () {
        // Get.back();
      },
    );
  }
}
