import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/company/companyLogin/widget/input_password_widget.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/routes/routes_name.dart';
import '../../../viewModels/controller/company/companyLogin/company_login_view_model.dart';
import '../../company/companyLogin/widget/login_button_widget.dart';
import '../forgetPassword/widget/input_email_widget.dart';

class CompanyLoginScreen extends StatefulWidget {
  const CompanyLoginScreen({super.key});

  @override
  State<CompanyLoginScreen> createState() => _CompanyLoginScreenState();
}

class _CompanyLoginScreenState extends State<CompanyLoginScreen> {
  final loginVM = Get.put(CompanyLoginViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(250),
                    ),
                    Image(
                      height: Get.height * Utils.getResponsiveHeight(27),
                      width: Get.width * Utils.getResponsiveWidth(77),
                      image: AssetImage(ImageAssets.appLogoSmall),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(24),
                    ),
                    Text(
                      'sign_in_to_skill_bridge'.tr,
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
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Transform.translate(
                                  offset: Offset(-12, -0),
                                  child: Checkbox(
                                    value: loginVM.isRemember.value,
                                    onChanged: (bool? value) {
                                      loginVM.isRemember.value = value!;
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
                                  child: Text(
                                    'remember_for_30_days'.tr,
                                    style: TextStyle(
                                      fontSize:
                                      Get.height *
                                          Utils.getResponsiveSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textSecondaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
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
                            Get.offAllNamed(RoutesName.companySignUpScreen);
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
                      height: Get.height * Utils.getResponsiveHeight(50),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // ),
      ),
    );
  }
}
