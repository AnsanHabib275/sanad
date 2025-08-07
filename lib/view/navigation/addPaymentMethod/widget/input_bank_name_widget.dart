import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../viewModels/controller/navigation/addPaymentMethod/add_payment_method_view_model.dart';
import '../../../../viewModels/controller/navigation/paymentMethod/payment_method_view_model.dart';

class InputBankNameWidget extends StatelessWidget {
  InputBankNameWidget({super.key});

  final addPaymentMethodVM = Get.put(AddPaymentMethodViewModel());
  final List<String> bankNameList = [
    'UBL',
    'HBL',
    'ABL',
    'MCB',
    'AL Habib',
    'MEZAN BANK',
    'STANDARD CHARTED ACCOUNT BANK',
    'AL FALAH BANK',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        borderRadius: BorderRadius.circular(
          Utils.getResponsiveSize(context, 12),
        ),
        dropdownColor: Theme.of(context).extension<AppColors>()?.cardBg,
        style: Theme.of(context).inputDecorationTheme.labelStyle,
        hint: Text(
          'bank_name_hint'.tr,
          style: Theme.of(context).inputDecorationTheme.hintStyle,
        ),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: Utils.getResponsiveHeight(context, 8),
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          errorText:
              addPaymentMethodVM.errorMessage.value.isEmpty
                  ? null
                  : addPaymentMethodVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        ),
        value:
            addPaymentMethodVM.bankNameController.value.text.isEmpty
                ? null
                : addPaymentMethodVM.bankNameController.value.text,
        items:
            bankNameList.map((String organization) {
              return DropdownMenuItem<String>(
                value: organization,
                child: Text(organization),
              );
            }).toList(),
        onChanged: (value) {
          if (value != null) {
            addPaymentMethodVM.bankNameController.value.text = value;
          }
        },
        icon: Image.asset(
          IconAssets.icArrowDown,
          height: Utils.getResponsiveHeight(context, 18),
          width: Utils.getResponsiveWidth(context, 18),
          color: Theme.of(context).iconTheme.color,
        ),
        validator: (value) => value == null ? 'bank_name_error'.tr : null,
      );
    });
  }
}
