import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/signup/sign_up_view_model.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../utils/utils.dart';

class InputOrganizationTypeWidget extends StatelessWidget {
  InputOrganizationTypeWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());
  final List<String> organizationType = ['Formal', 'Informal'];

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
          hintText: 'organization_type_hint'.tr,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              signUpVM.errorMessage.value.isEmpty
                  ? null
                  : signUpVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
        ),
        value:
            signUpVM.organizationTypeController.value.text.isEmpty
                ? null
                : signUpVM.organizationTypeController.value.text,
        items:
            organizationType.map((String organization) {
              return DropdownMenuItem<String>(
                value: organization,
                child: Text(organization),
              );
            }).toList(),
        onChanged: (value) {
          if (value != null) {
            signUpVM.organizationTypeController.value.text = value;
            signUpVM.validateForm();
          }
        },
        icon: Image.asset(
          IconAssets.icArrowDown,
          height: Utils.getResponsiveHeight(context, 18),
          width: Utils.getResponsiveWidth(context, 18),
          color: Theme.of(context).iconTheme.color,
        ),
        validator:
            (value) => value == null ? 'organization_type_error'.tr : null,
      );
    });
  }
}
