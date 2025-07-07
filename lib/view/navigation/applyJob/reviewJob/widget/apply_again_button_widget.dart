import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';

import '../../../../../../res/themes/app_themes.dart';
import '../../../navigation_screen.dart';

class ApplyAgainButtonWidget extends StatelessWidget {
  const ApplyAgainButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: Theme.of(context).extension<AppColors>()!.buttonBg,
      textColor: Theme.of(context).extension<AppColors>()!.textPrimaryColor,
      fontWeight: FontWeight.w500,
      width: 170,
      height: 40,
      title: 'apply_again'.tr,
      onPress: () {
        Get.offAll(() => NavigationScreen(initialIndex: 0));
      },
    );
  }
}
