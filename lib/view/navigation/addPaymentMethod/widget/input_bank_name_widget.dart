import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../viewModels/controller/navigation/paymentMethod/payment_method_view_model.dart';

class InputBankNameWidget extends StatelessWidget {
  InputBankNameWidget({super.key});

  final paymentMethodVM = Get.put(PaymentMethodViewModel());
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
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hintText: 'bank_name_hint'.tr,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              paymentMethodVM.errorMessage.value.isEmpty
                  ? null
                  : paymentMethodVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        ),
        value:
            paymentMethodVM.bankNameController.value.text.isEmpty
                ? null
                : paymentMethodVM.bankNameController.value.text,
        items:
            bankNameList.map((String organization) {
              return DropdownMenuItem<String>(
                value: organization,
                child: Text(organization),
              );
            }).toList(),
        onChanged: (value) {
          if (value != null) {
            paymentMethodVM.bankNameController.value.text = value;
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
