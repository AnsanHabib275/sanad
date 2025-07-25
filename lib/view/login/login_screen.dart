import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/login/widget/input_mobile_number_widget.dart';
import 'package:sanad/view/login/widget/login_button_widget.dart';

import '../../../../res/themes/app_themes.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/routes/routes_name.dart';
import '../../../viewModels/controller/login/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginVM = Get.put(LoginViewModel());
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
                horizontal: Utils.getResponsiveWidth(context, 30),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Utils.getResponsiveHeight(context, 270)),
                    Image(
                      height: Utils.getResponsiveHeight(context, 54),
                      width: Utils.getResponsiveWidth(context, 155),
                      image: AssetImage(ImageAssets.appLogo),
                    ),
                    SizedBox(height: Utils.getResponsiveHeight(context, 24)),
                    Text(
                      'sign_in_to_sanad'.tr,
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
                    SizedBox(height: Utils.getResponsiveHeight(context, 70)),
                    Form(
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
                    SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                    LoginButtonWidget(formKey: formKey),
                    SizedBox(height: Utils.getResponsiveHeight(context, 70)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'don’t_have_an_account'.tr,
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
                            'request_one'.tr,
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
        // ),
      ),
    );
  }
}
