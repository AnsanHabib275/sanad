import 'package:flutter/material.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/utils/utils.dart';

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
          Radius.circular(Utils.getResponsiveHeight(context, 6)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.getResponsiveWidth(context, 10),
          vertical: Utils.getResponsiveHeight(context, 2),
        ),
        child: Text(
          widget.jobSpecification,
          style: TextStyle(
            fontSize: Utils.getResponsiveSize(context, 12),
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
            color: Theme.of(context).extension<AppColors>()?.textPrimaryColor,
          ),
        ),
      ),
    );
  }
}
