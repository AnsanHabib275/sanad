import 'package:flutter/material.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';

class SoftwareProgramCartWidget extends StatefulWidget {
  final String softwareProgram;

  const SoftwareProgramCartWidget({super.key, required this.softwareProgram});

  @override
  State<SoftwareProgramCartWidget> createState() =>
      _SoftwareProgramCartWidgetState();
}

class _SoftwareProgramCartWidgetState extends State<SoftwareProgramCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.containerBg,
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
            color: Theme.of(context).extension<AppColors>()?.textPrimaryColor,
          ),
        ),
      ),
    );
  }
}
