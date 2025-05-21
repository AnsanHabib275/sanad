import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../utils/utils.dart';

class ApplyNowButtonWidget extends StatelessWidget {
  const ApplyNowButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final resetPasswordVM = Get.put(ResetPasswordViewModel());
    // return Obx(() {
    return RoundButton(
      title: 'apply_now'.tr,
      // loading: resetPasswordVM.loading.value,
      onPress: () {
        Utils.hideKeyboardGlobally();
        Get.toNamed(RoutesName.viewJobScreen);
        // if (formKey.currentState!.validate()) {
        //   resetPasswordVM.resetPasswordApi(eID);
        // }
      },
    );
    // });
  }
}
