import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/models/paymentMethod/payment_method_model.dart';

import '../../../../../data/response/status.dart';
import '../../../../../models/payment/payment_list_model.dart';
import '../../../../repository/paymentMethodRepository/payment_method_repository.dart';

class PaymentMethodViewModel extends GetxController {
  final _api = PaymentMethodRepository();

  final rxRequestStatus = Status.loading.obs;
  var paymentMethodDataList = <PaymentMethodModel>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setError(String value) => error.value = value;

  Future<void> paymentMethodListApi() async {
    try {
      loading.value = true;
      error.value = '';
      final result = await _api.paymentMethodListApi();
      final paymentHistory = PaymentListModel.fromJson(result);

      if (paymentHistory.isSuccessfull == true) {
        // paymentMethodDataList.assignAll(paymentHistory.payment);
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

  @override
  void dispose() {
    Get.delete<PaymentMethodViewModel>();
    super.dispose();
  }
}
