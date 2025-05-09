import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/home/widget/scan_now_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/assets/icon_assets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.bg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(62)),
                Row(
                  children: [
                    Image.asset(
                      ImageAssets.appLogo,
                      height: Get.height * Utils.getResponsiveHeight(44),
                      width: Get.width * Utils.getResponsiveWidth(190),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Image.asset(IconAssets.icEmail),
                      onPressed: () {
                        Get.toNamed(RoutesName.notificationScreen);
                      },
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(135)),
                Image.asset(ImageAssets.appLogo),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(30)),
                Text(
                  'tap_the_bellow_button_to_scan_the_product'.tr,
                  style: TextStyle(
                    color: AppColor.lightGrey,
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    fontSize: Get.height * Utils.getResponsiveSize(16),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                ScanNowButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
