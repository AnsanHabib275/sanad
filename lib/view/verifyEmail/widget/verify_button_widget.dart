import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/viewModels/controller/verifyEmail/verify_email_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class VerifyButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const VerifyButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final verifyEmailVM = Get.put(VerifyEmailViewModel());
    return Obx(() {
      return RoundButton(
        title: 'verify'.tr,
        loading: verifyEmailVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(RoutesName.loginScreen);
          // if (verifyEmailVM.isOtpFilled.value) {
          //   verifyEmailVM.verifyEmailApi();
          // }
        },
      );
    });
  }
}
