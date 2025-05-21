import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/round_button.dart';
import '../../../../res/themes/app_themes.dart';

class DismissButtonWidget extends StatelessWidget {
  const DismissButtonWidget({super.key});

  // final deleteAccountVM = Get.put(DeleteAccountViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: Theme.of(context).extension<AppColors>()!.buttonBg,
      textColor: Theme.of(context).extension<AppColors>()!.textPrimaryColor,
      fontWeight: FontWeight.w500,
      width: 147,
      title: 'dismiss'.tr,
      // loading: deleteAccountVM.loading.value,
      onPress: () {
        // deleteAccountVM.deleteAccountApi();
      },
    );
  }
}
