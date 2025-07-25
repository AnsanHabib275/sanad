import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/components/round_button.dart';
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
              Utils.getResponsiveSize(context, 12),
            ),
          ),
          child: SizedBox(
            width: Utils.getResponsiveWidth(context, 400),
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Utils.getResponsiveHeight(context, 24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    height: Utils.getResponsiveHeight(context, 92),
                    width: Utils.getResponsiveWidth(context, 92),
                    ImageAssets.imgSuccessLarge,
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 20)),
                  Text(
                    'great_with_exclamation'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 16),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color: AppColor.primaryColor,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 8)),
                  Text(
                    'withdraw_success'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 18),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 8)),
                  Text(
                    'below_is_your_withdraw_summary'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 14),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textBodyColor,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 32)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Image.asset(
                        ImageAssets.imgHalfRound,
                        height: Utils.getResponsiveHeight(context, 25),
                        width: Utils.getResponsiveWidth(context, 15),
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.halfRoundCircleColor,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(context, 10),
                          ),
                          child: Image.asset(
                            ImageAssets.imgDottedLine,
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.halfRoundCircleColor,
                          ),
                        ),
                      ),
                      Transform.rotate(
                        angle: 180 * pi / 180,
                        child: Image.asset(
                          ImageAssets.imgHalfRound,
                          height: Utils.getResponsiveHeight(context, 25),
                          width: Utils.getResponsiveWidth(context, 15),
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.halfRoundCircleColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 32)),
                  Text(
                    'withdraw_destination'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 18),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 8)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(context, 24),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).extension<AppColors>()?.cardBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            Utils.getResponsiveHeight(context, 12),
                          ),
                        ),
                        border: Border.all(
                          color: Theme.of(context).dividerColor,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: Utils.getResponsiveHeight(context, 16),
                          horizontal: Utils.getResponsiveWidth(context, 16),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(ImageAssets.imgMasterCard),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 10),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Master Card',
                                  style: TextStyle(
                                    fontSize: Utils.getResponsiveSize(
                                      context,
                                      16,
                                    ),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(
                                          context,
                                        ).extension<AppColors>()?.textBodyColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Utils.getResponsiveHeight(context, 2),
                                ),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'XXXX XXXX XXXX ',
                                        style: TextStyle(
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            12,
                                          ),
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
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            12,
                                          ),
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
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            12,
                                          ),
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
                                          fontSize: Utils.getResponsiveSize(
                                            context,
                                            12,
                                          ),
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
                              child: Image.asset(
                                IconAssets.icEdit,
                                height: Utils.getResponsiveHeight(context, 20),
                                width: Utils.getResponsiveWidth(context, 20),
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 8),
                            ),
                            InkWell(
                              onTap: () {
                                // Get.toNamed(RoutesName.applyJobScreen);
                              },
                              child: Image.asset(
                                IconAssets.icDelete,
                                height: Utils.getResponsiveHeight(context, 20),
                                width: Utils.getResponsiveWidth(context, 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 32)),
                  Text(
                    'total_withdraw'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        ImageAssets.saudiRiyalSymbol,
                        height: Utils.getResponsiveHeight(context, 24),
                        width: Utils.getResponsiveWidth(context, 26),
                        color: Theme.of(context).iconTheme.color,
                      ),
                      SizedBox(width: Utils.getResponsiveWidth(context, 12)),
                      Text(
                        '20.00',
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w700,
                          fontSize: Utils.getResponsiveSize(context, 30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
