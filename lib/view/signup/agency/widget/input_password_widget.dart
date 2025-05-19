import 'package:sanad/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/signup/sign_up_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.passwordController.value,
        focusNode: signUpVM.passwordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            signUpVM.passwordFocusNode.value,
            signUpVM.noteFocusNode.value,
          );
        },
        decoration: InputDecoration(
          hint: Text('password_hint'.tr),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              signUpVM.errorMessage.value.isEmpty
                  ? null
                  : signUpVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
          suffixIcon: IconButton(
            icon: Image.asset(
              signUpVM.isVisible.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              signUpVM.isVisible.value = !signUpVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: signUpVM.isVisible.value,
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
