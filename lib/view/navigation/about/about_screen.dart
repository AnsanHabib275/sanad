import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/themes/app_themes.dart';
import '../../../utils/utils.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: IconButton(
            icon: Image.asset(
              IconAssets.icArrowLeft,
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('about'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(16),
              vertical: Get.height * Utils.getResponsiveHeight(16),
            ),
            child: Text(
              'about_description'.tr,
              style: TextStyle(
                color:
                    Theme.of(
                      context,
                    ).extension<AppColors>()?.textSecondaryColor,
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
                fontSize: Get.height * Utils.getResponsiveSize(14),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
