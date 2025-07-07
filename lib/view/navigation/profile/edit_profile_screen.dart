import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/profile/widget/input_city_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_country_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_tagline_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_first_name_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_last_name_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_postal_code_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_street_widget.dart';
import 'package:sanad/view/navigation/profile/widget/update_button_widget.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import 'package:sanad/viewModels/controller/navigation/updateProfile/update_profile_view_model.dart';
import 'widget/input_email_widget.dart';
import 'widget/input_mobile_number_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final updateProfileVM = Get.put(UpdateProfileViewModel());
  final userVM = Get.find<UserPreference>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
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
            title: Text('edit_profile'.tr),
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
            shape: Border(
              bottom: BorderSide(
                color: Theme.of(context).dividerColor,
                width: 1.0,
              ),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(112),
                              width: Get.width * Utils.getResponsiveWidth(102),
                              child: InkWell(
                                onTap: () {
                                  _showImageSourceDialog(context);
                                },
                                child: Stack(
                                  children: [
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: InkWell(
                                        onTap: () {
                                          _showImageSourceDialog(context);
                                        },
                                        child: SizedBox(
                                          height:
                                              Get.height *
                                              Utils.getResponsiveHeight(95),
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(95),
                                          child: Obx(() {
                                            return CircleAvatar(
                                              child:
                                                  userVM.userImageURL.isNotEmpty
                                                      ? Image.asset(
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
                                                      )
                                                      : ClipOval(
                                                        child: Image.file(
                                                          File(
                                                            updateProfileVM
                                                                .filePath
                                                                .value,
                                                          ),
                                                          // userVM
                                                          //     .userImageURL
                                                          //     .value,
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
                                                          // loadingBuilder: (
                                                          //   context,
                                                          //   child,
                                                          //   loadingProgress,
                                                          // ) {
                                                          //   if (loadingProgress ==
                                                          //       null) {
                                                          //     return child;
                                                          //   }
                                                          //   return Center(
                                                          //     child: CircularProgressIndicator(
                                                          //       value:
                                                          //           loadingProgress
                                                          //                       .expectedTotalBytes !=
                                                          //                   null
                                                          //               ? loadingProgress
                                                          //                       .cumulativeBytesLoaded /
                                                          //                   (loadingProgress.expectedTotalBytes ??
                                                          //                       1)
                                                          //               : null,
                                                          //     ),
                                                          //   );
                                                          // },
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
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      left: 0,
                                      right: 0,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.addPhotoBgColor,
                                          borderRadius: BorderRadius.circular(
                                            Get.height *
                                                Utils.getResponsiveHeight(16),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal:
                                                Get.width *
                                                Utils.getResponsiveWidth(18),
                                            vertical:
                                                Get.height *
                                                Utils.getResponsiveHeight(9),
                                          ),
                                          child: Text(
                                            'add_photo'.tr,
                                            style: TextStyle(
                                              fontSize:
                                                  Get.height *
                                                  Utils.getResponsiveSize(12),
                                              fontFamily: 'Manrope',
                                              fontWeight: FontWeight.w600,
                                              color: AppColor.blackColor,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
                          ),
                          Form(
                            key: formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'first_name'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputFirstNameWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'last_name'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputLastNameWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'phone_number'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputMobileNumberWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'email'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputEmailWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'street'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputStreetWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'city_or_state'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputCityWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'postal_code'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputPostalCodeWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'country'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputCountryWidget(),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Text(
                                  'tagline'.tr,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                InputTaglineWidget(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(54)),
                  UpdateButtonWidget(formKey: formKey),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(47)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _showImageSourceDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('select_image_source'.tr),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text('camera'.tr),
                onTap: () {
                  Get.back();
                  updateProfileVM.getImageFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text('gallery'.tr),
                onTap: () {
                  Get.back();
                  updateProfileVM.getImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
