import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../viewModels/controller/recruiter/navigation/applyJob/apply_job_view_model.dart';


class InputLinkedInAccountWidget extends StatelessWidget {
  InputLinkedInAccountWidget({super.key});

  final applyJobVM = Get.put(ApplyJobViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: applyJobVM.linkedinAccountController.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('linkedin_account_hint'.tr),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          border: Theme.of(context).inputDecorationTheme.border,
          enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
          focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        ),
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
