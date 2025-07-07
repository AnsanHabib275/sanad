import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../viewModels/controller/onBoarding/onboarding_view_model.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';

class NextButtonWidget extends StatelessWidget {
  NextButtonWidget({super.key, required this.pageController});
  final PageController pageController; //= PageController();
  final userVM = Get.put(UserPreference());
  final onBoardingVM = Get.find<OnBoardingViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: onBoardingVM.currentPage.value <= 1 ? 'next'.tr : 'continue'.tr,
        onPress: () {
          if (onBoardingVM.currentPage.value < 2) {
            pageController.nextPage(
              duration: const Duration(milliseconds: 100),
              curve: Curves.linear,
            );
          } else {
            Get.toNamed(RoutesName.selectRoleScreen);
          }
          // userVM.saveFirstUse(false).then((value) {
          //   Get.delete<OnBoardingViewModel>();
          //   Get.offAllNamed(RoutesName.signUpScreen);
          // });
        },
      );
    });
  }
}
