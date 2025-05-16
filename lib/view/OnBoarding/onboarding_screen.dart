import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/OnBoarding/widget/next_button_widget.dart';
import 'package:sanad/view/OnBoarding/widget/onboarding_page.dart';
import 'package:sanad/viewModels/controller/onBoarding/onboarding_view_model.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';
import '../../models/onBoarding/on_boarding_list_model.dart';
import '../../res/colors/app_color.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final onBoardingVM = Get.put(OnBoardingViewModel());
  final userVM = Get.put(UserPreference());

  final List<OnBoardingListModel> tutorialPages = [
    OnBoardingListModel(
      ImageAssets.ob1,
      'ob_1_title'.tr,
      'ob_1_description'.tr,
    ),
    OnBoardingListModel(
      ImageAssets.ob2,
      'ob_2_title'.tr,
      'ob_2_description'.tr,
    ),
    OnBoardingListModel(
      ImageAssets.ob3,
      'ob_3_title'.tr,
      'ob_3_description'.tr,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
        systemNavigationBarIconBrightness:
            Theme.of(context).brightness == Brightness.dark
                ? Brightness.light
                : Brightness.dark,
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
        // child: PopScope(
        //   canPop: false,
        child: Scaffold(
          body: Stack(
            children: [
              Positioned(
                top: -250,
                left: -157,
                right: -157,
                child: Image.asset(
                  ImageAssets.onBoardingBg,
                  height: Get.height * Utils.getResponsiveHeight(744),
                  width: Get.width * Utils.getResponsiveWidth(744),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(32),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            _pageController.jumpToPage(
                              tutorialPages.length - 1,
                            );
                          },
                          child: Text(
                            'skip'.tr,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w400,
                              color: AppColor.darkGrey,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * Utils.getResponsiveWidth(16),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(40),
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: _pageController,
                        itemCount: tutorialPages.length,
                        onPageChanged: (int page) {
                          onBoardingVM.currentPage.value = page;
                        },
                        itemBuilder: (context, index) {
                          return OnBoardingPage(
                            onBoardingList: tutorialPages[index],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(47),
                    ),
                    Obx(() {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: List.generate(
                          tutorialPages.length,
                          (index) => Container(
                            margin: EdgeInsets.symmetric(
                              horizontal:
                                  Get.width * Utils.getResponsiveWidth(5),
                            ),
                            width: Get.width * Utils.getResponsiveWidth(10),
                            height: Get.height * Utils.getResponsiveHeight(10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image:
                                    onBoardingVM.currentPage.value == index
                                        ? AssetImage(ImageAssets.obPageSelected)
                                        : AssetImage(
                                          ImageAssets.obPageUnselected,
                                        ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(70),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(32),
                      ),
                      child: NextButtonWidget(pageController: _pageController),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(70),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
