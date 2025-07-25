import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/image_assets.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class TransactionDetailScreen extends StatefulWidget {
  const TransactionDetailScreen({super.key});

  @override
  State<TransactionDetailScreen> createState() =>
      _TransactionDetailScreenState();
}

class _TransactionDetailScreenState extends State<TransactionDetailScreen> {
  final transactionID = Get.arguments['paymentID'] ?? '';
  final transactionTime = Get.arguments['transactionTime'] ?? '';
  final name = Get.arguments['name'] ?? '';
  final transactionType = Get.arguments['transactionType'] ?? '';
  final transactionDate = Get.arguments['transactionDate'] ?? '';
  final amount = Get.arguments['amount'] ?? '';
  final accountNumber = Get.arguments['accountNumber'] ?? '';

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
              height: Utils.getResponsiveHeight(context, 24),
              width: Utils.getResponsiveWidth(context, 24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('transactions'.tr),
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
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveHeight(context, 12)),
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
                      SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(context, 16),
                        ),
                        child: Text(
                          'transaction_details'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Utils.getResponsiveSize(context, 16),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(context, 4)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(context, 16),
                        ),
                        child: Row(
                          children: [
                            Text(
                              transactionID,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textSecondaryColor,
                                fontSize: Utils.getResponsiveSize(context, 12),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Spacer(),
                            Text(
                              transactionTime,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textSecondaryColor,
                                fontSize: Utils.getResponsiveSize(context, 12),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                      Divider(
                        color: Theme.of(context).dividerColor,
                        height: Utils.getResponsiveHeight(context, 1),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                          Utils.getResponsiveHeight(context, 16),
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
                                    'name'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      8,
                                    ),
                                  ),
                                  Text(
                                    name,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      20,
                                    ),
                                  ),
                                  Text(
                                    'transaction_type'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      8,
                                    ),
                                  ),
                                  Text(
                                    transactionType,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      20,
                                    ),
                                  ),
                                  Text(
                                    'transaction_date'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      8,
                                    ),
                                  ),
                                  Text(
                                    transactionDate,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      20,
                                    ),
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
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      8,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color:
                                          Theme.of(
                                            context,
                                          ).extension<AppColors>()?.containerBg,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(
                                          Utils.getResponsiveHeight(context, 8),
                                        ),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: Utils.getResponsiveWidth(
                                          context,
                                          12,
                                        ),
                                        vertical: Utils.getResponsiveHeight(
                                          context,
                                          8,
                                        ),
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
                                            height: Utils.getResponsiveHeight(
                                              context,
                                              18,
                                            ),
                                            width: Utils.getResponsiveWidth(
                                              context,
                                              18,
                                            ),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).iconTheme.color,
                                          ),
                                          SizedBox(
                                            width: Utils.getResponsiveWidth(
                                              context,
                                              8,
                                            ),
                                          ),
                                          Text(
                                            'download_invoice'.tr,
                                            style: TextStyle(
                                              fontSize: Utils.getResponsiveSize(
                                                context,
                                                12,
                                              ),
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
                              width: Utils.getResponsiveWidth(context, 16),
                            ),
                            Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'amount'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      8,
                                    ),
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
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      20,
                                    ),
                                  ),
                                  Text(
                                    'account_number'.tr,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      8,
                                    ),
                                  ),
                                  Text(
                                    accountNumber,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        18,
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
