import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/transactions/transactions_model.dart';
import 'package:sanad/view/navigation/transactions/widget/input_search_widget.dart';
import 'package:sanad/view/navigation/transactions/widget/transactions_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/transactions/transactions_view_model.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final transactionsVM = Get.put(TransactionsViewModel());
  final List<TransactionsModel> transactionsItems = [
    TransactionsModel(
      1,
      'P-ID-001',
      '\$2300',
      'Card',
      '02:46 PM',
      'Emma Caldwell',
      'Bank Transfer',
      'Dec 12, 2024',
      '2567379800',
    ),
    TransactionsModel(
      2,
      'P-ID-002',
      '-\$670',
      'Wallet',
      '02:46 PM',
      'Emma Caldwell',
      'Bank Transfer',
      'Dec 12, 2024',
      '2567379800',
    ),
    TransactionsModel(
      3,
      'P-ID-003',
      '\$234',
      'Wallet',
      '02:46 PM',
      'Emma Caldwell',
      'Bank Transfer',
      'Dec 12, 2024',
      '2567379800',
    ),
    TransactionsModel(
      4,
      'P-ID-004',
      '\$5000',
      'Card',
      '02:46 PM',
      'Emma Caldwell',
      'Bank Transfer',
      'Dec 12, 2024',
      '2567379800',
    ),
    TransactionsModel(
      5,
      'P-ID-005',
      '\$2300',
      'Wallet',
      '02:46 PM',
      'Emma Caldwell',
      'Bank Transfer',
      'Dec 12, 2024',
      '2567379800',
    ),
    TransactionsModel(
      6,
      'P-ID-006',
      '\$560',
      'Card',
      '02:46 PM',
      'Emma Caldwell',
      'Bank Transfer',
      'Dec 12, 2024',
      '2567379800',
    ),
  ];

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Utils.getResponsiveHeight(context, 16)),
              InputSearchWidget(
                onSearch: (query) => transactionsVM.filterTransactions(query),
              ),
              SizedBox(height: Utils.getResponsiveHeight(context, 12)),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
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
                        SizedBox(
                          height: Utils.getResponsiveHeight(context, 16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(context, 16),
                          ),
                          child: Text(
                            'transaction_history'.tr,
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
                          child: Text(
                            'track_your_list_of_transaction_here'.tr,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize: Utils.getResponsiveSize(context, 12),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Utils.getResponsiveHeight(context, 16),
                        ),
                        Container(
                          height: Utils.getResponsiveHeight(context, 50),
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
                                width: Utils.getResponsiveWidth(context, 97),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Utils.getResponsiveWidth(
                                        context,
                                        5,
                                      ),
                                      vertical: Utils.getResponsiveHeight(
                                        context,
                                        16,
                                      ),
                                    ),
                                    child: Text(
                                      'id'.tr,
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
                                width: Utils.getResponsiveWidth(context, 97),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Utils.getResponsiveWidth(
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
                                width: Utils.getResponsiveWidth(context, 127),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Utils.getResponsiveWidth(
                                        context,
                                        5,
                                      ),
                                      vertical: Utils.getResponsiveHeight(
                                        context,
                                        16,
                                      ),
                                    ),
                                    child: Text(
                                      'method'.tr,
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
                                width: Utils.getResponsiveWidth(context, 74),
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Utils.getResponsiveWidth(
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
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: transactionsItems.length,
                          itemBuilder: (context, index) {
                            return TransactionsCartWidget(
                              transaction: transactionsItems[index],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height:
                    Platform.isIOS
                        ? Utils.getResponsiveHeight(context, 40)
                        : Utils.getResponsiveHeight(context, 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
