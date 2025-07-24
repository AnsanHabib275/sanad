import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/viewJob/widget/prefer_job_type_cart_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/apply_now_button_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/custom_tab_bar_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/job_specifications_cart_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/software_program_cart_widget.dart';

import '../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class ViewJobScreen extends StatefulWidget {
  const ViewJobScreen({super.key});

  @override
  State<ViewJobScreen> createState() => _ViewJobScreenState();
}

class _ViewJobScreenState extends State<ViewJobScreen> {
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
      Get.arguments['jobSpecifications'] ?? [];
  final experienceRequired = Get.arguments['experienceRequired'] ?? '';
  final candidatesRequired = Get.arguments['candidatesRequired'] ?? '';
  final jobDescription = Get.arguments['jobDescription'] ?? '';
  final List<String> preferJobType = Get.arguments['preferJobType'] ?? [];
  final List<String> softwarePrograms = Get.arguments['softwarePrograms'] ?? [];

  final companyName = Get.arguments['companyName'] ?? '';
  final companyWebsite = Get.arguments['companyWebsite'] ?? '';
  final companyType = Get.arguments['companyType'] ?? '';
  final companySize = Get.arguments['companySize'] ?? '';
  final companyLocation = Get.arguments['companyLocation'] ?? '';
  final companyDescription = Get.arguments['companyDescription'] ?? '';

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
          title: Text('view_job'.tr),
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
                    SizedBox(height: Utils.getResponsiveHeight(24)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showPostBottomSheet();
                            },
                            child: Image.asset(
                              IconAssets.icPostLogo,
                              height: Utils.getResponsiveHeight(32),
                              width: Utils.getResponsiveWidth(32),
                            ),
                          ),
                          SizedBox(width: Utils.getResponsiveWidth(16)),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  jobName,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.textPrimaryColor,
                                    fontSize: Utils.getResponsiveSize(20),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: Utils.getResponsiveHeight(2)),
                                Container(
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context)
                                            .extension<AppColors>()
                                            ?.cardSelectedBg,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        Utils.getResponsiveHeight(6),
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: Utils.getResponsiveWidth(12),
                                      vertical: Utils.getResponsiveHeight(2),
                                    ),
                                    child: Text(
                                      jobCategory,
                                      style: TextStyle(
                                        fontSize: Utils.getResponsiveSize(11),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: Utils.getResponsiveHeight(8)),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: agencyName,
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
                                      TextSpan(
                                        text: ' | '.tr,
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
                                      TextSpan(
                                        text: location,
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
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: Utils.getResponsiveWidth(16)),
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
                    ),
                    SizedBox(height: Utils.getResponsiveHeight(16)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                      ),
                      child: SizedBox(
                        height: Utils.getResponsiveHeight(22),
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemCount: jobSpecifications.length,
                          separatorBuilder:
                              (context, index) =>
                                  SizedBox(width: Utils.getResponsiveWidth(8)),
                          itemBuilder: (context, index) {
                            return JobSpecificationsCartWidget(
                              jobSpecification: jobSpecifications[index],
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: Utils.getResponsiveHeight(16)),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      height: Utils.getResponsiveHeight(1),
                    ),
                    SizedBox(height: Utils.getResponsiveHeight(24)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                      ),
                      child: Text(
                        'job_details'.tr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontSize: Utils.getResponsiveSize(18),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: Utils.getResponsiveHeight(16)),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(16),
                      ),
                      child: CustomTabBar(),
                    ),
                    SizedBox(height: Utils.getResponsiveHeight(16)),
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
                                    horizontal: Utils.getResponsiveWidth(16),
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
                                              'employment_type'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(12),
                                              ),
                                            ),
                                            Text(
                                              jobType,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textPrimaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                16,
                                              ),
                                            ),
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
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                16,
                                              ),
                                            ),
                                            Text(
                                              'salary_range'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(12),
                                              ),
                                            ),
                                            Text(
                                              salaryRange,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textPrimaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                16,
                                              ),
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
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width: Utils.getResponsiveWidth(16),
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
                                              'experience_required'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
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
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                16,
                                              ),
                                            ),
                                            Text(
                                              'seniority_level'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(12),
                                              ),
                                            ),
                                            Text(
                                              professionalStatus,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textPrimaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                16,
                                              ),
                                            ),
                                            Text(
                                              'job_post_type'.tr,
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textSecondaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(12),
                                              ),
                                            ),
                                            Text(
                                              isPrivate ? 'Private' : 'Public',
                                              style: TextStyle(
                                                color:
                                                    Theme.of(context)
                                                        .extension<AppColors>()
                                                        ?.textPrimaryColor,
                                                fontFamily: 'Manrope',
                                                fontWeight: FontWeight.w500,
                                                fontSize:
                                                    Utils.getResponsiveSize(14),
                                              ),
                                            ),
                                            SizedBox(
                                              height: Utils.getResponsiveHeight(
                                                16,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  'price_per_cv'.tr,
                                                  style: TextStyle(
                                                    color:
                                                        Theme.of(context)
                                                            .extension<
                                                              AppColors
                                                            >()
                                                            ?.textPrimaryColor,
                                                    fontFamily: 'Manrope',
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        Utils.getResponsiveSize(
                                                          14,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width:
                                                      Utils.getResponsiveWidth(
                                                        12,
                                                      ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        Theme.of(context)
                                                            .extension<
                                                              AppColors
                                                            >()
                                                            ?.cardSelectedBg,
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(
                                                        Utils.getResponsiveHeight(
                                                          6,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.symmetric(
                                                      horizontal:
                                                          Utils.getResponsiveWidth(
                                                            8,
                                                          ),
                                                      vertical:
                                                          Utils.getResponsiveHeight(
                                                            4,
                                                          ),
                                                    ),
                                                    child: Text(
                                                      cvPrice,
                                                      style: TextStyle(
                                                        fontSize:
                                                            Utils.getResponsiveSize(
                                                              11,
                                                            ),
                                                        fontFamily: 'Manrope',
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            AppColor
                                                                .primaryColor,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: Utils.getResponsiveHeight(24)),
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                  height: Utils.getResponsiveHeight(1),
                                ),
                                SizedBox(height: Utils.getResponsiveHeight(16)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(16),
                                  ),
                                  child: Text(
                                    'description'.tr,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                      fontSize: Utils.getResponsiveSize(18),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                SizedBox(height: Utils.getResponsiveHeight(16)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(16),
                                  ),
                                  child: Text(
                                    jobDescription,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textSecondaryColor,
                                      fontSize: Utils.getResponsiveSize(14),
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
                                SizedBox(height: Utils.getResponsiveHeight(8)),
                                Divider(
                                  color: Theme.of(context).dividerColor,
                                  height: Utils.getResponsiveHeight(1),
                                ),
                                SizedBox(height: Utils.getResponsiveHeight(12)),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(16),
                                    vertical: Utils.getResponsiveHeight(16),
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
                                          fontSize: Utils.getResponsiveSize(18),
                                          fontFamily: 'Manrope',
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(8),
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
                                                Utils.getResponsiveWidth(16),
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
                                                height:
                                                    Utils.getResponsiveHeight(
                                                      8,
                                                    ),
                                              ),
                                              Text(
                                                'are_you_open_to_relocating'.tr,
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
                                                          ?.textSecondaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    Utils.getResponsiveHeight(
                                                      24,
                                                    ),
                                              ),
                                              ConstrainedBox(
                                                constraints: BoxConstraints(
                                                  maxWidth: jobContainerWidth,
                                                ),
                                                child: ListView.separated(
                                                  shrinkWrap: true,
                                                  physics:
                                                      BouncingScrollPhysics(),
                                                  itemCount:
                                                      preferJobType.length,
                                                  separatorBuilder:
                                                      (
                                                        context,
                                                        index,
                                                      ) => SizedBox(
                                                        height:
                                                            Utils.getResponsiveHeight(
                                                              12,
                                                            ),
                                                      ),
                                                  itemBuilder: (
                                                    context,
                                                    index,
                                                  ) {
                                                    return PreferJobTypeCartWidget(
                                                      preferJobType:
                                                          preferJobType[index],
                                                    );
                                                  },
                                                ),
                                              ),
                                              // Flexible(
                                              //   child: ConstrainedBox(
                                              //     constraints: BoxConstraints(
                                              //       maxWidth: jobContainerWidth,
                                              //     ),
                                              //     child: ListView.separated(
                                              //       shrinkWrap: true,
                                              //       physics:
                                              //           BouncingScrollPhysics(),
                                              //       itemCount:
                                              //           preferJobType.length,
                                              //       separatorBuilder:
                                              //           (
                                              //             context,
                                              //             index,
                                              //           ) => SizedBox(
                                              //             height:
                                              //                 Utils.getResponsiveHeight(
                                              //                   12,
                                              //                 ),
                                              //           ),
                                              //       itemBuilder: (
                                              //         context,
                                              //         index,
                                              //       ) {
                                              //         return PreferJobTypeCartWidget(
                                              //           preferJobType:
                                              //               preferJobType[index],
                                              //         );
                                              //       },
                                              //     ),
                                              //   ),
                                              // ),

                                              // Container(
                                              //   decoration: BoxDecoration(
                                              //     color:
                                              //         Theme.of(context)
                                              //             .extension<
                                              //               AppColors
                                              //             >()
                                              //             ?.containerBg,
                                              //     borderRadius: BorderRadius.all(
                                              //       Radius.circular(
                                              //         Utils.getResponsiveHeight(
                                              //           8,
                                              //         ),
                                              //       ),
                                              //     ),
                                              //   ),
                                              //   child: Padding(
                                              //     padding: EdgeInsets.symmetric(
                                              //       horizontal:
                                              //           Utils.getResponsiveWidth(
                                              //             12,
                                              //           ),
                                              //       vertical:
                                              //           Utils.getResponsiveHeight(
                                              //             8,
                                              //           ),
                                              //     ),
                                              //     child: Text(
                                              //       'open_to_relocating'.tr,
                                              //       style: TextStyle(
                                              //         fontSize:
                                              //             Utils.getResponsiveSize(
                                              //               12,
                                              //             ),
                                              //         fontFamily: 'Manrope',
                                              //         fontWeight:
                                              //             FontWeight.w500,
                                              //         color:
                                              //             Theme.of(context)
                                              //                 .extension<
                                              //                   AppColors
                                              //                 >()
                                              //                 ?.textPrimaryColor,
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(8),
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
                                                Utils.getResponsiveHeight(8),
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
                                                  Utils.getResponsiveWidth(16),
                                              vertical:
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
                                                      Utils.getResponsiveHeight(
                                                        24,
                                                      ),
                                                ),
                                                ConstrainedBox(
                                                  constraints: BoxConstraints(
                                                    maxWidth:
                                                        softwareContainerWidth,
                                                  ),
                                                  child: ListView.separated(
                                                    shrinkWrap: true,
                                                    physics:
                                                        BouncingScrollPhysics(),
                                                    itemCount:
                                                        softwarePrograms.length,
                                                    separatorBuilder:
                                                        (
                                                          context,
                                                          index,
                                                        ) => SizedBox(
                                                          height:
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
                                                // Flexible(
                                                //   child: ConstrainedBox(
                                                //     constraints: BoxConstraints(
                                                //       maxWidth:
                                                //       softwareContainerWidth,
                                                //     ),
                                                //     child: ListView.separated(
                                                //       shrinkWrap: true,
                                                //       physics:
                                                //       BouncingScrollPhysics(),
                                                //       itemCount:
                                                //       softwarePrograms
                                                //           .length,
                                                //       separatorBuilder:
                                                //           (
                                                //           context,
                                                //           index,
                                                //           ) => SizedBox(
                                                //         height:
                                                //         Utils.getResponsiveHeight(
                                                //           12,
                                                //         ),
                                                //       ),
                                                //       itemBuilder: (
                                                //           context,
                                                //           index,
                                                //           ) {
                                                //         return SoftwareProgramCartWidget(
                                                //           softwareProgram:
                                                //           softwarePrograms[index],
                                                //         );
                                                //       },
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Utils.getResponsiveHeight(8),
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
                                                Utils.getResponsiveWidth(16),
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
                                                height:
                                                    Utils.getResponsiveHeight(
                                                      8,
                                                    ),
                                              ),
                                              Text(
                                                'how_many_years_of_experience'
                                                    .tr,
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
                                                          ?.textSecondaryColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height:
                                                    Utils.getResponsiveHeight(
                                                      20,
                                                    ),
                                              ),
                                              Text(
                                                'should_have_an_experience'.tr,
                                                style: TextStyle(
                                                  fontSize:
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
                    SizedBox(height: Utils.getResponsiveHeight(16)),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      height: Utils.getResponsiveHeight(1),
                    ),
                    SizedBox(height: Utils.getResponsiveHeight(20)),
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
                  horizontal: Utils.getResponsiveWidth(16),
                  vertical: Utils.getResponsiveHeight(16),
                ),
                child: ApplyNowButtonWidget(
                  isPrivate: isPrivate,
                  jobName: jobName,
                  companyName: agencyName,
                  location: location,
                  jobType: jobType,
                  salaryRange: salaryRange,
                  preferJobType: preferJobType,
                  softwarePrograms: softwarePrograms,
                ),
              ),
            ),
          ],
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

  void showPostBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: EdgeInsets.only(
          top: Utils.getResponsiveHeight(24),
          bottom: Utils.getResponsiveHeight(60),
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).extension<AppColors>()?.cardBg,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(Utils.getResponsiveHeight(30)),
            topRight: Radius.circular(Utils.getResponsiveHeight(30)),
          ),
          border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    IconAssets.icPostLogo,
                    height: Utils.getResponsiveHeight(32),
                    width: Utils.getResponsiveWidth(32),
                  ),
                  SizedBox(width: Utils.getResponsiveWidth(16)),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          companyName,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontSize: Utils.getResponsiveSize(20),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(2)),
                        Container(
                          decoration: BoxDecoration(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.cardSelectedBg,
                            borderRadius: BorderRadius.all(
                              Radius.circular(Utils.getResponsiveHeight(6)),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Utils.getResponsiveWidth(12),
                              vertical: Utils.getResponsiveHeight(2),
                            ),
                            child: Text(
                              jobCategory,
                              style: TextStyle(
                                fontSize: Utils.getResponsiveSize(11),
                                fontFamily: 'Manrope',
                                fontWeight: FontWeight.w500,
                                color: AppColor.primaryColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(8)),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: agencyName,
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
                              TextSpan(
                                text: ' | '.tr,
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
                              TextSpan(
                                text: location,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Utils.getResponsiveHeight(16)),
            Divider(
              color: Theme.of(context).dividerColor,
              height: Utils.getResponsiveHeight(1),
            ),
            SizedBox(height: Utils.getResponsiveHeight(24)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'website'.tr,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(12),
                          ),
                        ),
                        Text(
                          companyWebsite,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(14),
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                        Text(
                          'company_type'.tr,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(12),
                          ),
                        ),
                        Text(
                          companyType,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(14),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: Utils.getResponsiveWidth(16)),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'company_size'.tr,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(12),
                          ),
                        ),
                        Text(
                          companySize,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(14),
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(16)),
                        Text(
                          'location'.tr,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(12),
                          ),
                        ),
                        Text(
                          companyLocation,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Utils.getResponsiveSize(14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Utils.getResponsiveHeight(24)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(16),
              ),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'about'.tr,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(18),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.textPrimaryColor,
                      ),
                    ),
                    TextSpan(
                      text: companyName,
                      style: TextStyle(
                        fontSize: Utils.getResponsiveSize(18),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w600,
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
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(16),
              ),
              child: Text(
                companyDescription,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color:
                      Theme.of(
                        context,
                      ).extension<AppColors>()?.textSecondaryColor,
                  fontSize: Utils.getResponsiveSize(14),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }
}
