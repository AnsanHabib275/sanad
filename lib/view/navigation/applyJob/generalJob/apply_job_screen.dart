import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/applyJob/generalJob/widget/discard_button_widget.dart';
import 'package:sanad/view/navigation/applyJob/generalJob/widget/input_linkedin_account_widget.dart';
import 'package:sanad/viewModels/controller/navigation/applyJob/apply_job_view_model.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../navigation/applyJob/generalJob/widget/next_button_widget.dart';
import '../generalJob/widget/apply_job_tab_bar_widget.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({super.key});

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  final applyJobVM = Get.put(ApplyJobViewModel);

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
                  ApplyJobTabBar(),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()!.cardBg,
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
                                jobName,
                                style: TextStyle(
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(20),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textPrimaryColor,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * Utils.getResponsiveWidth(12),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.containerBg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Get.height * Utils.getResponsiveHeight(6),
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
                                    Get.height * Utils.getResponsiveHeight(24),
                                width: Get.width * Utils.getResponsiveWidth(24),
                              ),
                              SizedBox(
                                width: Get.width * Utils.getResponsiveWidth(8),
                              ),
                              Image.asset(
                                IconAssets.icBookmark,
                                height:
                                    Get.height * Utils.getResponsiveHeight(24),
                                width: Get.width * Utils.getResponsiveWidth(24),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(12),
                          ),
                          Text(
                            companyName.toString(),
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
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
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(24),
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
                                      Get.height * Utils.getResponsiveHeight(6),
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
                                      Get.height * Utils.getResponsiveHeight(6),
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
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()!.cardBg,
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
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'linkedin_account'.tr,
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
                                TextSpan(
                                  text: 'optional'.tr,
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
                              ],
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          InputLinkedInAccountWidget(),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(16),
                          ),
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()!.cardBg,
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
                                horizontal:
                                    Get.width * Utils.getResponsiveWidth(16),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(16),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'upload_resume'.tr,
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
                                  SizedBox(
                                    height:
                                        Get.height *
                                        Utils.getResponsiveHeight(8),
                                  ),
                                  DottedBorder(
                                    options: RectDottedBorderOptions(
                                      color: Theme.of(context).dividerColor,
                                      strokeWidth: 2,
                                      dashPattern: [
                                        6,
                                        2.5,
                                      ], // Dash pattern: [dashLength, spaceBetween]
                                      // radius: Radius.circular(12),
                                    ),

                                    child: Container(
                                      width:
                                          Get.width *
                                          Utils.getResponsiveWidth(334),
                                      height:
                                          Get.height *
                                          Utils.getResponsiveHeight(217),
                                      decoration: BoxDecoration(
                                        color:
                                            Theme.of(
                                              context,
                                              // ).extension<AppColors>()?.cardBg,
                                            ).colorScheme.surface,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            Get.height *
                                                Utils.getResponsiveHeight(8),
                                          ),
                                        ),
                                      ),
                                      alignment: Alignment.center,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            IconAssets.icUpload,
                                            height:
                                                Get.height *
                                                Utils.getResponsiveHeight(39),
                                            width:
                                                Get.width *
                                                Utils.getResponsiveWidth(39),
                                            color:
                                                Theme.of(
                                                  context,
                                                ).iconTheme.color,
                                          ),
                                          RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'click_to_upload'.tr,
                                                  style: TextStyle(
                                                    fontSize:
                                                        Get.height *
                                                        Utils.getResponsiveSize(
                                                          14,
                                                        ),
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w600,
                                                    color:
                                                        Theme.of(context)
                                                            .extension<
                                                              AppColors
                                                            >()
                                                            ?.textBodyColor,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'drag_and_drop'.tr,
                                                  style: TextStyle(
                                                    fontSize:
                                                        Get.height *
                                                        Utils.getResponsiveSize(
                                                          14,
                                                        ),
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w400,
                                                    color:
                                                        Theme.of(context)
                                                            .extension<
                                                              AppColors
                                                            >()
                                                            ?.textBodyColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            'file_format'.tr,
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
                                      DiscardButtonWidget(),
                                      NextButtonWidget(
                                        isPrivate: isPrivate,
                                        jobName: jobName,
                                        companyName: companyName,
                                        location: location,
                                        jobType: jobType,
                                        salaryRange: salaryRange,
                                        isOpenToRelocating: isOpenToRelocating,
                                        softwarePrograms: softwarePrograms,
                                      ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
