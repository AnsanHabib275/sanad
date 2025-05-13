import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../../../viewModels/controller/resetPassword/reset_password_view_model.dart';

class NextButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String eID;
  const NextButtonWidget({super.key, required this.formKey, required this.eID});

  @override
  Widget build(BuildContext context) {
    final resetPasswordVM = Get.put(ResetPasswordViewModel());
    return Obx(() {
      return RoundButton(
        title: 'next'.tr,
        loading: resetPasswordVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(RoutesName.resetDoneScreen);
          // if (formKey.currentState!.validate()) {
          //   resetPasswordVM.resetPasswordApi(eID);
          // }
        },
      );
    });
  }
}
