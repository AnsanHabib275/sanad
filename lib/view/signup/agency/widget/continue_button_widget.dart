import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';

import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/signup/sign_up_view_model.dart';

class ContinueButtonWidget extends StatelessWidget {
  ContinueButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'continue'.tr,
        loading: signUpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(
            RoutesName.verifyEmailScreen,
            arguments: {'Accountid': '1', 'email': 'a@gimpmail.com'},
          );
          // if (formKey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
