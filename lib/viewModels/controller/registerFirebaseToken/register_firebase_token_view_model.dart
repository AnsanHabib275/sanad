import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../repository/firebaseRegisterTokenRepository/firebase_register_token_repository.dart';
import '../userPreference/user_preference_view_model.dart';

class RegisterFirebaseTokenViewModel extends GetxController {
  final _api = FirebaseRegisterTokenRepository();
  final userVM = Get.put(UserPreference());

  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  void firebaseTokenApi(String token, String platform) {
    loading.value = true;
    Map data = {'token': token, 'platform': platform};
    _api
        .firebaseTokenApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            errorMessage.value = value['message'];
          } else {
            errorMessage.value = '';
            Utils.toastMessage('Token Registered Successfully');
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
        });
  }
}
