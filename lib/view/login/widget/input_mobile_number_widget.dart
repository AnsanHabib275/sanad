import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../utils/utils.dart';
import '../../../../viewModels/controller/login/login_view_model.dart';

class InputMobileNumberWidget extends StatelessWidget {
  InputMobileNumberWidget({super.key});

  final loginVM = Get.put(LoginViewModel());

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
                    loginVM.phoneError.value.isEmpty
                        ? Theme.of(
                          context,
                        ).inputDecorationTheme.border!.borderSide.color
                        : AppColor.redColor,
              ),
              borderRadius: BorderRadius.circular(
                Utils.getResponsiveSize(context, 8),
              ),
            ),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InkWell(
                    onTap: () {
                      Utils.hideKeyboardGlobally();
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) async {
                          loginVM.handleCountrySelection(country);
                        },
                      );
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IntrinsicWidth(
                          child: TextFormField(
                            controller: loginVM.countryCodeController.value,
                            focusNode: loginVM.countryCodeFocusNode.value,
                            readOnly: true,
                            textAlign: TextAlign.center,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            keyboardType: TextInputType.none,
                            onTap: () {
                              Utils.hideKeyboardGlobally();
                              showCountryPicker(
                                context: context,
                                showPhoneCode: true,
                                onSelect: (Country country) async {
                                  loginVM.handleCountrySelection(country);
                                },
                              );
                            },
                            style:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.labelStyle,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.only(
                                top: Utils.getResponsiveHeight(context, 8),
                                bottom: Utils.getResponsiveHeight(context, 8),
                                left: Utils.getResponsiveWidth(context, 12),
                                right: Utils.getResponsiveWidth(context, 8),
                              ),
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
                        Image.asset(
                          IconAssets.icArrowDown,
                          height: Utils.getResponsiveHeight(context, 16),
                          width: Utils.getResponsiveWidth(context, 16),
                        ),
                        SizedBox(width: Utils.getResponsiveWidth(context, 8)),
                      ],
                    ),
                  ),
                  Container(
                    width: Utils.getResponsiveWidth(context, 1),
                    color:
                        Theme.of(
                          context,
                        ).inputDecorationTheme.border?.borderSide.color,
                  ),
                  Expanded(
                    child: TextFormField(
                      controller: loginVM.mobileNumberController.value,
                      focusNode: loginVM.mobileNumberFocusNode.value,
                      enableSuggestions: true,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      style: Theme.of(context).inputDecorationTheme.labelStyle,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          vertical: Utils.getResponsiveHeight(context, 8),
                          horizontal: Utils.getResponsiveWidth(context, 16),
                        ),
                        hintText: 'hint_mobile_number'.tr,
                        hintStyle:
                            Theme.of(context).inputDecorationTheme.hintStyle,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                      onChanged: (value) async {
                        await loginVM.validatePhoneNumber(value);
                        loginVM.formatPhoneNumber(value);
                        loginVM.validateForm();
                      },
                      validator: (value) {
                        loginVM.validatePhoneNumber(value!);
                        loginVM.formatPhoneNumber(value);
                        return null;
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (loginVM.phoneError.value.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: Utils.getResponsiveWidth(context, 15),
                top: Utils.getResponsiveHeight(context, 4),
              ),
              child: Text(
                loginVM.phoneError.value,
                style: Theme.of(context).inputDecorationTheme.errorStyle,
              ),
            ),
        ],
      );
    });
  }
}
