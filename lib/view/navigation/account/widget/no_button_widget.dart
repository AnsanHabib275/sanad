import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';


class NoButtonWidget extends StatelessWidget {
  const NoButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 170,
      height: 40,
      title: 'no'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
