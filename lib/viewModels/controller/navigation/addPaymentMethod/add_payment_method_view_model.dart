import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanad/models/paymentMethod/payment_method_model.dart';

import '../../../../../data/response/status.dart';
import '../../../../../models/payment/payment_list_model.dart';
import '../../../../repository/addPaymentMethodRepository/add_payment_method_repository.dart';
import '../../../../repository/paymentMethodRepository/payment_method_repository.dart';

class AddPaymentMethodViewModel extends GetxController {
  final _api = AddPaymentMethodRepository();
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
  RxString error = ''.obs;
  RxBool loading = false.obs;
  RxString errorMessage = ''.obs;
  RxString dateError = ''.obs;
  RxString selectedTab = 'creditCard'.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setError(String value) => error.value = value;

  void setSelectionTab(String tabText) {
    selectedTab.value = tabText;
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
    Get.delete<AddPaymentMethodViewModel>();
    super.dispose();
  }
}
