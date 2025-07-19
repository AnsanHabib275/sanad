import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';

import '../../../../utils/utils.dart';

class VerifyWithdrawButtonWidget extends StatelessWidget {
  VerifyWithdrawButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final otpVM = Get.put(OTPViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'verify_withdraw'.tr,
        loading: otpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(RoutesName.agencySignUpFillDetailsScreen);
          // if (otpVM.isOtpFilled.value) {
          //   otpVM.otpApi(eID);
          // }
        },
      );
    });
  }
}
