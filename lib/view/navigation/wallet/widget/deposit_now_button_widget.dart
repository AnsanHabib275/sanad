import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/components/round_button.dart';

class DepositNowButtonWidget extends StatelessWidget {
  const DepositNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 124,
      title: 'deposit_now'.tr,
      onPress: () {
        // Get.back();
      },
    );
  }
}
