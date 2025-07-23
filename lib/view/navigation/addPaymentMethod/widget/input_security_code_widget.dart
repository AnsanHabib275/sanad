import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewModels/controller/navigation/paymentMethod/payment_method_view_model.dart';

class InputSecurityCodeWidget extends StatelessWidget {
  InputSecurityCodeWidget({super.key});

  final paymentMethodVM = Get.put(PaymentMethodViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: paymentMethodVM.securityCodeController.value,
        focusNode: paymentMethodVM.securityCodeFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'security_code_error'.tr;
          }
          return null;
        },
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('security_code_hint'.tr),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              paymentMethodVM.errorMessage.value.isEmpty
                  ? null
                  : paymentMethodVM.errorMessage.value,
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
