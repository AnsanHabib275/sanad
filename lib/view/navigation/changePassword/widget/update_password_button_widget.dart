import 'package:sanad/res/components/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/navigation/changePassword/change_password_view_model.dart';

class UpdatePasswordButtonWidget extends StatelessWidget {
  UpdatePasswordButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final changePasswordVM = Get.put(ChangePasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'change_password'.tr,
        loading: changePasswordVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          if (formKey.currentState!.validate()) {
            changePasswordVM.changePasswordApi();
          }
        },
      );
    });
  }
}
