import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/changePassword/widget/login_button_widget.dart';

import '../../../res/assets/gif_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class ChangePasswordDoneScreen extends StatefulWidget {
  const ChangePasswordDoneScreen({super.key});

  @override
  State<ChangePasswordDoneScreen> createState() =>
      _ChangePasswordDoneScreenState();
}

class _ChangePasswordDoneScreenState extends State<ChangePasswordDoneScreen> {
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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  GifAssets.gifDoneAnimation,
                  height: Get.height * Utils.getResponsiveHeight(150),
                  width: Get.width * Utils.getResponsiveWidth(200),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(30)),
                Text(
                  'password_change_successfully'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.background,
                    fontSize: Get.height * Utils.getResponsiveSize(16),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(40)),
                LoginButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
