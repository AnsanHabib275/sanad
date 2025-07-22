import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/repository/withdrawFundsVerificationRepository/withdraw_funds_verification_repository.dart';
import 'package:sanad/utils/utils.dart';

class WithdrawFundsVerificationViewModel extends GetxController {
  final _api = WithdrawFundsVerificationRepository();

  final otpOneController = TextEditingController().obs;
  final otpTwoController = TextEditingController().obs;
  final otpThreeController = TextEditingController().obs;
  final otpFourController = TextEditingController().obs;

  final otpOneFocusNode = FocusNode().obs;
  final otpTwoFocusNode = FocusNode().obs;
  final otpThreeFocusNode = FocusNode().obs;
  final otpFourFocusNode = FocusNode().obs;

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
        otpFourController.value.text.isNotEmpty;
  }

  void clearFields() {
    otpOneController.value.text = '';
    otpTwoController.value.text = '';
    otpThreeController.value.text = '';
    otpFourController.value.text = '';
    isOtpFilled.value = false;
  }

  void otpApi(String eId) {
    loading.value = true;
    final verificationCode =
        otpOneController.value.text +
        otpTwoController.value.text +
        otpThreeController.value.text +
        otpFourController.value.text;
    Map data = {'Otp': verificationCode, 'E_id': eId};
    _api
        .withdrawFundsVerificationApi(data)
        .then((value) {
          loading.value = false;
          if (value['IsSuccessfull'] == false) {
            Utils.snackBar('error'.tr, value['Message']);
          } else {
            Utils.snackBar('success'.tr, "OTP VERIFIED SUCCESSFULLY");
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
          Utils.snackBar('error'.tr, error.toString());
        });
  }

  void resendCodeApi(String email) {
    resendCodeLoading.value = true;
    Map data = {'email': email};
    _api
        .withdrawFundsVerificationApi(data)
        .then((value) {
          resendCodeLoading.value = false;
          if (value['isSuccessfull'] == false) {
            Utils.snackBar('error'.tr, value['Message']);
          } else {
            Utils.snackBar('success'.tr, "OTP Sent To Your Email Account");
          }
        })
        .onError((error, stackTrace) {
          resendCodeLoading.value = false;
          errorMessage.value = error.toString();
        });
  }
}
