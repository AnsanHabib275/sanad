import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/recruiter/navigation/analytics/widget/analytics_chart_widget.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

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
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
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
                              'revenue'.tr,
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
                              Theme.of(context).extension<AppColors>()?.cardBg,
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
                                    'cvs_sublimed'.tr,
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
                              Theme.of(context).extension<AppColors>()?.cardBg,
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
                                    'cvs_bought'.tr,
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
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
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
                                  color: Theme.of(context)
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
                                        height: Get.height * Utils.getResponsiveHeight(32),
                                        width: Get.width * Utils.getResponsiveWidth(32),
                                        decoration: BoxDecoration(
                                          color:
                                          Theme.of(context)
                                              .extension<AppColors>()!
                                              .cvSubmittedCountBgColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              Get.height *
                                                  Utils.getResponsiveHeight(
                                                    9999,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        child: Center(
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
                                        height: Get.height * Utils.getResponsiveHeight(32),
                                        width: Get.width * Utils.getResponsiveWidth(32),
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()!
                                                  .cvAcceptedCountBgColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              Get.height *
                                                  Utils.getResponsiveHeight(
                                                    9999,
                                                  ),
                                            ),
                                          ),
                                        ),
                                        child: Center(
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
                SizedBox(height: Get.height * Utils.getResponsiveHeight(35)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
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
                      vertical: Get.height * Utils.getResponsiveHeight(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              ImageAssets.imgDummyProfile,
                              height:
                              Get.height * Utils.getResponsiveHeight(64),
                              width: Get.width * Utils.getResponsiveWidth(64),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(14),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Mohsin Noor ',
                                  style: TextStyle(
                                    color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textPrimaryColor,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w700,
                                    fontSize:
                                    Get.height *
                                        Utils.getResponsiveSize(17),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * Utils.getResponsiveWidth(3),
                                ),
                                Text(
                                  'Top Rated Recruiter',
                                  style: TextStyle(
                                    color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textSecondaryColor,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    fontSize:
                                    Get.height *
                                        Utils.getResponsiveSize(11),
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * Utils.getResponsiveWidth(3),
                                ),
                                RatingBar.builder(
                                  initialRating: 5.0,
                                  minRating: 0.0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  unratedColor: Theme.of(context).iconTheme.color,
                                  glow: true,
                                  glowColor: AppColor.ratedStarColor,
                                  itemCount: 5,
                                  itemSize: Get.height * Utils.getResponsiveSize(13),
                                  itemPadding: EdgeInsets.symmetric(
                                    horizontal:
                                    Get.width * Utils.getResponsiveWidth(3),
                                  ),
                                  itemBuilder:
                                      (context, _) => Image.asset(
                                    IconAssets.icRatingFilled,
                                    // color: AppColor.ratedStarColor,
                                  ),
                                  onRatingUpdate: (rating)
                                  {
                                    // => rateUsVM.rating.value = rating,
                                  }
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * Utils.getResponsiveHeight(10)),
                        Text(
                          'recruiter_comment'.tr,
                          style: TextStyle(
                            color:
                            Theme.of(context)
                                .extension<AppColors>()
                                ?.textSecondaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize:
                            Get.height *
                                Utils.getResponsiveSize(11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
