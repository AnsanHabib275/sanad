import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/signup/individual/widget/continue_button_widget.dart';
import 'package:sanad/view/signup/individual/widget/input_email_widget.dart';
import 'package:sanad/view/signup/individual/widget/input_first_name_widget.dart';
import 'package:sanad/view/signup/individual/widget/input_last_name_widget.dart';
import 'package:sanad/view/signup/individual/widget/input_tagline_widget.dart';

import '../../../../res/assets/image_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../viewModels/controller/signup/individual/sign_up_view_model.dart';

class IndividualSignUpScreen extends StatefulWidget {
  const IndividualSignUpScreen({super.key});

  @override
  State<IndividualSignUpScreen> createState() => _IndividualSignUpScreenState();
}

class _IndividualSignUpScreenState extends State<IndividualSignUpScreen> {
  final signUpVM = Get.put(SignUpViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      // child: PopScope(
      // canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Utils.getResponsiveWidth(context, 30),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Utils.getResponsiveHeight(context, 60)),
                  Image(
                    height: Utils.getResponsiveHeight(context, 27),
                    width: Utils.getResponsiveWidth(context, 77),
                    image: AssetImage(ImageAssets.appLogoSmall),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 24)),
                  Text(
                    'please_fill_the_required_information'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontSize: Utils.getResponsiveSize(context, 20),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 38)),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: Utils.getResponsiveHeight(context, 110),
                      width: Utils.getResponsiveWidth(context, 102),
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
                              child: Obx(() {
                                return Container(
                                  height: Utils.getResponsiveHeight(
                                    context,
                                    95,
                                  ),
                                  width: Utils.getResponsiveWidth(context, 95),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child:
                                      signUpVM.filePath.isEmpty
                                          ? Image.asset(
                                            ImageAssets.imgDummyPicture,
                                            fit: BoxFit.cover,
                                          )
                                          : Image.file(
                                            File(signUpVM.filePath.value),
                                            fit: BoxFit.cover,
                                            errorBuilder: (
                                              context,
                                              error,
                                              stackTrace,
                                            ) {
                                              return Image.asset(
                                                ImageAssets.imgDummyPicture,
                                                fit: BoxFit.cover,
                                              );
                                            },
                                          ),
                                );
                              }),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.addPhotoBgColor,
                                  borderRadius: BorderRadius.circular(
                                    Utils.getResponsiveHeight(context, 16),
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
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
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
                        SizedBox(height: Utils.getResponsiveHeight(context, 8)),
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
                        SizedBox(height: Utils.getResponsiveHeight(context, 8)),
                        InputLastNameWidget(),
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
                        SizedBox(height: Utils.getResponsiveHeight(context, 8)),
                        InputTaglineWidget(),
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
                        SizedBox(height: Utils.getResponsiveHeight(context, 8)),
                        InputEmailWidget(),
                        SizedBox(
                          height: Utils.getResponsiveHeight(context, 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 121)),
                  ContinueButtonWidget(formKey: formKey),
                  SizedBox(height: Utils.getResponsiveHeight(context, 100)),
                ],
              ),
            ),
          ),
        ),
      ),
      // ),
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
                  signUpVM.getImageFromCamera();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo),
                title: Text('gallery'.tr),
                onTap: () {
                  Get.back();
                  signUpVM.getImageFromGallery();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
