import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button_border.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../../res/routes/routes_name.dart';

class SignUpAsARecruiterButtonWidget extends StatelessWidget {
  const SignUpAsARecruiterButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButtonBorder(
        title: 'sign_up_as_a_recruiter'.tr,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(
            RoutesName.signUpScreen,
          );
        },
      );
    });
  }
}
