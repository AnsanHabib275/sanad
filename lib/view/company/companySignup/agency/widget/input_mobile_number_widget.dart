import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';

class InputMobileNumberWidget extends StatelessWidget {
  InputMobileNumberWidget({super.key});

  final companySignUpVM = Get.put(CompanySignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width * 1,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    companySignUpVM.phoneError.value.isEmpty
                        ? Theme.of(
                          context,
                        ).inputDecorationTheme.border!.borderSide.color
                        : AppColor.redColor,
              ),
              borderRadius: BorderRadius.circular(
                Get.height * Utils.getResponsiveSize(8),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Utils.hideKeyboardGlobally();
                    showCountryPicker(
                      context: context,
                      showPhoneCode: true,
                      onSelect: (Country country) async {
                        companySignUpVM.handleCountrySelection(country);
                      },
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(11)),
                      IntrinsicWidth(
                        child: TextFormField(
                          controller: companySignUpVM.countryCodeController.value,
                          focusNode: companySignUpVM.countryCodeFocusNode.value,
                          readOnly: true,
                          textAlign: TextAlign.center,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.none,
                          onTap: () {
                            Utils.hideKeyboardGlobally();
                            showCountryPicker(
                              context: context,
                              showPhoneCode: true,
                              onSelect: (Country country) async {
                                companySignUpVM.handleCountrySelection(country);
                              },
                            );
                          },
                          style:
                              Theme.of(context).inputDecorationTheme.hintStyle,
                          decoration: InputDecoration(
                            hintText: 'hint_country_code'.tr,
                            hintStyle:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.hintStyle,
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                      Image.asset(
                        IconAssets.icArrowDown,
                        height: Get.height * Utils.getResponsiveHeight(16),
                        width: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(7)),
                    ],
                  ),
                ),
                Container(
                  height: Get.height * Utils.getResponsiveHeight(50),
                  width: Get.width * Utils.getResponsiveWidth(1),
                  color:
                      Theme.of(
                        context,
                      ).inputDecorationTheme.border?.borderSide.color,
                ),
                SizedBox(width: Get.width * Utils.getResponsiveWidth(24)),
                Expanded(
                  child: TextFormField(
                    controller: companySignUpVM.mobileNumberController.value,
                    focusNode: companySignUpVM.mobileNumberFocusNode.value,
                    enableSuggestions: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.done,
                    style: Theme.of(context).inputDecorationTheme.hintStyle,
                    decoration: InputDecoration(
                      hintText: 'hint_mobile_number'.tr,
                      hintStyle:
                          Theme.of(context).inputDecorationTheme.hintStyle,
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                    onChanged: (value) async {
                      await companySignUpVM.validatePhoneNumber(value);
                      companySignUpVM.formatPhoneNumber(value);
                      companySignUpVM.validateForm();
                    },
                    validator: (value) {
                      companySignUpVM.validatePhoneNumber(value!);
                      companySignUpVM.formatPhoneNumber(value);
                      return null;
                    },
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  ),
                ),
              ],
            ),
          ),
          if (companySignUpVM.phoneError.value.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: Get.width * Utils.getResponsiveWidth(15),
                top: Get.height * Utils.getResponsiveHeight(4),
              ),
              child: Text(
                companySignUpVM.phoneError.value,
                style: Theme.of(context).inputDecorationTheme.errorStyle,
              ),
            ),
        ],
      );
    });
  }
}
