import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/verifyEmail/widget/input_otp_widget.dart';
import 'package:sanad/view/verifyEmail/widget/verify_button_widget.dart';
import 'package:sanad/viewModels/controller/verifyEmail/verify_email_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../res/assets/icon_assets.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key});

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final verifyEmailVM = Get.put(VerifyEmailViewModel());
  final _formKey = GlobalKey<FormState>();
  final accountId = Get.arguments['Accountid'] ?? '';

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
              'email_verification'.tr,
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
              if (!verifyEmailVM.loading.value) {
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
                                            controller: verifyEmailVM
                                                .otpOneController.value,
                                            focusNode: verifyEmailVM
                                                .otpOneFocusNode.value,
                                            nextFocusNode: verifyEmailVM
                                                .otpTwoFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            controller: verifyEmailVM
                                                .otpTwoController.value,
                                            focusNode: verifyEmailVM
                                                .otpTwoFocusNode.value,
                                            nextFocusNode: verifyEmailVM
                                                .otpThreeFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            controller: verifyEmailVM
                                                .otpThreeController.value,
                                            focusNode: verifyEmailVM
                                                .otpThreeFocusNode.value,
                                            nextFocusNode: verifyEmailVM
                                                .otpFourFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            controller: verifyEmailVM
                                                .otpFourController.value,
                                            focusNode: verifyEmailVM
                                                .otpFourFocusNode.value,
                                            nextFocusNode: verifyEmailVM
                                                .otpFiveFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            controller: verifyEmailVM
                                                .otpFiveController.value,
                                            focusNode: verifyEmailVM
                                                .otpFiveFocusNode.value,
                                            nextFocusNode: verifyEmailVM
                                                .otpSixFocusNode.value,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width *
                                              Utils.getResponsiveWidth(48),
                                          height: Get.height *
                                              Utils.getResponsiveHeight(48),
                                          child: InputOTPWidget(
                                            controller: verifyEmailVM
                                                .otpSixController.value,
                                            focusNode: verifyEmailVM
                                                .otpSixFocusNode.value,
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
                                          verifyEmailVM
                                              .resendCodeApi(accountId);
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
                                  VerifyButtonWidget(formKey: _formKey),
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
