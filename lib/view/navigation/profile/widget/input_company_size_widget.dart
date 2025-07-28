import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../utils/utils.dart';
import '../../../../viewModels/controller/navigation/updateProfile/update_profile_view_model.dart';

class InputCompanySizeWidget extends StatelessWidget {
  InputCompanySizeWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());
  final List<String> companySize = [
    'Self-employed, Sole trader',
    '2-10',
    '11-50',
    '51-200',
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        style: Theme.of(context).inputDecorationTheme.labelStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: Utils.getResponsiveHeight(context, 8),
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          hintText: 'company_size_hint'.tr,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              updateProfileVM.errorMessage.value.isEmpty
                  ? null
                  : updateProfileVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        ),
        value:
            updateProfileVM.companySizeController.value.text.isEmpty
                ? null
                : updateProfileVM.companySizeController.value.text,
        items:
            companySize.map((String organization) {
              return DropdownMenuItem<String>(
                value: organization,
                child: Text(organization),
              );
            }).toList(),
        onChanged: (value) {
          if (value != null) {
            updateProfileVM.companySizeController.value.text = value;
          }
        },
        icon: Image.asset(
          IconAssets.icArrowDown,
          height: Utils.getResponsiveHeight(context, 18),
          width: Utils.getResponsiveWidth(context, 18),
          color: Theme.of(context).iconTheme.color,
        ),
        validator: (value) => value == null ? 'company_size_error'.tr : null,
      );
    });
  }
}
