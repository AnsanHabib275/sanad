import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/submittedCV/submitted_cv_model.dart';
import 'package:sanad/view/navigation/submittedCV/widget/bought_button_widget.dart';
import '../../../../res/assets/image_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/navigation/notification/notification_view_model.dart';

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
          Radius.circular(Get.height * Utils.getResponsiveHeight(12)),
        ),
        border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(Get.height * Utils.getResponsiveHeight(16)),
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
                    fontSize: Get.height * Utils.getResponsiveSize(16),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w700,
                    color:
                    Theme.of(
                      context,
                    ).extension<AppColors>()?.textPrimaryColor,
                  ),
                ),
                SizedBox(width: Get.width * Utils.getResponsiveWidth(20)),
                Text(
                  widget.submittedCVModel.submittedTime,
                  style: TextStyle(
                    fontSize: Get.height * Utils.getResponsiveSize(12),
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
            RichText(text: TextSpan(
              children:[
                TextSpan(
                  text: widget.submittedCVModel.email,
                  style: TextStyle(
                    fontSize:
                    Get.height *
                        Utils.getResponsiveSize(11),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color:
                    Theme.of(context)
                        .extension<AppColors>()
                        ?.textSecondaryColor,
                  ),
                ),
                TextSpan(
                  text: ' | ',
                  style: TextStyle(
                    fontSize:
                    Get.height *
                        Utils.getResponsiveSize(11),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color:
                    Theme.of(context)
                        .extension<AppColors>()
                        ?.textSecondaryColor,
                  ),
                ),
                TextSpan(
                  text: widget.submittedCVModel.designation,
                  style: TextStyle(
                    fontSize:
                    Get.height *
                        Utils.getResponsiveSize(11),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w500,
                    color:
                    Theme.of(context)
                        .extension<AppColors>()
                        ?.textSecondaryColor,
                  ),
                ),
              ],
            ),),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:
                    Theme.of(
                      context,
                    ).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(
                        Get.height * Utils.getResponsiveHeight(8),
                      ),
                    ),
                    border: Border.all(color: Theme.of(context).dividerColor, width: 1.0),
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
                          widget.submittedCVModel.cvName,
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
                widget.submittedCVModel.isBought ? BoughtButtonWidget() : SizedBox(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
