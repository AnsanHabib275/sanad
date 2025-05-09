import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';

import '../../../res/routes/routes_name.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: 'login'.tr,
      width: 164,
      onPress: () {
        Get.toNamed(RoutesName.loginScreen);
      },
    );
  }
}
