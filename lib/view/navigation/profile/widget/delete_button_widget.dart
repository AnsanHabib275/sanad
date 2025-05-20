import 'package:sanad/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/components/round_button.dart';
import '../../../../res/themes/app_themes.dart';

class DeleteButtonWidget extends StatelessWidget {
  const DeleteButtonWidget({super.key});

  // final deleteAccountVM = Get.put(DeleteAccountViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        buttonColor: Theme.of(context).extension<AppColors>()!.buttonBg,
        textColor: Theme.of(context).extension<AppColors>()!.textPrimaryColor,
        width: 119,
        height: 40,
        radius: 30,
        fontSize: 16,
        title: 'yes'.tr,
        // loading: deleteAccountVM.loading.value,
        onPress: () {
          // deleteAccountVM.deleteAccountApi();
        },
      );
    });
  }
}
