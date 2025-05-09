import 'package:sanad/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../viewModels/controller/signup/sign_up_view_model.dart';

class InputConfirmPasswordWidget extends StatelessWidget {
  InputConfirmPasswordWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.confirmPasswordController.value,
        focusNode: signUpVM.confirmPasswordFocusNode.value,
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
              signUpVM.errorMessage.value.isEmpty
                  ? null
                  : signUpVM.errorMessage.value,
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
              signUpVM.isVisibleConfirmPassword.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
            ),
            onPressed: () {
              signUpVM.isVisibleConfirmPassword.value =
                  !signUpVM.isVisibleConfirmPassword.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: signUpVM.isVisibleConfirmPassword.value,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'confirm_password_format_invalid'.tr;
          } else if (value != signUpVM.passwordController.value.text) {
            return 'confirm_password_not_match'.tr;
          }
          return null;
        },
      );
    });
  }
}
