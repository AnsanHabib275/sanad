import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/utils.dart';

class NextButtonWidget extends StatelessWidget {
  NextButtonWidget({super.key, required this.formKey, required this.eID});

  final GlobalKey<FormState> formKey;
  final String eID;
  final otpVM = Get.put(OTPViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'next'.tr,
        loading: otpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(
            RoutesName.resetPasswordScreen,
            arguments: {'eID': 'bdjshdfjshvd'},
          );
          // if (formKey.currentState!.validate()) {
          // if (otpVM.isOtpFilled.value) {
          //   otpVM.otpApi(eID);
          // }
        },
      );
    });
  }
}
