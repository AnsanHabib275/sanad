import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';
import '../../../../../res/themes/app_themes.dart';

class ViewAllButtonWidget extends StatelessWidget {
  const ViewAllButtonWidget({super.key});

  // final deleteAccountVM = Get.put(DeleteAccountViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: Theme.of(context).extension<AppColors>()!.buttonBg,
      textColor: Theme.of(context).extension<AppColors>()!.textSecondaryColor,
      fontWeight: FontWeight.w500,
      radius: 6,
      fontSize: 12,
      width: 70,
      height: 22,
      title: 'view_all'.tr,
      // loading: deleteAccountVM.loading.value,
      onPress: () {
        // deleteAccountVM.deleteAccountApi();
      },
    );
  }
}
