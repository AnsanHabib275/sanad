import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../models/onBoarding/on_boarding_list_model.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/routes/routes_name.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingListModel onBoardingList;
  final int index;

  const OnBoardingPage({
    super.key,
    required this.onBoardingList,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (index != 3) {
            return Column(
              children: [
                Image.asset(
                  onBoardingList.imagePath,
                  height: Get.height * Utils.getResponsiveHeight(350),
                  width: Get.width * Utils.getResponsiveWidth(511),
                  fit: BoxFit.contain,
                  // color: Theme.of(context).iconTheme.color,
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(155)),
                Text(
                  onBoardingList.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.height * Utils.getResponsiveSize(24),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
                Text(
                  onBoardingList.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Get.height * Utils.getResponsiveSize(14),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(45)),
              ],
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(33),
            ),
            child: Column(
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(145)),
                Image.asset(
                  onBoardingList.imagePath,
                  height: Get.height * Utils.getResponsiveHeight(54),
                  width: Get.width * Utils.getResponsiveWidth(155),
                  // fit: BoxFit.contain,
                  // color: Theme.of(context).iconTheme.color,
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(299)),
                Text(
                  'are_you_client_or_recruiter'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(24),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          // move to web
                        },
                        child: Container(
                          height: Get.height * Utils.getResponsiveHeight(108),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Get.height * Utils.getResponsiveHeight(8),
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
                                'client'.tr,
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
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(16)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(RoutesName.signUpScreen);
                        },
                        child: Container(
                          height: Get.height * Utils.getResponsiveHeight(108),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Get.height * Utils.getResponsiveHeight(8),
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
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(95)),
              ],
            ),
          );
        },
      ),
    );
  }
}
