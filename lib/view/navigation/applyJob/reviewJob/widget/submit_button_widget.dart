import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/applyJob/reviewJob/widget/apply_again_button_widget.dart';
import 'package:sanad/view/navigation/applyJob/reviewJob/widget/back_to_jobs_button_widget.dart';

import '../../../../../../res/assets/image_assets.dart';
import '../../../../../../res/components/round_button.dart';
import '../../../../../../res/themes/app_themes.dart';
import '../../../../../../utils/utils.dart';

class SubmitButtonWidget extends StatelessWidget {
  const SubmitButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundButton(
      width: 89,
      height: 40,
      title: 'submit'.tr,
      onPress: () {
        showApplyJobDialog(context);
      },
    );
  }

  void showApplyJobDialog(BuildContext context) {
    Get.dialog(
      MediaQuery(
        data: MediaQuery.of(
          context,
        ).copyWith(textScaler: TextScaler.linear(1.0)),
        child: Dialog(
          insetPadding: EdgeInsets.zero,
          elevation: 0,
          backgroundColor: Theme.of(context).extension<AppColors>()?.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Utils.getResponsiveSize(context, 12),
            ),
          ),
          child: SizedBox(
            width: Utils.getResponsiveWidth(context, 400),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(context, 20),
                vertical: Utils.getResponsiveHeight(context, 20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    height: Utils.getResponsiveHeight(context, 48),
                    width: Utils.getResponsiveWidth(context, 48),
                    ImageAssets.imgSuccessFull,
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 20)),
                  Text(
                    'application_sent_successfully'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 18),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 8)),
                  Text(
                    'application_submitted_successfully'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Utils.getResponsiveSize(context, 14),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textBodyColor,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: ApplyAgainButtonWidget()),
                      SizedBox(width: Utils.getResponsiveWidth(context, 12)),
                      Expanded(child: BackToJobsButtonWidget()),
                    ],
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
