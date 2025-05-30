import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/company/companySignup/individual/fillDetail/widget/continue_button_widget.dart';
import 'package:sanad/view/company/companySignup/individual/fillDetail/widget/input_first_name_widget.dart';
import 'package:sanad/view/company/companySignup/individual/fillDetail/widget/input_last_name_widget.dart';
import 'package:sanad/view/company/companySignup/individual/fillDetail/widget/input_mobile_number_widget.dart';
import 'package:sanad/view/company/companySignup/individual/fillDetail/widget/input_interested_industry_widget.dart';
import 'package:sanad/view/company/companySignup/individual/fillDetail/widget/input_tagline_widget.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../../res/assets/image_assets.dart';
import '../../../../../res/themes/app_themes.dart';

class CompanyIndividualSignUpFillDetailScreen extends StatefulWidget {
  const CompanyIndividualSignUpFillDetailScreen({super.key});

  @override
  State<CompanyIndividualSignUpFillDetailScreen> createState() =>
      _CompanyIndividualSignUpFillDetailScreenState();
}

class _CompanyIndividualSignUpFillDetailScreenState
    extends State<CompanyIndividualSignUpFillDetailScreen> {
  final signUpVM = Get.put(CompanySignUpViewModel());
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
              horizontal: Get.width * Utils.getResponsiveWidth(32),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(60)),
                  Image(
                    height: Get.height * Utils.getResponsiveHeight(27),
                    width: Get.width * Utils.getResponsiveWidth(77),
                    image: AssetImage(ImageAssets.appLogoSmall),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                  Text(
                    'please_fill_the_required_information'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                      fontSize: Get.height * Utils.getResponsiveSize(20),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                  Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(115),
                      width: Get.width * Utils.getResponsiveWidth(90),
                      child: InkWell(
                        onTap: () {
                          _showImageSourceDialog(context);
                        },
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                _showImageSourceDialog(context);
                              },
                              child: SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(85),
                                width: Get.width * Utils.getResponsiveWidth(85),
                                child: Obx(() {
                                  return CircleAvatar(
                                    radius:
                                        Get.height *
                                        Utils.getResponsiveSize(41),
                                    child:
                                        signUpVM.imagePath.isEmpty
                                            ? Image.asset(
                                              ImageAssets.imgDummyPicture,
                                              height:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(85),
                                              width:
                                                  Get.width *
                                                  Utils.getResponsiveWidth(85),
                                              fit: BoxFit.cover,
                                            )
                                            : ClipOval(
                                              child: Image.network(
                                                // File(updateProfileVM
                                                //     .filePath.value),
                                                signUpVM.imagePath.value,
                                                fit: BoxFit.cover,
                                                height:
                                                    Get.height *
                                                    Utils.getResponsiveHeight(
                                                      85,
                                                    ),
                                                width:
                                                    Get.width *
                                                    Utils.getResponsiveWidth(
                                                      85,
                                                    ),
                                                loadingBuilder: (
                                                  context,
                                                  child,
                                                  loadingProgress,
                                                ) {
                                                  if (loadingProgress == null) {
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
                                                                  (loadingProgress
                                                                          .expectedTotalBytes ??
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
                                                    ImageAssets.imgDummyPicture,
                                                    height:
                                                        Get.height *
                                                        Utils.getResponsiveHeight(
                                                          85,
                                                        ),
                                                    width:
                                                        Get.width *
                                                        Utils.getResponsiveWidth(
                                                          85,
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
                              height:
                                  Get.height * Utils.getResponsiveHeight(10),
                            ),
                            Text(
                              'upload_logo'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.textPrimaryColor,
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
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
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputFirstNameWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'last_name'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputLastNameWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'tagline'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputTaglineWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'phone_number'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputMobileNumberWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'interested_industry'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputInterestedIndustryWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                  ContinueButtonWidget(formKey: formKey),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(60)),
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
