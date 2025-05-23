import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';

class BackToJobsButtonWidget extends StatelessWidget {
  const BackToJobsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 170,
      height: 40,
      title: 'back_to_jobs'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
