import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../../res/routes/routes_name.dart';
import '../../../../../viewModels/controller/signup/sign_up_view_model.dart';

class SendCodeButtonWidget extends StatelessWidget {
  SendCodeButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'send_code'.tr,
        loading: signUpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(
            RoutesName.otpScreen,
            arguments: {'Accountid': '1', 'MobileNumber': '0347*******'},
          );
          // if (formKey.currentState!.validate()) {
          //   signUpVM.signUpIndividualApi();
          // }
        },
      );
    });
  }
}
