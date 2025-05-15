import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/repository/rateUsRepository/rate_us_repository.dart';

class RateUsViewModel extends GetxController {
  final _api = RateUsRepository();
  final messageController = TextEditingController().obs;

  final messageFocusNode = FocusNode().obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;
  RxString apiErrorMessage = ''.obs;
  RxDouble rating = 0.0.obs;

  void rateUsApi() {
    loading.value = true;
    Map data = {
      'message': messageController.value.text,
      'rating': rating.value,
    };
    _api
        .rateUsApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            apiErrorMessage.value = '';
            Get.back();
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          apiErrorMessage.value = error.toString();
        });
  }
}
