import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/models/home/jobs_list_model.dart';
import 'package:sanad/repository/myJobsRepository/my_jobs_repository.dart';
import '../../../../data/response/status.dart';

class MyJobsViewModel extends GetxController {
  final _api = MyJobsRepository();

  final rxRequestStatus = Status.loading.obs;
  var jobsDataList = <Jobs>[].obs;
  var filteredJobsDataList = <Jobs>[].obs;
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
      final jobsHistory = JobsListModel.fromJson(result);

      if (jobsHistory.isSuccessfull == true) {
        processJobsData(jobsHistory.jobs ?? []);
      } else {
        error.value = jobsHistory.message ?? 'no_jobs'.tr;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
      update(); // Add explicit update
    }
  }

  void processJobsData(List<Jobs> data) {
    jobsDataList.assignAll(data);

    // Force update filtered lists
    update(); // Add explicit update
  }

  @override
  void dispose() {
    Get.delete<MyJobsViewModel>();
    super.dispose();
  }
}
