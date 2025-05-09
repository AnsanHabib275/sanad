import 'package:sanad/res/assets/icon_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/profile/widget/no_button_widget.dart';
import 'package:sanad/view/navigation/profile/widget/yes_button_widget.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';
import '../../../res/routes/routes_name.dart';
import '../../../viewModels/controller/registerFirebaseToken/register_firebase_token_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userVM = Get.find<UserPreference>();
  final firebaseTokenVM = Get.put(RegisterFirebaseTokenViewModel());

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageAssets.bg),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(60)),
                Row(
                  children: [
                    Text(
                      'profile'.tr,
                      style: TextStyle(
                        color: AppColor.background,
                        fontSize: Get.height * Utils.getResponsiveSize(20),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        showLogoutDialog();
                      },
                      child: Image.asset(
                        IconAssets.icProfile,
                        height: Get.height * Utils.getResponsiveHeight(24),
                        width: Get.width * Utils.getResponsiveWidth(24),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.toNamed(RoutesName.editInformationScreen);
                          },
                          child: Container(
                            height: Get.height * Utils.getResponsiveHeight(55),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.transparent,
                              border: Border.all(
                                color: AppColor.extraDarkGrey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * Utils.getResponsiveSize(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    Get.height * Utils.getResponsiveHeight(20),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'my_job'.tr,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(16),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    IconAssets.icMyJob,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(24),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(15),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(RoutesName.changePasswordScreen);
                          },
                          child: Container(
                            height: Get.height * Utils.getResponsiveHeight(55),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.transparent,
                              border: Border.all(
                                color: AppColor.extraDarkGrey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * Utils.getResponsiveSize(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    Get.height * Utils.getResponsiveHeight(20),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'notifications'.tr,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(16),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    IconAssets.icNotifications,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(24),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(15),
                        ),
                        InkWell(
                          onTap: () {
                            // Get.toNamed(RoutesName.kycScreen);
                          },
                          child: Container(
                            height: Get.height * Utils.getResponsiveHeight(55),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.transparent,
                              border: Border.all(
                                color: AppColor.extraDarkGrey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * Utils.getResponsiveSize(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    Get.height * Utils.getResponsiveHeight(20),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'wallet'.tr,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(16),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    IconAssets.icWallet,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(24),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(15),
                        ),
                        InkWell(
                          onTap: () {
                            // Get.toNamed(RoutesName.faqsScreen);
                          },
                          child: Container(
                            height: Get.height * Utils.getResponsiveHeight(55),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.transparent,
                              border: Border.all(
                                color: AppColor.extraDarkGrey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * Utils.getResponsiveSize(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    Get.height * Utils.getResponsiveHeight(20),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'transactions'.tr,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(16),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    IconAssets.icTransactions,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(24),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(15),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: Get.height * Utils.getResponsiveHeight(55),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColor.transparent,
                              border: Border.all(
                                color: AppColor.extraDarkGrey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(
                                Get.height * Utils.getResponsiveSize(15),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    Get.height * Utils.getResponsiveHeight(20),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'payments_method'.tr,
                                    style: TextStyle(
                                      color: AppColor.grey,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(16),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Image.asset(
                                    IconAssets.icPayment,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(24),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(24),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(15),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showLogoutDialog() {
    Get.dialog(
      MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(1.0)),
        child: Dialog(
          backgroundColor: AppColor.dimBlack,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Get.height * Utils.getResponsiveSize(12),
            ),
          ),
          child: SizedBox(
            height: Get.height * Utils.getResponsiveHeight(250),
            width: Get.width * Utils.getResponsiveWidth(280),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(15),
                vertical: Get.height * Utils.getResponsiveHeight(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: Get.height * Utils.getResponsiveHeight(69),
                    width: Get.width * Utils.getResponsiveWidth(69),
                    IconAssets.icSignOut,
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(30)),
                  Text(
                    'are_you_sure_you_want_to_logout'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkGrey,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: YesButtonWidget()),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(11)),
                      Expanded(child: NoButtonWidget()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
