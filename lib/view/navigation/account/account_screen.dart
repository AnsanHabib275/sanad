import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/view/navigation/account/widget/no_button_widget.dart';
import 'package:sanad/view/navigation/account/widget/theme_toggle_widget.dart';
import 'package:sanad/view/navigation/account/widget/yes_button_widget.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../res/urls/app_url.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/services/theme_service.dart';
import '../navigation_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final userVM = Get.put(UserPreference());
  final themeService = Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('account'.tr),
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
            horizontal: Utils.getResponsiveWidth(context, 16),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Container(
                  height: Utils.getResponsiveHeight(context, 82),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveSize(context, 4)),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: ListTile(
                    horizontalTitleGap: Utils.getResponsiveWidth(context, 16),
                    leading: CircleAvatar(
                      radius: Utils.getResponsiveSize(context, 24),
                      child:
                          userVM.userImageURL.isEmpty
                              ? Image.asset(
                                ImageAssets.imgDummyProfile,
                                height: Utils.getResponsiveHeight(context, 48),
                                width: Utils.getResponsiveWidth(context, 48),
                                fit: BoxFit.cover,
                              )
                              : ClipOval(
                                child: Image.network(
                                  AppUrl.baseUrl + userVM.userImageURL.value,
                                  height: Utils.getResponsiveHeight(
                                    context,
                                    48,
                                  ),
                                  width: Utils.getResponsiveWidth(context, 48),
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
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset(
                                      ImageAssets.imgDummyPicture,
                                      height: Utils.getResponsiveHeight(
                                        context,
                                        48,
                                      ),
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        48,
                                      ),
                                      fit: BoxFit.cover,
                                    );
                                  },
                                ),
                              ),
                    ),
                    title: Text(
                      // userVM.userFullName.value,
                      'Mohsin Noor',
                    ),
                    titleTextStyle: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 20),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                    subtitle: Text(
                      // userVM.userEmail.value,
                      'mohsinnoor@gmail.com',
                    ),
                    subtitleTextStyle: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textBodyColor,
                    ),
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Text(
                  'account'.tr,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Utils.getResponsiveSize(context, 18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveSize(context, 8)),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icProfile,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('profile'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.profileScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icMyJob,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('my_jobs'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.offAll(() => NavigationScreen(initialIndex: 1));
                          // Get.toNamed(RoutesName.myJobsScreen);
                        },
                      ),

                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icNotifications,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('notifications'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.notificationScreen);
                        },
                      ),

                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icAnalytics,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('analytics'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.analyticsScreen);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Text(
                  'payments'.tr,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Utils.getResponsiveSize(context, 18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveSize(context, 8)),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icWallet,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('wallet'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.offAll(() => NavigationScreen(initialIndex: 2));
                        },
                      ),
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icCard,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('payments'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.paymentsScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icTransactions,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('transactions'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.transactionsScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icPayment,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('payment_method'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.paymentMethodScreen);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Text(
                  'settings'.tr,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Utils.getResponsiveSize(context, 18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveHeight(context, 8)),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThemeToggleWidget(),
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icRateUs,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('rate_us'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.rateUsScreen);
                        },
                      ),

                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icAbout,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('about'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.aboutScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icHelp,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('help'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.helpScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight: Utils.getResponsiveHeight(context, 48),
                        horizontalTitleGap: Utils.getResponsiveWidth(
                          context,
                          6,
                        ),
                        leading: Image.asset(
                          IconAssets.icSignOut,
                          height: Utils.getResponsiveHeight(context, 24),
                          width: Utils.getResponsiveWidth(context, 24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('sign_out'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Utils.getResponsiveSize(context, 16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          showLogoutDialog();
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 26)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLogoutDialog() {
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
              padding: EdgeInsets.only(
                left: Utils.getResponsiveWidth(context, 20),
                right: Utils.getResponsiveWidth(context, 20),
                top: Utils.getResponsiveHeight(context, 20),
                bottom:
                    Platform.isIOS
                        ? Utils.getResponsiveHeight(context, 40)
                        : Utils.getResponsiveHeight(context, 20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    height: Utils.getResponsiveHeight(context, 61),
                    width: Utils.getResponsiveWidth(context, 61),
                    ImageAssets.imgSignOut,
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 13)),
                  Text(
                    'sign_out_dash'.tr,
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
                    'confirm_sign_out'.tr,
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: YesButtonWidget()),
                      SizedBox(width: Utils.getResponsiveWidth(context, 12)),
                      Expanded(child: NoButtonWidget()),
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
