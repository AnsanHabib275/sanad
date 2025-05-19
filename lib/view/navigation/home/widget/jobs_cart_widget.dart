import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import '../../../../models/home/jobs_model.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class JobsCartWidget extends StatefulWidget {
  final JobsModel jobs;

  const JobsCartWidget({super.key, required this.jobs});

  @override
  State<JobsCartWidget> createState() => _JobsCartWidgetState();
}

class _JobsCartWidgetState extends State<JobsCartWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // child: Obx(() {
      //   return InkWell(
      //     onTap: () {},
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).cardTheme.surfaceTintColor!,
            width: 1.0,
          ),
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
                    widget.jobs.jobName.toString(),
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(20),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                    ),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(12)),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.cardItemBgColor,
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
                        widget.jobs.isPrivate
                            ? 'private_job'.tr
                            : 'public_job'.tr,
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
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
                widget.jobs.companyName.toString(),
                style: TextStyle(
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                ),
              ),
              Text(
                widget.jobs.jobLocation.toString(),
                style: TextStyle(
                  fontSize: Get.height * Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).textTheme.bodyMedium!.color!,
                ),
              ),
              SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.cardItemBgColor,
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
                        widget.jobs.jobType.toString(),
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.cardItemBgColor,
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
                        widget.jobs.salaryRange.toString(),
                        style: TextStyle(
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
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
