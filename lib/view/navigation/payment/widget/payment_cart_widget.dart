import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/payment/payment_model.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';

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
              'jobTitle': widget.payment.jobTitle,
              'cvName': widget.payment.cvName,
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
                    widget.payment.paymentID,
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
                    widget.payment.amount,
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
                  child: Text(
                    widget.payment.jobTitle,
                    textAlign: TextAlign.start,
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
                  // child: Container(
                  //   decoration: BoxDecoration(
                  //     color:
                  //         widget.payment.status == 'Expired'
                  //             ? AppColor.errorBgColor
                  //             : widget.payment.status == 'Hired'
                  //             ? AppColor.successBgColor
                  //             : AppColor.runningBgColor,
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(
                  //         Utils.getResponsiveHeight(6),
                  //       ),
                  //     ),
                  //   ),
                  //   child: Padding(
                  //     padding: EdgeInsets.symmetric(
                  //       horizontal: Utils.getResponsiveWidth(10),
                  //       vertical: Utils.getResponsiveHeight(2),
                  //     ),
                  //     child: Text(
                  //       widget.payment.status,
                  //       style: TextStyle(
                  //         fontSize: Utils.getResponsiveSize(12),
                  //         fontFamily: 'Inter',
                  //         fontWeight: FontWeight.w500,
                  //         color:
                  //             widget.payment.status == 'Expired'
                  //                 ? AppColor.errorTextColor
                  //                 : widget.payment.status == 'Hired'
                  //                 ? AppColor.successTextColor
                  //                 : AppColor.runningTextColor,
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
                        ImageAssets.imgDownload,
                        height: Utils.getResponsiveHeight(18),
                        width: Utils.getResponsiveWidth(18),
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
