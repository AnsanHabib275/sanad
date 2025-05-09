import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../viewModels/controller/onBoarding/onboarding_view_model.dart';
import '../../../viewModels/controller/userPreference/user_preference_view_model.dart';

class SignUpButtonWidget extends StatelessWidget {
  SignUpButtonWidget({super.key});
  final userVM = Get.put(UserPreference());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: 'sign_up'.tr,
      onPress: () {
        userVM.saveFirstUse(false).then((value) {
          Get.delete<OnBoardingViewModel>();
          Get.offAllNamed(RoutesName.signUpScreen);
        });
      },
    );
  }
}
