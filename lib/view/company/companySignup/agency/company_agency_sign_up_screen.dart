import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/company/companySignup/agency/widget/sign_up_as_a_company_button_widget.dart';
import 'package:sanad/view/company/companySignup/agency/widget/input_password_widget.dart';
import 'package:sanad/view/company/companySignup/agency/widget/sign_up_as_a_recruiter_button_widget.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../res/themes/app_themes.dart';
import '../../companySignup/agency/widget/input_email_widget.dart';

class CompanyAgencySignUpScreen extends StatefulWidget {
  const CompanyAgencySignUpScreen({super.key});

  @override
  State<CompanyAgencySignUpScreen> createState() =>
      _CompanyAgencySignUpScreenState();
}

class _CompanyAgencySignUpScreenState
    extends State<CompanyAgencySignUpScreen> {
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
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(32),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(190),
                      ),
                      Image(
                        height: Get.height * Utils.getResponsiveHeight(27),
                        width: Get.width * Utils.getResponsiveWidth(77),
                        image: AssetImage(ImageAssets.appLogoSmall),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(32),
                      ),
                      Text(
                        'sign_up_as_a_company'.tr,
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
                        height: Get.height * Utils.getResponsiveHeight(16),
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
                            InputPasswordWidget(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Transform.translate(
                              offset: Offset(-12, -15),
                              child: Checkbox(
                                value: signUpVM.isAgree.value,
                                onChanged: (bool? value) {
                                  signUpVM.isAgree.value = value!;
                                },
                                activeColor:
                                AppColor
                                    .primaryColor, // Color when checked
                                checkColor: AppColor.secondaryIconDarkColor,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color: AppColor.primaryColor,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    Get.height * Utils.getResponsiveSize(4),
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: Offset(-20, -0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: RichText(
                                  textAlign: TextAlign.start,
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
                                        text: 'cookie_policy_company'.tr,
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
                            ),
                          ],
                        );
                      }),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      SignUpAsACompanyButtonWidget(formKey: formKey),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      SignUpAsARecruiterButtonWidget(),
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
                              Get.offAllNamed(RoutesName.companyLoginScreen);
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
                        height: Get.height * Utils.getResponsiveHeight(32),
                      ),

                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                          // Get.offAllNamed(RoutesName.signUpScreen);
                        },
                        child: Text(
                          'sign_up_as_an_individual'.tr,
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
                ),
                SizedBox(
                  height: Get.height * Utils.getResponsiveHeight(50),
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
