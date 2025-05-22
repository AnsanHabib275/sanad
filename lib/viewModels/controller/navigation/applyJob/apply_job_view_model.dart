import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/repository/applyJobRepository/apply_job_repository.dart';
import '../../../../data/response/status.dart';

class ApplyJobViewModel extends GetxController {
  final _api = ApplyJobRepository();

  final linkedinAccountController = TextEditingController().obs;

  final rxRequestStatus = Status.loading.obs;
  RxString error = ''.obs;
  RxString selectedTab = 'general'.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void setSelectionTab(String tabText) {
    selectedTab.value = tabText;
  }

  void applyJobApi() {
    loading.value = true;
    Map data = {'OldPassword': '', 'NewPassword': ''};
    _api
        .applyJobApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            errorMessage.value = value['message'];
          } else {
            // Get.toNamed(RoutesName.changePasswordDoneScreen);
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
        });
  }
}
