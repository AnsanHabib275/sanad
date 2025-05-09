import 'package:sanad/view/signup/widget/input_confirm_password_widget.dart';
import 'package:sanad/view/signup/widget/sign_up_button_widget.dart';
import 'package:sanad/view/signup/widget/input_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../viewModels/controller/signup/sign_up_view_model.dart';
import '../signup/widget/input_email_widget.dart';
import '../signup/widget/input_password_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpVM = Get.put(SignUpViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: PopScope(
        canPop: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Container(
              height: Get.height * 1,
              width: Get.width * 1,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ImageAssets.bg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(20),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(64),
                      ),
                      Text(
                        'create_account'.tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColor.blue,
                          fontSize: Get.height * Utils.getResponsiveSize(20),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(15),
                      ),
                      Text(
                        'please_enter_the_following_credentials'.tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: AppColor.grey,
                          fontSize: Get.height * Utils.getResponsiveSize(14),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(25),
                      ),
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'name'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColor.darkGrey,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            InputNameWidget(),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(15),
                            ),
                            Text(
                              'email'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColor.darkGrey,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            InputEmailWidget(),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(15),
                            ),
                            Text(
                              'password'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColor.darkGrey,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            InputPasswordWidget(),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(15),
                            ),
                            Text(
                              'confirm_password'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: AppColor.darkGrey,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            InputConfirmPasswordWidget(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(30),
                      ),
                      SignUpButtonWidget(formKey: formKey),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(25),
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
                                  Get.height * Utils.getResponsiveSize(14),
                              color: AppColor.darkGrey,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(5),
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
                                    Get.height * Utils.getResponsiveSize(14),
                                color: AppColor.orange,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(100),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
