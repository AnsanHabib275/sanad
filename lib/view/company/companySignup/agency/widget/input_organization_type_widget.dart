import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../utils/utils.dart';

class InputOrganizationTypeWidget extends StatelessWidget {
  InputOrganizationTypeWidget({super.key});

  final signUpVM = Get.put(CompanySignUpViewModel());
  final List<String> organizationType = ['Formal', 'Informal'];

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DropdownButtonFormField<String>(
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
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
          height: Get.height * Utils.getResponsiveHeight(18),
          width: Get.width * Utils.getResponsiveWidth(18),
          color: Theme.of(context).iconTheme.color,
        ),
        validator: (value) => value == null ? 'organization_type_error' : null,
      );
    });
  }
}
