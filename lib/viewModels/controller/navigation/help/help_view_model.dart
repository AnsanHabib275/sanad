import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../data/response/status.dart';
import '../../../../../models/help/help_list_model.dart';
import '../../../../../repository/helpRepository/help_repository.dart';

class HelpViewModel extends GetxController {
  final _api = HelpRepository();

  final rxRequestStatus = Status.loading.obs;
  var helpDataList = <Help>[].obs;
  var filteredHelpDataList = <Help>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  final searchController = TextEditingController().obs;
  final searchFocusNode = FocusNode().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  Future<void> helpListApi() async {
    try {
      loading.value = true;
      error.value = '';
      final result = await _api.helpListApi();
      final helpHistory = HelpListModel.fromJson(result);

      if (helpHistory.isSuccessfull == true) {
        processHelpData(helpHistory.help ?? []);
      } else {
        error.value = helpHistory.message ?? 'no_help_history'.tr;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
      update();
    }
  }

  void processHelpData(List<Help> data) {
    helpDataList.assignAll(data);
    filterHelp(searchController.value.text);
    update();
  }

  void filterHelp(String query) {
    final searchTerm = query.toLowerCase();
    filteredHelpDataList.assignAll(
      helpDataList.where((item) => _matchesSearch(item, searchTerm)).toList(),
    );
    update();
  }

  bool _matchesSearch(Help item, String searchTerm) {
    return item.helpID.toString().contains(searchTerm) ||
        item.helpText.toString().contains(searchTerm);
  }

  @override
  void dispose() {
    Get.delete<HelpViewModel>();
    super.dispose();
  }
}
