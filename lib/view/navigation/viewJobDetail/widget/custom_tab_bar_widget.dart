import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  final applyJobVM = Get.put(ApplyJobViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Utils.getResponsiveHeight(44),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.tabsBg,
        border: Border.all(
          // color: Theme.of(context).extension<AppColors>()?.tabsBorderColor,
          color: Theme.of(context).dividerColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Utils.getResponsiveHeight(10)),
        ),
      ),
      child: Obx(() {
        return Padding(
          padding: EdgeInsets.all(Utils.getResponsiveHeight(4)),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    applyJobVM.setSelectionTab('general');
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          applyJobVM.selectedTab.value == 'general'
                              ? Theme.of(
                                context,
                              ).extension<AppColors>()?.selectedTabsBg
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(6)),
                      ),
                    ),
                    child: Text(
                      'general'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        color:
                            applyJobVM.selectedTab.value == 'general'
                                ? Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor
                                : Theme.of(
                                  context,
                                ).extension<AppColors>()?.textBodyColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    applyJobVM.setSelectionTab('requirements');
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          applyJobVM.selectedTab.value == 'requirements'
                              ? Theme.of(
                                context,
                              ).extension<AppColors>()?.selectedTabsBg
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(6)),
                      ),
                    ),
                    child: Text(
                      'requirements'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        color:
                            applyJobVM.selectedTab.value == 'requirements'
                                ? Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor
                                : Theme.of(
                                  context,
                                ).extension<AppColors>()?.textBodyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
