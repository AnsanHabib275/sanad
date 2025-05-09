import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../repository/resetPasswordRepository/reset_password_repository.dart';

class ResetPasswordViewModel extends GetxController {
  final _api = ResetPasswordRepository();

  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  final newPasswordFocusNode = FocusNode().obs;
  final confirmPasswordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isVisibleConfirmPassword = true.obs;
  RxString errorMessage = ''.obs;

  void resetPasswordApi(String eId) {
    loading.value = true;
    Map data = {'E_id': eId, 'NewPassword': newPasswordController.value.text};
    _api
        .resetPasswordApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            errorMessage.value = value['message'];
          } else {
            // Get.toNamed(RoutesName.resetDoneScreen);
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
        });
  }
}
