import 'package:flutter/material.dart';
import 'package:sanad/models/wallet/wallet_model.dart';
import 'package:sanad/res/assets/icon_assets.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';

class WalletCartWidget extends StatefulWidget {
  final WalletModel wallet;

  const WalletCartWidget({super.key, required this.wallet});

  @override
  State<WalletCartWidget> createState() => _WalletCartWidgetState();
}

class _WalletCartWidgetState extends State<WalletCartWidget> {
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
            width: Utils.getResponsiveWidth(context, 97),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Utils.getResponsiveWidth(context, 5),
                  vertical: Utils.getResponsiveHeight(context, 16),
                ),
                child: Text(
                  widget.wallet.transactionID,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    fontSize: Utils.getResponsiveSize(context, 14),
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
                  horizontal: Utils.getResponsiveWidth(context, 5),
                  vertical: Utils.getResponsiveHeight(context, 16),
                ),
                child: Text(
                  widget.wallet.amount,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    fontSize: Utils.getResponsiveSize(context, 14),
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
                  horizontal: Utils.getResponsiveWidth(context, 5),
                  vertical: Utils.getResponsiveHeight(context, 16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color:
                        widget.wallet.paymentMethod == 'Card'
                            ? AppColor.successBgColor
                            : AppColor.indigoBgColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveHeight(context, 6)),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(context, 10),
                      vertical: Utils.getResponsiveHeight(context, 2),
                    ),
                    child: Text(
                      widget.wallet.paymentMethod,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(context, 12),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color:
                            widget.wallet.paymentMethod == 'Card'
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
            width: Utils.getResponsiveWidth(context, 74),
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Utils.getResponsiveWidth(context, 5),
                  vertical: Utils.getResponsiveHeight(context, 16),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.secondaryButtonColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(Utils.getResponsiveHeight(context, 8)),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(context, 12),
                      vertical: Utils.getResponsiveHeight(context, 8),
                    ),
                    child: Image.asset(
                      IconAssets.icAction,
                      height: Utils.getResponsiveHeight(context, 20),
                      width: Utils.getResponsiveWidth(context, 20),
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
