import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/registerFirebaseToken/register_firebase_token_view_model.dart';

import '../../../../models/login/login_model.dart';
import '../../../../repository/loginRepository/login_repository.dart';
import '../../../../res/routes/routes_name.dart';
import '../../userPreference/user_preference_view_model.dart';
// import '../../services/notification_services.dart';

class CompanyLoginViewModel extends GetxController {
  final _api = LoginRepository();
  final userVM = Get.put(UserPreference());
  final firebaseTokenVM = Get.put(RegisterFirebaseTokenViewModel());
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  // NotificationServices notificationServices = NotificationServices();
  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;
  RxString apiErrorMessage = ''.obs;

  void loginApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api
        .loginApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            // if (Platform.isIOS) {
            //   notificationServices.getDeviceToken().then(
            //     (value) => firebaseTokenVM.firebaseTokenApi(value, 'ios'),
            //   );
            // } else {
            //   notificationServices.getDeviceToken().then(
            //     (value) => firebaseTokenVM.firebaseTokenApi(value, 'android'),
            //   );
            // }
            apiErrorMessage.value = '';
            LoginModel loginModel = LoginModel.fromJson(value);
            userVM
                .saveUser(loginModel)
                .then((value) {
                  if ((loginModel.user?.imageURL?.isEmpty ?? true) ||
                      (loginModel.user?.gender?.isEmpty ?? true) ||
                      (loginModel.user?.mobileNumbre?.isEmpty ?? true)) {
                    Get.offAllNamed(RoutesName.navigationScreen);
                  } else {
                    Get.offAllNamed(RoutesName.navigationScreen);
                  }
                })
                .onError((error, stackTrace) {
                  apiErrorMessage.value = error.toString();
                });
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          apiErrorMessage.value = error.toString();
        });
  }
}
