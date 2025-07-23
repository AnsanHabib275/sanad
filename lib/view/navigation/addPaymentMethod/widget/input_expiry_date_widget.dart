import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/utils.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../viewModels/controller/navigation/paymentMethod/payment_method_view_model.dart';

class InputExpiryDateWidget extends StatelessWidget {
  final paymentMethodVM = Get.put(PaymentMethodViewModel());

  final DateTime? selectedDate;

  InputExpiryDateWidget({super.key, this.selectedDate});

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1000, 1, 1),
      lastDate: DateTime(9999, 12, 31),
    );
    if (pickedDate != null && pickedDate != selectedDate) {
      final formattedDate = DateFormat('MM-yyyy').format(pickedDate);
      paymentMethodVM.expiryDateController.value.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return InkWell(
        onTap: () {
          Utils.hideKeyboardGlobally();
          _selectDate(context);
        },
        child: AbsorbPointer(
          child: TextFormField(
            controller: paymentMethodVM.expiryDateController.value,
            focusNode: paymentMethodVM.expiryDateFocusNode.value,
            readOnly: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: Theme.of(context).inputDecorationTheme.hintStyle,
            decoration: InputDecoration(
              hint: Text('expiry_date_hint'.tr),
              hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
              errorText:
                  paymentMethodVM.errorMessage.value.isEmpty
                      ? null
                      : paymentMethodVM.errorMessage.value,
              errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
              border: Theme.of(context).inputDecorationTheme.border,
              enabledBorder:
                  Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedBorder:
                  Theme.of(context).inputDecorationTheme.focusedBorder,
              errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
              focusedErrorBorder:
                  Theme.of(context).inputDecorationTheme.focusedErrorBorder,
              suffixIcon: InkWell(
                onTap: () {
                  Utils.hideKeyboardGlobally();
                  _selectDate(context);
                },
                child: Image.asset(IconAssets.icDate),
              ),
            ),
            keyboardType: TextInputType.none,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'expiry_date_error'.tr;
              }
              return null;
            },
          ),
        ),
      );
    });
  }
}
