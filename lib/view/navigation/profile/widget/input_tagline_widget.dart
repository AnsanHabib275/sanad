import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../viewModels/controller/navigation/updateProfile/update_profile_view_model.dart';

class InputTaglineWidget extends StatelessWidget {
  InputTaglineWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: updateProfileVM.taglineController.value,
        focusNode: updateProfileVM.taglineFocusNode.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'tagline_error'.tr;
          }
          return null;
        },
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('tagline_hint'.tr),
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
        keyboardType: TextInputType.multiline,
        minLines: null,
        maxLines: null,
      );
    });
  }
}
