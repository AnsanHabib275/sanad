import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/models/onBoarding/on_boarding_list_model.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/OnBoarding/widget/next_button_widget.dart';
import 'package:sanad/view/OnBoarding/widget/onboarding_page.dart';
import 'package:sanad/viewModels/controller/onBoarding/onboarding_view_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final onBoardingVM = Get.put(OnBoardingViewModel());

  final List<OnBoardingListModel> tutorialPages = [
    OnBoardingListModel(
      ImageAssets.ob1,
      'ob_1_title'.tr,
      'ob_1_description'.tr,
    ),
    OnBoardingListModel(
      Get.isDarkMode ? ImageAssets.ob2Dark : ImageAssets.ob2,
      'ob_2_title'.tr,
      'ob_2_description'.tr,
    ),
    OnBoardingListModel(
      Get.isDarkMode ? ImageAssets.ob3Dark : ImageAssets.ob3,
      'ob_3_title'.tr,
      'ob_3_description'.tr,
    ),
    OnBoardingListModel(ImageAssets.appLogo, '', ''),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: AppColor.transparent,
        statusBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        statusBarBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.dark
                : Brightness.light,
        systemNavigationBarColor: Theme.of(context).secondaryHeaderColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: const TextScaler.linear(1)),
        // child: PopScope(
        //   canPop: false,
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Image.asset(
                  ImageAssets.onBoardingBg,
                  // height: Utils.getResponsiveHeight(context, 494),
                  // width: Utils.getResponsiveWidth(context, 744),
                  fit: BoxFit.cover, // Ensures full screen fill
                  alignment: Alignment.topCenter,
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  children: [
                    SizedBox(height: Utils.getResponsiveHeight(context, 32)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(
                              tutorialPages.length - 1,
                            );
                          },
                          child: Text(
                            'skip'.tr,
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(context, 16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.skipText,
                            ),
                          ),
                        ),
                        SizedBox(width: Utils.getResponsiveWidth(context, 16)),
                      ],
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: const ClampingScrollPhysics(),
                        controller: _pageController,
                        itemCount: tutorialPages.length,
                        onPageChanged: (int page) {
                          onBoardingVM.currentPage.value = page;
                        },
                        itemBuilder: (context, index) {
                          return OnBoardingPage(
                            onBoardingList: tutorialPages[index],
                            index: index,
                          );
                        },
                      ),
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          tutorialPages.length,
                          (index) => Container(
                            margin: EdgeInsets.only(
                              right: Utils.getResponsiveWidth(context, 5),
                            ),
                            width: Utils.getResponsiveWidth(context, 14),
                            height: Utils.getResponsiveHeight(context, 14),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    onBoardingVM.currentPage.value == index
                                        ? const AssetImage(
                                          ImageAssets.obPageSelected,
                                        )
                                        : const AssetImage(
                                          ImageAssets.obPageUnselected,
                                        ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: Utils.getResponsiveHeight(context, 40)),
                    Obx(() {
                      if (!(onBoardingVM.currentPage.value <
                          tutorialPages.length - 1)) {
                        return SizedBox(
                          height: Utils.getResponsiveHeight(context, 110),
                        );
                      }
                      return Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Utils.getResponsiveWidth(context, 30),
                            ),
                            child: NextButtonWidget(
                              pageController: _pageController,
                            ),
                          ),
                          SizedBox(
                            height: Utils.getResponsiveHeight(context, 70),
                          ),
                        ],
                      );
                    }),
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
