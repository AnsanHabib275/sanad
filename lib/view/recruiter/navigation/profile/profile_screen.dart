import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/routes/routes_name.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../res/urls/app_url.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final userVM = Get.find<UserPreference>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: IconButton(
            icon: Image.asset(
              IconAssets.icArrowLeft,
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('profile'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Container(
                    height: Get.height * Utils.getResponsiveHeight(82),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(4),
                        ),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ListTile(
                            horizontalTitleGap:
                                Get.width * Utils.getResponsiveWidth(16),
                            leading: CircleAvatar(
                              radius: Get.height * Utils.getResponsiveSize(24),
                              child:
                                  userVM.userImageURL.isEmpty
                                      ?
                              Image.asset(
                                ImageAssets.imgDummyProfile,
                                height:
                                    Get.height * Utils.getResponsiveHeight(48),
                                width: Get.width * Utils.getResponsiveWidth(48),
                                fit: BoxFit.cover,
                              )
                                      : ClipOval(
                                        child: Image.network(
                                          AppUrl.baseUrl +
                                              userVM.userImageURL.value,
                                          height:
                                              Get.height *
                                              Utils.getResponsiveHeight(48),
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(48),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                            ),
                            title: Text(
                              // userVM.userFullName.value,
                              'Mohsin Noor',
                            ),
                            titleTextStyle: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(20),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                            subtitle: Text(
                              // userVM.userEmail.value,
                              'mohsinnoor@gmail.com',
                            ),
                            subtitleTextStyle: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textBodyColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(
                            Get.height * Utils.getResponsiveHeight(16),
                          ),
                          child: Container(
                            height: Get.height * Utils.getResponsiveHeight(32),
                            width: Get.width * Utils.getResponsiveWidth(32),
                            decoration: BoxDecoration(
                              color: Theme.of(context).extension<AppColors>()?.buttonBg,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  Get.height * Utils.getResponsiveHeight(9999),
                                ),
                              ),
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesName.editProfileScreen);
                              },
                              child: Image.asset(
                                IconAssets.icEditProfile,
                                height:
                                    Get.height * Utils.getResponsiveHeight(24),
                                width: Get.width * Utils.getResponsiveWidth(24),
                                color: Theme.of(context).iconTheme.color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'my_information'.tr,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontSize: Get.height * Utils.getResponsiveSize(18),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(8),
                        ),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                        vertical: Get.height * Utils.getResponsiveHeight(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height:
                                  Get.height *
                                  Utils.getResponsiveHeight(95),
                              width:
                                  Get.width *
                                  Utils.getResponsiveWidth(95),
                              child: Obx(() {
                                return CircleAvatar(
                                  radius:
                                      Get.height *
                                      Utils.getResponsiveSize(47),
                                  child:
                                      userVM.userImageURL.isEmpty
                                          ? Image.asset(
                                            ImageAssets.imgDummyPicture,
                                            height:
                                                Get.height *
                                                Utils.getResponsiveHeight(
                                                  95,
                                                ),
                                            width:
                                                Get.width *
                                                Utils.getResponsiveWidth(
                                                  95,
                                                ),
                                            fit: BoxFit.cover,
                                          )
                                          : ClipOval(
                                            child: Image.network(
                                              // File(updateProfileVM
                                              //     .filePath.value),
                                              userVM.userImageURL.value,
                                              // The selected or updated image path
                                              fit: BoxFit.cover,
                                              height:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(
                                                    95,
                                                  ),
                                              width:
                                                  Get.width *
                                                  Utils.getResponsiveWidth(
                                                    95,
                                                  ),
                                              loadingBuilder: (
                                                context,
                                                child,
                                                loadingProgress,
                                              ) {
                                                if (loadingProgress ==
                                                    null) {
                                                  return child;
                                                }
                                                return Center(
                                                  child: CircularProgressIndicator(
                                                    value:
                                                        loadingProgress
                                                                    .expectedTotalBytes !=
                                                                null
                                                            ? loadingProgress
                                                                    .cumulativeBytesLoaded /
                                                                (loadingProgress.expectedTotalBytes ??
                                                                    1)
                                                            : null,
                                                  ),
                                                );
                                              },
                                              errorBuilder: (
                                                context,
                                                error,
                                                stackTrace,
                                              ) {
                                                return Image.asset(
                                                  ImageAssets
                                                      .imgDummyPicture,
                                                  height:
                                                      Get.height *
                                                      Utils.getResponsiveHeight(
                                                        95,
                                                      ),
                                                  width:
                                                      Get.width *
                                                      Utils.getResponsiveWidth(
                                                        95,
                                                      ),
                                                  fit: BoxFit.cover,
                                                );
                                              },
                                            ),
                                          ),
                                );
                              }),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'first_name'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            'Mohsin',
                            // userVM.userFirstName.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'last_name'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            'Noor',
                            // userVM.userLastName.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'phone_number'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            '+1(234) 567 8900',
                            // '${userVM.userCountryCode.value}${userVM.userMobileNumber.value}',
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'email'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            'mohsinzapta@gmail.com',
                            // userVM.userEmail.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'street'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            'Jon St Park',
                            // userVM.userStreet.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'city_or_state'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            'Riyadh',
                            // userVM.userCity.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'postal_code'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            '123ABC',
                            // userVM.userPostalCode.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'country'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            'Pakistan',
                            // userVM.userCountry.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Text(
                            'tagline'.tr,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident',
                            // userVM.userDescription.value,
                            style: TextStyle(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(16),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(120)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
