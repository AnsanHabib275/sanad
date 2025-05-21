import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/image_assets.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/themes/app_themes.dart';
import '../../../utils/utils.dart';

class PaymentDetailScreen extends StatefulWidget {
  const PaymentDetailScreen({super.key});

  @override
  State<PaymentDetailScreen> createState() => _PaymentDetailScreenState();
}

class _PaymentDetailScreenState extends State<PaymentDetailScreen> {
  final paymentID = Get.arguments['paymentID'] ?? '';
  final paymentDate = Get.arguments['paymentDate'] ?? '';
  final amount = Get.arguments['amount'] ?? '';
  final status = Get.arguments['status'] ?? '';
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
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
          title: Text('payment_details'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Get.width * Utils.getResponsiveWidth(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()!.cardBg,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        child: Text(
                          'payment_details'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(16),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(4),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        child: Text(
                          'track_your_payment_details_here'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        height: Get.height * Utils.getResponsiveHeight(1),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          Get.height * Utils.getResponsiveHeight(16),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'payment_id'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(8),
                                  ),
                                  Text(
                                    paymentID,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(20),
                                  ),
                                  Text(
                                    'payment_amount'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(8),
                                  ),
                                  Text(
                                    amount,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(20),
                                  ),
                                  Text(
                                    'invoice'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(8),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(
                                            context,
                                          ).extension<AppColors>()?.buttonBg,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          Get.height *
                                              Utils.getResponsiveHeight(8),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Get.width *
                                            Utils.getResponsiveWidth(12),
                                        vertical:
                                            Get.height *
                                            Utils.getResponsiveHeight(8),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(
                                            ImageAssets.imgDownload,
                                            height:
                                                Get.height *
                                                Utils.getResponsiveHeight(18),
                                            width:
                                                Get.width *
                                                Utils.getResponsiveWidth(18),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).iconTheme.color,
                                          ),
                                          SizedBox(
                                            width:
                                                Get.width *
                                                Utils.getResponsiveWidth(8),
                                          ),
                                          Text(
                                            'download_invoice'.tr,
                                            style: TextStyle(
                                              fontSize:
                                                  Get.height *
                                                  Utils.getResponsiveSize(12),
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w500,
                                              color:
                                                  Theme.of(context)
                                                      .extension<AppColors>()
                                                      ?.buttonText,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(16),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'payment_date'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(8),
                                  ),
                                  Text(
                                    paymentDate,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(20),
                                  ),
                                  Text(
                                    'status'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(8),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          status == 'Expired'
                                              ? AppColor.errorBgColor
                                              : status == 'Hired'
                                              ? AppColor.successBgColor
                                              : AppColor.runningBgColor,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          Get.height *
                                              Utils.getResponsiveHeight(6),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            Get.width *
                                            Utils.getResponsiveWidth(10),
                                        vertical:
                                            Get.height *
                                            Utils.getResponsiveHeight(2),
                                      ),
                                      child: Text(
                                        status,
                                        style: TextStyle(
                                          fontSize:
                                              Get.height *
                                              Utils.getResponsiveSize(12),
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          color:
                                              status == 'Expired'
                                                  ? AppColor.errorTextColor
                                                  : status == 'Hired'
                                                  ? AppColor.successTextColor
                                                  : AppColor.runningTextColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
