import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:path/path.dart' as path;
import 'package:xml/xml.dart';

import 'package:sanad/res/assets/image_assets.dart';
import 'package:sanad/view/navigation/applyJob/generalJob/widget/discard_button_widget.dart';
import 'package:sanad/view/navigation/applyJob/generalJob/widget/input_linkedin_account_widget.dart';
import 'package:sanad/view/navigation/applyJob/generalJob/widget/update_button_widget.dart';
import 'package:sanad/view/navigation/applyJob/generalJob/widget/view_button_widget.dart';
import 'package:sanad/viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';
import '../../../../../res/assets/icon_assets.dart';
import 'widget/apply_job_tab_bar_widget.dart';
import 'widget/next_button_widget.dart';

class ApplyJobScreen extends StatefulWidget {
  const ApplyJobScreen({super.key});

  @override
  State<ApplyJobScreen> createState() => _ApplyJobScreenState();
}

class _ApplyJobScreenState extends State<ApplyJobScreen> {
  // final applyJobVM = Get.put(ApplyJobViewModel);

  final applyJobVM = Get.put(ApplyJobViewModel());

  final isPrivate = Get.arguments['isPrivate'] ?? false;
  final jobName = Get.arguments['jobName'] ?? '';
  final companyName = Get.arguments['companyName'] ?? '';
  final location = Get.arguments['location'] ?? '';
  final jobType = Get.arguments['jobType'] ?? '';
  final salaryRange = Get.arguments['salaryRange'] ?? '';
  final List<String> preferJobType = Get.arguments['preferJobType'] ?? [];
  final List<String> softwarePrograms = Get.arguments['softwarePrograms'] ?? [];
  late String cvName;
  late String cvExtention;
  late String cvSize;

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
                height: Utils.getResponsiveHeight(context, 24),
                width: Utils.getResponsiveWidth(context, 24),
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
              horizontal: Utils.getResponsiveWidth(context, 16),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  ApplyJobTabBar(),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(context, 8)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Utils.getResponsiveHeight(context, 16),
                        horizontal: Utils.getResponsiveWidth(context, 16),
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
                                  fontSize: Utils.getResponsiveSize(
                                    context,
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
                                width: Utils.getResponsiveWidth(context, 12),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.containerBg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Utils.getResponsiveHeight(context, 6),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(
                                      context,
                                      10,
                                    ),
                                    vertical: Utils.getResponsiveHeight(
                                      context,
                                      2,
                                    ),
                                  ),
                                  child: Text(
                                    isPrivate
                                        ? 'private_job'.tr
                                        : 'public_job'.tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
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
                                height: Utils.getResponsiveHeight(context, 24),
                                width: Utils.getResponsiveWidth(context, 24),
                              ),
                              SizedBox(
                                width: Utils.getResponsiveWidth(context, 8),
                              ),
                              Image.asset(
                                IconAssets.icBookmark,
                                height: Utils.getResponsiveHeight(context, 24),
                                width: Utils.getResponsiveWidth(context, 24),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Utils.getResponsiveHeight(context, 12),
                          ),
                          Text(
                            companyName.toString(),
                            style: TextStyle(
                              fontSize: Utils.getResponsiveSize(context, 14),
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
                              fontSize: Utils.getResponsiveSize(context, 14),
                              fontFamily: 'Manrope',
                              fontWeight: FontWeight.w500,
                              color:
                                  Theme.of(
                                    context,
                                  ).extension<AppColors>()?.textSecondaryColor,
                            ),
                          ),
                          SizedBox(
                            height: Utils.getResponsiveHeight(context, 24),
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
                                      Utils.getResponsiveHeight(context, 6),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(
                                      context,
                                      10,
                                    ),
                                    vertical: Utils.getResponsiveHeight(
                                      context,
                                      2,
                                    ),
                                  ),
                                  child: Text(
                                    jobType.toString(),
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
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
                                width: Utils.getResponsiveWidth(context, 8),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.containerBg,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                      Utils.getResponsiveHeight(context, 6),
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: Utils.getResponsiveWidth(
                                      context,
                                      10,
                                    ),
                                    vertical: Utils.getResponsiveHeight(
                                      context,
                                      2,
                                    ),
                                  ),
                                  child: Text(
                                    salaryRange.toString(),
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        12,
                                      ),
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
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.cardBg,
                      borderRadius: BorderRadius.all(
                        Radius.circular(Utils.getResponsiveHeight(context, 8)),
                      ),
                      border: Border.all(
                        color: Theme.of(context).dividerColor,
                        width: 1.0,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Utils.getResponsiveWidth(context, 16),
                        vertical: Utils.getResponsiveHeight(context, 16),
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
                                    fontSize: Utils.getResponsiveSize(
                                      context,
                                      14,
                                    ),
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
                                    fontSize: Utils.getResponsiveSize(
                                      context,
                                      14,
                                    ),
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
                            height: Utils.getResponsiveHeight(context, 8),
                          ),
                          InputLinkedInAccountWidget(),
                          SizedBox(
                            height: Utils.getResponsiveHeight(context, 16),
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
                                  Utils.getResponsiveHeight(context, 12),
                                ),
                              ),
                              border: Border.all(
                                color: Theme.of(context).dividerColor,
                                width: 1.0,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: Utils.getResponsiveWidth(context, 16),
                                right: Utils.getResponsiveWidth(context, 16),
                                top: Utils.getResponsiveHeight(context, 16),
                                bottom:
                                    Platform.isIOS
                                        ? Utils.getResponsiveHeight(context, 36)
                                        : Utils.getResponsiveHeight(
                                          context,
                                          16,
                                        ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'upload_resume'.tr,
                                    style: TextStyle(
                                      fontSize: Utils.getResponsiveSize(
                                        context,
                                        14,
                                      ),
                                      fontFamily: 'Manrope',
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Theme.of(context)
                                              .extension<AppColors>()
                                              ?.textPrimaryColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      8,
                                    ),
                                  ),
                                  Obx(() {
                                    return DottedBorder(
                                      options: RectDottedBorderOptions(
                                        color: Theme.of(context).dividerColor,
                                        strokeWidth: 2,
                                        dashPattern: [
                                          6,
                                          2.5,
                                        ], // Dash pattern: [dashLength, spaceBetween]
                                      ),

                                      child: Container(
                                        // width: Utils.getResponsiveWidth(
                                        //   context,
                                        //   334,
                                        // ),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color:
                                              Theme.of(
                                                context,
                                                // ).extension<AppColors>()?.cardBg,
                                              ).colorScheme.surface,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              Utils.getResponsiveHeight(
                                                context,
                                                8,
                                              ),
                                            ),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child:
                                            !applyJobVM.isUploaded.value
                                                ? Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical:
                                                        Utils.getResponsiveHeight(
                                                          context,
                                                          60,
                                                        ),
                                                    horizontal:
                                                        Utils.getResponsiveWidth(
                                                          context,
                                                          55,
                                                        ),
                                                  ),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      pickAndValidateImage();
                                                      // pickSingleFile();
                                                      // applyJobVM
                                                      //     .isUploaded
                                                      //     .value = true;
                                                    },
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Image.asset(
                                                          IconAssets.icUpload,
                                                          height:
                                                              Utils.getResponsiveHeight(
                                                                context,
                                                                39,
                                                              ),
                                                          width:
                                                              Utils.getResponsiveWidth(
                                                                context,
                                                                39,
                                                              ),
                                                          color:
                                                              Theme.of(
                                                                context,
                                                              ).iconTheme.color,
                                                        ),
                                                        RichText(
                                                          text: TextSpan(
                                                            children: [
                                                              TextSpan(
                                                                text:
                                                                    'click_to_upload'
                                                                        .tr,
                                                                style: TextStyle(
                                                                  fontSize:
                                                                      Utils.getResponsiveSize(
                                                                        context,
                                                                        14,
                                                                      ),
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color:
                                                                      Theme.of(
                                                                            context,
                                                                          )
                                                                          .extension<
                                                                            AppColors
                                                                          >()
                                                                          ?.textBodyColor,
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text:
                                                                    'drag_and_drop'
                                                                        .tr,
                                                                style: TextStyle(
                                                                  fontSize:
                                                                      Utils.getResponsiveSize(
                                                                        context,
                                                                        14,
                                                                      ),
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  color:
                                                                      Theme.of(
                                                                            context,
                                                                          )
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
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                            fontSize:
                                                                Utils.getResponsiveSize(
                                                                  context,
                                                                  11,
                                                                ),
                                                            fontFamily:
                                                                'Manrope',
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            color:
                                                                Theme.of(
                                                                      context,
                                                                    )
                                                                    .extension<
                                                                      AppColors
                                                                    >()
                                                                    ?.textBodyColor,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                : Padding(
                                                  padding: EdgeInsets.only(
                                                    top:
                                                        Utils.getResponsiveHeight(
                                                          context,
                                                          44,
                                                        ),
                                                    left:
                                                        Utils.getResponsiveWidth(
                                                          context,
                                                          16,
                                                        ),
                                                    bottom:
                                                        Utils.getResponsiveHeight(
                                                          context,
                                                          16,
                                                        ),
                                                    right:
                                                        Utils.getResponsiveWidth(
                                                          context,
                                                          16,
                                                        ),
                                                  ),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      Image.asset(
                                                        ImageAssets.imgPdf,
                                                        height:
                                                            Utils.getResponsiveHeight(
                                                              context,
                                                              56,
                                                            ),
                                                        width:
                                                            Utils.getResponsiveWidth(
                                                              context,
                                                              56,
                                                            ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Utils.getResponsiveHeight(
                                                              context,
                                                              7,
                                                            ),
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'file_selected'
                                                                      .tr,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Utils.getResponsiveSize(
                                                                      context,
                                                                      14,
                                                                    ),
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .extension<
                                                                          AppColors
                                                                        >()
                                                                        ?.textBodyColor,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: cvName,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Utils.getResponsiveSize(
                                                                      context,
                                                                      14,
                                                                    ),
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .extension<
                                                                          AppColors
                                                                        >()
                                                                        ?.textBodyColor,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: cvExtention,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Utils.getResponsiveSize(
                                                                      context,
                                                                      14,
                                                                    ),
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .extension<
                                                                          AppColors
                                                                        >()
                                                                        ?.textBodyColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Utils.getResponsiveHeight(
                                                              context,
                                                              7,
                                                            ),
                                                      ),
                                                      RichText(
                                                        text: TextSpan(
                                                          children: [
                                                            TextSpan(
                                                              text:
                                                                  'file_size'
                                                                      .tr,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Utils.getResponsiveSize(
                                                                      context,
                                                                      11,
                                                                    ),
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .extension<
                                                                          AppColors
                                                                        >()
                                                                        ?.textBodyColor,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: cvSize,
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Utils.getResponsiveSize(
                                                                      context,
                                                                      11,
                                                                    ),
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .extension<
                                                                          AppColors
                                                                        >()
                                                                        ?.textBodyColor,
                                                              ),
                                                            ),
                                                            TextSpan(
                                                              text: 'KB',
                                                              style: TextStyle(
                                                                fontSize:
                                                                    Utils.getResponsiveSize(
                                                                      context,
                                                                      11,
                                                                    ),
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    Theme.of(
                                                                          context,
                                                                        )
                                                                        .extension<
                                                                          AppColors
                                                                        >()
                                                                        ?.textBodyColor,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                            Utils.getResponsiveHeight(
                                                              context,
                                                              37,
                                                            ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child:
                                                                ViewButtonWidget(),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                                Utils.getResponsiveWidth(
                                                                  context,
                                                                  16,
                                                                ),
                                                          ),
                                                          Expanded(
                                                            child:
                                                                UpdateButtonWidget(),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                      ),
                                    );
                                  }),
                                  SizedBox(
                                    height: Utils.getResponsiveHeight(
                                      context,
                                      16,
                                    ),
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
                                        preferJobType: preferJobType,
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

  // Future<void> pickSingleFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['svg', 'png', 'jpg', 'gif'],
  //   );
  //
  //   if (result != null) {
  //     String filePath = result.files.single.path!;
  //     print('Picked file: $filePath');
  //     applyJobVM.isUploaded.value = true;
  //   } else {
  //     print('File picking cancelled');
  //   }
  // }
  Future<void> pickAndValidateImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: [
        'svg',
        'png',
        'jpg',
        'jpeg',
        'pdf',
        'doc',
        'docx',
        'txt',
      ],
    );
    if (result != null && result.files.single.path != null) {
      final file = File(result.files.single.path!);
      final fileName = path.basename(file.path);
      final extension = path.extension(file.path);
      final fileSizeInBytes = await file.length();
      final fileSizeInKB = fileSizeInBytes / 1024;
      final fileSizeInMB = fileSizeInBytes / (1024 * 1024);

      if (fileSizeInMB > 1) {
        print('❌ Image size exceeds 1 MB');
        Get.snackbar('File too large', 'Please select a file under 1 MB');
        return;
      } else {
        cvName = fileName;
        cvExtention = extension;
        cvSize = fileSizeInKB.toString();
        applyJobVM.isUploaded.value = true;
      }

      print('✅ Image accepted: ${file.path}');
      // Proceed to use the image
    } else {
      print('❌ No file selected');
    }

    // if (result != null && result.files.single.path != null) {
    //   final path = result.files.single.path!;
    //   final ext = path.split('.').last.toLowerCase();
    //
    //   bool isValid = false;
    //
    //   if (ext == 'svg') {
    //     isValid = await validateSvgDimensions(path);
    //   } else {
    //     isValid = await validateImageDimensions(path);
    //   }
    //
    //   if (isValid) {
    //     print('✅ File accepted');
    //     // Proceed with upload or preview
    //   } else {
    //     print('❌ Image must be max 800x400 px');
    //     // Show error to user
    //   }
    // }
  }

  Future<bool> validateSvgDimensions(String path) async {
    final content = await File(path).readAsString();
    final document = XmlDocument.parse(content);
    final svg = document.findElements('svg').first;

    final widthAttr = svg.getAttribute('width') ?? '';
    final heightAttr = svg.getAttribute('height') ?? '';

    final width =
        double.tryParse(widthAttr.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;
    final height =
        double.tryParse(heightAttr.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0;

    return width <= 800 && height <= 400;
  }

  Future<bool> validateImageDimensions(String path) async {
    final file = File(path);
    final bytes = await file.readAsBytes();
    final decoded = img.decodeImage(bytes);

    if (decoded == null) return false;

    return decoded.width <= 800 && decoded.height <= 400;
  }
}
