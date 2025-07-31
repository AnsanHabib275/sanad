import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/view/navigation/wallet/widget/deposit_now_button_widget.dart';
import 'package:sanad/view/navigation/wallet/widget/view_all_button_widget.dart';
import 'package:sanad/view/navigation/wallet/widget/wallet_cart_widget.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../models/wallet/wallet_model.dart';
import '../../../res/assets/image_assets.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final List<WalletModel> walletItems = [
    WalletModel(1, 'P-ID-001', '\$2300', 'Card'),
    WalletModel(2, 'P-ID-002', '-\$670', 'Wallet'),
    WalletModel(3, 'P-ID-003', '\$234', 'Wallet'),
    WalletModel(4, 'P-ID-004', '\$5000', 'Card'),
  ];

  late bool isEmpty = false;
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Container(
                  height: Utils.getResponsiveHeight(context, 90),
                  width: double.infinity,
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(context, 16),
                      vertical: Utils.getResponsiveHeight(context, 10),
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
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize: Utils.getResponsiveSize(context, 14),
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: '100',
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        20,
                                      ),
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
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        20,
                                      ),
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
                        DepositNowButtonWidget(),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEmpty = true;
                          });
                        },
                        child: Container(
                          height: Utils.getResponsiveHeight(context, 80),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.cardBg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Utils.getResponsiveSize(context, 8),
                              ),
                            ),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
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
                                  fontSize: Utils.getResponsiveSize(
                                    context,
                                    14,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '50',
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(
                                          context,
                                          18,
                                        ),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Theme.of(context)
                                                .extension<AppColors>()
                                                ?.textPrimaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'riyal'.tr,
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(
                                          context,
                                          18,
                                        ),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
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
                        ),
                      ),
                    ),
                    SizedBox(width: Utils.getResponsiveWidth(context, 14)),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isEmpty = false;
                          });
                        },
                        child: Container(
                          height: Utils.getResponsiveHeight(context, 80),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.cardBg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Utils.getResponsiveSize(context, 8),
                              ),
                            ),
                            border: Border.all(
                              color: Theme.of(context).dividerColor,
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
                                  fontSize: Utils.getResponsiveSize(
                                    context,
                                    14,
                                  ),
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '0',
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(
                                          context,
                                          18,
                                        ),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
                                        color:
                                            Theme.of(context)
                                                .extension<AppColors>()
                                                ?.textPrimaryColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'riyal'.tr,
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(
                                          context,
                                          18,
                                        ),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w600,
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
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                Container(
                  width: double.infinity,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(context, 16),
                          vertical: Utils.getResponsiveHeight(context, 16),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'recent_transactions'.tr,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                                fontSize: Utils.getResponsiveSize(context, 16),
                              ),
                            ),
                            Spacer(),
                            Image.asset(IconAssets.icRecentTransactions),
                          ],
                        ),
                      ),
                      // Obx(() {
                      //   if (transactionsItems.isNotEmpty) {
                      //     return
                      // transactionsItems.isNotEmpty
                      //     ? Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      !isEmpty
                          ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: Utils.getResponsiveHeight(context, 50),
                                width: double.infinity,
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.containerBg,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        97,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Utils.getResponsiveWidth(
                                                  context,
                                                  5,
                                                ),
                                            vertical: Utils.getResponsiveHeight(
                                              context,
                                              16,
                                            ),
                                          ),
                                          child: Text(
                                            'transaction_id'.tr,
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context)
                                                      .extension<AppColors>()
                                                      ?.textBodyColor,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w600,
                                              fontSize: Utils.getResponsiveSize(
                                                context,
                                                12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        97,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Utils.getResponsiveWidth(
                                                  context,
                                                  5,
                                                ),
                                            vertical: Utils.getResponsiveHeight(
                                              context,
                                              16,
                                            ),
                                          ),
                                          child: Text(
                                            'amount'.tr,
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context)
                                                      .extension<AppColors>()
                                                      ?.textBodyColor,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w600,
                                              fontSize: Utils.getResponsiveSize(
                                                context,
                                                12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        127,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Utils.getResponsiveWidth(
                                                  context,
                                                  5,
                                                ),
                                            vertical: Utils.getResponsiveHeight(
                                              context,
                                              16,
                                            ),
                                          ),
                                          child: Text(
                                            'transaction_method'.tr,
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context)
                                                      .extension<AppColors>()
                                                      ?.textBodyColor,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w600,
                                              fontSize: Utils.getResponsiveSize(
                                                context,
                                                12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        74,
                                      ),
                                      child: Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Utils.getResponsiveWidth(
                                                  context,
                                                  5,
                                                ),
                                            vertical: Utils.getResponsiveHeight(
                                              context,
                                              16,
                                            ),
                                          ),
                                          child: Text(
                                            'action'.tr,
                                            style: TextStyle(
                                              color:
                                                  Theme.of(context)
                                                      .extension<AppColors>()
                                                      ?.textBodyColor,
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w600,
                                              fontSize: Utils.getResponsiveSize(
                                                context,
                                                12,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.zero,
                                itemCount: walletItems.length,
                                itemBuilder: (context, index) {
                                  return WalletCartWidget(
                                    wallet: walletItems[index],
                                  );
                                },
                              ),
                            ],
                          )
                          : Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: Utils.getResponsiveHeight(
                                  context,
                                  150,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageAssets.imgEmptyTransactions,
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      60,
                                    ),
                                    width: Utils.getResponsiveWidth(
                                      context,
                                      47,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      18,
                                    ),
                                  ),
                                  Text(
                                    'empty_transactions'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      // ;
                      //                     }),
                    ],
                  ),
                ),
                !isEmpty
                    ? Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Utils.getResponsiveHeight(context, 16),
                      ),
                      child: ViewAllButtonWidget(),
                    )
                    : SizedBox.shrink(),
                SizedBox(
                  height:
                      Platform.isIOS
                          ? Utils.getResponsiveHeight(context, 35)
                          : Utils.getResponsiveHeight(context, 15),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
