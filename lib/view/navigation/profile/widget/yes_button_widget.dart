import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';

class YesButtonWidget extends StatelessWidget {
  YesButtonWidget({super.key});

  final userVM = Get.put(UserPreference());
  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 119,
      height: 40,
      radius: 30,
      fontSize: 16,
      title: 'yes'.tr,
      onPress: () {
        userVM.removeUser();
        Get.offAllNamed(RoutesName.loginScreen);
      },
    );
  }
}
