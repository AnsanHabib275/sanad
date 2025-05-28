import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../data/response/status.dart';
import '../../../../../models/recruiter/myJobs/my_jobs_list_model.dart';
import '../../../../../repository/recruiter/myJobsRepository/my_jobs_repository.dart';


class MyJobsViewModel extends GetxController {
  final _api = MyJobsRepository();

  final rxRequestStatus = Status.loading.obs;
  var jobsDataList = <MyJobs>[].obs;
  var filteredJobsDataList = <MyJobs>[].obs;
  RxString error = ''.obs;
  RxString selectedTab = 'applied'.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  final searchController = TextEditingController().obs;
  final searchFocusNode = FocusNode().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  void setSelectionTab(String tabText) {
    selectedTab.value = tabText;
  }

  Future<void> myJobsListApi() async {
    try {
      loading.value = true;
      error.value = '';
      final result = await _api.myJobsListApi();
      final jobsHistory = MyJobsListModel.fromJson(result);

      if (jobsHistory.isSuccessfull == true) {
        processJobsData(jobsHistory.myJobs ?? []);
      } else {
        error.value = jobsHistory.message ?? 'no_jobs'.tr;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
      update();
    }
  }

  void processJobsData(List<MyJobs> data) {
    jobsDataList.assignAll(data);
    update();
  }

  @override
  void dispose() {
    Get.delete<MyJobsViewModel>();
    super.dispose();
  }
}
