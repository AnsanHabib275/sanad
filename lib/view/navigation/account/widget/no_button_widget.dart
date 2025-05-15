import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/round_button_border.dart';

class NoButtonWidget extends StatelessWidget {
  const NoButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButtonBorder(
      width: 170,
      title: 'no'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
