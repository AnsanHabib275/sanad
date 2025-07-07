import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/applyJob/additionalRequirementJob/widget/back_button_widget.dart';
import 'package:sanad/view/navigation/applyJob/additionalRequirementJob/widget/input_experience_year_widget.dart';
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
  // final applyJobVM = Get.put(ApplyJobViewModel());
  final applyJobVM = Get.find<ApplyJobViewModel>();

  final isPrivate = Get.arguments['isPrivate'] ?? false;
  final jobName = Get.arguments['jobName'] ?? '';
  final companyName = Get.arguments['companyName'] ?? '';
  final location = Get.arguments['location'] ?? '';
  final jobType = Get.arguments['jobType'] ?? '';
  final salaryRange = Get.arguments['salaryRange'] ?? '';
  final isOpenToRelocating = Get.arguments['isOpenToRelocating'] ?? '';
  final List<String> softwarePrograms = Get.arguments['softwarePrograms'] ?? [];

  @override
  Widget build(BuildContext context) {
    final double containerWidth = _calculateMaxTextWidth(
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
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                children: [
                  Expanded(
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
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(16),
                            ),
                            AdditionalRequirementsJobTabBar(),
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(16),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.cardBg,
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
                                  vertical:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                  horizontal:
                                      Get.width * Utils.getResponsiveWidth(16),
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
                                            fontSize:
                                                Get.height *
                                                Utils.getResponsiveSize(20),
                                            fontFamily: 'Manrope',
                                            fontWeight: FontWeight.w700,
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()
                                                    ?.textPrimaryColor,
                                          ),
                                        ),
                                        SizedBox(
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(12),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()
                                                    ?.containerBg,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Get.height *
                                                    Utils.getResponsiveHeight(
                                                      6,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Get.width *
                                                  Utils.getResponsiveWidth(10),
                                              vertical:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(2),
                                            ),
                                            child: Text(
                                              isPrivate
                                                  ? 'private_job'.tr
                                                  : 'public_job'.tr,
                                              style: TextStyle(
                                                fontSize:
                                                    Get.height *
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
                                          height:
                                              Get.height *
                                              Utils.getResponsiveHeight(24),
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(24),
                                        ),
                                        SizedBox(
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(8),
                                        ),
                                        Image.asset(
                                          IconAssets.icBookmark,
                                          height:
                                              Get.height *
                                              Utils.getResponsiveHeight(24),
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(24),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(12),
                                    ),
                                    Text(
                                      companyName.toString(),
                                      style: TextStyle(
                                        fontSize:
                                            Get.height *
                                            Utils.getResponsiveSize(14),
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
                                        fontSize:
                                            Get.height *
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
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(24),
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
                                                Get.height *
                                                    Utils.getResponsiveHeight(
                                                      6,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Get.width *
                                                  Utils.getResponsiveWidth(10),
                                              vertical:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(2),
                                            ),
                                            child: Text(
                                              jobType.toString(),
                                              style: TextStyle(
                                                fontSize:
                                                    Get.height *
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
                                          width:
                                              Get.width *
                                              Utils.getResponsiveWidth(8),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()
                                                    ?.containerBg,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Get.height *
                                                    Utils.getResponsiveHeight(
                                                      6,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Get.width *
                                                  Utils.getResponsiveWidth(10),
                                              vertical:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(2),
                                            ),
                                            child: Text(
                                              salaryRange.toString(),
                                              style: TextStyle(
                                                fontSize:
                                                    Get.height *
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
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(16),
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(
                                      context,
                                    ).extension<AppColors>()?.cardBg,
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
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
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
                                        fontSize:
                                            Get.height *
                                            Utils.getResponsiveSize(14),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(40),
                                    ),
                                    Text(
                                      'are_you_open_to_relocating'.tr,
                                      style: TextStyle(
                                        fontSize:
                                            Get.height *
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
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(24),
                                    ),
                                    Obx(() {
                                      return GestureDetector(
                                        onTap: () {
                                          applyJobVM.isCheckRelocate.value =
                                              !applyJobVM.isCheckRelocate.value;
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color:
                                                applyJobVM.isCheckRelocate.value
                                                    ? AppColor.primaryColor
                                                    : Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.containerBg,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(
                                                Get.height *
                                                    Utils.getResponsiveHeight(
                                                      8,
                                                    ),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  Get.width *
                                                  Utils.getResponsiveWidth(12),
                                              vertical:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(8),
                                            ),
                                            child: Text(
                                              'open_to_relocating'.tr,
                                              style: TextStyle(
                                                fontSize:
                                                    Get.height *
                                                    Utils.getResponsiveSize(12),
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    applyJobVM
                                                            .isCheckRelocate
                                                            .value
                                                        ? AppColor
                                                            .primaryButtonTextColor
                                                        : Theme.of(context)
                                                            .extension<
                                                              AppColors
                                                            >()
                                                            ?.textPrimaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                    SizedBox(
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(56),
                                    ),
                                    Text(
                                      'software_programs_do_you_know'.tr,
                                      style: TextStyle(
                                        fontSize:
                                            Get.height *
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
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(24),
                                    ),
                                    ConstrainedBox(
                                      constraints: BoxConstraints(
                                        maxWidth: containerWidth,
                                      ),
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemCount: softwarePrograms.length,
                                        separatorBuilder:
                                            (context, index) => SizedBox(
                                              height:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(12),
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
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(32),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(
                                              context,
                                            ).extension<AppColors>()?.cardBg,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Get.height *
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
                                          horizontal:
                                              Get.width *
                                              Utils.getResponsiveWidth(16),
                                          vertical:
                                              Get.height *
                                              Utils.getResponsiveHeight(16),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            SizedBox(
                                              height:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(8),
                                            ),
                                            Text(
                                              'how_many_years_of_experience'.tr,
                                              style: TextStyle(
                                                fontSize:
                                                    Get.height *
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
                                              height:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(20),
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
                                                        Get.width *
                                                        Utils.getResponsiveWidth(
                                                          100,
                                                        ),
                                                  ),
                                                  Container(
                                                    width:
                                                        Get.width *
                                                        Utils.getResponsiveWidth(
                                                          68,
                                                        ),
                                                    height:
                                                        Get.height *
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
                                                              Get.height *
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
                                                            Get.width *
                                                            Utils.getResponsiveWidth(
                                                              16,
                                                            ),
                                                        vertical:
                                                            Get.height *
                                                            Utils.getResponsiveHeight(
                                                              8,
                                                            ),
                                                      ),
                                                      child: Text(
                                                        'year'.tr,
                                                        style: TextStyle(
                                                          fontSize:
                                                              Get.height *
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
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(16),
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
                            SizedBox(
                              height:
                                  Get.height * Utils.getResponsiveHeight(20),
                            ),
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

  double _calculateMaxTextWidth(List<String> texts, BuildContext context) {
    double maxWidth = 0;
    final textStyle = TextStyle(
      fontSize: Get.height * Utils.getResponsiveSize(14),
      fontFamily: 'Manrope',
      fontWeight: FontWeight.w400,
    );

    for (String text in texts) {
      final TextPainter textPainter = TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
      )..layout();

      final double textWidth =
          textPainter.width +
          (Get.width * Utils.getResponsiveWidth(14) * 2); // Add padding

      if (textWidth > maxWidth) {
        maxWidth = textWidth;
      }
    }
    return maxWidth;
  }
}
