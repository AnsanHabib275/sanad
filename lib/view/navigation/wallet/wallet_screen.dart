import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/navigation/wallet/widget/deposit_now_button_widget.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
          title: Text('wallet'.tr),
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
                  height: Get.height * Utils.getResponsiveHeight(90),
                  width: double.infinity,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(16),
                      vertical: Get.height * Utils.getResponsiveHeight(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'total_balance'.tr,
                              style: TextStyle(
                                color: AppColor.textPrimaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
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
                                      color: AppColor.textPrimaryColor,
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
                                      color: AppColor.textPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        DepositNowButtonWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: Get.height * Utils.getResponsiveHeight(80),
                        width: double.infinity,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'deposits'.tr,
                              style: TextStyle(
                                color: AppColor.primaryButtonColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '0',
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.textPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'riyal'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.textPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(14)),
                    Expanded(
                      child: Container(
                        height: Get.height * Utils.getResponsiveHeight(80),
                        width: double.infinity,
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'refunds'.tr,
                              style: TextStyle(
                                color: AppColor.primaryButtonColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '0',
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.textPrimaryColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'riyal'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.textPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Container(
                  height: Get.height * Utils.getResponsiveHeight(461),
                  width: double.infinity,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(20),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Row(
                          children: [
                            Text(
                              'recent_transactions'.tr,
                              style: TextStyle(
                                color: AppColor.textPrimaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(16),
                              ),
                            ),
                            Spacer(),
                            Image.asset(IconAssets.icRecentTransactions),
                          ],
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                ImageAssets.imgEmptyTransactions,
                                height:
                                    Get.height * Utils.getResponsiveHeight(60),
                                width: Get.width * Utils.getResponsiveWidth(47),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(18),
                              ),
                              Text(
                                'empty_transactions'.tr,
                                style: TextStyle(
                                  color: AppColor.textPrimaryColor,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
