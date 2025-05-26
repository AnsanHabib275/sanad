import 'package:flutter/services.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/login/widget/login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/image_assets.dart';
import '../../../res/routes/routes_name.dart';
import '../../../res/themes/app_themes.dart';
import '../../../viewModels/controller/login/login_view_model.dart';
import '../../forgetPassword/widget/input_email_widget.dart';
import '../../signup/agency/widget/input_password_widget.dart';

class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});

  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
  final loginVM = Get.put(LoginViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      // value:
      //     Get.isDarkMode
      //         ? SystemUiOverlayStyle.light
      //         : SystemUiOverlayStyle.dark,
      value: SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        statusBarBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.dark
                : Brightness.light,
        systemNavigationBarColor: Theme.of(context).secondaryHeaderColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(1.0)),
        // child: PopScope(
        //   canPop: false,
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
                          'sign_in_to_sanad'.tr,
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
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(8),
                              ),
                              InputEmailWidget(),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(20),
                              ),
                              Text(
                                'password'.tr,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(8),
                              ),
                              InputPasswordWidget(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(20),
                        ),
                        Row(
                          children: [
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                Utils.hideKeyboardGlobally();
                                Get.toNamed(RoutesName.forgetPasswordScreen);
                              },
                              child: Text(
                                'forgot_password_with_question'.tr,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        LoginButtonWidget(formKey: formKey),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(32),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'don’t_have_an_account'.tr,
                              textScaler: TextScaler.linear(1),
                              style: TextStyle(
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(12),
                                color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textSecondaryColor,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(4),
                            ),
                            InkWell(
                              onTap: () {
                                Utils.hideKeyboardGlobally();
                                Get.offAllNamed(RoutesName.selectRoleScreen);
                              },
                              child: Text(
                                'request_one'.tr,
                                style: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
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
      ),
    );
  }
}
