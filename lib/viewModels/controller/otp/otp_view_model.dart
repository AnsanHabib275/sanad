import 'package:sanad/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../repository/otpRepository/otp_repository.dart';
import '../../../../res/routes/routes_name.dart';

class OTPViewModel extends GetxController {
  final _api = OTPRepository();

  final otpOneController = TextEditingController().obs;
  final otpTwoController = TextEditingController().obs;
  final otpThreeController = TextEditingController().obs;
  final otpFourController = TextEditingController().obs;
  final otpFiveController = TextEditingController().obs;
  final otpSixController = TextEditingController().obs;

  final otpOneFocusNode = FocusNode().obs;
  final otpTwoFocusNode = FocusNode().obs;
  final otpThreeFocusNode = FocusNode().obs;
  final otpFourFocusNode = FocusNode().obs;
  final otpFiveFocusNode = FocusNode().obs;
  final otpSixFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool resendCodeLoading = false.obs;
  RxString errorMessage = ''.obs;
  RxString from = ''.obs;

  RxBool isOtpFilled = false.obs;

  void checkOtpFilled() {
    isOtpFilled.value =
        otpOneController.value.text.isNotEmpty &&
        otpTwoController.value.text.isNotEmpty &&
        otpThreeController.value.text.isNotEmpty &&
        otpFourController.value.text.isNotEmpty &&
        otpFiveController.value.text.isNotEmpty &&
        otpSixController.value.text.isNotEmpty;
  }

  void clearFields() {
    otpOneController.value.text = '';
    otpTwoController.value.text = '';
    otpThreeController.value.text = '';
    otpFourController.value.text = '';
    otpFiveController.value.text = '';
    otpSixController.value.text = '';
    isOtpFilled.value = false;
  }

  void otpApi(String eId) {
    loading.value = true;
    final verificationCode =
        otpOneController.value.text +
        otpTwoController.value.text +
        otpThreeController.value.text +
        otpFourController.value.text +
        otpFiveController.value.text +
        otpSixController.value.text;
    Map data = {'Otp': verificationCode, 'E_id': eId};
    _api
        .otpApi(data)
        .then((value) {
          loading.value = false;
          if (value['IsSuccessfull'] == false) {
            Utils.toastMessage(value['Message']);
          } else {
            Utils.toastMessage("OTP VERIFIED SUCCESSFULLY");
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
          Utils.toastMessage(error.toString());
        });
  }

  void resendCodeApi(String email) {
    resendCodeLoading.value = true;
    Map data = {'email': email};
    _api
        .otpApi(data)
        .then((value) {
          resendCodeLoading.value = false;
          if (value['isSuccessfull'] == false) {
            Utils.toastMessage(value['message']);
          } else {
            Utils.toastMessage("OTP Sent To Your Email Account");
          }
        })
        .onError((error, stackTrace) {
          resendCodeLoading.value = false;
          errorMessage.value = error.toString();
        });
  }
}
