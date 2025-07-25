import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../res/assets/icon_assets.dart';
import '../../../../../../res/colors/app_color.dart';
import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class ReviewJobTabBar extends StatefulWidget {
  const ReviewJobTabBar({super.key});

  @override
  State<ReviewJobTabBar> createState() => _ReviewJobTabBarState();
}

class _ReviewJobTabBarState extends State<ReviewJobTabBar>
    with SingleTickerProviderStateMixin {
  final applyJobVM = Get.put(ApplyJobViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Utils.getResponsiveHeight(context, 52),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.cardBg,
        border: Border.all(color: Theme.of(context).dividerColor, width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(Utils.getResponsiveHeight(context, 8)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(Utils.getResponsiveHeight(context, 16)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              IconAssets.icCheckCircleUnselected,
              height: Utils.getResponsiveHeight(context, 15),
              width: Utils.getResponsiveWidth(context, 15),
              color: AppColor.primaryIconColor,
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 10)),
            Text(
              'resume'.tr,
              style: TextStyle(
                fontSize: Utils.getResponsiveSize(context, 12),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color: AppColor.primaryIconColor,
              ),
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Utils.getResponsiveHeight(context, 20),
              width: Utils.getResponsiveWidth(context, 20),
              color: AppColor.primaryIconColor,
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 8)),
            Image.asset(
              IconAssets.icCheckCircleUnselected,
              height: Utils.getResponsiveHeight(context, 15),
              width: Utils.getResponsiveWidth(context, 15),
              color: AppColor.primaryIconColor,
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 10)),
            Text(
              'additional_requirements'.tr,
              style: TextStyle(
                fontSize: Utils.getResponsiveSize(context, 12),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color: AppColor.primaryIconColor,
              ),
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Utils.getResponsiveHeight(context, 20),
              width: Utils.getResponsiveWidth(context, 20),
              color: AppColor.primaryIconColor,
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 10)),
            Text(
              'review'.tr,
              style: TextStyle(
                fontSize: Utils.getResponsiveSize(context, 12),
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
