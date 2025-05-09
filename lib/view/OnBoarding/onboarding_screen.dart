import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/OnBoarding/widget/sign_up_button_widget.dart';
import 'package:sanad/view/OnBoarding/widget/onboarding_page.dart';
import 'package:sanad/viewModels/controller/onBoarding/onboarding_view_model.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';
import '../../models/onBoarding/on_boarding_list_model.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';

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
    OnBoardingListModel(ImageAssets.appLogo, 'scan'.tr, 'tp_1_description'.tr),
    OnBoardingListModel(
      ImageAssets.appLogo,
      'verify'.tr,
      'tp_2_description'.tr,
    ),
    OnBoardingListModel(
      ImageAssets.appLogo,
      'report_counterfeits'.tr,
      'tp_3_description'.tr,
    ),
    OnBoardingListModel(
      ImageAssets.appLogo,
      'earn_rewards'.tr,
      'tp_4_description'.tr,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1)),
      child: PopScope(
        canPop: false,
        child: Scaffold(
          body: Container(
            height: Get.height * 1,
            width: Get.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(80)),
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
                SizedBox(height: Get.height * Utils.getResponsiveHeight(35)),
                Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                      tutorialPages.length,
                      (index) => Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: Get.width * Utils.getResponsiveWidth(4),
                        ),
                        width:
                            onBoardingVM.currentPage.value == index
                                ? Get.width * Utils.getResponsiveWidth(20)
                                : Get.width * Utils.getResponsiveWidth(12),
                        height: Get.height * Utils.getResponsiveHeight(8),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image:
                                onBoardingVM.currentPage.value == index
                                    ? AssetImage(ImageAssets.appLogo)
                                    : AssetImage(ImageAssets.appLogo),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Get.width * Utils.getResponsiveWidth(20),
                  ),
                  child: Obx(() {
                    return SizedBox(
                      child:
                          onBoardingVM.currentPage.value <
                                  tutorialPages.length - 1
                              ? Column(
                                children: [
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(52),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
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
                                                Get.height *
                                                Utils.getResponsiveSize(14),
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w500,
                                            color: AppColor.darkGrey,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          if (onBoardingVM.currentPage.value <
                                              tutorialPages.length - 1) {
                                            _pageController.nextPage(
                                              duration: const Duration(
                                                milliseconds: 100,
                                              ),
                                              curve: Curves.linear,
                                            );
                                          }
                                        },
                                        child: Image.asset(
                                          ImageAssets.appLogo,
                                          height:
                                              Get.height *
                                              Utils.getResponsiveHeight(50),
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(113),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(55),
                                  ),
                                ],
                              )
                              : Column(
                                children: [
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(52),
                                  ),
                                  SignUpButtonWidget(),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'already_have_an_account'.tr,
                                        textScaler: TextScaler.linear(1),
                                        style: TextStyle(
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w400,
                                          fontSize:
                                              Get.height *
                                              Utils.getResponsiveSize(14),
                                          color: AppColor.darkGrey,
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            Get.width *
                                            Utils.getResponsiveWidth(5),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          userVM.saveFirstUse(false).then((
                                            value,
                                          ) {
                                            Get.delete<OnBoardingViewModel>();
                                            Get.offAllNamed(
                                              RoutesName.loginScreen,
                                            );
                                          });
                                        },
                                        child: Text(
                                          'sign_in'.tr,
                                          style: TextStyle(
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w500,
                                            fontSize:
                                                Get.height *
                                                Utils.getResponsiveSize(14),
                                            color: AppColor.orange,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(19),
                                  ),
                                ],
                              ),
                    );
                  }),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.appLogo,
                      height: Get.height * Utils.getResponsiveHeight(20),
                      width: Get.width * Utils.getResponsiveWidth(25),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                    Text(
                      'powered_by_blockchain'.tr,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(12),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
                        color: AppColor.background,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(42)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
