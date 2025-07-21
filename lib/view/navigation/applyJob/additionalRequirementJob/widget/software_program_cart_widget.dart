import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../res/colors/app_color.dart';
import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class SoftwareProgramCartWidget extends StatefulWidget {
  final String softwareProgram;

  const SoftwareProgramCartWidget({super.key, required this.softwareProgram});

  @override
  State<SoftwareProgramCartWidget> createState() =>
      _SoftwareProgramCartWidgetState();
}

class _SoftwareProgramCartWidgetState extends State<SoftwareProgramCartWidget> {
  final applyJobVM = Get.find<ApplyJobViewModel>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = applyJobVM.selectedPrograms.contains(
        widget.softwareProgram,
      );
      return GestureDetector(
        onTap: () {
          applyJobVM.toggleSelection(widget.softwareProgram);
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
              widget.softwareProgram,
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
