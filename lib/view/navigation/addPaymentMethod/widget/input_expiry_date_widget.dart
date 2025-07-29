import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../../utils/utils.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../res/colors/app_color.dart';
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
      final formattedDate = DateFormat('MM/yyyy').format(pickedDate);
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
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    paymentMethodVM.dateError.value.isEmpty
                        ? Theme.of(
                          context,
                        ).inputDecorationTheme.border!.borderSide.color
                        : AppColor.redColor,
              ),
              borderRadius: BorderRadius.circular(
                Utils.getResponsiveSize(context, 8),
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: paymentMethodVM.expiryDateController.value,
                      focusNode: paymentMethodVM.expiryDateFocusNode.value,
                      readOnly: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: Utils.getResponsiveHeight(context, 8),
                          horizontal: Utils.getResponsiveWidth(context, 16),
                        ),
                        hintText: 'expiry_date_hint'.tr,
                        hintStyle:
                            Theme.of(context).inputDecorationTheme.hintStyle,
                        errorText:
                            paymentMethodVM.errorMessage.value.isEmpty
                                ? null
                                : paymentMethodVM.errorMessage.value,
                        errorStyle:
                            Theme.of(context).inputDecorationTheme.errorStyle,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Utils.getResponsiveHeight(context, 8),
                      horizontal: Utils.getResponsiveWidth(context, 8),
                    ),
                    child: Image.asset(
                      IconAssets.icDate,
                      height: Utils.getResponsiveHeight(context, 18),
                      width: Utils.getResponsiveWidth(context, 18),
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
