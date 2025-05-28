import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../data/response/status.dart';
import '../../../../../models/recruiter/transactions/transactions_list_model.dart';
import '../../../../../repository/recruiter/transactionsRepository/transactions_repository.dart';


class TransactionsViewModel extends GetxController {
  final _api = TransactionsRepository();

  final rxRequestStatus = Status.loading.obs;
  var transactionsDataList = <Transactions>[].obs;
  var filteredTransactionsDataList = <Transactions>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  final searchController = TextEditingController().obs;
  final searchFocusNode = FocusNode().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  Future<void> transactionsListApi() async {
    try {
      loading.value = true;
      error.value = '';
      final result = await _api.transactionsListApi();
      final transactionsHistory = TransactionsListModel.fromJson(result);

      if (transactionsHistory.isSuccessfull == true) {
        processTransactionsData(transactionsHistory.transactions ?? []);
      } else {
        error.value = transactionsHistory.message ?? 'no_transactions'.tr;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
      update();
    }
  }

  void processTransactionsData(List<Transactions> data) {
    transactionsDataList.assignAll(data);
    filterTransactions(searchController.value.text);
    update();
  }

  void filterTransactions(String query) {
    final searchTerm = query.toLowerCase();
    filteredTransactionsDataList.assignAll(
      transactionsDataList.where((item) => _matchesSearch(item, searchTerm)).toList(),
    );
    update(); // Add explicit update
  }

  bool _matchesSearch(Transactions item, String searchTerm) {
    return item.transactionID.toString().contains(searchTerm) ||
        item.paymentID.toString().contains(searchTerm) ||
        item.amount.toString().contains(searchTerm) ||
        item.paymentMethod.toString().contains(searchTerm);
  }

  @override
  void dispose() {
    Get.delete<TransactionsViewModel>();
    super.dispose();
  }
}
