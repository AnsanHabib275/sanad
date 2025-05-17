import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
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
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          leading: IconButton(
            icon: Image.asset(IconAssets.icArrowLeft,
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('about'.tr),
          titleTextStyle: TextStyle(
            color: AppColor.textPrimaryColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            fontSize: Get.height * Utils.getResponsiveSize(24),
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColor.searchBarBorderColor,
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
                color: AppColor.textSecondaryColor,
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
