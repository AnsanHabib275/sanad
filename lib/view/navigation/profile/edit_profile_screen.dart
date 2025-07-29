import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/profile/widget/input_city_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_company_size_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_country_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_email_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_first_name_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_interested_industry_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_last_name_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_mobile_number_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_organization_type_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_postal_code_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_street_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_tagline_widget.dart';
import 'package:sanad/view/navigation/profile/widget/input_website_widget.dart';
import 'package:sanad/view/navigation/profile/widget/update_button_widget.dart';
import 'package:sanad/viewModels/controller/navigation/updateProfile/update_profile_view_model.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/userPreference/user_preference_view_model.dart';

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
                height: Utils.getResponsiveHeight(context, 24),
                width: Utils.getResponsiveWidth(context, 24),
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
              horizontal: Utils.getResponsiveWidth(context, 30),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Text(
                    'my_information'.tr,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontSize: Utils.getResponsiveSize(context, 18),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Obx(() {
                          final hasLocalImage =
                              updateProfileVM.filePath.value.isNotEmpty;
                          final hasNetworkImage =
                              userVM.userImageURL.value.isNotEmpty;

                          return InkWell(
                            onTap: () {
                              _showImageSourceDialog(context);
                            },
                            child: SizedBox(
                              height: Utils.getResponsiveHeight(context, 112),
                              width: Utils.getResponsiveWidth(context, 102),
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      height: Utils.getResponsiveHeight(
                                        context,
                                        95,
                                      ),
                                      width: Utils.getResponsiveWidth(
                                        context,
                                        95,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                      ),
                                      clipBehavior: Clip.antiAlias,
                                      child:
                                          hasLocalImage
                                              ? Image.file(
                                                File(
                                                  updateProfileVM
                                                      .filePath
                                                      .value,
                                                ),
                                                fit: BoxFit.cover,
                                              )
                                              //     : hasNetworkImage
                                              //     ? CachedNetworkImage(
                                              //   imageUrl: userVM.userImageURL.value,
                                              //   fit: BoxFit.cover,
                                              //   placeholder: (context, url) => Center(
                                              //     child: CircularProgressIndicator(),
                                              //   ),
                                              //   errorWidget: (context, url, error) => Image.asset(
                                              //     ImageAssets.imgDummyPicture,
                                              //     fit: BoxFit.cover,
                                              //   ),
                                              // )
                                              : Image.asset(
                                                ImageAssets.imgDummyPicture,
                                                fit: BoxFit.cover,
                                              ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.zero,
                                      decoration: BoxDecoration(
                                        color: AppColor.addPhotoBgColor,
                                        borderRadius: BorderRadius.circular(
                                          Utils.getResponsiveHeight(
                                            context,
                                            16,
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Utils.getResponsiveWidth(
                                            context,
                                            18,
                                          ),
                                          vertical: Utils.getResponsiveHeight(
                                            context,
                                            9,
                                          ),
                                        ),
                                        child: Text(
                                          'add_photo'.tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: Utils.getResponsiveSize(
                                              context,
                                              12,
                                            ),
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
                          );
                        }),
                      ),
                      SizedBox(height: Utils.getResponsiveHeight(context, 24)),
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
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputFirstNameWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'last_name'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputLastNameWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'email'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputEmailWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'organization_type'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputOrganizationTypeWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'company_size_employees'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputCompanySizeWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'website'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputWebsiteWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'interested_industry'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputInterestedIndustryWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'tagline'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputTaglineWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'phone_number'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputMobileNumberWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'country'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputCountryWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'city_or_state'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputCityWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'street'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputStreetWidget(),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 16),
                            ),
                            Text(
                              'postal_code'.tr,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Utils.getResponsiveSize(context, 14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: Utils.getResponsiveHeight(context, 8),
                            ),
                            InputPostalCodeWidget(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 54)),
                  UpdateButtonWidget(formKey: formKey),
                  SizedBox(
                    height:
                        Platform.isIOS
                            ? Utils.getResponsiveHeight(context, 67)
                            : Utils.getResponsiveHeight(context, 47),
                  ),
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
