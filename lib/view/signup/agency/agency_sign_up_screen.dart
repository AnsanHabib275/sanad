import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/signup/sign_up_view_model.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/routes/routes_name.dart';
import '../agency/widget/input_mobile_number_widget.dart';
import '../agency/widget/send_code_button_widget.dart';

class AgencySignUpScreen extends StatefulWidget {
  const AgencySignUpScreen({super.key});

  @override
  State<AgencySignUpScreen> createState() => _AgencySignUpScreenState();
}

class _AgencySignUpScreenState extends State<AgencySignUpScreen> {
  final signUpVM = Get.put(SignUpViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      // child: PopScope(
      // canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Utils.getResponsiveWidth(context, 20),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Utils.getResponsiveHeight(context, 257)),
                  Image(
                    height: Utils.getResponsiveHeight(context, 54),
                    width: Utils.getResponsiveWidth(context, 155),
                    image: AssetImage(ImageAssets.appLogo),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 24)),
                  Text(
                    'join_as_an_agency'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontSize: Utils.getResponsiveSize(context, 24),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 32)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(context, 10),
                    ),
                    child: Form(
                      key: formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'mobile_number'.tr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize: Utils.getResponsiveSize(context, 14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Utils.getResponsiveHeight(context, 8),
                          ),
                          InputMobileNumberWidget(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Obx(() {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(context, 10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Transform.translate(
                            offset: Offset(-14, -16),
                            child: Checkbox(
                              value: signUpVM.isAgree.value,
                              onChanged: (bool? value) {
                                signUpVM.isAgree.value = value!;
                              },
                              activeColor: AppColor.primaryColor,
                              // Color when checked
                              checkColor: AppColor.secondaryIconDarkColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color: AppColor.primaryColor,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Utils.getResponsiveSize(context, 4),
                                ),
                              ),
                            ),
                          ),
                          Transform.translate(
                            offset: Offset(-16, 0),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        'by_clicking_agree_join_or_continue_you_agree_to_the_linkedIn'
                                            .tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'user_agreement'.tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(
                                              RoutesName
                                                  .termsAndConditionsScreen,
                                            );
                                          },
                                  ),
                                  TextSpan(
                                    text: ', ',
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'privacy_policy'.tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(
                                              RoutesName.privacyPolicyScreen,
                                            );
                                          },
                                  ),
                                  TextSpan(
                                    text: ', and \n',
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'cookie_policy'.tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.toNamed(
                                              RoutesName.cookiesPolicyScreen,
                                            );
                                          },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(context, 10),
                    ),
                    child: SendCodeButtonWidget(formKey: formKey),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'already_have_an_account'.tr,
                        textScaler: TextScaler.linear(1),
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          fontSize: Utils.getResponsiveSize(context, 12),
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textSecondaryColor,
                        ),
                      ),
                      SizedBox(width: Utils.getResponsiveWidth(context, 4)),
                      InkWell(
                        onTap: () {
                          Utils.hideKeyboardGlobally();
                          Get.offAllNamed(RoutesName.loginScreen);
                        },
                        child: Text(
                          'sign_in'.tr,
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(context, 12),
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'looking_to_create_an_account_for_an_individual'.tr,
                        textScaler: TextScaler.linear(1),
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          fontSize: Utils.getResponsiveSize(context, 12),
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textSecondaryColor,
                        ),
                      ),
                      SizedBox(width: Utils.getResponsiveWidth(context, 4)),
                      InkWell(
                        onTap: () {
                          Utils.hideKeyboardGlobally();
                          Get.offAllNamed(RoutesName.signUpScreen);
                        },
                        child: Text(
                          'signup_as_individual'.tr,
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(context, 12),
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 50)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
