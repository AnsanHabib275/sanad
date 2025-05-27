import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/transactions/transactions_model.dart';
import 'package:sanad/view/navigation/transactions/widget/input_search_widget.dart';
import 'package:sanad/view/navigation/transactions/widget/transactions_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/transactions/transactions_view_model.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/themes/app_themes.dart';
import '../../../utils/utils.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  final transactionsVM = Get.put(TransactionsViewModel());
  final List<TransactionsModel> transactionsItems = [
    TransactionsModel(1, 'P-ID-001', '\$2300', 'Card'),
    TransactionsModel(2, 'P-ID-002', '-\$670', 'Wallet'),
    TransactionsModel(3, 'P-ID-003', '\$234', 'Wallet'),
    TransactionsModel(4, 'P-ID-004', '\$5000', 'Card'),
    TransactionsModel(5, 'P-ID-005', '\$2300', 'Wallet'),
    TransactionsModel(6, 'P-ID-006', '\$560', 'Card'),
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
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
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
            horizontal: Get.width * Utils.getResponsiveWidth(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
              InputSearchWidget(
                onSearch: (query) => transactionsVM.filterTransactions(query),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
              Flexible(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).extension<AppColors>()?.cardBg,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(12),
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
                          horizontal: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        child: Text(
                          'transaction_history'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(16),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(4),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        child: Text(
                          'track_your_list_of_transaction_here'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      Container(
                        height: Get.height * Utils.getResponsiveHeight(50),
                        width: double.infinity,
                        color:
                            Theme.of(context).extension<AppColors>()?.containerBg,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(97),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
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
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(97),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
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
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(127),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
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
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(74),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width * Utils.getResponsiveWidth(5),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
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
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(12),
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
                          itemCount: transactionsItems.length,
                          itemBuilder: (context, index) {
                            return TransactionsCartWidget(
                              transaction: transactionsItems[index],
                            );
                          },
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
    );
  }
}
