import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/viewModels/controller/otp/otp_view_model.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class VerifyWithdrawButtonWidget extends StatelessWidget {
  VerifyWithdrawButtonWidget({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;
  final otpVM = Get.put(OTPViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RoundButton(
        title: 'verify_withdraw'.tr,
        loading: otpVM.loading.value,
        onPress: () {
          Utils.hideKeyboardGlobally();
          showSuccessWithdrawDialog(context);
          // Get.toNamed(RoutesName.agencySignUpFillDetailsScreen);
          // if (otpVM.isOtpFilled.value) {
          //   otpVM.otpApi(eID);
          // }
        },
      );
    });
  }
  void showSuccessWithdrawDialog(BuildContext context) {
    Get.dialog(
      MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(1.0)),
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Theme.of(context).extension<AppColors>()?.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Get.height * Utils.getResponsiveSize(12),
            ),
          ),
          child: SizedBox(
            width: Get.width * Utils.getResponsiveWidth(400),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.height * Utils.getResponsiveHeight(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    height: Get.height * Utils.getResponsiveHeight(92),
                    width: Get.width * Utils.getResponsiveWidth(92),
                    ImageAssets.imgSuccessFull,
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(20)),
                  Text(
                    'great_with_exclamation'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(16),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color:
                      AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                  Text(
                      'withdraw_success'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(18),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                      ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                  Text(
                    'below_is_your_withdraw_summary'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textBodyColor,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(32)),
                  Image.asset(ImageAssets.imgDottedLine),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(32)),
                  Text(
                    'withdraw_destination'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(18),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(24),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<AppColors>()?.cardBg,
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      Get.height * Utils.getResponsiveHeight(12),
                    ),
                  ),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height * Utils.getResponsiveHeight(16),
                    horizontal: Get.width * Utils.getResponsiveWidth(16),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImageAssets.imgMasterCard),
                          SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Master Card',
                                style: TextStyle(
                                  fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  color:
                                  Theme.of(context)
                                      .extension<AppColors>()
                                      ?.textBodyColor,
                                ),
                              ),
                              SizedBox(height: Get.height * Utils.getResponsiveHeight(2)),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'XXXX XXXX XXXX ',
                                      style: TextStyle(
                                        fontSize:
                                        Get.height * Utils.getResponsiveSize(12),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textSecondaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '2107',
                                      style: TextStyle(
                                        fontSize:
                                        Get.height * Utils.getResponsiveSize(12),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textSecondaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' | Expiry ',
                                      style: TextStyle(
                                        fontSize:
                                        Get.height * Utils.getResponsiveSize(12),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textSecondaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '10/26',
                                      style: TextStyle(
                                        fontSize:
                                        Get.height * Utils.getResponsiveSize(12),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textSecondaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            onTap: () {
                              // Get.toNamed(RoutesName.applyJobScreen);
                            },
                            child: Image.asset(IconAssets.icEdit,
                              height: Get.height * Utils.getResponsiveHeight(20),
                            width: Get.width * Utils.getResponsiveWidth(20),
                          ),
                          ),
                          SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                          InkWell(
                            onTap: () {
                              // Get.toNamed(RoutesName.applyJobScreen);
                            },
                            child: Image.asset(
                              IconAssets.icDelete,
                              height: Get.height * Utils.getResponsiveHeight(20),
                              width: Get.width * Utils.getResponsiveWidth(20),
                            ),
                          ),
                        ],
                      ),
                ),
              ),
            ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(32)),
                  Text(
                    'total_withdraw'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.saudiRiyalSymbol,
                        height:
                        Get.height * Utils.getResponsiveHeight(24),
                        width: Get.width * Utils.getResponsiveWidth(26),
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(12),),
                      Text(
                        '20.00',
                        style: TextStyle(
                          color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          fontSize:
                          Get.height * Utils.getResponsiveSize(30),
                        ),
                      ),
                    ],),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
