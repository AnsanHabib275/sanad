import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      return SwitchListTile(
        secondary: Image.asset(
          IconAssets.icDarkTheme,
          height: Get.height * Utils.getResponsiveHeight(24),
          width: Get.width * Utils.getResponsiveWidth(24),
          color: Theme.of(context).iconTheme.color,
        ),
        title: Transform.translate(
          offset: Offset(-10, 0),
          child: Text(
            'dark_mode'.tr,
            style: TextStyle(
              color: Theme.of(context).extension<AppColors>()?.textBodyColor,
              fontSize: Get.height * Utils.getResponsiveSize(16),
              fontFamily: 'Manrope',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        value: themeService.themeMode == ThemeMode.dark,
        onChanged: (value) {
          themeService.toggleTheme();
        },
      );
    });
  }
}
