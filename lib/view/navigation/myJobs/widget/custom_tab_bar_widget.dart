import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/viewModels/controller/navigation/myJobs/my_jobs_view_model.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  final myJobsVM = Get.put(MyJobsViewModel());
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    // complaintsVM.complaintsListApi();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Get.height * Utils.getResponsiveHeight(44),
      decoration: BoxDecoration(
        color: AppColor.textPrimaryColor,
        // color: Theme.of(context).tabBarTheme!.overlayColor!,
        border: Border(
          bottom: BorderSide(
            color: Theme.of(context).tabBarTheme.labelColor!,
            width: 1,
          ),
          // bottom: BorderSide(color: AppColor.tabsBorderColor, width: 1),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(Get.height * Utils.getResponsiveHeight(10)),
        ),
      ),
      child: Obx(() {
        return Padding(
          padding: EdgeInsets.all(Get.height * Utils.getResponsiveHeight(4)),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // complaintsVM.isSolved.value = false;
                    _animationController.reverse();
                    myJobsVM.setSelectionTab('applied');
                    // complaintsVM.complaintsListApi();
                    // complaintsVM.toggleSolved(false);
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          myJobsVM.selectedTab.value == 'applied'
                              ? AppColor.whiteColor
                              : myJobsVM.selectedTab.value == 'saved'
                              ? AppColor.transparent
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(6),
                        ),
                      ),
                    ),
                    child: Text(
                      'applied'.tr,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(14),
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
                    // complaintsVM.isSolved.value = true;
                    _animationController.forward();
                    myJobsVM.setSelectionTab('saved');
                    // complaintsVM.complaintsListApi();
                    // complaintsVM.toggleSolved(true);
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          myJobsVM.selectedTab.value == 'saved'
                              ? AppColor.whiteColor
                              : myJobsVM.selectedTab.value == 'applied'
                              ? AppColor.transparent
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(6),
                        ),
                      ),
                    ),
                    child: Text(
                      'saved'.tr,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(14),
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
                    // complaintsVM.isSolved.value = true;
                    _animationController.forward();
                    myJobsVM.setSelectionTab('invitation');
                    // complaintsVM.complaintsListApi();
                    // complaintsVM.toggleSolved(true);
                  },
                  child: Container(
                    height: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color:
                          myJobsVM.selectedTab.value == 'invitation'
                              ? AppColor.whiteColor
                              : myJobsVM.selectedTab.value == 'applied'
                              ? AppColor.transparent
                              : AppColor.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(6),
                        ),
                      ),
                    ),
                    child: Text(
                      'invitation'.tr,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(14),
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
