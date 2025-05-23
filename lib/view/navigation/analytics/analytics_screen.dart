import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/navigation/analytics/widget/analytics_chart_widget.dart';
import '../../../res/themes/app_themes.dart';
import '../../../utils/utils.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
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
          title: Text('analytics'.tr),
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
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()!.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(8),
                      ),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(16),
                      vertical: Get.height * Utils.getResponsiveHeight(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'wallet'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * Utils.getResponsiveHeight(8),
                            ),
                            Text(
                              'your_wallet'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textBodyColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                              ),
                            ),
                            SizedBox(
                              height: Get.height * Utils.getResponsiveHeight(8),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2,456',
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(20),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'riyal'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(20),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w700,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          ImageAssets.imgRiyalWallet,
                          height: Get.height * Utils.getResponsiveHeight(48),
                          width: Get.width * Utils.getResponsiveWidth(48),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).extension<AppColors>()!.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                Get.width * Utils.getResponsiveWidth(16),
                            vertical:
                                Get.height * Utils.getResponsiveHeight(16),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssets.imgAllJobs,
                                height:
                                    Get.height * Utils.getResponsiveHeight(48),
                                width: Get.width * Utils.getResponsiveWidth(48),
                              ),
                              SizedBox(
                                width: Get.width * Utils.getResponsiveWidth(16),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'all_jobs'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(11),
                                    ),
                                  ),
                                  Text(
                                    '2,456',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(16)),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).extension<AppColors>()!.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                Get.width * Utils.getResponsiveWidth(16),
                            vertical:
                                Get.height * Utils.getResponsiveHeight(16),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                ImageAssets.imgActiveJobs,
                                height:
                                    Get.height * Utils.getResponsiveHeight(48),
                                width: Get.width * Utils.getResponsiveWidth(48),
                              ),
                              SizedBox(
                                width: Get.width * Utils.getResponsiveWidth(16),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'active_jobs'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(11),
                                    ),
                                  ),
                                  Text(
                                    '1590',
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()!.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(8),
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
                          horizontal: Get.width * Utils.getResponsiveWidth(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'application_response'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                              ),
                            ),
                            Spacer(),
                            Image.asset(IconAssets.icRecentTransactions),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(8),
                            ),
                            Text(
                              'accepted'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textBodyColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(32),
                      ),
                      AnalyticsChartWidget(),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(24),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()!
                                          .cvSubmittedCardBgColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Get.height * Utils.getResponsiveHeight(8),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width *
                                        Utils.getResponsiveWidth(26),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()!
                                                  .cvSubmittedCountBgColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              Get.height *
                                                  Utils.getResponsiveHeight(
                                                    100,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Get.width *
                                                Utils.getResponsiveWidth(7),
                                            vertical:
                                                Get.height *
                                                Utils.getResponsiveHeight(9),
                                          ),
                                          child: Text(
                                            '40',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context)
                                                      .extension<AppColors>()
                                                      ?.cvSubmittedCountTextColor,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  Get.height *
                                                  Utils.getResponsiveSize(14),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            Get.height *
                                            Utils.getResponsiveHeight(8),
                                      ),
                                      Text(
                                        'total_cv_submitted'.tr,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()
                                                  ?.cvSubmittedCountTextColor,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              Get.height *
                                              Utils.getResponsiveSize(14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(12),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()!
                                          .cvAcceptedCardBgColor,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Get.height * Utils.getResponsiveHeight(8),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width *
                                        Utils.getResponsiveWidth(26),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()!
                                                  .cvAcceptedCountBgColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              Get.height *
                                                  Utils.getResponsiveHeight(
                                                    100,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Get.width *
                                                Utils.getResponsiveWidth(7),
                                            vertical:
                                                Get.height *
                                                Utils.getResponsiveHeight(9),
                                          ),
                                          child: Text(
                                            '32',
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context)
                                                      .extension<AppColors>()
                                                      ?.cvAcceptedCountTextColor,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  Get.height *
                                                  Utils.getResponsiveSize(14),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            Get.height *
                                            Utils.getResponsiveHeight(8),
                                      ),
                                      Text(
                                        'total_cv_accepted'.tr,
                                        style: TextStyle(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()
                                                  ?.cvAcceptedCountTextColor,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              Get.height *
                                              Utils.getResponsiveSize(14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
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
