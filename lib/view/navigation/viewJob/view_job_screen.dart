import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/navigation/viewJob/widget/custom_tab_bar_widget.dart';
import '../../../res/assets/icon_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/themes/app_themes.dart';
import '../../../utils/utils.dart';

class ViewJobScreen extends StatefulWidget {
  const ViewJobScreen({super.key});

  @override
  State<ViewJobScreen> createState() => _ViewJobScreenState();
}

class _ViewJobScreenState extends State<ViewJobScreen> {
  final jobName = Get.arguments['jobName'] ?? '';
  final jobCategory = Get.arguments['jobCategory'] ?? '';
  final companyName = Get.arguments['companyName'] ?? '';
  final location = Get.arguments['location'] ?? '';
  final jobType = Get.arguments['jobType'] ?? '';
  final professionalStatus = Get.arguments['professionalStatus'] ?? '';
  final salaryRange = Get.arguments['salaryRange'] ?? '';
  final cvCount = Get.arguments['cvCount'] ?? '';
  final experienceRequired = Get.arguments['experienceRequired'] ?? '';
  final candidatesRequired = Get.arguments['candidatesRequired'] ?? '';
  final jobDescription = Get.arguments['jobDescription'] ?? '';
  final isOpenToRelocating = Get.arguments['isOpenToRelocating'] ?? '';
  final List<String> softwarePrograms = Get.arguments['softwarePrograms'] ?? [];
  @override
  Widget build(BuildContext context) {
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
          title: Text('view_job'.tr),
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
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      IconAssets.icPostLogo,
                      height: Get.height * Utils.getResponsiveHeight(32),
                      width: Get.width * Utils.getResponsiveWidth(32),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(16)),
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
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textPrimaryColor,
                              fontSize:
                                  Get.height * Utils.getResponsiveSize(20),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(2),
                          ),
                          Container(
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
                                    Get.width * Utils.getResponsiveWidth(12),
                                vertical:
                                    Get.height * Utils.getResponsiveHeight(2),
                              ),
                              child: Text(
                                jobCategory,
                                style: TextStyle(
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(11),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.cardSelectedTextColor,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * Utils.getResponsiveHeight(8),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: companyName,
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
                                TextSpan(
                                  text: ' | '.tr,
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
                                TextSpan(
                                  text: location,
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
                        ],
                      ),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(16)),
                    Image.asset(
                      IconAssets.icDisable,
                      height: Get.height * Utils.getResponsiveHeight(24),
                      width: Get.width * Utils.getResponsiveWidth(24),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
                    Image.asset(
                      IconAssets.icBookmark,
                      height: Get.height * Utils.getResponsiveHeight(24),
                      width: Get.width * Utils.getResponsiveWidth(24),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
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
                          horizontal: Get.width * Utils.getResponsiveWidth(10),
                          vertical: Get.height * Utils.getResponsiveHeight(2),
                        ),
                        child: Text(
                          jobType,
                          style: TextStyle(
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
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
                          horizontal: Get.width * Utils.getResponsiveWidth(10),
                          vertical: Get.height * Utils.getResponsiveHeight(2),
                        ),
                        child: Text(
                          professionalStatus,
                          style: TextStyle(
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
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
                          horizontal: Get.width * Utils.getResponsiveWidth(10),
                          vertical: Get.height * Utils.getResponsiveHeight(2),
                        ),
                        child: Text(
                          salaryRange,
                          style: TextStyle(
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width * Utils.getResponsiveWidth(8)),
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
                          horizontal: Get.width * Utils.getResponsiveWidth(10),
                          vertical: Get.height * Utils.getResponsiveHeight(2),
                        ),
                        child: Text(
                          cvCount,
                          style: TextStyle(
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Divider(
                  color: Theme.of(context).dividerColor,
                  height: Get.height * Utils.getResponsiveHeight(1),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                Text(
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
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                CustomTabBar(),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
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
                                'experience_required'.tr,
                                style: TextStyle(
                                  color:
                                      Theme.of(context)
                                          .extension<AppColors>()
                                          ?.textSecondaryColor,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(12),
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
                                      Get.height * Utils.getResponsiveSize(14),
                                ),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(16),
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
                                      Get.height * Utils.getResponsiveSize(12),
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
                                      Get.height * Utils.getResponsiveSize(14),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: Get.width * Utils.getResponsiveWidth(16),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      Get.height * Utils.getResponsiveSize(12),
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
                                      Get.height * Utils.getResponsiveSize(14),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(24),
                    ),
                    Divider(
                      color: Theme.of(context).dividerColor,
                      height: Get.height * Utils.getResponsiveHeight(1),
                    ),
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(16),
                    ),
                    Text(
                      'description'.tr,
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
                    SizedBox(
                      height: Get.height * Utils.getResponsiveHeight(16),
                    ),
                    Text(
                      jobDescription,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.textBodyColor,
                        fontSize: Get.height * Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500,
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
                      height: Get.height * Utils.getResponsiveHeight(20),
                    ),
                  ],
                ),
                Column(children: []),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
