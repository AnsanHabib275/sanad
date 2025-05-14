import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';

import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/urls/app_url.dart';
import '../../../utils/utils.dart';

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
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text('account'.tr),
          titleTextStyle: TextStyle(
            color: AppColor.textPrimaryColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            fontSize: Get.height * Utils.getResponsiveSize(24),
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColor.searchBarBorderColor,
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
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(4),
                      ),
                    ),
                    border: Border.all(
                      color: AppColor.searchBarBorderColor,
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
                      color: AppColor.textPrimaryColor,
                    ),
                    subtitle: Text(
                      // userVM.userEmail.value,
                      'mohsinnoor@gmail.com',
                    ),
                    subtitleTextStyle: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color: AppColor.textBodyColor,
                    ),
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'account'.tr,
                  style: TextStyle(
                    color: AppColor.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(8),
                      ),
                    ),
                    border: Border.all(
                      color: AppColor.searchBarBorderColor,
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
                        ),
                        title: Text('profile'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
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
                        ),
                        title: Text('my_jobs'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.myJobsScreen);
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
                        ),
                        title: Text('notifications'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
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
                        ),
                        title: Text('analytics'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Text(
                  'payments'.tr,
                  style: TextStyle(
                    color: AppColor.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(8),
                      ),
                    ),
                    border: Border.all(
                      color: AppColor.searchBarBorderColor,
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
                        ),
                        title: Text('wallet'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: () {
                          Get.toNamed(RoutesName.walletScreen);
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
                        ),
                        title: Text('transactions'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
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
                        ),
                        title: Text('payments_method'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
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
                    color: AppColor.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(8),
                      ),
                    ),
                    border: Border.all(
                      color: AppColor.searchBarBorderColor,
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
                          IconAssets.icRateUs,
                          height: Get.height * Utils.getResponsiveHeight(24),
                          width: Get.width * Utils.getResponsiveWidth(24),
                        ),
                        title: Text('rate_us'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
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
                        ),
                        title: Text('about'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
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
                        ),
                        title: Text('help'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
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
                        ),
                        title: Text('sign_out'.tr),
                        titleTextStyle: TextStyle(
                          color: AppColor.textBodyColor,
                          fontSize: Get.height * Utils.getResponsiveSize(16),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
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
}
