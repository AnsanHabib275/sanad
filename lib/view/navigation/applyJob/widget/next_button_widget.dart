import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/components/round_button.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';

class NextButtonWidget extends StatelessWidget {
  NextButtonWidget({super.key});

  final userVM = Get.put(UserPreference());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * Utils.getResponsiveWidth(98),
      height: Get.height * Utils.getResponsiveHeight(40),
      decoration: BoxDecoration(
        color: AppColor.primaryButtonColor,
        borderRadius: BorderRadius.all(
          Radius.circular(Get.height * Utils.getResponsiveHeight(8)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * Utils.getResponsiveWidth(20),
          vertical: Get.height * Utils.getResponsiveHeight(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'next'.tr,
              style: TextStyle(
                fontSize: Get.height * Utils.getResponsiveSize(14),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color: AppColor.primaryButtonTextColor,
              ),
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Get.height * Utils.getResponsiveHeight(18),
              width: Get.width * Utils.getResponsiveWidth(18),
              color: AppColor.primaryButtonTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
