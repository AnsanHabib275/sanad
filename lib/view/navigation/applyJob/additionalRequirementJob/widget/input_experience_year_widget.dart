import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/themes/app_themes.dart';

import '../../../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class InputExperienceYearWidget extends StatelessWidget {
  InputExperienceYearWidget({super.key});

  final applyJobVM = Get.put(ApplyJobViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return TextFormField(
        controller: applyJobVM.experienceYearController.value,
        enableSuggestions: true,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: Theme.of(context).inputDecorationTheme.hintStyle,
        decoration: InputDecoration(
          hint: Text('experience_year_hint'.tr),
          hintStyle: Theme.of(context).inputDecorationTheme.hintStyle,
          border: UnderlineInputBorder(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).extension<AppColors>()!.containerBg,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).extension<AppColors>()!.containerBg,
              width: 1.0,
            ),
          ),
        ),
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
      );
    });
  }
}
