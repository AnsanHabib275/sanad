import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/viewJobDetail/widget/custom_tab_bar_widget.dart';
import 'package:sanad/view/navigation/viewJobDetail/widget/job_specifications_cart_widget.dart';
import 'package:sanad/view/navigation/viewJobDetail/widget/software_program_cart_widget.dart';
import 'package:sanad/view/navigation/viewJobDetail/widget/submit_button_widget.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class ViewJobDetailScreen extends StatefulWidget {
  const ViewJobDetailScreen({super.key});

  @override
  State<ViewJobDetailScreen> createState() => _ViewJobDetailScreenState();
}

class _ViewJobDetailScreenState extends State<ViewJobDetailScreen> {
  final applyJobVM = Get.put(ApplyJobViewModel());

  final isPrivate = Get.arguments['isPrivate'] ?? false;
  final jobName = Get.arguments['jobName'] ?? '';
  final jobCategory = Get.arguments['jobCategory'] ?? '';
  final agencyName = Get.arguments['agencyName'] ?? '';
  final location = Get.arguments['location'] ?? '';
  final jobType = Get.arguments['jobType'] ?? '';

  final professionalStatus = Get.arguments['professionalStatus'] ?? '';
  final salaryRange = Get.arguments['salaryRange'] ?? '';

  final cvPrice = Get.arguments['cvPrice'] ?? '';
  final List<String> jobSpecifications =
      Get.arguments['myJobSpecifications'] ?? [];
  final experienceRequired = Get.arguments['experienceRequired'] ?? '';
  final candidatesRequired = Get.arguments['candidatesRequired'] ?? '';
  final jobDescription = Get.arguments['jobDescription'] ?? '';
  final isOpenToRelocating = Get.arguments['isOpenToRelocating'] ?? '';
  final List<String> softwarePrograms = Get.arguments['softwarePrograms'] ?? [];
  final companyName = Get.arguments['companyName'] ?? '';
  final companyWebsite = Get.arguments['companyWebsite'] ?? '';
  final companyType = Get.arguments['companyType'] ?? '';
  final companySize = Get.arguments['companySize'] ?? '';
  final companyLocation = Get.arguments['companyLocation'] ?? '';
  final companyDescription = Get.arguments['companyDescription'] ?? '';

  @override
  Widget build(BuildContext context) {
    final double containerWidth = _calculateMaxTextWidth(
      softwarePrograms,
      context,
    );
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
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
          title: Text('view_job_details'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            IconAssets.icPostLogo,
                            height: Get.height * Utils.getResponsiveHeight(32),
                            width: Get.width * Utils.getResponsiveWidth(32),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(12),
                          ),
                          Expanded(
                            child: Text(
                              companyName,
                              style: TextStyle(
                                fontSize:
                                    Get.height * Utils.getResponsiveSize(14),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                color:
                                    Theme.of(context)
                                        .extension<AppColors>()
                                        ?.textSecondaryColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(16),
                          ),
                          Image.asset(
                            IconAssets.icDisable,
                            height: Get.height * Utils.getResponsiveHeight(24),
                            width: Get.width * Utils.getResponsiveWidth(24),
                          ),
                          SizedBox(
                            width: Get.width * Utils.getResponsiveWidth(8),
                          ),
                          Image.asset(
                            IconAssets.icBookmark,
                            height: Get.height * Utils.getResponsiveHeight(24),
                            width: Get.width * Utils.getResponsiveWidth(24),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(12),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      child: Text(
                        jobName,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontSize: Get.height * Utils.getResponsiveSize(20),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * Utils.getResponsiveHeight(2)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.cardSelectedBg,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              Get.height * Utils.getResponsiveHeight(6),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                Get.width * Utils.getResponsiveWidth(10),
                            vertical: Get.height * Utils.getResponsiveHeight(2),
                          ),
                          child: Text(
                            jobCategory,
                            style: TextStyle(
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(11),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(12),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      child: SizedBox(
                        height: Get.height * Utils.getResponsiveHeight(22),
                        child: Flexible(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            physics: AlwaysScrollableScrollPhysics(),
                            itemCount: jobSpecifications.length,
                            separatorBuilder:
                                (context, index) => SizedBox(
                                  width:
                                      Get.width * Utils.getResponsiveWidth(8),
                                ),
                            itemBuilder: (context, index) {
                              return JobSpecificationsCartWidget(
                                jobSpecification: jobSpecifications[index],
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(16),
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      height: Get.height * Utils.getResponsiveHeight(1),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(24),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      child: Text(
                        'job_details'.tr,
                        textAlign: TextAlign.left,
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
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(16),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Get.width * Utils.getResponsiveWidth(16),
                      ),
                      child: CustomTabBar(),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(16),
                    ),
                    SizedBox(
                      child: Obx(() {
                        return applyJobVM.selectedTab.value == 'general'
                            ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width *
                                        Utils.getResponsiveWidth(16),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'experience_required'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Get.height *
                                                    Utils.getResponsiveSize(12),
                                              ),
                                            ),
                                            Text(
                                              experienceRequired,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textPrimaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Get.height *
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                            SizedBox(
                                              height:
                                                  Get.height *
                                                  Utils.getResponsiveHeight(16),
                                            ),
                                            Text(
                                              'location'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Get.height *
                                                    Utils.getResponsiveSize(12),
                                              ),
                                            ),
                                            Text(
                                              location,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textPrimaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Get.height *
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            Get.width *
                                            Utils.getResponsiveWidth(16),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'candidates_required'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Get.height *
                                                    Utils.getResponsiveSize(12),
                                              ),
                                            ),
                                            Text(
                                              candidatesRequired,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textPrimaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Get.height *
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(24),
                                ),
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                  height:
                                      Get.height * Utils.getResponsiveHeight(1),
                                ),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width *
                                        Utils.getResponsiveWidth(16),
                                  ),
                                  child: Text(
                                    'description'.tr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(18),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(16),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width *
                                        Utils.getResponsiveWidth(16),
                                  ),
                                  child: Text(
                                    jobDescription,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textBodyColor,
                                      fontSize:
                                          Get.height *
                                          Utils.getResponsiveSize(14),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            )
                            : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height:
                                      Get.height * Utils.getResponsiveHeight(8),
                                ),
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                  height:
                                      Get.height * Utils.getResponsiveHeight(1),
                                ),
                                SizedBox(
                                  height:
                                      Get.height *
                                      Utils.getResponsiveHeight(12),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal:
                                        Get.width *
                                        Utils.getResponsiveWidth(16),
                                    vertical:
                                        Get.height *
                                        Utils.getResponsiveHeight(16),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              Utils.getResponsiveSize(18),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            Get.height *
                                            Utils.getResponsiveHeight(8),
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
                                            color:
                                                Theme.of(context).dividerColor,
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
                                                    Utils.getResponsiveHeight(
                                                      8,
                                                    ),
                                              ),
                                              Text(
                                                'are_you_open_to_relocating'.tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      Get.height *
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
                                                          ?.textSecondaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    Get.height *
                                                    Utils.getResponsiveHeight(
                                                      24,
                                                    ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      Theme.of(context)
                                                          .extension<
                                                            AppColors
                                                          >()
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
                                                        Utils.getResponsiveWidth(
                                                          12,
                                                        ),
                                                    vertical:
                                                        Get.height *
                                                        Utils.getResponsiveHeight(
                                                          8,
                                                        ),
                                                  ),
                                                  child: Text(
                                                    'open_to_relocating'.tr,
                                                    style: TextStyle(
                                                      fontSize:
                                                          Get.height *
                                                          Utils.getResponsiveSize(
                                                            12,
                                                          ),
                                                      fontFamily: 'Manrope',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color:
                                                          Theme.of(context)
                                                              .extension<
                                                                AppColors
                                                              >()
                                                              ?.textPrimaryColor,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            Get.height *
                                            Utils.getResponsiveHeight(8),
                                      ),
                                      Flexible(
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context)
                                                    .extension<AppColors>()!
                                                    .cardBg,
                                            borderRadius: BorderRadius.all(
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
                                                Text(
                                                  'software_programs_do_you_know'
                                                      .tr,
                                                  style: TextStyle(
                                                    fontSize:
                                                        Get.height *
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
                                                            ?.textSecondaryColor,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height:
                                                      Get.height *
                                                      Utils.getResponsiveHeight(
                                                        24,
                                                      ),
                                                ),
                                                Flexible(
                                                  child: ConstrainedBox(
                                                    constraints: BoxConstraints(
                                                      maxWidth: containerWidth,
                                                    ),
                                                    child: ListView.separated(
                                                      shrinkWrap: true,
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                      itemCount:
                                                          softwarePrograms
                                                              .length,
                                                      separatorBuilder:
                                                          (
                                                            context,
                                                            index,
                                                          ) => SizedBox(
                                                            height:
                                                                Get.height *
                                                                Utils.getResponsiveHeight(
                                                                  12,
                                                                ),
                                                          ),
                                                      itemBuilder: (
                                                        context,
                                                        index,
                                                      ) {
                                                        return SoftwareProgramCartWidget(
                                                          softwareProgram:
                                                              softwarePrograms[index],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            Get.height *
                                            Utils.getResponsiveHeight(8),
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
                                            color:
                                                Theme.of(context).dividerColor,
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
                                                    Utils.getResponsiveHeight(
                                                      8,
                                                    ),
                                              ),
                                              Text(
                                                'how_many_years_of_experience'
                                                    .tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      Get.height *
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
                                                          ?.textSecondaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    Get.height *
                                                    Utils.getResponsiveHeight(
                                                      20,
                                                    ),
                                              ),
                                              Text(
                                                'should_have_an_experience'.tr,
                                                style: TextStyle(
                                                  fontSize:
                                                      Get.height *
                                                      Utils.getResponsiveSize(
                                                        12,
                                                      ),
                                                  fontFamily: 'Manrope',
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      Theme.of(context)
                                                          .extension<
                                                            AppColors
                                                          >()
                                                          ?.textSecondaryColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            );
                      }),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(16),
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      height: Get.height * Utils.getResponsiveHeight(1),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(20),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).extension<AppColors>()?.cardBg,
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
                child: SubmitButtonWidget(
                  isPrivate: isPrivate,
                  jobName: jobName,
                  companyName: companyName,
                  location: location,
                  jobType: jobType,
                  salaryRange: salaryRange,
                  isOpenToRelocating: isOpenToRelocating,
                  softwarePrograms: softwarePrograms,
                ),
              ),
            ),
          ],
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
