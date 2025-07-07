import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('message_hint'.tr),
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
        minLines: null,
        maxLines: null,
      );
    });
  }
}
