import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';

import '../../../../../utils/utils.dart';


class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return RoundButton(
      title: 'submit'.tr,
      // loading: loginVM.loading.value,
      onPress: () {
        Utils.hideKeyboardGlobally();
        // if (formKey.currentState!.validate()) {
        //   loginVM.loginApi();
        // }
        Get.back();
      },
    );
    // });
  }
}
