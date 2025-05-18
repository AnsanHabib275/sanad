import 'package:flutter/services.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/image_assets.dart';
import '../../viewModels/controller/navigation/notification/notification_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(RoutesName.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils.hideKeyboardGlobally();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: PopScope(
          canPop: false,
          child: Scaffold(
            backgroundColor: Theme.of(context).splashColor , //  .primaryColor,
            // backgroundColor: AppColor.logoColor,
            body: Stack(
              children: [
                Image(
                  height: Get.height * 1,
                  width: Get.width * 1,
                  image: AssetImage(ImageAssets.splashBg),
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: Get.width * Utils.getResponsiveWidth(110),
                  right: Get.width * Utils.getResponsiveWidth(110),
                  top: Get.height * Utils.getResponsiveHeight(430),
                  bottom: Get.height * Utils.getResponsiveHeight(430),
                  child: Image.asset(
                    ImageAssets.appLogoLarge,
                    width: Get.width * Utils.getResponsiveWidth(203),
                    height: Get.height * Utils.getResponsiveHeight(70),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
