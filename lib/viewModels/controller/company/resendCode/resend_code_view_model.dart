import 'package:sanad/utils/utils.dart';
import 'package:get/get.dart';

import '../../../../repository/company/forgetPasswordRepository/forget_password_repository.dart';


class ResendCodeViewModel extends GetxController {
  final _api = ForgetPasswordRepository();

  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  void resendCodeApi(String email) {
    loading.value = true;
    Map data = {'email': email};
    _api
        .forgetPasswordApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            Utils.toastMessage(value['message']);
          } else {
            Utils.toastMessage("OTP Sent To Your Email Account");
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
        });
  }
}
