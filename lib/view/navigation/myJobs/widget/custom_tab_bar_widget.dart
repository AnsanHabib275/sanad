import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/navigation/myJobs/my_jobs_view_model.dart';

import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  final myJobsVM = Get.put(MyJobsViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Utils.getResponsiveHeight(context, 44),
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.tabsBg,
        border: Border.all(
          // color: Theme.of(context).extension<AppColors>()?.tabsBorderColor,
          color: Theme.of(context).dividerColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Utils.getResponsiveHeight(context, 10)),
        ),
      ),
      child: Obx(() {
        return Padding(
          padding: EdgeInsets.all(Utils.getResponsiveHeight(context, 4)),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    myJobsVM.setSelectionTab('applied');
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          myJobsVM.selectedTab.value == 'applied'
                              ? Theme.of(
                                context,
                              ).extension<AppColors>()?.selectedTabsBg
                              : myJobsVM.selectedTab.value == 'saved'
                              ? AppColor.transparent
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(context, 6)),
                      ),
                    ),
                    child: Text(
                      'applied'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(context, 14),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color:
                            myJobsVM.selectedTab.value == 'applied'
                                ? AppColor.primaryButtonColor
                                : myJobsVM.selectedTab.value == 'saved'
                                ? AppColor.textSecondaryColor
                                : AppColor.textSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    myJobsVM.setSelectionTab('saved');
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          myJobsVM.selectedTab.value == 'saved'
                              ? Theme.of(
                                context,
                              ).extension<AppColors>()?.selectedTabsBg
                              : myJobsVM.selectedTab.value == 'applied'
                              ? AppColor.transparent
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(context, 6)),
                      ),
                    ),
                    child: Text(
                      'saved'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(context, 14),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color:
                            myJobsVM.selectedTab.value == 'saved'
                                ? AppColor.primaryButtonColor
                                : myJobsVM.selectedTab.value == 'applied'
                                ? AppColor.textSecondaryColor
                                : AppColor.textSecondaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    myJobsVM.setSelectionTab('invitation');
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          myJobsVM.selectedTab.value == 'invitation'
                              ? Theme.of(
                                context,
                              ).extension<AppColors>()?.selectedTabsBg
                              : myJobsVM.selectedTab.value == 'applied'
                              ? AppColor.transparent
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(context, 6)),
                      ),
                    ),
                    child: Text(
                      'invitation'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(context, 14),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        color:
                            myJobsVM.selectedTab.value == 'invitation'
                                ? AppColor.primaryButtonColor
                                : myJobsVM.selectedTab.value == 'applied'
                                ? AppColor.textSecondaryColor
                                : AppColor.textSecondaryColor,
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
