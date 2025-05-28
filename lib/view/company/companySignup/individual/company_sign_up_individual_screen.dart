import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/company/companySignup/individual/widget/agree_and_join_button_widget.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../res/themes/app_themes.dart';
import '../../companySignup/individual/widget/input_email_widget.dart';

class CompanySignUpIndividualScreen extends StatefulWidget {
  const CompanySignUpIndividualScreen({super.key});

  @override
  State<CompanySignUpIndividualScreen> createState() =>
      _CompanySignUpIndividualScreenState();
}

class _CompanySignUpIndividualScreenState
    extends State<CompanySignUpIndividualScreen> {
  final signUpVM = Get.put(CompanySignUpViewModel());
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
              horizontal: Get.width * Utils.getResponsiveWidth(32),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        height: Get.height * Utils.getResponsiveHeight(54),
                        width: Get.width * Utils.getResponsiveWidth(155),
                        image: AssetImage(ImageAssets.appLogo),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(24),
                      ),
                      Text(
                        'join_as_an_individual'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontSize: Get.height * Utils.getResponsiveSize(24),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(32),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'email'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * Utils.getResponsiveHeight(8),
                            ),
                            InputEmailWidget(),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(20),
                            ),
                            Text(
                              'password_at_least'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Get.height * Utils.getResponsiveHeight(8),
                            ),
                            // InputPasswordWidget(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(20),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'by_clicking_agree_join_or_continue_you_agree_to_the_linkedIn'
                                        .tr,
                                style: TextStyle(
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
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
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
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
                                        // Get.toNamed(RoutesName.userAgreement);
                                      },
                              ),
                              TextSpan(
                                text: ', ',
                                style: TextStyle(
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
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
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
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
                                        // Get.toNamed(RoutesName.userAgreement);
                                      },
                              ),
                              TextSpan(
                                text: 'and'.tr,
                                style: TextStyle(
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
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
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
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
                                        // Get.toNamed(RoutesName.userAgreement);
                                      },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      AgreeAndJoinButtonWidget(formKey: formKey),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(32),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'already_have_an_account'.tr,
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(12),
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(4),
                          ),
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
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(12),
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'looking_to_create_an_account_for_an_agency'.tr,
                            textScaler: TextScaler.linear(1),
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(12),
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(4),
                          ),
                          InkWell(
                            onTap: () {
                              Utils.hideKeyboardGlobally();
                              Get.offAllNamed(RoutesName.signUpScreen);
                            },
                            child: Text(
                              'signup_as_agency'.tr,
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(12),
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
