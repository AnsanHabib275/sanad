import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/withdrawFundsVerification/widget/input_otp_widget.dart';
import 'package:sanad/viewModels/controller/vithdrawFundsVerification/withdraw_funds_verification_view_model.dart';

import '../../../../res/themes/app_themes.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/assets/image_assets.dart';
import '../withdrawFundsVerification/widget/verify_withdraw_button_widget.dart';

class WithdrawFundsVerificationScreen extends StatefulWidget {
  const WithdrawFundsVerificationScreen({super.key});

  @override
  State<WithdrawFundsVerificationScreen> createState() =>
      _WithdrawFundsVerificationScreenState();
}

class _WithdrawFundsVerificationScreenState
    extends State<WithdrawFundsVerificationScreen> {
  final wfvVM = Get.put(WithdrawFundsVerificationViewModel());
  final _formKey = GlobalKey<FormState>();
  // final from = Get.arguments['from'] ?? '';
  // final accountId = Get.arguments['Accountid'] ?? '';
  // final mobileNumber = Get.arguments['MobileNumber'] ?? '';

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
            title: Text('withdraw_funds'.tr),
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
            if (!wfvVM.resendCodeLoading.value) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.getResponsiveWidth(context, 16),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height:
                            MediaQuery.of(context).padding.top +
                            Utils.getResponsiveHeight(context, 100),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).extension<AppColors>()?.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Utils.getResponsiveHeight(context, 8),
                            ),
                          ),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(context, 16),
                            vertical: Utils.getResponsiveHeight(context, 48),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset(
                                ImageAssets.imgWithdrawFundsVerification,
                                height: Utils.getResponsiveHeight(context, 92),
                                width: Utils.getResponsiveWidth(context, 92),
                              ),
                              SizedBox(
                                height: Utils.getResponsiveHeight(context, 32),
                              ),
                              Text(
                                'verification'.tr,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                  fontSize: Utils.getResponsiveSize(
                                    context,
                                    24,
                                  ),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(
                                height: Utils.getResponsiveHeight(context, 12),
                              ),
                              Text(
                                'enter_the_4_digit_code_to_process_your_withdraw'
                                    .tr,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textSecondaryColor,
                                  fontSize: Utils.getResponsiveSize(
                                    context,
                                    14,
                                  ),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: Utils.getResponsiveHeight(context, 32),
                              ),
                              Obx(() {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        56,
                                      ),
                                      height: Utils.getResponsiveHeight(
                                        context,
                                        56,
                                      ),
                                      child: InputOTPWidget(
                                        controller:
                                            wfvVM.otpOneController.value,
                                        focusNode: wfvVM.otpOneFocusNode.value,
                                        nextFocusNode:
                                            wfvVM.otpTwoFocusNode.value,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        56,
                                      ),
                                      height: Utils.getResponsiveHeight(
                                        context,
                                        56,
                                      ),
                                      child: InputOTPWidget(
                                        controller:
                                            wfvVM.otpTwoController.value,
                                        focusNode: wfvVM.otpTwoFocusNode.value,
                                        nextFocusNode:
                                            wfvVM.otpThreeFocusNode.value,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        56,
                                      ),
                                      height: Utils.getResponsiveHeight(
                                        context,
                                        56,
                                      ),
                                      child: InputOTPWidget(
                                        controller:
                                            wfvVM.otpThreeController.value,
                                        focusNode:
                                            wfvVM.otpThreeFocusNode.value,
                                        nextFocusNode:
                                            wfvVM.otpFourFocusNode.value,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        56,
                                      ),
                                      height: Utils.getResponsiveHeight(
                                        context,
                                        56,
                                      ),
                                      child: InputOTPWidget(
                                        controller:
                                            wfvVM.otpFourController.value,
                                        focusNode: wfvVM.otpFourFocusNode.value,
                                      ),
                                    ),
                                  ],
                                );
                              }),
                              SizedBox(
                                height: Utils.getResponsiveHeight(context, 32),
                              ),
                              Text(
                                'i_didn_t_receive_the_code'.tr,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                  fontSize: Utils.getResponsiveSize(
                                    context,
                                    16,
                                  ),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: Utils.getResponsiveHeight(context, 12),
                              ),
                              InkWell(
                                onTap: () {
                                  wfvVM.resendCodeApi('accountId');
                                  wfvVM.clearFields();
                                },
                                child: Text(
                                  'resend_code'.tr,
                                  style: TextStyle(
                                    color: AppColor.primaryColor,
                                    fontSize: Utils.getResponsiveSize(
                                      context,
                                      16,
                                    ),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(context, 46)),
                      VerifyWithdrawButtonWidget(formKey: _formKey),
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
