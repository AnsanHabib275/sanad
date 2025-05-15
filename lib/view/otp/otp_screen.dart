import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/otp/widget/input_otp_widget.dart';
import 'package:sanad/view/otp/widget/next_button_widget.dart';
import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';
import 'package:sanad/viewModels/controller/resendCode/resend_code_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/icon_assets.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
          appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            leading: IconButton(
              icon: Image.asset(IconAssets.icArrowLeft),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text(
              'otp_verification'.tr,
              style: TextStyle(
                color: AppColor.textPrimaryColor,
                fontSize: Get.height * Utils.getResponsiveSize(24),
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
              ),
            ),
            shape: Border(
              bottom: BorderSide(
                color: AppColor.searchBarBorderColor,
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
                        height: Get.height * Utils.getResponsiveHeight(124),
                      ),
                      Text(
                        'enter_your_security_code_we_sent_to'.tr,
                        style: TextStyle(
                          color: AppColor.textPrimaryColor,
                          fontSize: Get.height * Utils.getResponsiveSize(14),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        email,
                        style: TextStyle(
                          color: AppColor.textPrimaryColor,
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
                            color: AppColor.textPrimaryColor,
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
                              width: 55,
                              height: 55,
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpOneController.value,
                                focusNode: otpVM.otpOneFocusNode.value,
                                nextFocusNode: otpVM.otpTwoFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpTwoController.value,
                                focusNode: otpVM.otpTwoFocusNode.value,
                                nextFocusNode: otpVM.otpThreeFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpThreeController.value,
                                focusNode: otpVM.otpThreeFocusNode.value,
                                nextFocusNode: otpVM.otpFourFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpFourController.value,
                                focusNode: otpVM.otpFourFocusNode.value,
                                nextFocusNode: otpVM.otpFiveFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: 55,
                              height: 55,
                              child: InputOTPWidget(
                                eID: eID,
                                controller: otpVM.otpFiveController.value,
                                focusNode: otpVM.otpFiveFocusNode.value,
                                nextFocusNode: otpVM.otpSixFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: 55,
                              height: 55,
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
                            color: AppColor.primaryColor,
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
