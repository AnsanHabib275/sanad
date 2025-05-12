import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/signupRepository/sign_up_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class SignUpViewModel extends GetxController {
  final _api = SignUpRepository();

  final fullNameController = TextEditingController().obs;
  final taglineController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final noteController = TextEditingController().obs;

  final fullNameFocusNode = FocusNode().obs;
  final taglineFocusNode = FocusNode().obs;
  final phoneNumberFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final noteFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxString imagePath = ''.obs;
  RxString imagePathError = ''.obs;
  RxString errorMessage = ''.obs;
  RxString apiErrorMessage = ''.obs;

  void signUpApi() {
    loading.value = true;
    Map data = {
      'FullName': fullNameController.value.text,
      'Tagline': taglineController.value.text,
      'PhoneNumber': phoneNumberController.value.text,
      'Email': emailController.value.text,
      'Password': passwordController.value.text,
      'Note': noteController.value.text,
    };
    _api
        .signUpApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            Utils.toastMessage("OTP Sent To Your Email Account");
            Get.toNamed(
              RoutesName.verifyEmailScreen,
              arguments: {'Accountid': value['Accountid']},
            );
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          apiErrorMessage.value = error.toString();
        });
  }

  void signUpIndividualApi() {
    loading.value = true;
    Map data = {
      'Email': emailController.value.text,
      'Password': passwordController.value.text,
    };
    _api
        .signUpIndividualApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            apiErrorMessage.value = '';
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          apiErrorMessage.value = error.toString();
        });
  }
}
