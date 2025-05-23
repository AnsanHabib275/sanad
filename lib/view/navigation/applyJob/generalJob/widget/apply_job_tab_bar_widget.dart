import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/viewModels/controller/navigation/applyJob/apply_job_view_model.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';

class ApplyJobTabBar extends StatefulWidget {
  const ApplyJobTabBar({super.key});
  @override
  State<ApplyJobTabBar> createState() => _ApplyJobTabBarState();
}

class _ApplyJobTabBarState extends State<ApplyJobTabBar>
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
              color: Theme.of(context).primaryIconTheme.color,
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
            Text(
              'resume'.tr,
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
            SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
            Text(
              'additional_requirements'.tr,
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
            SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Get.height * Utils.getResponsiveHeight(20),
              width: Get.width * Utils.getResponsiveWidth(20),
              color:
                  Theme.of(context).extension<AppColors>()?.textSecondaryColor,
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
