import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../data/response/status.dart';
import '../../../../repository/applyJobRepository/apply_job_repository.dart';

class ApplyJobViewModel extends GetxController {
  final _api = ApplyJobRepository();

  final linkedinAccountController = TextEditingController().obs;
  final experienceYearController = TextEditingController().obs;

  final rxRequestStatus = Status.loading.obs;
  RxString error = ''.obs;
  RxString selectedTab = 'general'.obs;
  RxBool loading = false.obs;
  RxBool isUploaded = false.obs;
  RxBool isCheckRelocate = false.obs;
  RxBool isCheckPortfolioYes = false.obs;
  RxBool isCheckPortfolioNo = false.obs;
  RxBool isCheckCertificationYes = false.obs;
  RxBool isCheckCertificationNo = false.obs;
  var selectedPrograms = <String>[].obs;
  var selectedPreferJobType = <String>[].obs;
  RxString errorMessage = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setError(String value) => error.value = value;

  void setSelectionTab(String tabText) {
    selectedTab.value = tabText;
  }

  void toggleSelectionPreferJob(String jobType) {
    if (selectedPreferJobType.contains(jobType)) {
      selectedPreferJobType.remove(jobType);
    } else {
      selectedPreferJobType.add(jobType);
    }
  }

  void toggleSelection(String program) {
    if (selectedPrograms.contains(program)) {
      selectedPrograms.remove(program);
    } else {
      selectedPrograms.add(program);
    }
  }

  void togglePortfolioSelection(bool isCheckYes) {
    if (isCheckYes) {
      isCheckPortfolioYes.value = true;
      isCheckPortfolioNo.value = false;
    } else {
      isCheckPortfolioYes.value = false;
      isCheckPortfolioNo.value = true;
    }
  }

  void toggleCertificationSelection(bool isCheckYes) {
    if (isCheckYes) {
      isCheckCertificationYes.value = true;
      isCheckCertificationNo.value = false;
    } else {
      isCheckCertificationYes.value = false;
      isCheckCertificationNo.value = true;
    }
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
