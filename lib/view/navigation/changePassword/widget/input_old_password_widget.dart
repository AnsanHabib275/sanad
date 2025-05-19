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
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
          suffixIcon: IconButton(
            icon: Image.asset(
              changePasswordVM.isVisible.value
                  ? IconAssets.icInvisiblePassword
                  : IconAssets.icVisiblePassword,
              color: Theme.of(context).iconTheme.color,
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
