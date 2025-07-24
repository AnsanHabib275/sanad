import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';

import '../../../../../models/submittedCV/submitted_cv_model.dart';
import '../../../../../res/assets/image_assets.dart';
import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../../viewModels/controller/navigation/notification/notification_view_model.dart';
import '../../../../res/colors/app_color.dart';

class SubmittedCVCartWidget extends StatefulWidget {
  final SubmittedCVModel submittedCVModel;

  const SubmittedCVCartWidget({super.key, required this.submittedCVModel});

  @override
  State<SubmittedCVCartWidget> createState() => _SubmittedCVCartWidgetState();
}

class _SubmittedCVCartWidgetState extends State<SubmittedCVCartWidget> {
  final notificationVM = Get.put(NotificationViewModel());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).extension<AppColors>()?.cardBg,
        borderRadius: BorderRadius.all(
          Radius.circular(Utils.getResponsiveHeight(12)),
        ),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(Utils.getResponsiveHeight(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.submittedCVModel.name,
                  style: TextStyle(
                    fontSize: Utils.getResponsiveSize(16),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                  ),
                ),
                SizedBox(width: Utils.getResponsiveWidth(20)),
                Text(
                  widget.submittedCVModel.submittedTime,
                  style: TextStyle(
                    fontSize: Utils.getResponsiveSize(12),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textSecondaryColor,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: widget.submittedCVModel.email,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(11),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textSecondaryColor,
                    ),
                  ),
                  TextSpan(
                    text: ' | ',
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(11),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textSecondaryColor,
                    ),
                  ),
                  TextSpan(
                    text: widget.submittedCVModel.designation,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(11),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Utils.getResponsiveHeight(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                          widget.submittedCVModel.cvName,
                          style: TextStyle(
                            fontSize: Utils.getResponsiveSize(11),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w400,
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textBodyColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                widget.submittedCVModel.isBought
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                              horizontal: Utils.getResponsiveWidth(4),
                              vertical: Utils.getResponsiveHeight(4),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset(IconAssets.icCheckbox),
                                SizedBox(width: Utils.getResponsiveWidth(4)),
                                Text(
                                  'bought'.tr,
                                  style: TextStyle(
                                    fontSize: Utils.getResponsiveSize(10),
                                    fontFamily: 'Manrope',
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: Utils.getResponsiveHeight(2)),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'you_have_paid'.tr,
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
                              TextSpan(
                                text: ' - ',
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
                              TextSpan(
                                text: widget.submittedCVModel.price,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(12),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.textBodyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                    : Container(
                      decoration: BoxDecoration(
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.containerBg,
                        borderRadius: BorderRadius.all(
                          Radius.circular(Utils.getResponsiveHeight(6)),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Utils.getResponsiveWidth(8),
                          vertical: Utils.getResponsiveHeight(2),
                        ),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'view_cv'.tr,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(12),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.textBodyColor,
                                ),
                              ),
                              TextSpan(
                                text: ' - ',
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(12),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500,
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.textBodyColor,
                                ),
                              ),
                              TextSpan(
                                text: widget.submittedCVModel.price,
                                style: TextStyle(
                                  fontSize: Utils.getResponsiveSize(12),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w700,
                                  color:
                                      Theme.of(
                                        context,
                                      ).extension<AppColors>()?.textBodyColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
