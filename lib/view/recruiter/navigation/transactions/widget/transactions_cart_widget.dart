import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/recruiter/transactions/transactions_model.dart';
import 'package:sanad/res/assets/image_assets.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';


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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.width * Utils.getResponsiveWidth(97),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(5),
                  vertical: Get.height * Utils.getResponsiveHeight(16),
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
                    fontSize: Get.height * Utils.getResponsiveSize(14),
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
                  horizontal: Get.width * Utils.getResponsiveWidth(5),
                  vertical: Get.height * Utils.getResponsiveHeight(16),
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
                    fontSize: Get.height * Utils.getResponsiveSize(14),
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
                  horizontal: Get.width * Utils.getResponsiveWidth(5),
                  vertical: Get.height * Utils.getResponsiveHeight(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        widget.transaction.paymentMethod == 'Card'
                            ? AppColor.successBgColor
                            : AppColor.indigoBgColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(6),
                      ),
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
          ),
          SizedBox(
            width: Get.width * Utils.getResponsiveWidth(74),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(5),
                  vertical: Get.height * Utils.getResponsiveHeight(16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.secondaryButtonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(8),
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(12),
                      vertical: Get.height * Utils.getResponsiveHeight(8),
                    ),
                    child: Image.asset(
                      ImageAssets.imgDownload,
                      height: Get.height * Utils.getResponsiveHeight(18),
                      width: Get.width * Utils.getResponsiveWidth(18),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
