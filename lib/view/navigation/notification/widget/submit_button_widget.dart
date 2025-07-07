import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';
class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 147,
      title: 'submit'.tr,
      onPress: () {
        // Get.back();
      },
    );
  }
}
