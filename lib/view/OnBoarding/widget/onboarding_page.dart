import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import 'package:url_launcher/url_launcher.dart';

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
            debugPrint('index : $index');
            return Column(
              children: [
                index == 0
                    ? SizedBox(
                      height: Utils.getResponsiveHeight(context, 430),
                      width: Utils.getResponsiveWidth(context, 430),
                      child: Image.asset(
                        onBoardingList.imagePath,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.topCenter,
                      ),
                    )
                    : SizedBox(
                      height: Utils.getResponsiveHeight(context, 350),
                      width: Utils.getResponsiveWidth(context, 350),
                      child: Center(
                        child: Image.asset(
                          onBoardingList.imagePath,
                          alignment: Alignment.topCenter,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                index == 0
                    ? SizedBox(height: Utils.getResponsiveHeight(context, 75))
                    : SizedBox(height: Utils.getResponsiveHeight(context, 155)),
                Text(
                  onBoardingList.title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Utils.getResponsiveSize(context, 24),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w800,
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 12)),
                Text(
                  onBoardingList.description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: Utils.getResponsiveSize(context, 14),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w400,
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 70)),
              ],
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Utils.getResponsiveWidth(context, 30),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: Utils.getResponsiveHeight(context, 350),
                  width: Utils.getResponsiveWidth(context, 350),
                  child: Center(
                    child: Image.asset(
                      onBoardingList.imagePath,
                      alignment: Alignment.topCenter,
                      height: Utils.getResponsiveHeight(context, 54),
                      width: Utils.getResponsiveWidth(context, 155),
                    ),
                  ),
                ),

                SizedBox(height: Utils.getResponsiveHeight(context, 155)),
                Text(
                  'are_you_client_or_recruiter'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Utils.getResponsiveSize(context, 24),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          openWebsite("https://sanad-eta.vercel.app");
                        },
                        child: Container(
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Utils.getResponsiveWidth(context, 17),
                              vertical: Utils.getResponsiveHeight(context, 17),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  height: Utils.getResponsiveHeight(
                                    context,
                                    34,
                                  ),
                                  width: Utils.getResponsiveWidth(context, 34),
                                  image: AssetImage(IconAssets.icCompany),
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                SizedBox(
                                  height: Utils.getResponsiveHeight(
                                    context,
                                    11,
                                  ),
                                ),
                                Text(
                                  'client'.tr,
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
                    ),
                    SizedBox(width: Utils.getResponsiveWidth(context, 16)),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(RoutesName.signUpScreen);
                        },
                        child: Container(
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Utils.getResponsiveWidth(context, 17),
                              vertical: Utils.getResponsiveHeight(context, 17),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image(
                                  height: Utils.getResponsiveHeight(
                                    context,
                                    34,
                                  ),
                                  width: Utils.getResponsiveWidth(context, 34),
                                  image: AssetImage(IconAssets.icRecruiter),
                                  color: Theme.of(context).iconTheme.color,
                                ),
                                SizedBox(
                                  height: Utils.getResponsiveHeight(
                                    context,
                                    11,
                                  ),
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
                    ),
                  ],
                ),
                SizedBox(height: Utils.getResponsiveHeight(context, 10)),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<void> openWebsite(String url) async {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri, mode: LaunchMode.inAppWebView);
  }
}
