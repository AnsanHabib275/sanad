import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../viewModels/controller/userPreference/user_preference_view_model.dart';

class DeclineButtonWidget extends StatelessWidget {
  DeclineButtonWidget({super.key});

  final userVM = Get.put(UserPreference());

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      buttonColor: Theme.of(context).extension<AppColors>()!.buttonBg,
      textColor: Theme.of(context).extension<AppColors>()!.textPrimaryColor,
      fontWeight: FontWeight.w500,
      width: 193,
      height: 40,
      title: 'decline'.tr,
      onPress: () {
        Get.back();
        // userVM.removeUser();
      },
    );
  }
}
