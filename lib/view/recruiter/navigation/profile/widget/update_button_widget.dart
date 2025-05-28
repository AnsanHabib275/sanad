import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/recruiter/navigation/updateProfile/update_profile_view_model.dart';

class UpdateButtonWidget extends StatelessWidget {
  UpdateButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'update'.tr,
        loading: updateProfileVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.back();
          // Get.toNamed(
          // RoutesName.verifyEmailScreen,
          // arguments: {'Accountid': '1', 'email': 'a@gimpmail.com'},
          // );
          // if (formKey.currentState!.validate()) {
          //   signUpVM.signUpApi();
          // }
        },
      );
    });
  }
}
