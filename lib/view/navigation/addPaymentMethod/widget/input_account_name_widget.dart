import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../viewModels/controller/navigation/addPaymentMethod/add_payment_method_view_model.dart';

class InputAccountNameWidget extends StatelessWidget {
  InputAccountNameWidget({super.key});

  final addPaymentMethodVM = Get.put(AddPaymentMethodViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: addPaymentMethodVM.accountNameController.value,
        focusNode: addPaymentMethodVM.accountNameFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'account_name_error'.tr;
          }
          return null;
        },
        style: Theme.of(context).inputDecorationTheme.labelStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: Utils.getResponsiveHeight(context, 8),
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          hintText: 'account_name_hint'.tr,
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
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
