import 'package:flutter/material.dart';
import 'package:sanad/models/paymentMethod/payment_method_model.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../res/assets/icon_assets.dart';

class PaymentMethodCartWidget extends StatefulWidget {
  final PaymentMethodModel paymentMethod;

  const PaymentMethodCartWidget({super.key, required this.paymentMethod});

  @override
  State<PaymentMethodCartWidget> createState() =>
      _PaymentMethodCartWidgetState();
}

class _PaymentMethodCartWidgetState extends State<PaymentMethodCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).extension<AppColors>()?.cardBg,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
        borderRadius: BorderRadius.circular(Utils.getResponsiveSize(12)),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Utils.getResponsiveHeight(16),
          horizontal: Utils.getResponsiveWidth(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(widget.paymentMethod.image),
            SizedBox(width: Utils.getResponsiveWidth(10)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.paymentMethod.name,
                  style: TextStyle(
                    fontSize: Utils.getResponsiveSize(16),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    color:
                        Theme.of(context).extension<AppColors>()?.textBodyColor,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(2)),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'XXXX XXXX XXXX ',
                        style: TextStyle(
                          fontSize: Utils.getResponsiveSize(12),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textSecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: widget.paymentMethod.code,
                        style: TextStyle(
                          fontSize: Utils.getResponsiveSize(12),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textSecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: ' | Expiry ',
                        style: TextStyle(
                          fontSize: Utils.getResponsiveSize(12),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textSecondaryColor,
                        ),
                      ),
                      TextSpan(
                        text: widget.paymentMethod.expiry,
                        style: TextStyle(
                          fontSize: Utils.getResponsiveSize(12),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                // Get.toNamed(RoutesName.applyJobScreen);
              },
              child: Image.asset(
                IconAssets.icEdit,
                height: Utils.getResponsiveHeight(20),
                width: Utils.getResponsiveWidth(20),
              ),
            ),
            SizedBox(width: Utils.getResponsiveWidth(8)),
            InkWell(
              onTap: () {
                // Get.toNamed(RoutesName.applyJobScreen);
              },
              child: Image.asset(
                IconAssets.icDelete,
                height: Utils.getResponsiveHeight(20),
                width: Utils.getResponsiveWidth(20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
