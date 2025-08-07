import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../viewModels/controller/navigation/addPaymentMethod/add_payment_method_view_model.dart';
import '../../../../viewModels/controller/navigation/paymentMethod/payment_method_view_model.dart';

class InputIBANWidget extends StatelessWidget {
  InputIBANWidget({super.key});

  final addPaymentMethodVM = Get.put(AddPaymentMethodViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: addPaymentMethodVM.ibanController.value,
        focusNode: addPaymentMethodVM.ibanFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'iban_error'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            addPaymentMethodVM.ibanFocusNode.value,
            addPaymentMethodVM.accountNameFocusNode.value,
          );
        },
        style: Theme.of(context).inputDecorationTheme.labelStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: Utils.getResponsiveHeight(context, 8),
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          hintText: 'iban_hint'.tr,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              addPaymentMethodVM.errorMessage.value.isEmpty
                  ? null
                  : addPaymentMethodVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
