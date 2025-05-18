import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../../res/colors/app_color.dart';

class InputOTPWidget extends StatelessWidget {
  final String eID;
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  InputOTPWidget({
    super.key,
    required this.eID,
    required this.controller,
    required this.focusNode,
    this.nextFocusNode,
  });

  final otpVM = Get.put(OTPViewModel());

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
          otpVM.checkOtpFilled();
        }
      },
      style: TextStyle(
        color: AppColor.otpTextColor,
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
          borderSide: const BorderSide(
            color: AppColor.editTextBorderColor,
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryButtonColor,
            width: 0.8,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(8)),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: AppColor.primaryButtonColor,
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
