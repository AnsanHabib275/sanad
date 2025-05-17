import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/models/payment/payment_list_model.dart';
import '../../../../data/response/status.dart';
import '../../../../repository/paymentsRepository/payments_repository.dart';

class PaymentsViewModel extends GetxController {
  final _api = PaymentsRepository();

  final rxRequestStatus = Status.loading.obs;
  var paymentsDataList = <Payment>[].obs;
  var filteredPaymentDataList = <Payment>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;

  final searchController = TextEditingController().obs;
  final searchFocusNode = FocusNode().obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setError(String value) => error.value = value;

  Future<void> paymentsListApi() async {
    try {
      loading.value = true;
      error.value = '';
      final result = await _api.paymentsListApi();
      final paymentHistory = PaymentListModel.fromJson(result);

      if (paymentHistory.isSuccessfull == true) {
        processPaymentData(paymentHistory.payment ?? []);
      } else {
        error.value = paymentHistory.message ?? 'no_payments'.tr;
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      loading.value = false;
      update(); // Add explicit update
    }
  }

  void processPaymentData(List<Payment> data) {
    paymentsDataList.assignAll(data);

    // Force update filtered lists
    filterPayment(searchController.value.text);
    update(); // Add explicit update
  }

  void filterPayment(String query) {
    final searchTerm = query.toLowerCase();
    filteredPaymentDataList.assignAll(
      paymentsDataList.where((item) => _matchesSearch(item, searchTerm)).toList(),
    );
    update(); // Add explicit update
  }

  bool _matchesSearch(Payment item, String searchTerm) {
    return item.paymentID.toString().contains(searchTerm) ||
        item.paymentDate.toString().contains(searchTerm) ||
        item.amount.toString().contains(searchTerm) ||
        item.status.toString().contains(searchTerm);
  }

  @override
  void dispose() {
    Get.delete<PaymentsViewModel>();
    super.dispose();
  }
}
