import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/navigation/rateUs/rate_us_view_model.dart';

import '../../../../utils/utils.dart';

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
        style: Theme.of(context).inputDecorationTheme.labelStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: Utils.getResponsiveHeight(context, 8),
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          hintText: 'message_hint'.tr,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              rateUsVM.apiErrorMessage.value.isNotEmpty
                  ? rateUsVM.apiErrorMessage.value
                  : rateUsVM.errorMessage.value.isNotEmpty
                  ? rateUsVM.errorMessage.value
                  : null,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        ),
        keyboardType: TextInputType.multiline,
        textInputAction: TextInputAction.newline,
        minLines: 3,
        maxLines: null,
      );
    });
  }
}
