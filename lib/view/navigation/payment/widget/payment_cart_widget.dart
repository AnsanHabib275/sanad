import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/payment/payment_model.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class PaymentCartWidget extends StatefulWidget {
  final PaymentModel payment;

  const PaymentCartWidget({super.key, required this.payment});

  @override
  State<PaymentCartWidget> createState() => _PaymentCartWidgetState();
}

class _PaymentCartWidgetState extends State<PaymentCartWidget> {
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
            RoutesName.paymentDetailScreen,
            arguments: {
              'paymentID': widget.payment.paymentID,
              'paymentDate': widget.payment.paymentDate,
              'amount': widget.payment.amount,
              'status': widget.payment.status,
            },
          );
        },
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
                    widget.payment.paymentID,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textSecondaryColor,
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
                    widget.payment.amount,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textSecondaryColor,
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
                          widget.payment.status == 'Expired'
                              ? AppColor.errorBgColor
                              : widget.payment.status == 'Hired'
                              ? AppColor.successBgColor
                              : AppColor.runningBgColor,
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
                        widget.payment.status,
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color:
                              widget.payment.status == 'Expired'
                                  ? AppColor.errorTextColor
                                  : widget.payment.status == 'Hired'
                                  ? AppColor.successTextColor
                                  : AppColor.runningTextColor,
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
                      color: Theme.of(context).cardTheme.color,
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
      ),
    );
  }
}
