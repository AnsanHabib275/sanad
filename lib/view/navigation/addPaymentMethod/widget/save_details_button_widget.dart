import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/utils/utils.dart';

class SaveDetailsButtonWidget extends StatelessWidget {
  const SaveDetailsButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // final addPaymentMethodVM = Get.put(AddPaymentMethodViewModel());
    // return Obx(() {
    return RoundButton(
      title: 'save_details'.tr,
      // loading: resetPasswordVM.loading.value,
      onPress: () {
        Utils.hideKeyboardGlobally();
        Get.back();
        // if (formKey.currentState!.validate()) {
        //   resetPasswordVM.resetPasswordApi(eID);
        // }
      },
    );
    // });
  }
}
