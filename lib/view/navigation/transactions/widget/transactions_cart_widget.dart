import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/transactions/transactions_model.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/assets/image_assets.dart';
import '../../../../models/home/jobs_model.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

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
      height: Get.height * Utils.getResponsiveHeight(66),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        // border: Border(
        //   bottom: BorderSide(color: AppColor.searchBarBorderColor, width: 1.0),
        // ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: Get.height * Utils.getResponsiveHeight(66),
            width: Get.width * Utils.getResponsiveWidth(92),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
                vertical: Get.height * Utils.getResponsiveHeight(16),
              ),
              child: Text(
                widget.transaction.paymentID,
                style: TextStyle(
                  color: AppColor.textPrimaryColor,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * Utils.getResponsiveHeight(66),
            width: Get.width * Utils.getResponsiveWidth(78),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
                vertical: Get.height * Utils.getResponsiveHeight(16),
              ),
              child: Text(
                widget.transaction.amount,
                style: TextStyle(
                  color: AppColor.textPrimaryColor,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Get.height * Utils.getResponsiveHeight(66),
            width: Get.width * Utils.getResponsiveWidth(80),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
                vertical: Get.height * Utils.getResponsiveHeight(16),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color:
                      widget.transaction.paymentMethod == 'Card'
                          ? AppColor.successBgColor
                          : AppColor.indigoBgColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(Get.height * Utils.getResponsiveHeight(6)),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(10),
                    vertical: Get.height * Utils.getResponsiveHeight(2),
                  ),
                  child: Text(
                    widget.transaction.paymentMethod,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(12),
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
          SizedBox(
            height: Get.height * Utils.getResponsiveHeight(66),
            width: Get.width * Utils.getResponsiveWidth(74),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
                vertical: Get.height * Utils.getResponsiveHeight(16),
              ),
              child: Image.asset(ImageAssets.imgTransactionDownload),
            ),
          ),
        ],
      ),
    );
  }
}
