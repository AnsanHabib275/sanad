import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/otp/company/widget/input_otp_widget.dart';
import 'package:sanad/view/otp/company/widget/next_button_widget.dart';
import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';
import 'package:sanad/viewModels/controller/resendCode/resend_code_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/themes/app_themes.dart';

class CompanyOTPScreen extends StatefulWidget {
  const CompanyOTPScreen({super.key});

  @override
  State<CompanyOTPScreen> createState() => _CompanyOTPScreenState();
}

class _CompanyOTPScreenState extends State<CompanyOTPScreen> {
  final otpVM = Get.put(OTPViewModel());
  final resendCodeVM = Get.put(ResendCodeViewModel());
  final _formKey = GlobalKey<FormState>();
  final eID = Get.arguments['eID'] ?? '';
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
            title: Text('otp_verification'.tr),
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
            if (!resendCodeVM.loading.value) {
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
                                eID: eID,
                                controller: otpVM.otpOneController.value,
                                focusNode: otpVM.otpOneFocusNode.value,
                                nextFocusNode: otpVM.otpTwoFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpTwoController.value,
                                focusNode: otpVM.otpTwoFocusNode.value,
                                nextFocusNode: otpVM.otpThreeFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpThreeController.value,
                                focusNode: otpVM.otpThreeFocusNode.value,
                                nextFocusNode: otpVM.otpFourFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpFourController.value,
                                focusNode: otpVM.otpFourFocusNode.value,
                                nextFocusNode: otpVM.otpFiveFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpFiveController.value,
                                focusNode: otpVM.otpFiveFocusNode.value,
                                nextFocusNode: otpVM.otpSixFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(55),
                              height:
                                  Get.height * Utils.getResponsiveHeight(55),
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpSixController.value,
                                focusNode: otpVM.otpSixFocusNode.value,
                                // nextFocusNode: otpVM.otpFourFocusNode.value,
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
                          resendCodeVM.resendCodeApi(email);
                          otpVM.clearFields();
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
                      NextButtonWidget(formKey: _formKey, eID: eID),
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
