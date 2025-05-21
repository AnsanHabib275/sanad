import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/help/help_model.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class HelpCartWidget extends StatefulWidget {
  final HelpModel help;

  const HelpCartWidget({super.key, required this.help});

  @override
  State<HelpCartWidget> createState() => _HelpCartWidgetState();
}

class _HelpCartWidgetState extends State<HelpCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height * Utils.getResponsiveHeight(16),
        left: Get.width * Utils.getResponsiveWidth(16),
        right: Get.width * Utils.getResponsiveWidth(16),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).extension<AppColors>()!.cardBg,
          border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
          borderRadius: BorderRadius.all(
            Radius.circular(Get.height * Utils.getResponsiveSize(12)),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(Get.height * Utils.getResponsiveHeight(16)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  widget.help.helpText,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    fontSize: Get.height * Utils.getResponsiveSize(14),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: Get.width * Utils.getResponsiveWidth(20),
                ),
                child: Image.asset(
                  IconAssets.icHelpArrow,
                  height: Get.height * Utils.getResponsiveHeight(10),
                  width: Get.width * Utils.getResponsiveWidth(10),
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
