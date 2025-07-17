import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../../utils/utils.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({
    super.key,
    required this.isPrivate,
    required this.jobName,
    required this.companyName,
    required this.location,
    required this.jobType,
    required this.salaryRange,
    required this.isOpenToRelocating,
    required this.softwarePrograms,
  });

  final bool isPrivate;
  final String jobName;
  final String companyName;
  final String location;
  final String jobType;
  final String salaryRange;
  final String isOpenToRelocating;
  final List<String> softwarePrograms;

  @override
  Widget build(BuildContext context) {
    // final resetPasswordVM = Get.put(ResetPasswordViewModel());
    // return Obx(() {
    return RoundButton(
      title: 'submit'.tr,
      // loading: resetPasswordVM.loading.value,
      onPress: () {
        Utils.hideKeyboardGlobally();
        Get.toNamed(RoutesName.submittedCvScreen);
        // if (formKey.currentState!.validate()) {
        //   resetPasswordVM.resetPasswordApi(eID);
        // }
      },
    );
    // });
  }
}
