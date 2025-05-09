import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/otp/widget/input_otp_widget.dart';
import 'package:sanad/view/otp/widget/verify_button_widget.dart';
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
            backgroundColor: AppColor.transparent,
            leading: IconButton(
              icon: Image.asset(IconAssets.icArrowLeft),
              onPressed: () => Get.back(),
            ),
            centerTitle: false,
            title: Text(
              'otp_verification'.tr,
              style: TextStyle(
                  color: AppColor.blue,
                  fontSize: Get.height * Utils.getResponsiveSize(20),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Outfit'),
            ),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Container(
            height: Get.height * 1,
            width: Get.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Obx(() {
              if (!resendCodeVM.loading.value) {
                return SafeArea(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: constraints.maxHeight,
                          ),
                          child: IntrinsicHeight(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Get.width * Utils.getResponsiveWidth(20)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'please_enter_the_following_credentials'.tr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize: Get.height *
                                          Utils.getResponsiveSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height *
                                        Utils.getResponsiveHeight(25),
                                  ),
                                  Text(
                                    'otp_code'.tr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColor.darkGrey,
                                      fontSize: Get.height *
                                          Utils.getResponsiveSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Get.height *
                                        Utils.getResponsiveHeight(16),
                                  ),
                                  Obx(() {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            eID: eID,
                                            controller:
                                                otpVM.otpOneController.value,
                                            focusNode:
                                                otpVM.otpOneFocusNode.value,
                                            nextFocusNode:
                                                otpVM.otpTwoFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            eID: eID,
                                            controller:
                                                otpVM.otpTwoController.value,
                                            focusNode:
                                                otpVM.otpTwoFocusNode.value,
                                            nextFocusNode:
                                                otpVM.otpThreeFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            eID: eID,
                                            controller:
                                                otpVM.otpThreeController.value,
                                            focusNode:
                                                otpVM.otpThreeFocusNode.value,
                                            nextFocusNode:
                                                otpVM.otpFourFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            eID: eID,
                                            controller:
                                                otpVM.otpFourController.value,
                                            focusNode:
                                                otpVM.otpFourFocusNode.value,
                                            nextFocusNode:
                                                otpVM.otpFiveFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            eID: eID,
                                            controller:
                                                otpVM.otpFiveController.value,
                                            focusNode:
                                                otpVM.otpFiveFocusNode.value,
                                            nextFocusNode:
                                                otpVM.otpSixFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            eID: eID,
                                            controller:
                                                otpVM.otpSixController.value,
                                            focusNode:
                                                otpVM.otpSixFocusNode.value,
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                  SizedBox(
                                    height: Get.height *
                                        Utils.getResponsiveHeight(20),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'did_n’t_receive_the_otp'.tr,
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w400,
                                            fontSize: Get.height *
                                                Utils.getResponsiveSize(14),
                                            color: AppColor.darkGrey),
                                      ),
                                      SizedBox(
                                        width: Get.width *
                                            Utils.getResponsiveWidth(5),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Utils.hideKeyboardGlobally();
                                          resendCodeVM.resendCodeApi(email);
                                          otpVM.clearFields();
                                        },
                                        child: Text(
                                          'resend_code'.tr,
                                          style: TextStyle(
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w500,
                                              fontSize: Get.height *
                                                  Utils.getResponsiveSize(14),
                                              color: AppColor.blue),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height *
                                        Utils.getResponsiveHeight(20),
                                  ),
                                  Spacer(),
                                  VerifyButtonWidget(
                                    formKey: _formKey,
                                    eID: eID,
                                  ),
                                  SizedBox(
                                      height: Get.height *
                                          Utils.getResponsiveHeight(52)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Center(child: CircularProgressIndicator());
            }),
          ),
        ),
      ),
    );
  }
}
