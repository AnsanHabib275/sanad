import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/verifyEmail/widget/input_otp_widget.dart';
import 'package:sanad/view/verifyEmail/widget/verify_button_widget.dart';
import 'package:sanad/viewModels/controller/verifyEmail/verify_email_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/icon_assets.dart';
import '../../res/themes/app_themes.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final verifyEmailVM = Get.put(VerifyEmailViewModel());
  final _formKey = GlobalKey<FormState>();
  final accountId = Get.arguments['Accountid'] ?? '';
  final email = Get.arguments['email'] ?? '';

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: IconButton(
              icon: Image.asset(
                IconAssets.icArrowLeft,
                height: Get.height * Utils.getResponsiveHeight(24),
                width: Get.width * Utils.getResponsiveWidth(24),
                color: Theme.of(context).iconTheme.color,
              ),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text('email_verification'.tr),
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
            shape: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Obx(() {
            if (!verifyEmailVM.loading.value) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(32),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                            kToolbarHeight +
                            Get.height * Utils.getResponsiveHeight(74),
                      ),
                      Text(
                        'enter_your_security_code_we_sent_to'.tr,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontSize: Get.height * Utils.getResponsiveSize(14),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontSize: Get.height * Utils.getResponsiveSize(14),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(23),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'otp_code'.tr,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(10),
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpOneController.value,
                                focusNode: verifyEmailVM.otpOneFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpTwoFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpTwoController.value,
                                focusNode: verifyEmailVM.otpTwoFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpThreeFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpThreeController.value,
                                focusNode:
                                    verifyEmailVM.otpThreeFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpFourFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpFourController.value,
                                focusNode: verifyEmailVM.otpFourFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpFiveFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpFiveController.value,
                                focusNode: verifyEmailVM.otpFiveFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpSixFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpSixController.value,
                                focusNode: verifyEmailVM.otpSixFocusNode.value,
                                // nextFocusNode: verifyEmailVM.otpFourFocusNode.value,
                              ),
                            ),
                          ],
                        );
                      }),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(26),
                      ),
                      InkWell(
                        onTap: () {
                          verifyEmailVM.resendCodeApi(accountId);
                          verifyEmailVM.clearFields();
                        },
                        child: Text(
                          'resend_code'.tr,
                          style: TextStyle(
                            color: AppColor.primaryButtonColor,
                            decoration: TextDecoration.underline,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(39),
                      ),
                      VerifyButtonWidget(formKey: _formKey),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(20),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
        ),
      ),
    );
  }
}
