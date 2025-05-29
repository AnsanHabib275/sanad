import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/company/companySignup/agency/fillDetail/widget/continue_button_widget.dart';
import 'package:sanad/view/company/companySignup/agency/fillDetail/widget/input_agency_name_widget.dart';
import 'package:sanad/view/company/companySignup/agency/fillDetail/widget/input_mobile_number_widget.dart';
import 'package:sanad/view/company/companySignup/agency/fillDetail/widget/input_organization_type_widget.dart';
import 'package:sanad/view/company/companySignup/agency/fillDetail/widget/input_tagline_widget.dart';
import 'package:sanad/view/company/companySignup/agency/fillDetail/widget/input_website_widget.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../../res/assets/image_assets.dart';
import '../../../../../res/themes/app_themes.dart';


class CompanyAgencySignUpFillDetailScreen extends StatefulWidget {
  const CompanyAgencySignUpFillDetailScreen({super.key});

  @override
  State<CompanyAgencySignUpFillDetailScreen> createState() => _CompanyAgencySignUpFillDetailScreenState();
}

class _CompanyAgencySignUpFillDetailScreenState extends State<CompanyAgencySignUpFillDetailScreen> {
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
                      height: Get.height * Utils.getResponsiveHeight(112),
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
                                Get.height *
                                    Utils.getResponsiveHeight(85),
                                width:
                                Get.width * Utils.getResponsiveWidth(85),
                                child: Obx(() {
                                  return CircleAvatar(
                                    radius:
                                    Get.height *
                                        Utils.getResponsiveSize(42),
                                    child:
                                    signUpVM.imagePath.isEmpty
                                        ? Image.asset(
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
                                            ImageAssets
                                                .imgDummyPicture,
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
                            SizedBox(height: Get.height * Utils.getResponsiveHeight(11)),
                            Text(
                              'upload_logo'.tr,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                                fontSize: Get.height * Utils.getResponsiveSize(14),
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
                          'agency_name'.tr,
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
                        InputAgencyNameWidget(),
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
                          'website'.tr,
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
                        InputWebsiteWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'organization_type'.tr,
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
                        InputOrganizationTypeWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'company_size'.tr,
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
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.containerBg,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    Get.height * Utils.getResponsiveHeight(8),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Get.width * Utils.getResponsiveWidth(12),
                                  vertical:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                child: Text(
                                  'self_employed'.tr,
                                  style: TextStyle(
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(12),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(8),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.containerBg,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    Get.height * Utils.getResponsiveHeight(8),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Get.width * Utils.getResponsiveWidth(12),
                                  vertical:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                child: Text(
                                  'two_to_ten'.tr,
                                  style: TextStyle(
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(12),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(8),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.containerBg,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    Get.height * Utils.getResponsiveHeight(8),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Get.width * Utils.getResponsiveWidth(12),
                                  vertical:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                child: Text(
                                  'eleven_to_fifty'.tr,
                                  style: TextStyle(
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(12),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Get.width * Utils.getResponsiveWidth(8),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.containerBg,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(
                                    Get.height * Utils.getResponsiveHeight(8),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Get.width * Utils.getResponsiveWidth(12),
                                  vertical:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                child: Text(
                                  'fifty_one_to_two_hundred'.tr,
                                  style: TextStyle(
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(12),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                        Container(
                          decoration: BoxDecoration(
                            color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.containerBg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                Get.height * Utils.getResponsiveHeight(8),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                              Get.width * Utils.getResponsiveWidth(12),
                              vertical:
                              Get.height * Utils.getResponsiveHeight(8),
                            ),
                            child: Text(
                              'two_hundred_one_to_five_hundred'.tr,
                              style: TextStyle(
                                fontSize:
                                Get.height *
                                    Utils.getResponsiveSize(12),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                color:
                                Theme.of(context)
                                    .extension<AppColors>()
                                    ?.textPrimaryColor,
                              ),
                            ),
                          ),
                        ),
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
