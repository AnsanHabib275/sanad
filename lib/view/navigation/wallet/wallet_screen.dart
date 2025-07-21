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
    // TransactionsModel(5, 'P-ID-005', '\$2300', 'Wallet'),
    // TransactionsModel(6, 'P-ID-006', '\$560', 'Card'),
  ];
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
            horizontal: Utils.getResponsiveWidth(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: Utils.getResponsiveHeight(16)),
              Container(
                height: Utils.getResponsiveHeight(90),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).extension<AppColors>()?.cardBg,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Utils.getResponsiveSize(8)),
                  ),
                  border: Border.all(
                    color: Theme.of(context).dividerColor,
                    width: 1.0,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.getResponsiveWidth(16),
                    vertical: Utils.getResponsiveHeight(10),
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
                      DepositNowButtonWidget(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Utils.getResponsiveHeight(16)),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: Utils.getResponsiveHeight(80),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).extension<AppColors>()?.cardBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Utils.getResponsiveSize(8)),
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
                              fontSize: Utils.getResponsiveSize(14),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '0',
                                  style: TextStyle(
                                    fontSize: Utils.getResponsiveSize(18),
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
                                    fontSize: Utils.getResponsiveSize(18),
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
                  SizedBox(width: Utils.getResponsiveWidth(14)),
                  Expanded(
                    child: Container(
                      height: Utils.getResponsiveHeight(80),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).extension<AppColors>()?.cardBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Utils.getResponsiveSize(8)),
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
                              fontSize: Utils.getResponsiveSize(14),
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '0',
                                  style: TextStyle(
                                    fontSize: Utils.getResponsiveSize(18),
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
                                    fontSize: Utils.getResponsiveSize(18),
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
                ],
              ),
              SizedBox(height: Utils.getResponsiveHeight(16)),
              Flexible(
                child: Container(
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
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(16),
                          vertical: Utils.getResponsiveHeight(16),
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
                                fontSize: Utils.getResponsiveSize(16),
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
                      Container(
                        height: Utils.getResponsiveHeight(50),
                        width: double.infinity,
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.containerBg,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Utils.getResponsiveWidth(97),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(5),
                                    vertical: Utils.getResponsiveHeight(16),
                                  ),
                                  child: Text(
                                    'payment_id'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize: Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(97),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(5),
                                    vertical: Utils.getResponsiveHeight(16),
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
                                      fontSize: Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(127),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(5),
                                    vertical: Utils.getResponsiveHeight(16),
                                  ),
                                  child: Text(
                                    'payment_method'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                      fontSize: Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Utils.getResponsiveWidth(74),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(5),
                                    vertical: Utils.getResponsiveHeight(16),
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
                                      fontSize: Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Flexible(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: walletItems.length,
                          itemBuilder: (context, index) {
                            return WalletCartWidget(wallet: walletItems[index]);
                          },
                        ),
                      ),

                      //   ],
                      // )

                      // ;
                      //                       }
                      //                       return
                      // : Expanded(
                      //   child: Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       Image.asset(
                      //         ImageAssets.imgEmptyTransactions,
                      //         height:
                      //
                      //             Utils.getResponsiveHeight(60),
                      //         width:
                      //
                      //             Utils.getResponsiveWidth(47),
                      //       ),
                      //       SizedBox(
                      //         height:
                      //
                      //             Utils.getResponsiveHeight(18),
                      //       ),
                      //       Text(
                      //         'empty_transactions'.tr,
                      //         style: TextStyle(
                      //           color:
                      //               Theme.of(context)
                      //                   .extension<AppColors>()
                      //                   ?.textBodyColor,
                      //           fontFamily: 'Manrope',
                      //           fontWeight: FontWeight.w400,
                      //           fontSize:
                      //
                      //               Utils.getResponsiveSize(14),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // ;
                      //                     }),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Utils.getResponsiveHeight(16),
                ),
                child: ViewAllButtonWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
