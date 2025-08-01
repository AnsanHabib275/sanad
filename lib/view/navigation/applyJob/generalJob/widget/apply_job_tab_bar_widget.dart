import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';

import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

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
              color: Theme.of(context).primaryIconTheme.color,
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 10)),
            Text(
              'resume'.tr,
              style: TextStyle(
                fontSize: Utils.getResponsiveSize(context, 12),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Utils.getResponsiveHeight(context, 20),
              width: Utils.getResponsiveWidth(context, 20),
              color: Theme.of(context).primaryIconTheme.color,
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 8)),
            Text(
              'additional_requirements'.tr,
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
            SizedBox(width: Utils.getResponsiveWidth(context, 8)),
            Image.asset(
              IconAssets.icArrowRightUnselected,
              height: Utils.getResponsiveHeight(context, 20),
              width: Utils.getResponsiveWidth(context, 20),
              color:
                  Theme.of(context).extension<AppColors>()?.textSecondaryColor,
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
