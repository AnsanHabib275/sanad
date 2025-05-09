import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class VerifyButtonWidget extends StatelessWidget {
  VerifyButtonWidget({super.key, required this.formKey, required this.eID});

  final GlobalKey<FormState> formKey;
  final String eID;
  final otpVM = Get.put(OTPViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'verify'.tr,
        loading: otpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          // if (formKey.currentState!.validate()) {
          if (otpVM.isOtpFilled.value) {
            otpVM.otpApi(eID);
          }
        },
      );
    });
  }
}
