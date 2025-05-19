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
      buttonColor: AppColor.secondaryButtonColor,
      textColor: Theme.of(context).textTheme.bodyLarge!.color!,
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
