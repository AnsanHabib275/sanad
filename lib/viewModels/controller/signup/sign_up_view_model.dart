import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/signupRepository/sign_up_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class SignUpViewModel extends GetxController {
  final _api = SignUpRepository();

  final nameController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final nameFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isVisibleConfirmPassword = true.obs;
  RxString errorMessage = ''.obs;
  RxString apiErrorMessage = ''.obs;

  void signUpApi() {
    loading.value = true;
    Map data = {
      'name': nameController.value.text,
      'email': emailController.value.text,
      'password': passwordController.value.text,
    };
    _api.signUpApi(data).then((value) {
      loading.value = false;
      if (value['isSuccessfull'] == false) {
        apiErrorMessage.value = value['message'];
      } else {
        Utils.toastMessage("OTP Sent To Your Email Account");
        Get.toNamed(RoutesName.verifyEmailScreen, arguments: {
          'Accountid': value['Accountid'],
        });
      }
    }).onError((error, stackTrace) {
      loading.value = false;
      apiErrorMessage.value = error.toString();
    });
  }
}
