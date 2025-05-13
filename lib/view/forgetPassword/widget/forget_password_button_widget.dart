import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/forgetPassword/forget_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordButtonWidget extends StatelessWidget {
  ForgetPasswordButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final forgetPasswordVM = Get.put(ForgetPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'next'.tr,
        loading: forgetPasswordVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(
            RoutesName.otpScreen,
            arguments: {'eID': 'kjbsdjskd273w', 'email': 'a@gimpmail.com'},
          );
          // if (formKey.currentState!.validate()) {
          //   forgetPasswordVM.forgetPasswordApi();
          // }
        },
      );
    });
  }
}
