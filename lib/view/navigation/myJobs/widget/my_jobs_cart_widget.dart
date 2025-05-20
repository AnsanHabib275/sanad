import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import '../../../../models/myJobs/my_jobs_model.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class MyJobsCartWidget extends StatefulWidget {
  final MyJobsModel myJobs;

  const MyJobsCartWidget({super.key, required this.myJobs});

  @override
  State<MyJobsCartWidget> createState() => _MyJobsCartWidgetState();
}

class _MyJobsCartWidgetState extends State<MyJobsCartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // child: Obx(() {
      //   return InkWell(
      //     onTap: () {},
      child: Card(
        elevation: 2,
        color: Theme.of(context).cardTheme.color,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
          borderRadius: BorderRadius.circular(
            Get.height * Utils.getResponsiveSize(8),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Get.height * Utils.getResponsiveHeight(16),
            horizontal: Get.width * Utils.getResponsiveWidth(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.myJobs.jobName.toString(),
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(20),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(12)),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).extension<AppColors>()?.containerBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(6),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(10),
                        vertical: Get.height * Utils.getResponsiveHeight(2),
                      ),
                      child: Text(
                        widget.myJobs.isPrivate
                            ? 'private_job'.tr
                            : 'public_job'.tr,
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Image.asset(
                    IconAssets.icDisable,
                    height: Get.height * Utils.getResponsiveHeight(24),
                    width: Get.width * Utils.getResponsiveWidth(24),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                  Image.asset(
                    IconAssets.icBookmark,
                    height: Get.height * Utils.getResponsiveHeight(24),
                    width: Get.width * Utils.getResponsiveWidth(24),
                  ),
                ],
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
              Text(
                widget.myJobs.companyName.toString(),
                style: TextStyle(
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textSecondaryColor,
                ),
              ),
              Text(
                widget.myJobs.jobLocation.toString(),
                style: TextStyle(
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textSecondaryColor,
                ),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).extension<AppColors>()?.containerBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(6),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(10),
                        vertical: Get.height * Utils.getResponsiveHeight(2),
                      ),
                      child: Text(
                        widget.myJobs.jobType.toString(),
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(context).extension<AppColors>()?.containerBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(6),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(10),
                        vertical: Get.height * Utils.getResponsiveHeight(2),
                      ),
                      child: Text(
                        widget.myJobs.salaryRange.toString(),
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.cardSelectedBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(6),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(12),
                        vertical: Get.height * Utils.getResponsiveHeight(2),
                      ),
                      child: Text(
                        widget.myJobs.applied.toString(),
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(14),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: AppColor.cardSelectedTextColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      //   );
      // }),
    );
  }
}
