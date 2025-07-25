import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/login/login_view_model.dart';

class LoginButtonWidget extends StatelessWidget {
  LoginButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'login'.tr,
        loading: loginVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          // if (formKey.currentState!.validate()) {
          //   loginVM.loginApi();
          // }
          Get.toNamed(RoutesName.navigationScreen);
        },
      );
    });
  }
}
