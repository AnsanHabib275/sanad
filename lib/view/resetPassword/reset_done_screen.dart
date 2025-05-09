import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/resetPassword/widget/login_button_widget.dart';

import '../../res/assets/gif_assets.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/utils.dart';

class ResetDoneScreen extends StatefulWidget {
  const ResetDoneScreen({super.key});

  @override
  State<ResetDoneScreen> createState() => _ResetDoneScreenState();
}

class _ResetDoneScreenState extends State<ResetDoneScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: PopScope(
        canPop: false,
        // onWillPop: () async {
        //   return false;
        // },
        child: Scaffold(
          body: Container(
            height: Get.height * 1,
            width: Get.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * Utils.getResponsiveWidth(25)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    GifAssets.gifDoneAnimation,
                    height: Get.height * Utils.getResponsiveHeight(150),
                    width: Get.width * Utils.getResponsiveWidth(200),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(30),
                  ),
                  Text(
                    'account_reset_successfully'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.background,
                      fontSize: Get.height * Utils.getResponsiveSize(16),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * Utils.getResponsiveHeight(40),
                  ),
                  LoginButtonWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
