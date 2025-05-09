import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/navigation/changePassword/change_password_view_model.dart';

class InputOldPasswordWidget extends StatelessWidget {
  InputOldPasswordWidget({super.key});

  final changePasswordVM = Get.put(ChangePasswordViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: changePasswordVM.oldPasswordController.value,
        focusNode: changePasswordVM.oldPasswordFocusNode.value,
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
              changePasswordVM.errorMessage.value.isEmpty
                  ? null
                  : changePasswordVM.errorMessage.value,
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
              changePasswordVM.isVisible.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
            ),
            onPressed: () {
              changePasswordVM.isVisible.value =
                  !changePasswordVM.isVisible.value;
            },
          ),
        ),
        keyboardType: TextInputType.visiblePassword,
        obscureText: changePasswordVM.isVisible.value,
        obscuringCharacter: '*',
        textInputAction: TextInputAction.done,
        validator: (value) {
          if (value == null || value.isEmpty || value.length < 7) {
            return 'existing_password_format_invalid'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            changePasswordVM.oldPasswordFocusNode.value,
            changePasswordVM.newPasswordFocusNode.value,
          );
        },
      );
    });
  }
}
