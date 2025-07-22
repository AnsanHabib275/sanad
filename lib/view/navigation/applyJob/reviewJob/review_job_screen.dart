import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/view/navigation/applyJob/reviewJob/widget/back_button_widget.dart';
import 'package:sanad/view/navigation/applyJob/reviewJob/widget/submit_button_widget.dart';
import 'package:sanad/viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

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
  final isPrivate = Get.arguments['isPrivate'] ?? false;
  final jobName = Get.arguments['jobName'] ?? '';
  final companyName = Get.arguments['companyName'] ?? '';
  final location = Get.arguments['location'] ?? '';
  final jobType = Get.arguments['jobType'] ?? '';
  final salaryRange = Get.arguments['salaryRange'] ?? '';

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
                height: Utils.getResponsiveHeight(24),
                width: Utils.getResponsiveWidth(24),
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
              horizontal: Utils.getResponsiveWidth(16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  ReviewJobTabBar(),
                  SizedBox(height: Utils.getResponsiveHeight(24)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(8)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Utils.getResponsiveHeight(16),
                        horizontal: Utils.getResponsiveWidth(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                jobName,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(20),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                ),
                              ),
                              SizedBox(width: Utils.getResponsiveWidth(12)),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.containerBg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Utils.getResponsiveHeight(6),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(10),
                                    vertical: Utils.getResponsiveHeight(2),
                                  ),
                                  child: Text(
                                    isPrivate
                                        ? 'private_job'.tr
                                        : 'public_job'.tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(12),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Spacer(),
                              Image.asset(
                                IconAssets.icDisable,
                                height: Utils.getResponsiveHeight(24),
                                width: Utils.getResponsiveWidth(24),
                              ),
                              SizedBox(width: Utils.getResponsiveWidth(8)),
                              Image.asset(
                                IconAssets.icBookmark,
                                height: Utils.getResponsiveHeight(24),
                                width: Utils.getResponsiveWidth(24),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            companyName.toString(),
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          Text(
                            location.toString(),
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(24)),
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
                                      Utils.getResponsiveHeight(6),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(10),
                                    vertical: Utils.getResponsiveHeight(2),
                                  ),
                                  child: Text(
                                    jobType.toString(),
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(12),
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: Utils.getResponsiveWidth(8)),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.containerBg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Utils.getResponsiveHeight(6),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(10),
                                    vertical: Utils.getResponsiveHeight(2),
                                  ),
                                  child: Text(
                                    salaryRange.toString(),
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(12),
                                      fontFamily: 'Inter',
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(24)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(12)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Utils.getResponsiveHeight(16),
                        horizontal: Utils.getResponsiveWidth(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'cv'.tr,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
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
                                    fontSize: Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(Utils.getResponsiveHeight(8)),
                              ),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: Utils.getResponsiveWidth(16),
                                vertical: Utils.getResponsiveHeight(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    ImageAssets.imgPdf,
                                    height: Utils.getResponsiveHeight(32),
                                    width: Utils.getResponsiveWidth(32),
                                  ),
                                  SizedBox(width: Utils.getResponsiveWidth(7)),
                                  Text(
                                    'resume_name'.tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(11),
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
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(12)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                        vertical: Utils.getResponsiveHeight(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'are_you_open_to_relocating'.tr,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textSecondaryColor,
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
                                    fontSize: Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            'Open to Relocating',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(12)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                        vertical: Utils.getResponsiveHeight(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'software_programs_do_you_know'.tr,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textSecondaryColor,
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
                                    fontSize: Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            'Framer, Figma',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(12)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                        vertical: Utils.getResponsiveHeight(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'portfolio'.tr,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
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
                                    fontSize: Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            'have_a_portfolio',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(12)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                        vertical: Utils.getResponsiveHeight(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'certification'.tr,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
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
                                    fontSize: Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            'have_mentioned_certification',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            'Yes',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(12)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                        vertical: Utils.getResponsiveHeight(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Text(
                                'experience'.tr,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
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
                                    fontSize: Utils.getResponsiveSize(14),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            'how_many_years_of_experience',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(height: Utils.getResponsiveHeight(12)),
                          Text(
                            '5',
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [BackButtonWidget(), SubmitButtonWidget()],
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
