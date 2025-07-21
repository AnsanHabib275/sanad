import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/models/paymentMethod/payment_method_model.dart';

import '../../../../../data/response/status.dart';
import '../../../../../models/payment/payment_list_model.dart';
import '../../../../repository/paymentMethodRepository/payment_method_repository.dart';

class PaymentMethodViewModel extends GetxController {
  final _api = PaymentMethodRepository();
  final creditCardNumberController = TextEditingController().obs;
  final cardHolderNameController = TextEditingController().obs;
  final expiryDateController = TextEditingController().obs;
  final securityCodeController = TextEditingController().obs;
  final bankNameController = TextEditingController().obs;
  final ibanController = TextEditingController().obs;
  final accountNameController = TextEditingController().obs;

  final creditCardNumberFocusNode = FocusNode().obs;
  final cardHolderNameFocusNode = FocusNode().obs;
  final expiryDateFocusNode = FocusNode().obs;
  final securityCodeFocusNode = FocusNode().obs;
  final bankNameFocusNode = FocusNode().obs;
  final ibanFocusNode = FocusNode().obs;
  final accountNameFocusNode = FocusNode().obs;

  final rxRequestStatus = Status.loading.obs;
  var paymentMethodDataList = <PaymentMethodModel>[].obs;
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;
  RxString selectedTab = 'creditCard'.obs;

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

  void addPaymentMethodApi() {
    loading.value = true;
    Map data = {
      'CreditCardNumber': creditCardNumberController.value.text,
      'CardHolderName': cardHolderNameController.value.text,
      'ExpiryDate': expiryDateController.value.text,
      'SecurityCode': securityCodeController.value.text,

      'BankName': bankNameController.value.text,
      'IBAN': ibanController.value.text,
      'AccountName': accountNameController.value.text,
    };
    _api
        .addPaymentMethodApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            errorMessage.value = value['message'];
          } else {
            // Get.offAllNamed(RoutesName.navigationScreen);
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
        });
  }

  @override
  void dispose() {
    Get.delete<PaymentMethodViewModel>();
    super.dispose();
  }
}
