import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/company/companyLogin/company_login_view_model.dart';

class InputEmailWidget extends StatelessWidget {
  InputEmailWidget({super.key});

  final companyLoginVM = Get.put(CompanyLoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: companyLoginVM.emailController.value,
        focusNode: companyLoginVM.emailFocusNode.value,
        enableSuggestions: true,
        autocorrect: false,
        autofocus: false,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null ||
              value.isEmpty ||
              !RegExp(
                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
              ).hasMatch(value)) {
            return 'email_not_valid'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            companyLoginVM.emailFocusNode.value,
            companyLoginVM.passwordFocusNode.value,
          );
        },
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('email_hint'.tr),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              companyLoginVM.errorMessage.value.isEmpty
                  ? null
                  : companyLoginVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
          prefixIcon: Image.asset(
            IconAssets.icEmail,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
