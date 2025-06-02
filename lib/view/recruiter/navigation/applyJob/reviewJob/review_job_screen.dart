import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/view/recruiter/navigation/applyJob/reviewJob/widget/back_button_widget.dart';
import 'package:sanad/view/recruiter/navigation/applyJob/reviewJob/widget/submit_button_widget.dart';
import 'package:sanad/viewModels/controller/recruiter/navigation/applyJob/apply_job_view_model.dart';
import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../res/assets/icon_assets.dart';
import '../../../../../res/assets/image_assets.dart';
import '../../../../../res/colors/app_color.dart';
import 'widget/review_job_tab_bar_widget.dart';

class ReviewJobScreen extends StatefulWidget {
  const ReviewJobScreen({super.key});

  @override
  State<ReviewJobScreen> createState() => _ReviewJobScreenState();
}

class _ReviewJobScreenState extends State<ReviewJobScreen> {
  final applyJobVM = Get.put(ApplyJobViewModel());

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
            title: Text('apply_job'.tr),
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  ReviewJobTabBar(),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(12),
                        ),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Get.height * Utils.getResponsiveHeight(16),
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'additional_requirements'.tr,
                                style: TextStyle(
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(RoutesName.applyJobScreen);
                                },
                                child: Text(
                                  'edit'.tr,
                                  style: TextStyle(
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
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
                                horizontal:
                                    Get.width * Utils.getResponsiveWidth(16),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageAssets.imgPdf,
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(32),
                                    width:
                                        Get.width *
                                        Utils.getResponsiveWidth(32),
                                  ),
                                  SizedBox(
                                    width:
                                        Get.width * Utils.getResponsiveWidth(7),
                                  ),
                                  Text(
                                    'resume_name'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(11),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w400,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Get.height * Utils.getResponsiveHeight(12),
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
                          Row(
                            children: [
                              Text(
                                'additional_requirements'.tr,
                                style: TextStyle(
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                ),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  Get.toNamed(
                                    RoutesName.additionalRequirementsJobScreen,
                                  );
                                },
                                child: Text(
                                  'edit'.tr,
                                  style: TextStyle(
                                    fontSize:
                                        Get.height *
                                        Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(16),
                          ),
                          Text(
                            'can_relocate'.tr,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(12),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          Text(
                            'can_you_relocate'.tr,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(16),
                          ),

                          Obx(() {
                            return Transform.translate(
                              offset: Offset(-12, -8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: applyJobVM.isCheckRelocate.value,
                                    onChanged: (bool? value) {
                                      applyJobVM.isCheckRelocate.value = value!;
                                    },
                                    activeColor:
                                        AppColor
                                            .primaryColor, // Color when checked
                                    checkColor: AppColor.secondaryIconDarkColor,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColor.primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        Get.height * Utils.getResponsiveSize(4),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'yes'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(32),
                          ),
                          Text(
                            'portfolio'.tr,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(12),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          Text(
                            'have_a_portfolio'.tr,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(16),
                          ),

                          Obx(() {
                            return Transform.translate(
                              offset: Offset(-12, -8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value: applyJobVM.isCheckPortfolio.value,
                                    onChanged: (bool? value) {
                                      applyJobVM.isCheckPortfolio.value =
                                          value!;
                                    },
                                    activeColor:
                                        AppColor
                                            .primaryColor, // Color when checked
                                    checkColor: AppColor.secondaryIconDarkColor,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColor.primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        Get.height * Utils.getResponsiveSize(4),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'yes'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(32),
                          ),
                          Text(
                            'certification'.tr,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(12),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          Text(
                            'have_mentioned_certification'.tr,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(16),
                          ),
                          Obx(() {
                            return Transform.translate(
                              offset: Offset(-12, -8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Checkbox(
                                    value:
                                        applyJobVM.isCheckCertification.value,
                                    onChanged: (bool? value) {
                                      applyJobVM.isCheckCertification.value =
                                          value!;
                                    },
                                    activeColor:
                                        AppColor
                                            .primaryColor, // Color when checked
                                    checkColor: AppColor.secondaryIconDarkColor,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                        color: AppColor.primaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(
                                        Get.height * Utils.getResponsiveSize(4),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'yes'.tr,
                                    style: TextStyle(
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(35),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              BackButtonWidget(),
                              SubmitButtonWidget(),
                            ],
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
      ),
    );
  }
}
