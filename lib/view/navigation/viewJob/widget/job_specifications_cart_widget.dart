import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class JobSpecificationsCartWidget extends StatefulWidget {
  final String jobSpecification;

  const JobSpecificationsCartWidget({
    super.key,
    required this.jobSpecification,
  });

  @override
  State<JobSpecificationsCartWidget> createState() =>
      _JobSpecificationsCartWidgetState();
}

class _JobSpecificationsCartWidgetState
    extends State<JobSpecificationsCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.containerBg,
        borderRadius: BorderRadius.all(
          Radius.circular(Get.height * Utils.getResponsiveHeight(6)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * Utils.getResponsiveWidth(10),
          vertical: Get.height * Utils.getResponsiveHeight(2),
        ),
        child: Text(
          widget.jobSpecification,
          style: TextStyle(
            fontSize: Get.height * Utils.getResponsiveSize(12),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Theme.of(context).extension<AppColors>()?.textPrimaryColor,
          ),
        ),
      ),
    );
  }
}
