import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../../models/myJobs/my_jobs_model.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../viewModels/controller/navigation/myJobs/my_jobs_view_model.dart';

class MyJobsCartWidget extends StatefulWidget {
  final MyJobsModel myJobs;

  const MyJobsCartWidget({super.key, required this.myJobs});

  @override
  State<MyJobsCartWidget> createState() => _MyJobsCartWidgetState();
}

class _MyJobsCartWidgetState extends State<MyJobsCartWidget> {
  final myJobsVM = Get.put(MyJobsViewModel());
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // child: Obx(() {
      child: InkWell(
        onTap: () {
          Get.toNamed(
            RoutesName.viewJobDetailScreen,
            arguments: {
              'isPrivate': widget.myJobs.isPrivate,
              'jobName': widget.myJobs.jobName,
              'jobCategory': 'Marketing & Advertisement',
              'agencyName': widget.myJobs.agencyName,
              'location': widget.myJobs.jobLocation,
              'jobType': widget.myJobs.jobType,
              'professionalStatus': 'Intermediate',
              'salaryRange': widget.myJobs.salaryRange,
              'cvPrice': '10 Riyal',
              'myJobSpecifications': [
                widget.myJobs.jobType,
                'Intermediate',
                widget.myJobs.salaryRange,
                '10 SAR/CV',
              ],
              'experienceRequired': '3 years',
              'candidatesRequired': '2',
              'jobDescription':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              'preferJobType': ['Open to Relocating', 'Remotely', 'Hybrid'],
              'softwarePrograms': [
                'Framer',
                'Figma',
                'Adobe XD',
                'Adobe Photoshop',
              ],
              'companyName': 'Coinbitsolutions',
              'companyWebsite': 'www.coinbitsolutions.com',
              'companyType': 'Design Servics',
              'companySize': '10-50 Employees ',
              'companyLocation': 'XYZ Location',
              'companyDescription':
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
            },
          );
        },
        child: Card(
          elevation: 2,
          color: Theme.of(context).extension<AppColors>()?.cardBg,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
            borderRadius: BorderRadius.circular(Utils.getResponsiveSize(8)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Utils.getResponsiveHeight(16),
              horizontal: Utils.getResponsiveWidth(16),
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
                        fontSize: Utils.getResponsiveSize(20),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w700,
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.textPrimaryColor,
                      ),
                    ),
                    SizedBox(width: Utils.getResponsiveWidth(12)),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.containerBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Utils.getResponsiveHeight(6)),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(10),
                          vertical: Utils.getResponsiveHeight(2),
                        ),
                        child: Text(
                          widget.myJobs.isPrivate
                              ? 'private_job'.tr
                              : 'public_job'.tr,
                          style: TextStyle(
                            fontSize: Utils.getResponsiveSize(12),
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
                      height: Utils.getResponsiveHeight(24),
                      width: Utils.getResponsiveWidth(24),
                    ),
                    SizedBox(width: Utils.getResponsiveWidth(8)),
                    Obx(() {
                      return Image.asset(
                        IconAssets.icBookmark,
                        height: Utils.getResponsiveHeight(24),
                        width: Utils.getResponsiveWidth(24),
                        color:
                            myJobsVM.selectedTab.value == 'saved'
                                ? AppColor.primaryColor
                                : AppColor.textSecondaryDarkColor,
                      );
                    }),
                  ],
                ),
                SizedBox(height: Utils.getResponsiveHeight(12)),
                Text(
                  widget.myJobs.agencyName.toString(),
                  style: TextStyle(
                    fontSize: Utils.getResponsiveSize(14),
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
                    fontSize: Utils.getResponsiveSize(14),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textSecondaryColor,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(24)),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.containerBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Utils.getResponsiveHeight(6)),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(10),
                          vertical: Utils.getResponsiveHeight(2),
                        ),
                        child: Text(
                          widget.myJobs.jobType.toString(),
                          style: TextStyle(
                            fontSize: Utils.getResponsiveSize(12),
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
                    SizedBox(width: Utils.getResponsiveWidth(8)),
                    Container(
                      decoration: BoxDecoration(
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.containerBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Utils.getResponsiveHeight(6)),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(10),
                          vertical: Utils.getResponsiveHeight(2),
                        ),
                        child: Text(
                          widget.myJobs.salaryRange.toString(),
                          style: TextStyle(
                            fontSize: Utils.getResponsiveSize(12),
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.submittedCvScreen);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.cardSelectedBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Utils.getResponsiveHeight(6)),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Utils.getResponsiveWidth(12),
                            vertical: Utils.getResponsiveHeight(2),
                          ),
                          child: Text(
                            widget.myJobs.applied.toString(),
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
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
      ),
      // }),
    );
  }
}
