import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../../res/components/round_button.dart';

class DepositNowButtonWidget extends StatelessWidget {
  const DepositNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 124,
      title: 'withdraw_now'.tr,
      onPress: () {
        Get.toNamed(RoutesName.withdrawFundsScreen);
      },
    );
  }
}
