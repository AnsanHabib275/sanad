import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';
import '../../../viewModels/controller/signup/sign_up_view_model.dart';

class InputNameWidget extends StatelessWidget {
  InputNameWidget({super.key});

  final signUpVM = Get.put(SignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: signUpVM.nameController.value,
        focusNode: signUpVM.nameFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'name_cannot_be_blank'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            signUpVM.nameFocusNode.value,
            signUpVM.emailFocusNode.value,
          );
        },
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
        ),
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
