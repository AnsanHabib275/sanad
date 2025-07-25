import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/verifyEmail/widget/verify_button_widget.dart';

import '../../../../res/themes/app_themes.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../viewModels/controller/verifyEmail/verify_email_view_model.dart';
import '../verifyEmail/widget/input_otp_widget.dart' show InputOTPWidget;

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
                height: Utils.getResponsiveHeight(context, 24),
                width: Utils.getResponsiveWidth(context, 24),
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
                    horizontal: Utils.getResponsiveWidth(context, 30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height:
                            kToolbarHeight +
                            Utils.getResponsiveHeight(context, 74),
                      ),
                      Text(
                        'enter_your_security_code_we_sent_to'.tr,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontSize: Utils.getResponsiveSize(context, 14),
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
                          fontSize: Utils.getResponsiveSize(context, 14),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(context, 23)),
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
                            fontSize: Utils.getResponsiveSize(context, 14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(context, 10)),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpOneController.value,
                                focusNode: verifyEmailVM.otpOneFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpTwoFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpTwoController.value,
                                focusNode: verifyEmailVM.otpTwoFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpThreeFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
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
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpFourController.value,
                                focusNode: verifyEmailVM.otpFourFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpFiveFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpFiveController.value,
                                focusNode: verifyEmailVM.otpFiveFocusNode.value,
                                nextFocusNode:
                                    verifyEmailVM.otpSixFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller:
                                    verifyEmailVM.otpSixController.value,
                                focusNode: verifyEmailVM.otpSixFocusNode.value,
                              ),
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: Utils.getResponsiveHeight(context, 26)),
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
                            fontSize: Utils.getResponsiveSize(context, 14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(context, 39)),
                      VerifyButtonWidget(formKey: _formKey),
                      SizedBox(height: Utils.getResponsiveHeight(context, 20)),
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
