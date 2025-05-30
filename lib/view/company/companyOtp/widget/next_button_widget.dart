import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/company/companyOtp/company_otp_view_model.dart';

class NextButtonWidget extends StatelessWidget {
  NextButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final otpVM = Get.put(CompanyOTPViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'next'.tr,
        loading: otpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(RoutesName.resetPasswordScreen);
          // if (otpVM.isOtpFilled.value) {
          //   otpVM.otpApi(eID);
          // }
        },
      );
    });
  }
}
