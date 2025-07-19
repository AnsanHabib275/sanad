import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';

class WithdrawNowButtonWidget extends StatelessWidget {
  const WithdrawNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 136,
      title: 'withdraw_now'.tr,
      onPress: () {
        // Get.back();
      },
    );
  }
}
