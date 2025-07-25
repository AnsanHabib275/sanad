import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/otp/otp_view_model.dart';

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

  final otpVM = Get.put(OTPViewModel());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: focusNode,
      builder: (context, child) {
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
            color: Theme.of(context).extension<AppColors>()?.otpText,
            fontSize: Utils.getResponsiveSize(context, 18),
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            filled: false,
            counterText: "",
            contentPadding: EdgeInsets.symmetric(
              vertical: Utils.getResponsiveHeight(context, 12),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color:
                    Theme.of(
                      context,
                    ).inputDecorationTheme.border!.borderSide.color,
                width: 0.8,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(Utils.getResponsiveSize(context, 8)),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                // color: AppColor.primaryButtonColor,
                color:
                    Theme.of(
                      context,
                    ).inputDecorationTheme.border!.borderSide.color,
                width: 0.8,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(Utils.getResponsiveSize(context, 8)),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: AppColor.primaryButtonColor,
                width: 0.8,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(Utils.getResponsiveSize(context, 8)),
              ),
            ),
          ),
          textAlign: TextAlign.center,
          maxLength: 1,
          keyboardType: TextInputType.number,
        );
      },
    );
  }
}
