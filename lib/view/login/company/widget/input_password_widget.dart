import 'package:sanad/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../viewModels/controller/login/company/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginVM = Get.put(CompanyLoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: loginVM.passwordController,
        focusNode: loginVM.passwordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('password_hint'.tr),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              loginVM.apiErrorMessage.value.isNotEmpty
                  ? loginVM.apiErrorMessage.value
                  : loginVM.errorMessage.value.isNotEmpty
                  ? loginVM.errorMessage.value
                  : null,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
          prefixIcon: Image.asset(
            IconAssets.icPassword,
            color: Theme.of(context).iconTheme.color,
          ),
          suffixIcon: IconButton(
            icon: Image.asset(
              loginVM.isVisible.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              loginVM.isVisible.value = !loginVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: loginVM.isVisible.value,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'password_format_invalid'.tr;
          }
          return null;
        },
      );
    });
  }
}
