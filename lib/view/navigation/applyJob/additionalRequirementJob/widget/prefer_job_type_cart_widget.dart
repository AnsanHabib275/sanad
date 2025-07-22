import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../res/colors/app_color.dart';
import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class PreferJobTypeCartWidget extends StatefulWidget {
  final String preferJobType;

  const PreferJobTypeCartWidget({super.key, required this.preferJobType});

  @override
  State<PreferJobTypeCartWidget> createState() =>
      _PreferJobTypeCartWidgetState();
}

class _PreferJobTypeCartWidgetState extends State<PreferJobTypeCartWidget> {
  final applyJobVM = Get.find<ApplyJobViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = applyJobVM.selectedPreferJobType.contains(
        widget.preferJobType,
      );
      return GestureDetector(
        onTap: () {
          applyJobVM.toggleSelectionPreferJob(widget.preferJobType);
        },
        child: Container(
          decoration: BoxDecoration(
            color:
                isSelected
                    ? AppColor.primaryColor
                    : Theme.of(context).extension<AppColors>()?.containerBg,
            borderRadius: BorderRadius.all(
              Radius.circular(Utils.getResponsiveHeight(8)),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Utils.getResponsiveWidth(12),
              vertical: Utils.getResponsiveHeight(8),
            ),
            child: Text(
              widget.preferJobType,
              textAlign: TextAlign.start,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: Utils.getResponsiveSize(14),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                color:
                    isSelected
                        ? AppColor.primaryButtonTextColor
                        : Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
              ),
            ),
          ),
        ),
      );
    });
  }
}
