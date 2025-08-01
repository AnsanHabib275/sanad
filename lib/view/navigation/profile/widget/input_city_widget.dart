import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../../viewModels/controller/navigation/updateProfile/update_profile_view_model.dart';

class InputCityWidget extends StatelessWidget {
  InputCityWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: updateProfileVM.cityController.value,
        focusNode: updateProfileVM.cityFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'city_or_state_error'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            updateProfileVM.cityFocusNode.value,
            updateProfileVM.streetFocusNode.value,
          );
        },
        style: Theme.of(context).inputDecorationTheme.labelStyle,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: Utils.getResponsiveHeight(context, 8),
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          hintText: 'city_or_state_hint'.tr,
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          errorText:
              updateProfileVM.errorMessage.value.isEmpty
                  ? null
                  : updateProfileVM.errorMessage.value,
          errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
          errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
          focusedErrorBorder:
              Theme.of(context).inputDecorationTheme.focusedErrorBorder,
        ),
        keyboardType: TextInputType.streetAddress,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
