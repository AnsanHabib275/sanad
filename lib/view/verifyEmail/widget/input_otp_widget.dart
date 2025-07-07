import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/verifyEmail/verify_email_view_model.dart';

class InputOTPWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  InputOTPWidget({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });

  final verifyEmailVM = Get.put(VerifyEmailViewModel());

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: (value) {
        if (nextFocusNode != null) {
          Utils.fieldFocusChange(context, focusNode, nextFocusNode!);
        }
      },
      onChanged: (value) {
        if (value.length == 1) {
          if (nextFocusNode != null) {
            Utils.fieldFocusChange(context, focusNode, nextFocusNode!);
          }
          verifyEmailVM.checkOtpFilled();
        }
      },
      style: TextStyle(
        color: Theme.of(context).extension<AppColors>()?.otpText,
        fontSize: Get.height * Utils.getResponsiveSize(18),
        fontFamily: 'Manrope',
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        filled: false,
        counterText: "",
        contentPadding: EdgeInsets.symmetric(
          vertical: Get.height * Utils.getResponsiveHeight(12),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color:
                Theme.of(context).inputDecorationTheme.border!.borderSide.color,
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryButtonColor, // Default border color
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryButtonColor, // Default border color
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
      ),
      textAlign: TextAlign.center,
      maxLength: 1,
      keyboardType: TextInputType.number,
    );
  }
}
