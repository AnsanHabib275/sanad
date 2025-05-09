import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../../viewModels/controller/resetPassword/reset_password_view_model.dart';

class ResetPasswordButtonWidget extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final String eID;
  const ResetPasswordButtonWidget({
    super.key,
    required this.formKey,
    required this.eID,
  });

  @override
  Widget build(BuildContext context) {
    final resetPasswordVM = Get.put(ResetPasswordViewModel());
    return Obx(() {
      return RoundButton(
        title: 'reset_password'.tr,
        loading: resetPasswordVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          if (formKey.currentState!.validate()) {
            resetPasswordVM.resetPasswordApi(eID);
          }
        },
      );
    });
  }
}
