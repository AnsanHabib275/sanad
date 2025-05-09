import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_color.dart';
import '../../../viewModels/controller/login/login_view_model.dart';

class InputPasswordWidget extends StatelessWidget {
  InputPasswordWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: loginVM.passwordController,
        focusNode: loginVM.passwordFocusNode.value,
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
              loginVM.apiErrorMessage.value.isNotEmpty
                  ? loginVM.apiErrorMessage.value
                  : loginVM.errorMessage.value.isNotEmpty
                  ? loginVM.errorMessage.value
                  : null,
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
          prefixIcon: Image.asset(IconAssets.icPassword),
          suffixIcon: IconButton(
            icon: Image.asset(
              loginVM.isVisible.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
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
