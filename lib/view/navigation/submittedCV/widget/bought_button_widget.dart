import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';

class BoughtButtonWidget extends StatelessWidget {
  const BoughtButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 64,
      height: 30,
      fontSize: 10,
      fontWeight: FontWeight.w500,
      radius: 7,
      title: 'bought'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
