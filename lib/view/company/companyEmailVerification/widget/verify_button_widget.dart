import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/company/companyVerifyEmail/company_verify_email_view_model.dart';

class VerifyButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  const VerifyButtonWidget({super.key, required this.formKey});

  @override
  Widget build(BuildContext context) {
    final verifyEmailVM = Get.put(CompanyVerifyEmailViewModel());
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
