import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../res/components/round_button.dart';
import '../../../../../../res/themes/app_themes.dart';

class DiscardButtonWidget extends StatelessWidget {
  const DiscardButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: Theme.of(context).extension<AppColors>()!.buttonBg,
      textColor: Theme.of(context).extension<AppColors>()!.textPrimaryColor,
      fontWeight: FontWeight.w500,
      width: 90,
      height: 40,
      title: 'discard'.tr,
      onPress: () {
        Get.back();
      },
    );
  }
}
