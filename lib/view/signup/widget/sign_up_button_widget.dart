import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../../viewModels/controller/signup/sign_up_view_model.dart';

class SignUpButtonWidget extends StatelessWidget {
  SignUpButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'sign_up'.tr,
        loading: signUpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          if (formKey.currentState!.validate()) {
            signUpVM.signUpApi();
          }
        },
      );
    });
  }
}
