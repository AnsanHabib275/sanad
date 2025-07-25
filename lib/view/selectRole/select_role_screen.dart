import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
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
              horizontal: Utils.getResponsiveWidth(context, 30),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  height: Utils.getResponsiveHeight(context, 54),
                  width: Utils.getResponsiveWidth(context, 155),
                  image: AssetImage(ImageAssets.appLogo),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 50)),
                Text(
                  'are_you_company_or_recruiter'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Utils.getResponsiveSize(context, 24),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // move to web
                          // https://sanad-eta.vercel.app/
                        },
                        child: Container(
                          height: Utils.getResponsiveHeight(context, 108),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Utils.getResponsiveHeight(context, 8),
                              ),
                            ),
                            border: Border.all(
                              color: AppColor.borderSecondaryColor,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                height: Utils.getResponsiveHeight(context, 34),
                                width: Utils.getResponsiveWidth(context, 34),
                                image: AssetImage(IconAssets.icCompany),
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                height: Utils.getResponsiveHeight(context, 11),
                              ),
                              Text(
                                'company'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textSecondaryColor,
                                  fontSize: Utils.getResponsiveSize(
                                    context,
                                    20,
                                  ),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Utils.getResponsiveWidth(context, 16)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(RoutesName.signUpScreen);
                        },
                        child: Container(
                          height: Utils.getResponsiveHeight(context, 108),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Utils.getResponsiveHeight(context, 8),
                              ),
                            ),
                            border: Border.all(
                              color: AppColor.borderSecondaryColor,
                              width: 1.0,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image(
                                height: Utils.getResponsiveHeight(context, 34),
                                width: Utils.getResponsiveWidth(context, 34),
                                image: AssetImage(IconAssets.icRecruiter),
                                color: Theme.of(context).iconTheme.color,
                              ),
                              SizedBox(
                                height: Utils.getResponsiveHeight(context, 11),
                              ),
                              Text(
                                'recruiter'.tr,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textSecondaryColor,
                                  fontSize: Utils.getResponsiveSize(
                                    context,
                                    20,
                                  ),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
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
