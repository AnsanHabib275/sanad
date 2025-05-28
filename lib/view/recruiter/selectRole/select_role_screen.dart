import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/utils/utils.dart';

import '../../../res/assets/image_assets.dart';
import '../../../res/themes/app_themes.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      // child: PopScope(
      // canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(32),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: Get.height * Utils.getResponsiveHeight(54),
                  width: Get.width * Utils.getResponsiveWidth(155),
                  image: AssetImage(ImageAssets.appLogo),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(50)),
                Text(
                  'are_you_company_or_recruiter'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(24),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Get.toNamed(RoutesName.signUpScreen);
                      },
                      child: Container(
                        height: Get.height * Utils.getResponsiveHeight(108),
                        width: Get.width * Utils.getResponsiveWidth(174),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ),
                          border: Border.all(
                            color:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.border!.borderSide.color,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              height:
                                  Get.height * Utils.getResponsiveHeight(34),
                              width: Get.width * Utils.getResponsiveWidth(34),
                              image: AssetImage(IconAssets.icCompany),
                              color: Theme.of(context).iconTheme.color,
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(11),
                            ),
                            Text(
                              'company'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textSecondaryColor,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(16)),
                    InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.signUpIndividualScreen);
                      },
                      child: Container(
                        height: Get.height * Utils.getResponsiveHeight(108),
                        width: Get.width * Utils.getResponsiveWidth(174),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ),
                          border: Border.all(
                            color:
                                Theme.of(
                                  context,
                                ).inputDecorationTheme.border!.borderSide.color,
                            width: 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                              height:
                                  Get.height * Utils.getResponsiveHeight(34),
                              width: Get.width * Utils.getResponsiveWidth(34),
                              image: AssetImage(IconAssets.icRecruiter),
                              color: Theme.of(context).iconTheme.color,
                            ),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(11),
                            ),
                            Text(
                              'recruiter'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textSecondaryColor,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(20),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
