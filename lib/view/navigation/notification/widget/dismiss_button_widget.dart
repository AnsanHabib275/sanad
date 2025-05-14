import 'package:sanad/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/round_button.dart';

class DismissButtonWidget extends StatelessWidget {
  const DismissButtonWidget({super.key});

  // final deleteAccountVM = Get.put(DeleteAccountViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: AppColor.appBarLightBackground,
      textColor: AppColor.textPrimaryColor,
      width: 147,
      height: 40,
      title: 'dismiss'.tr,
      // loading: deleteAccountVM.loading.value,
      onPress: () {
        // deleteAccountVM.deleteAccountApi();
      },
    );
  }
}
