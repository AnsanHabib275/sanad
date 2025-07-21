import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/navigation/analytics/widget/analytics_chart_widget.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../res/urls/app_url.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  final userVM = Get.put(UserPreference());

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
              height: Utils.getResponsiveHeight(24),
              width: Utils.getResponsiveWidth(24),
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
            horizontal: Utils.getResponsiveWidth(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Utils.getResponsiveHeight(16)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveHeight(8)),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(16),
                      vertical: Utils.getResponsiveHeight(16),
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
                                fontSize: Utils.getResponsiveSize(14),
                              ),
                            ),
                            SizedBox(height: Utils.getResponsiveHeight(8)),
                            Text(
                              'your_wallet'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textBodyColor,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: Utils.getResponsiveSize(14),
                              ),
                            ),
                            SizedBox(height: Utils.getResponsiveHeight(8)),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '2,456',
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(20),
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
                                      fontSize: Utils.getResponsiveSize(20),
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
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.walletBgColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(Utils.getResponsiveHeight(4)),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Utils.getResponsiveWidth(8),
                              vertical: Utils.getResponsiveHeight(8),
                            ),
                            child: Image.asset(
                              ImageAssets.imgRiyalWallet,
                              height: Utils.getResponsiveHeight(32),
                              width: Utils.getResponsiveWidth(32),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(16)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).extension<AppColors>()?.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Utils.getResponsiveHeight(8)),
                          ),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(16),
                            vertical: Utils.getResponsiveHeight(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.cvSubmittedCardBgColor20Per,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Utils.getResponsiveHeight(4),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(12),
                                    vertical: Utils.getResponsiveHeight(12),
                                  ),
                                  child: Image.asset(
                                    ImageAssets.imgAllJobs,
                                    height: Utils.getResponsiveHeight(24),
                                    width: Utils.getResponsiveWidth(24),
                                  ),
                                ),
                              ),
                              SizedBox(width: Utils.getResponsiveWidth(16)),
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
                                      fontSize: Utils.getResponsiveSize(11),
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
                                      fontSize: Utils.getResponsiveSize(18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Utils.getResponsiveWidth(16)),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).extension<AppColors>()?.cardBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Utils.getResponsiveHeight(8)),
                          ),
                          border: Border.all(
                            color: Theme.of(context).dividerColor,
                            width: 1.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(16),
                            vertical: Utils.getResponsiveHeight(16),
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.cvAcceptedCardBgColor20Per,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Utils.getResponsiveHeight(4),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(12),
                                    vertical: Utils.getResponsiveHeight(12),
                                  ),
                                  child: Image.asset(
                                    ImageAssets.imgActiveJobs,
                                    height: Utils.getResponsiveHeight(24),
                                    width: Utils.getResponsiveWidth(24),
                                  ),
                                ),
                              ),
                              SizedBox(width: Utils.getResponsiveWidth(16)),
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
                                      fontSize: Utils.getResponsiveSize(11),
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
                                      fontSize: Utils.getResponsiveSize(18),
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
                SizedBox(height: Utils.getResponsiveHeight(16)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveHeight(8)),
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
                      SizedBox(height: Utils.getResponsiveHeight(16)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(20),
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
                                fontSize: Utils.getResponsiveSize(16),
                              ),
                            ),
                            Spacer(),
                            Image.asset(IconAssets.icRecentTransactions),
                            SizedBox(width: Utils.getResponsiveWidth(8)),
                            Text(
                              'accepted'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textBodyColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w400,
                                fontSize: Utils.getResponsiveSize(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(32)),
                      AnalyticsChartWidget(),
                      SizedBox(height: Utils.getResponsiveHeight(24)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(16),
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
                                      Utils.getResponsiveHeight(8),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(26),
                                    vertical: Utils.getResponsiveHeight(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: Utils.getResponsiveHeight(32),
                                        width: Utils.getResponsiveWidth(32),
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()!
                                                  .cvSubmittedCountBgColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              Utils.getResponsiveHeight(9999),
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
                                              fontSize: Utils.getResponsiveSize(
                                                14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(8),
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
                                          fontSize: Utils.getResponsiveSize(14),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: Utils.getResponsiveWidth(12)),
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
                                      Utils.getResponsiveHeight(8),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(26),
                                    vertical: Utils.getResponsiveHeight(12),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: Utils.getResponsiveHeight(32),
                                        width: Utils.getResponsiveWidth(32),
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(context)
                                                  .extension<AppColors>()!
                                                  .cvAcceptedCountBgColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              Utils.getResponsiveHeight(9999),
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
                                              fontSize: Utils.getResponsiveSize(
                                                14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(8),
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
                                          fontSize: Utils.getResponsiveSize(14),
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
                      SizedBox(height: Utils.getResponsiveHeight(16)),
                    ],
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(35)),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveHeight(8)),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(16),
                      vertical: Utils.getResponsiveHeight(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: Utils.getResponsiveSize(32),
                              child:
                                  userVM.userImageURL.isEmpty
                                      ? Image.asset(
                                        ImageAssets.imgDummyProfile,
                                        height: Utils.getResponsiveHeight(64),
                                        width: Utils.getResponsiveWidth(64),
                                        fit: BoxFit.cover,
                                      )
                                      : ClipOval(
                                        child: Image.network(
                                          AppUrl.baseUrl +
                                              userVM.userImageURL.value,
                                          height: Utils.getResponsiveHeight(64),
                                          width: Utils.getResponsiveWidth(64),
                                          fit: BoxFit.cover,
                                          loadingBuilder: (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) {
                                            if (loadingProgress == null) {
                                              return child;
                                            }
                                            return Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    loadingProgress
                                                                .expectedTotalBytes !=
                                                            null
                                                        ? loadingProgress
                                                                .cumulativeBytesLoaded /
                                                            (loadingProgress
                                                                    .expectedTotalBytes ??
                                                                1)
                                                        : null,
                                              ),
                                            );
                                          },
                                          errorBuilder: (
                                            context,
                                            error,
                                            stackTrace,
                                          ) {
                                            return Image.asset(
                                              ImageAssets.imgDummyProfile,
                                              height: Utils.getResponsiveHeight(
                                                64,
                                              ),
                                              width: Utils.getResponsiveWidth(
                                                64,
                                              ),
                                              fit: BoxFit.cover,
                                            );
                                          },
                                        ),
                                      ),
                            ),
                            SizedBox(width: Utils.getResponsiveWidth(14)),
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
                                    fontSize: Utils.getResponsiveSize(17),
                                  ),
                                ),
                                SizedBox(width: Utils.getResponsiveWidth(3)),
                                Text(
                                  'Top Rated Recruiter',
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textSecondaryColor,
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    fontSize: Utils.getResponsiveSize(11),
                                  ),
                                ),
                                SizedBox(width: Utils.getResponsiveWidth(3)),
                                RatingBar.builder(
                                  initialRating: 5.0,
                                  minRating: 0.0,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  unratedColor:
                                      Theme.of(context).iconTheme.color,
                                  glow: true,
                                  glowColor: AppColor.ratedStarColor,
                                  itemCount: 5,
                                  itemSize: Utils.getResponsiveSize(13),
                                  itemPadding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(3),
                                  ),
                                  itemBuilder:
                                      (context, _) => Image.asset(
                                        IconAssets.icRatingFilled,
                                        // color: AppColor.ratedStarColor,
                                      ),
                                  onRatingUpdate: (rating) {
                                    // => rateUsVM.rating.value = rating,
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(10)),
                        Text(
                          'recruiter_comment'.tr,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(11),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(24)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
