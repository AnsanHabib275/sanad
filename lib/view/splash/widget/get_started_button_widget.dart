import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';
import 'package:sanad/viewModels/services/login_services.dart';
import '../../../res/components/round_button.dart';

class GetStartedButtonWidget extends StatelessWidget {
  GetStartedButtonWidget({super.key});
  final userServices = Get.put(LoginServices());
  final userVM = Get.put(UserPreference());
  @override
  Widget build(BuildContext context) {
    return RoundButton(
      title: 'get_started'.tr,
      onPress: () {
        userVM.fetchUserDetails();
        userServices.isLogin();
        // userServices.isLogin().then((value) {
        //   Get.delete<LoginServices>();
        // });
        // Get.toNamed(RoutesName.onBoardingScreen);
      },
    );
  }
}
