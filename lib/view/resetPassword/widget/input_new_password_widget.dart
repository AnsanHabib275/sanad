import 'package:sanad/viewModels/controller/resetPassword/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class InputNewPasswordWidget extends StatelessWidget {
  InputNewPasswordWidget({super.key});

  final resetPasswordVM = Get.put(ResetPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: resetPasswordVM.newPasswordController.value,
        focusNode: resetPasswordVM.newPasswordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('password_hint'.tr),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              resetPasswordVM.errorMessage.value.isEmpty
                  ? null
                  : resetPasswordVM.errorMessage.value,
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
              resetPasswordVM.isVisible.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () {
              resetPasswordVM.isVisible.value =
                  !resetPasswordVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: resetPasswordVM.isVisible.value,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'new_password_format_invalid'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            resetPasswordVM.newPasswordFocusNode.value,
            resetPasswordVM.confirmPasswordFocusNode.value,
          );
        },
      );
    });
  }
}
