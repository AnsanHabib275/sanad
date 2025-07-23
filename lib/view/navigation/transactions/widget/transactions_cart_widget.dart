import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/transactions/transactions_model.dart';
import 'package:sanad/res/assets/icon_assets.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../res/routes/routes_name.dart';

class TransactionsCartWidget extends StatefulWidget {
  final TransactionsModel transaction;

  const TransactionsCartWidget({super.key, required this.transaction});

  @override
  State<TransactionsCartWidget> createState() => _TransactionsCartWidgetState();
}

class _TransactionsCartWidgetState extends State<TransactionsCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
        ),
      ),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            RoutesName.transactionDetailScreen,
            arguments: {
              'paymentID': widget.transaction.paymentID,
              'transactionTime': widget.transaction.time,
              'name': widget.transaction.name,
              'transactionType': widget.transaction.paymentType,
              'transactionDate': widget.transaction.transactionDate,
              'amount': widget.transaction.amount,
              'accountNumber': widget.transaction.accountNumber,
            },
          );
        },
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
                    widget.transaction.paymentID,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: Utils.getResponsiveSize(14),
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
                    widget.transaction.amount,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: Utils.getResponsiveSize(14),
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
                  child: Container(
                    decoration: BoxDecoration(
                      color:
                          widget.transaction.paymentMethod == 'Card'
                              ? AppColor.successBgColor
                              : AppColor.indigoBgColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(6)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(10),
                        vertical: Utils.getResponsiveHeight(2),
                      ),
                      child: Text(
                        widget.transaction.paymentMethod,
                        style: TextStyle(
                          fontSize: Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color:
                              widget.transaction.paymentMethod == 'Card'
                                  ? AppColor.successTextColor
                                  : AppColor.indigoTextColor,
                        ),
                      ),
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.secondaryButtonColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(8)),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(12),
                        vertical: Utils.getResponsiveHeight(8),
                      ),
                      child: Image.asset(
                        IconAssets.icAction,
                        height: Utils.getResponsiveHeight(20),
                        width: Utils.getResponsiveWidth(20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
