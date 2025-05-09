import 'dart:async';
import 'package:get/get.dart';
import '../../res/routes/routes_name.dart';
import '../controller/userPreference/user_preference_view_model.dart';

class LoginServices extends GetxController {
  final userVM = Get.put(UserPreference());

  Future<void> isLogin() async {
    bool isFirstTime = await userVM.getFirstUse();
    if (isFirstTime) {
      Get.offAllNamed(RoutesName.onBoardingScreen);
    } else if (userVM.userEid.isEmpty) {
      Get.offAllNamed(RoutesName.loginScreen);
    } else if (userVM.userImageURL.isEmpty ||
        userVM.userGender.isEmpty ||
        userVM.userDob.isEmpty ||
        userVM.userCountryCode.isEmpty ||
        userVM.userMobileNumber.isEmpty) {
      Get.offAllNamed(RoutesName.navigationScreen);
    } else {
      Get.offAllNamed(RoutesName.navigationScreen);
    }
  }
}
