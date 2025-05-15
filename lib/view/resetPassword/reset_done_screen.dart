import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/resetPassword/widget/login_button_widget.dart';
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
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(32),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  ImageAssets.imgResetDone,
                  height: Get.height * Utils.getResponsiveHeight(122),
                  width: Get.width * Utils.getResponsiveWidth(125),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(40)),
                Text(
                  'password_reset_successfully'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(24),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(9)),
                Text(
                  'password_reset_description'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(14),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(42)),
                LoginButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
