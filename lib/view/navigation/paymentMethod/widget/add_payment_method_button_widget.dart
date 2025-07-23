import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../../../utils/utils.dart';

class AddPaymentMethodButtonWidget extends StatelessWidget {
  const AddPaymentMethodButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(RoutesName.addPaymentMethodScreen);
      },
      child: Container(
        width: double.infinity,
        height: Utils.getResponsiveHeight(44),
        decoration: BoxDecoration(
          color: AppColor.primaryButtonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(Utils.getResponsiveHeight(8)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Utils.getResponsiveHeight(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                ImageAssets.imgAddCard,
                height: Utils.getResponsiveHeight(24),
                width: Utils.getResponsiveWidth(24),
                color: AppColor.whiteColor,
              ),
              SizedBox(width: Utils.getResponsiveWidth(8)),
              Text(
                'add_new_payment_method'.tr,
                style: TextStyle(
                  fontSize: Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w600,
                  color: AppColor.primaryButtonTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
