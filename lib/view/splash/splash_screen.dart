import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/utils/utils.dart';

import '../../../res/assets/image_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        Get.offNamed(RoutesName.onBoardingScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Utils.hideKeyboardGlobally();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.light,
        statusBarBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.dark
                : Brightness.light,
        systemNavigationBarColor: Theme.of(context).primaryColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        child: Scaffold(
          backgroundColor: Theme.of(context).splashColor,
          body: Stack(
            children: [
              Image(
                height: Get.height * 1,
                width: Get.width * 1,
                image: AssetImage(ImageAssets.splashBg),
                fit: BoxFit.cover,
              ),
              Positioned(
                left: Utils.getResponsiveWidth(110),
                right: Utils.getResponsiveWidth(110),
                top: Utils.getResponsiveHeight(430),
                bottom: Utils.getResponsiveHeight(430),
                child: Image.asset(
                  ImageAssets.appLogoLarge,
                  width: Utils.getResponsiveWidth(203),
                  height: Utils.getResponsiveHeight(70),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // });
  }
}
