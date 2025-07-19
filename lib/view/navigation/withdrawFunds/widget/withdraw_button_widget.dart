import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/components/round_button.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/login/login_view_model.dart';

class WithdrawButtonWidget extends StatelessWidget {
   WithdrawButtonWidget({super.key});

  // final GlobalKey<FormState> formKey;
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'withdraw'.tr,
        loading: loginVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          // if (formKey.currentState!.validate()) {
          //   loginVM.loginApi();
          // }
          // Get.toNamed(RoutesName.navigationScreen);
        },
      );
    });
  }
}
