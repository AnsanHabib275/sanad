import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/view/navigation/account/widget/no_button_widget.dart'
    show NoButtonWidget;
import 'package:sanad/view/navigation/account/widget/theme_toggle_widget.dart';
import 'package:sanad/view/navigation/account/widget/yes_button_widget.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';

import '../../../res/assets/image_assets.dart';
import '../../../res/themes/app_themes.dart';
import '../../../res/urls/app_url.dart';
import '../../../utils/utils.dart';
import '../navigation_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  final userVM = Get.put(UserPreference());
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
            horizontal: Get.width * Utils.getResponsiveWidth(16),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  height: Get.height * Utils.getResponsiveHeight(82),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()!.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(4),
                      ),
                    ),
                    border: Border.all(
                      color: Theme.of(context).dividerColor,
                      width: 1.0,
                    ),
                  ),
                  child: ListTile(
                    horizontalTitleGap:
                        Get.width * Utils.getResponsiveWidth(16),
                    leading: CircleAvatar(
                      radius: Get.height * Utils.getResponsiveSize(24),
                      child:
                          userVM.userImageURL.isEmpty
                              ? Image.asset(
                                ImageAssets.imgDummyProfile,
                                height:
                                    Get.height * Utils.getResponsiveHeight(48),
                                width: Get.width * Utils.getResponsiveWidth(48),
                                fit: BoxFit.cover,
                              )
                              : ClipOval(
                                child: Image.network(
                                  AppUrl.baseUrl + userVM.userImageURL.value,
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(48),
                                  width:
                                      Get.width * Utils.getResponsiveWidth(48),
                                  fit: BoxFit.cover,
                                ),
                              ),
                    ),
                    title: Text(
                      // userVM.userFullName.value,
                      'Mohsin Noor',
                    ),
                    titleTextStyle: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(20),
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
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textBodyColor,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'account'.tr,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icProfile,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('profile'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.profileScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icMyJob,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('my_jobs'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.offAll(() => NavigationScreen(initialIndex: 1));
                          // Get.toNamed(RoutesName.myJobsScreen);
                        },
                      ),

                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icNotifications,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('notifications'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.notificationScreen);
                        },
                      ),

                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icAnalytics,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('analytics'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
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
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'payments'.tr,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icWallet,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('wallet'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.offAll(() => NavigationScreen(initialIndex: 2));
                        },
                      ),
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icTransactions,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('transactions'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.transactionsScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icPayment,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('payments_method'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.paymentsScreen);
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'settings'.tr,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ThemeToggleWidget(),
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icRateUs,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('rate_us'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.rateUsScreen);
                        },
                      ),

                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icAbout,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('about'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.aboutScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icHelp,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('help'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.helpScreen);
                        },
                      ),
                      ListTile(
                        minTileHeight:
                            Get.height * Utils.getResponsiveHeight(48),
                        horizontalTitleGap:
                            Get.width * Utils.getResponsiveWidth(6),
                        leading: Image.asset(
                          IconAssets.icSignOut,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                          color: Theme.of(context).iconTheme.color,
                        ),
                        title: Text('sign_out'.tr),
                        titleTextStyle: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
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
                SizedBox(height: Get.height * Utils.getResponsiveHeight(120)),
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
          elevation: 4,
          backgroundColor: Theme.of(context).extension<AppColors>()!.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Get.height * Utils.getResponsiveSize(12),
            ),
          ),
          child: SizedBox(
            height: Get.height * Utils.getResponsiveHeight(250),
            width: Get.width * Utils.getResponsiveWidth(400),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(20),
                vertical: Get.height * Utils.getResponsiveHeight(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: Get.height * Utils.getResponsiveHeight(61),
                    width: Get.width * Utils.getResponsiveWidth(61),
                    ImageAssets.imgSignOut,
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(13)),
                  Text(
                    'sign_out_dash'.tr,
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
                  FittedBox(
                    child: Text(
                      'confirm_sign_out'.tr,
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
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: YesButtonWidget()),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(12)),
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
