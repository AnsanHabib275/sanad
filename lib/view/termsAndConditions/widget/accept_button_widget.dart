import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';

class AcceptButtonWidget extends StatelessWidget {
  const AcceptButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 193,
      height: 40,
      title: 'accept'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
