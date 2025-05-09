import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';

import '../../../../res/routes/routes_name.dart';

class LoginButtonWidget extends StatelessWidget {
  const LoginButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = Get.put(UserPreference());
    return RoundButton(
      title: 'login'.tr,
      width: 164,
      onPress: () {
        userVM.removeUser();
        Get.offAllNamed(RoutesName.loginScreen);
      },
    );
  }
}
