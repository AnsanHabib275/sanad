import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../../res/routes/routes_name.dart';

class SignUpAsAIndividualButtonWidget extends StatelessWidget {
  SignUpAsAIndividualButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final signUpVM = Get.put(CompanySignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'sign_up_as_a_individual'.tr,
        loading: signUpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          Get.toNamed(
            RoutesName.companyIndividualSignUpFillDetailScreen,
            arguments: {'Accountid': '1', 'email': 'a@gimpmail.com'},
          );
          // if (formKey.currentState!.validate()) {
          //   signUpVM.signUpIndividualApi();
          // }
        },
      );
    });
  }
}
