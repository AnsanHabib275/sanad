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
      return Transform.scale(
        scale: Utils.getResponsiveHeight(context, 0.9),
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            focusColor: Colors.transparent,
          ),
          child: Transform.scale(
            scale: MediaQuery.of(context).size.width < 360 ? 0.8 : 1.0,
            child: SwitchListTile(
              secondary: Transform.translate(
                offset: Offset(-2, 0),
                child: Image.asset(
                  IconAssets.icDarkTheme,
                  height: Utils.getResponsiveHeight(context, 28),
                  width: Utils.getResponsiveWidth(context, 28),
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
              title: Transform.translate(
                offset: Offset(-12, 0),
                child: Text(
                  'dark_theme'.tr,
                  style: TextStyle(
                    color:
                        Theme.of(context).extension<AppColors>()?.textBodyColor,
                    fontSize: Utils.getResponsiveSize(context, 18),
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
          ),
        ),
      );
    });
  }
}
