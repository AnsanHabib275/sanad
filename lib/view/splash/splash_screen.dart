import 'package:sanad/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/splash/widget/get_started_button_widget.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../viewModels/controller/navigation/notification/notification_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    Utils.hideKeyboardGlobally();
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Stack(
            children: [
              Image(
                height: Get.height * 1,
                width: Get.width * 1,
                image: AssetImage(ImageAssets.bg),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: Get.width * Utils.getResponsiveWidth(50),
                right: Get.width * Utils.getResponsiveWidth(50),
                top: Get.height * Utils.getResponsiveHeight(286),
                bottom: Get.height * Utils.getResponsiveHeight(460),
                child: Image.asset(
                  ImageAssets.appLogo,
                  width: Get.width * Utils.getResponsiveWidth(264),
                  height: Get.height * Utils.getResponsiveHeight(62),
                ),
              ),
              Positioned(
                left: Get.width * Utils.getResponsiveWidth(20),
                right: Get.width * Utils.getResponsiveWidth(20),
                bottom: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'splash_description'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                        color: AppColor.darkGrey,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(20),
                    ),
                    GetStartedButtonWidget(),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(20),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
