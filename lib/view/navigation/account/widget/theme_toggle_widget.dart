import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../../viewModels/services/theme_service.dart';

class ThemeToggleWidget extends StatelessWidget {
  const ThemeToggleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Get.find<ThemeService>();

    return Obx(() {
      return Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
        ),
        child: SwitchListTile(
          secondary: Image.asset(
            IconAssets.icDarkTheme,
            height: Utils.getResponsiveHeight(context, 24),
            width: Utils.getResponsiveWidth(context, 24),
            color: Theme.of(context).iconTheme.color,
          ),
          title: Transform.translate(
            offset: Offset(-10, 0),
            child: Text(
              'dark_theme'.tr,
              style: TextStyle(
                color: Theme.of(context).extension<AppColors>()?.textBodyColor,
                fontSize: Utils.getResponsiveSize(context, 16),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          trackOutlineColor: WidgetStateProperty.all(AppColor.transparent),
          inactiveThumbImage: AssetImage(IconAssets.icSwitchThumb),
          inactiveThumbColor: AppColor.whiteColor,
          thumbColor: WidgetStateProperty.all(AppColor.whiteColor),
          activeTrackColor: AppColor.switchButtonActiveBgColor,
          inactiveTrackColor: AppColor.switchButtonInactiveBgColor16Per,
          value: themeService.themeMode == ThemeMode.dark,
          onChanged: (value) {
            themeService.toggleTheme();
          },
        ),
      );
    });
  }
}
