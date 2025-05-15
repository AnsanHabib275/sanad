import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/navigation/rateUs/rate_us_view_model.dart';

class InputMessageWidget extends StatelessWidget {
  InputMessageWidget({super.key});

  final rateUsVM = Get.put(RateUsViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: rateUsVM.messageController.value,
        focusNode: rateUsVM.messageFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'message_cannot_be_blank'.tr;
          }
          return null;
        },
        style: TextStyle(
          color: AppColor.textPrimaryColor,
          fontSize: Get.height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hint: Text('message_hint'.tr),
          hintStyle: TextStyle(
            color: AppColor.textSecondaryColor,
            fontSize: Get.height * Utils.getResponsiveSize(14),
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w500,
          ),
          errorText:
              rateUsVM.apiErrorMessage.value.isNotEmpty
                  ? rateUsVM.apiErrorMessage.value
                  : rateUsVM.errorMessage.value.isNotEmpty
                  ? rateUsVM.errorMessage.value
                  : null,
          errorStyle: TextStyle(
            color: AppColor.redColor,
            fontSize: Get.height * Utils.getResponsiveSize(14),
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
        keyboardType: TextInputType.multiline,
        minLines: null,
        maxLines: null,
      );
    });
  }
}
