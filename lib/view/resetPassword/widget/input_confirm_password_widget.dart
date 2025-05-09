import 'package:sanad/viewModels/controller/resetPassword/reset_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class InputConfirmPasswordWidget extends StatelessWidget {
  InputConfirmPasswordWidget({super.key});

  final resetPasswordVM = Get.put(ResetPasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: resetPasswordVM.confirmPasswordController.value,
        focusNode: resetPasswordVM.confirmPasswordFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: TextStyle(
          color: AppColor.background,
          fontSize: Get.height * Utils.getResponsiveSize(16),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          errorText:
              resetPasswordVM.errorMessage.value.isEmpty
                  ? null
                  : resetPasswordVM.errorMessage.value,
          errorStyle: TextStyle(
            color: AppColor.redColor,
            fontSize: Get.height * Utils.getResponsiveSize(16),
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w400,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8)),
            ),
            borderSide: BorderSide(
              color: AppColor.editTextBorderColor,
              width: 1.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8)),
            ),
            borderSide: BorderSide(
              color: AppColor.editTextBorderColor,
              width: 1.0,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8)),
            ),
            borderSide: BorderSide(
              color: AppColor.editTextBorderColor,
              width: 1.0,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8)),
            ),
            borderSide: BorderSide(color: AppColor.redColor, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(Get.height * Utils.getResponsiveSize(8)),
            ),
            borderSide: BorderSide(color: AppColor.redColor, width: 1.0),
          ),
          suffixIcon: IconButton(
            icon: Image.asset(
              resetPasswordVM.isVisibleConfirmPassword.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
            ),
            onPressed: () {
              resetPasswordVM.isVisibleConfirmPassword.value =
                  !resetPasswordVM.isVisibleConfirmPassword.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: resetPasswordVM.isVisibleConfirmPassword.value,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'confirm_password_format_invalid'.tr;
          } else if (value !=
              resetPasswordVM.newPasswordController.value.text) {
            return 'confirm_password_not_match'.tr;
          }
          return null;
        },
      );
    });
  }
}
