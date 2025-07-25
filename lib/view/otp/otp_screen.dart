import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/otp/widget/input_otp_widget.dart';
import 'package:sanad/view/otp/widget/next_button_widget.dart';
import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';

import '../../../../res/themes/app_themes.dart';
import '../../../res/assets/icon_assets.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final otpVM = Get.put(OTPViewModel());
  final _formKey = GlobalKey<FormState>();
  final from = Get.arguments['from'] ?? '';
  final accountId = Get.arguments['Accountid'] ?? '';
  final mobileNumber = Get.arguments['MobileNumber'] ?? '';

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
            if (!otpVM.resendCodeLoading.value) {
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
                        mobileNumber,
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
                                controller: otpVM.otpOneController.value,
                                focusNode: otpVM.otpOneFocusNode.value,
                                nextFocusNode: otpVM.otpTwoFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller: otpVM.otpTwoController.value,
                                focusNode: otpVM.otpTwoFocusNode.value,
                                nextFocusNode: otpVM.otpThreeFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller: otpVM.otpThreeController.value,
                                focusNode: otpVM.otpThreeFocusNode.value,
                                nextFocusNode: otpVM.otpFourFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller: otpVM.otpFourController.value,
                                focusNode: otpVM.otpFourFocusNode.value,
                                nextFocusNode: otpVM.otpFiveFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller: otpVM.otpFiveController.value,
                                focusNode: otpVM.otpFiveFocusNode.value,
                                nextFocusNode: otpVM.otpSixFocusNode.value,
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 55),
                              height: Utils.getResponsiveHeight(context, 55),
                              child: InputOTPWidget(
                                controller: otpVM.otpSixController.value,
                                focusNode: otpVM.otpSixFocusNode.value,
                              ),
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: Utils.getResponsiveHeight(context, 26)),
                      InkWell(
                        onTap: () {
                          otpVM.resendCodeApi(accountId);
                          otpVM.clearFields();
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
                      NextButtonWidget(formKey: _formKey, from: from),
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
