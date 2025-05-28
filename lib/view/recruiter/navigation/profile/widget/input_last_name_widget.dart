import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import '../../../../../viewModels/controller/recruiter/navigation/updateProfile/update_profile_view_model.dart';

class InputLastNameWidget extends StatelessWidget {
  InputLastNameWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: updateProfileVM.lastNameController.value,
        focusNode: updateProfileVM.lastNameFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'last_name_error'.tr;
          }
          return null;
        },
        onFieldSubmitted: (value) {
          Utils.fieldFocusChange(
            context,
            updateProfileVM.lastNameFocusNode.value,
            updateProfileVM.phoneNumberFocusNode.value,
          );
        },
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('last_name_hint'.tr),
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
