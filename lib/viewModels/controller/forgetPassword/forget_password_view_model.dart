import 'package:sanad/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/forgetPasswordRepository/forget_password_repository.dart';
import '../../../res/routes/routes_name.dart';

class ForgetPasswordViewModel extends GetxController {
  final _api = ForgetPasswordRepository();

  final emailController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString errorMessage = ''.obs;

  void forgetPasswordApi() {
    loading.value = true;
    Map data = {
      'email': emailController.value.text,
    };
    _api.forgetPasswordApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        errorMessage.value = value['message'];
      } else {
        Utils.toastMessage("OTP Sent To Your Email Account");
        Get.toNamed(RoutesName.otpScreen, arguments: {
          'eID': value['E_Id'],
          'email': emailController.value.text,
        })!
            .then((value) {});
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      errorMessage.value = error.toString();
    });
  }
}
