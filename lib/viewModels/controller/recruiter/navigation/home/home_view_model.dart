import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../../data/response/status.dart';
import '../../../../../models/recruiter/home/jobs_list_model.dart';
import '../../../../../repository/recruiter/homeRepository/home_repository.dart';

class HomeViewModel extends GetxController {
  final _api = HomeRepository();

  final rxRequestStatus = Status.loading.obs;
  var jobsDataList = <Jobs>[].obs;
  var filteredJobsDataList = <Jobs>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  final searchController = TextEditingController().obs;
  final searchFocusNode = FocusNode().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  Future<void> jobsListApi() async {
    try {
      loading.value = true;
      error.value = '';
      final result = await _api.jobsListApi();
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
    filterJobs(searchController.value.text);
    update(); // Add explicit update
  }

  void filterJobs(String query) {
    final searchTerm = query.toLowerCase();
    filteredJobsDataList.assignAll(
      jobsDataList.where((item) => _matchesSearch(item, searchTerm)).toList(),
    );
    update(); // Add explicit update
  }

  bool _matchesSearch(Jobs item, String searchTerm) {
    return item.jobId.toString().contains(searchTerm) ||
        item.jobName.toString().contains(searchTerm) ||
        item.jobType.toString().contains(searchTerm) ||
        item.jobLocation.toString().contains(searchTerm);
  }

  @override
  void dispose() {
    Get.delete<HomeViewModel>();
    super.dispose();
  }
}
