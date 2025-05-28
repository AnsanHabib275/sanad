import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../res/assets/icon_assets.dart';
import '../../../../../../res/colors/app_color.dart';
import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../../viewModels/controller/recruiter/navigation/applyJob/apply_job_view_model.dart';

class AdditionalRequirementsJobTabBar extends StatefulWidget {
  const AdditionalRequirementsJobTabBar({super.key});
  @override
  State<AdditionalRequirementsJobTabBar> createState() =>
      _AdditionalRequirementsJobTabBarState();
}

class _AdditionalRequirementsJobTabBarState
    extends State<AdditionalRequirementsJobTabBar>
    with SingleTickerProviderStateMixin {
  final applyJobVM = Get.put(ApplyJobViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * Utils.getResponsiveHeight(52),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.cardBg,
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(Get.height * Utils.getResponsiveHeight(8)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(Get.height * Utils.getResponsiveHeight(16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              IconAssets.icCheckCircleUnselected,
              height: Get.height * Utils.getResponsiveHeight(15),
              width: Get.width * Utils.getResponsiveWidth(15),
              color: AppColor.primaryIconColor,
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
            Text(
              'resume'.tr,
              style: TextStyle(
                fontSize: Get.height * Utils.getResponsiveSize(12),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color: AppColor.primaryIconColor,
              ),
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Get.height * Utils.getResponsiveHeight(20),
              width: Get.width * Utils.getResponsiveWidth(20),
              color: AppColor.primaryIconColor,
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
            Image.asset(
              IconAssets.icCheckCircleUnselected,
              height: Get.height * Utils.getResponsiveHeight(15),
              width: Get.width * Utils.getResponsiveWidth(15),
              color: Theme.of(context).primaryIconTheme.color,
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
            Text(
              'additional_requirements'.tr,
              style: TextStyle(
                fontSize: Get.height * Utils.getResponsiveSize(12),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Get.height * Utils.getResponsiveHeight(20),
              width: Get.width * Utils.getResponsiveWidth(20),
              color: Theme.of(context).primaryIconTheme.color,
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
            Text(
              'review'.tr,
              style: TextStyle(
                fontSize: Get.height * Utils.getResponsiveSize(12),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color:
                    Theme.of(
                      context,
                    ).extension<AppColors>()?.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
