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
          return Column(
            children: [
              Expanded(
                child: Image.asset(
                  onBoardingList.imagePath,
                  height: Utils.getResponsiveHeight(context, 495),
                  width: Utils.getResponsiveWidth(context, 430),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(height: Utils.getResponsiveHeight(context, 30)),
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
              index != 3
                  ? Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                    ],
                  )
                  : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(context, 30),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: Utils.getResponsiveHeight(context, 12),
                        ),
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
                                      horizontal: Utils.getResponsiveWidth(
                                        context,
                                        16,
                                      ),
                                      vertical: Utils.getResponsiveHeight(
                                        context,
                                        16,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image(
                                          height: Utils.getResponsiveHeight(
                                            context,
                                            34,
                                          ),
                                          width: Utils.getResponsiveWidth(
                                            context,
                                            34,
                                          ),
                                          image: AssetImage(
                                            IconAssets.icCompany,
                                          ),
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.011,
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
                            SizedBox(
                              width: Utils.getResponsiveWidth(context, 16),
                            ),
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
                                      horizontal: Utils.getResponsiveWidth(
                                        context,
                                        16,
                                      ),
                                      vertical: Utils.getResponsiveHeight(
                                        context,
                                        16,
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Image(
                                          height: Utils.getResponsiveHeight(
                                            context,
                                            34,
                                          ),
                                          width: Utils.getResponsiveWidth(
                                            context,
                                            34,
                                          ),
                                          image: AssetImage(
                                            IconAssets.icRecruiter,
                                          ),
                                          color:
                                              Theme.of(context).iconTheme.color,
                                        ),
                                        SizedBox(
                                          height:
                                              MediaQuery.of(
                                                context,
                                              ).size.height *
                                              0.011,
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
                      ],
                    ),
                  ),
              SizedBox(height: Utils.getResponsiveHeight(context, 30)),
            ],
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
