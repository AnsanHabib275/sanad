import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/applyJob/additionalRequirementJob/widget/back_button_widget.dart';
import 'package:sanad/view/navigation/applyJob/additionalRequirementJob/widget/input_experience_year_widget.dart';
import 'package:sanad/view/navigation/applyJob/additionalRequirementJob/widget/prefer_job_type_cart_widget.dart';
import 'package:sanad/view/navigation/applyJob/additionalRequirementJob/widget/software_program_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

import '../../../../../res/assets/icon_assets.dart';
import '../../../../../res/colors/app_color.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import 'widget/additional_requirement_job_tab_bar_widget.dart';
import 'widget/next_button_widget.dart';

class AdditionalRequirementsJobScreen extends StatefulWidget {
  const AdditionalRequirementsJobScreen({super.key});

  @override
  State<AdditionalRequirementsJobScreen> createState() =>
      _AdditionalRequirementsJobScreenState();
}

class _AdditionalRequirementsJobScreenState
    extends State<AdditionalRequirementsJobScreen> {
  final applyJobVM = Get.find<ApplyJobViewModel>();

  final isPrivate = Get.arguments['isPrivate'] ?? false;
  final jobName = Get.arguments['jobName'] ?? '';
  final companyName = Get.arguments['companyName'] ?? '';
  final location = Get.arguments['location'] ?? '';
  final jobType = Get.arguments['jobType'] ?? '';
  final salaryRange = Get.arguments['salaryRange'] ?? '';
  final List<String> preferJobType = Get.arguments['preferJobType'] ?? [];
  final List<String> softwarePrograms = Get.arguments['softwarePrograms'] ?? [];

  @override
  Widget build(BuildContext context) {
    final double jobContainerWidth = _calculateMaxTextWidthJob(
      preferJobType,
      context,
    );
    final double softwareContainerWidth = _calculateMaxTextWidthSoftware(
      softwarePrograms,
      context,
    );
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
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: Utils.getResponsiveHeight(16)),
                            AdditionalRequirementsJobTabBar(),
                            SizedBox(height: Utils.getResponsiveHeight(16)),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.cardBg,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          jobName,
                                          style: TextStyle(
                                            fontSize: Utils.getResponsiveSize(
                                              20,
                                            ),
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()
                                                    ?.textPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Utils.getResponsiveWidth(12),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()
                                                    ?.containerBg,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Utils.getResponsiveHeight(6),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Utils.getResponsiveWidth(10),
                                              vertical:
                                                  Utils.getResponsiveHeight(2),
                                            ),
                                            child: Text(
                                              isPrivate
                                                  ? 'private_job'.tr
                                                  : 'public_job'.tr,
                                              style: TextStyle(
                                                fontSize:
                                                    Utils.getResponsiveSize(12),
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
                                        SizedBox(
                                          width: Utils.getResponsiveWidth(8),
                                        ),
                                        Image.asset(
                                          IconAssets.icBookmark,
                                          height: Utils.getResponsiveHeight(24),
                                          width: Utils.getResponsiveWidth(24),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(12),
                                    ),
                                    Text(
                                      companyName.toString(),
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
                                    Text(
                                      location.toString(),
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
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(24),
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()
                                                    ?.containerBg,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Utils.getResponsiveHeight(6),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Utils.getResponsiveWidth(10),
                                              vertical:
                                                  Utils.getResponsiveHeight(2),
                                            ),
                                            child: Text(
                                              jobType.toString(),
                                              style: TextStyle(
                                                fontSize:
                                                    Utils.getResponsiveSize(12),
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
                                        SizedBox(
                                          width: Utils.getResponsiveWidth(8),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()
                                                    ?.containerBg,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Utils.getResponsiveHeight(6),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Utils.getResponsiveWidth(10),
                                              vertical:
                                                  Utils.getResponsiveHeight(2),
                                            ),
                                            child: Text(
                                              salaryRange.toString(),
                                              style: TextStyle(
                                                fontSize:
                                                    Utils.getResponsiveSize(12),
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
                            SizedBox(height: Utils.getResponsiveHeight(16)),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.cardBg,
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
                                  vertical: Utils.getResponsiveHeight(16),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'additional_requirements'.tr,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color:
                                            Theme.of(context)
                                                .extension<AppColors>()
                                                ?.textPrimaryColor,
                                        fontSize: Utils.getResponsiveSize(14),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(40),
                                    ),
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
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(24),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: jobContainerWidth,
                                      ),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: preferJobType.length,
                                        separatorBuilder:
                                            (context, index) => SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                12,
                                              ),
                                            ),
                                        itemBuilder: (context, index) {
                                          return PreferJobTypeCartWidget(
                                            preferJobType: preferJobType[index],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(56),
                                    ),
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
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(24),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: softwareContainerWidth,
                                      ),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: softwarePrograms.length,
                                        separatorBuilder:
                                            (context, index) => SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                12,
                                              ),
                                            ),
                                        itemBuilder: (context, index) {
                                          return SoftwareProgramCartWidget(
                                            softwareProgram:
                                                softwarePrograms[index],
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(32),
                                    ),
                                    Text(
                                      'portfolio'.tr,
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(12),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context)
                                                .extension<AppColors>()
                                                ?.textSecondaryColor,
                                      ),
                                    ),
                                    Text(
                                      'does_your_resume_have_a_portfolio'.tr,
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(14),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context)
                                                .extension<AppColors>()
                                                ?.textPrimaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(16),
                                    ),
                                    Obx(() {
                                      return Transform.translate(
                                        offset: Offset(-12, -8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Checkbox(
                                              value:
                                                  applyJobVM
                                                      .isCheckPortfolioNo
                                                      .value,
                                              onChanged: (bool? value) {
                                                applyJobVM
                                                    .isCheckPortfolioYes
                                                    .value = false;
                                                applyJobVM
                                                    .isCheckPortfolioNo
                                                    .value = true;
                                              },
                                              activeColor:
                                                  AppColor.primaryColor,
                                              // Color when checked
                                              checkColor:
                                                  AppColor
                                                      .secondaryIconDarkColor,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColor.primaryColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      Utils.getResponsiveSize(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: Offset(-8, 0),
                                              child: Text(
                                                'no'.tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      Utils.getResponsiveSize(
                                                        14,
                                                      ),
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(context)
                                                          .extension<
                                                            AppColors
                                                          >()
                                                          ?.textPrimaryColor,
                                                ),
                                              ),
                                            ),
                                            Checkbox(
                                              value:
                                                  applyJobVM
                                                      .isCheckPortfolioYes
                                                      .value,
                                              onChanged: (bool? value) {
                                                applyJobVM
                                                    .isCheckPortfolioYes
                                                    .value = true;
                                                applyJobVM
                                                    .isCheckPortfolioNo
                                                    .value = false;
                                              },
                                              activeColor:
                                                  AppColor.primaryColor,
                                              // Color when checked
                                              checkColor:
                                                  AppColor
                                                      .secondaryIconDarkColor,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColor.primaryColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      Utils.getResponsiveSize(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: Offset(-8, 0),
                                              child: Text(
                                                'yes'.tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      Utils.getResponsiveSize(
                                                        14,
                                                      ),
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(context)
                                                          .extension<
                                                            AppColors
                                                          >()
                                                          ?.textPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(32),
                                    ),
                                    Text(
                                      'certification'.tr,
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(12),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context)
                                                .extension<AppColors>()
                                                ?.textSecondaryColor,
                                      ),
                                    ),
                                    Text(
                                      'do_you_have_mentioned_certification'.tr,
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(14),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Theme.of(context)
                                                .extension<AppColors>()
                                                ?.textPrimaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(16),
                                    ),
                                    Obx(() {
                                      return Transform.translate(
                                        offset: Offset(-12, -8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Checkbox(
                                              value:
                                                  applyJobVM
                                                      .isCheckCertificationNo
                                                      .value,
                                              onChanged: (bool? value) {
                                                applyJobVM
                                                    .isCheckCertificationYes
                                                    .value = false;
                                                applyJobVM
                                                    .isCheckCertificationNo
                                                    .value = true;
                                              },
                                              activeColor:
                                                  AppColor.primaryColor,
                                              // Color when checked
                                              checkColor:
                                                  AppColor
                                                      .secondaryIconDarkColor,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColor.primaryColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      Utils.getResponsiveSize(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: Offset(-8, 0),
                                              child: Text(
                                                'no'.tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      Utils.getResponsiveSize(
                                                        14,
                                                      ),
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(context)
                                                          .extension<
                                                            AppColors
                                                          >()
                                                          ?.textPrimaryColor,
                                                ),
                                              ),
                                            ),
                                            Checkbox(
                                              value:
                                                  applyJobVM
                                                      .isCheckCertificationYes
                                                      .value,
                                              onChanged: (bool? value) {
                                                applyJobVM
                                                    .isCheckCertificationYes
                                                    .value = true;
                                                applyJobVM
                                                    .isCheckCertificationNo
                                                    .value = false;
                                              },
                                              activeColor:
                                                  AppColor.primaryColor,
                                              // Color when checked
                                              checkColor:
                                                  AppColor
                                                      .secondaryIconDarkColor,
                                              shape: RoundedRectangleBorder(
                                                side: BorderSide(
                                                  color: AppColor.primaryColor,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                      Utils.getResponsiveSize(
                                                        4,
                                                      ),
                                                    ),
                                              ),
                                            ),
                                            Transform.translate(
                                              offset: Offset(-8, 0),
                                              child: Text(
                                                'yes'.tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      Utils.getResponsiveSize(
                                                        14,
                                                      ),
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(context)
                                                          .extension<
                                                            AppColors
                                                          >()
                                                          ?.textPrimaryColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(
                                              context,
                                            ).extension<AppColors>()?.cardBg,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Utils.getResponsiveHeight(8),
                                          ),
                                        ),
                                        border: Border.all(
                                          color: Theme.of(context).dividerColor,
                                          width: 1.0,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: Utils.getResponsiveWidth(
                                            16,
                                          ),
                                          vertical: Utils.getResponsiveHeight(
                                            16,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                8,
                                              ),
                                            ),
                                            Text(
                                              'how_many_years_of_experience'.tr,
                                              style: TextStyle(
                                                fontSize:
                                                    Utils.getResponsiveSize(14),
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                              ),
                                            ),
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                20,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 36,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        InputExperienceYearWidget(),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Utils.getResponsiveWidth(
                                                          100,
                                                        ),
                                                  ),
                                                  Container(
                                                    width:
                                                        Utils.getResponsiveWidth(
                                                          68,
                                                        ),
                                                    height:
                                                        Utils.getResponsiveHeight(
                                                          38,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          Theme.of(context)
                                                              .extension<
                                                                AppColors
                                                              >()
                                                              ?.bg,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                            Radius.circular(
                                                              Utils.getResponsiveHeight(
                                                                8,
                                                              ),
                                                            ),
                                                          ),
                                                      border: Border.all(
                                                        color:
                                                            Theme.of(
                                                              context,
                                                            ).dividerColor,
                                                        width: 1.0,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal:
                                                            Utils.getResponsiveWidth(
                                                              16,
                                                            ),
                                                        vertical:
                                                            Utils.getResponsiveHeight(
                                                              8,
                                                            ),
                                                      ),
                                                      child: Text(
                                                        'year'.tr,
                                                        style: TextStyle(
                                                          fontSize:
                                                              Utils.getResponsiveSize(
                                                                14,
                                                              ),
                                                          fontFamily: 'Manrope',
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color:
                                                              AppColor
                                                                  .textSecondaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: Utils.getResponsiveHeight(16),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        BackButtonWidget(),
                                        NextButtonWidget(),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: Utils.getResponsiveHeight(20)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  double _calculateMaxTextWidthJob(List<String> texts, BuildContext context) {
    double maxWidth = 0;
    final textStyle = TextStyle(
      fontSize: Utils.getResponsiveSize(14),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    );

    for (String text in texts) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final double textWidth =
          textPainter.width + (Utils.getResponsiveWidth(14) * 3); // Add padding

      if (textWidth > maxWidth) {
        maxWidth = textWidth;
      }
    }
    return maxWidth;
  }

  double _calculateMaxTextWidthSoftware(
    List<String> texts,
    BuildContext context,
  ) {
    double maxWidth = 0;
    final textStyle = TextStyle(
      fontSize: Utils.getResponsiveSize(14),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    );

    for (String text in texts) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final double textWidth =
          textPainter.width + (Utils.getResponsiveWidth(14) * 3); // Add padding

      if (textWidth > maxWidth) {
        maxWidth = textWidth;
      }
    }
    return maxWidth;
  }
}
