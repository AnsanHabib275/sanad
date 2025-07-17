import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../../viewModels/controller/navigation/updateProfile/update_profile_view_model.dart';

class InputFirstNameWidget extends StatelessWidget {
  InputFirstNameWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: updateProfileVM.firstNameController.value,
        focusNode: updateProfileVM.firstNameFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'first_name_error'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            updateProfileVM.firstNameFocusNode.value,
            updateProfileVM.lastNameFocusNode.value,
          );
        },
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('first_name_hint'.tr),
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
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
