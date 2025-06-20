import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/recruiter/navigation/applyJob/reviewJob/widget/apply_again_button_widget.dart';
import 'package:sanad/view/recruiter/navigation/applyJob/reviewJob/widget/back_to_jobs_button_widget.dart';

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
          elevation: 4,
          backgroundColor: Theme.of(context).extension<AppColors>()?.cardBg,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              Get.height * Utils.getResponsiveSize(12),
            ),
          ),
          child: SizedBox(
            height: Get.height * Utils.getResponsiveHeight(264),
            width: Get.width * Utils.getResponsiveWidth(400),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(20),
                vertical: Get.height * Utils.getResponsiveHeight(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    height: Get.height * Utils.getResponsiveHeight(48),
                    width: Get.width * Utils.getResponsiveWidth(48),
                    ImageAssets.imgSuccessFull,
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(20)),
                  Text(
                    'application_sent_successfully'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Get.height * Utils.getResponsiveSize(18),
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textPrimaryColor,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(8)),
                  FittedBox(
                    child: Text(
                      'application_submitted_successfully'.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: Get.height * Utils.getResponsiveSize(14),
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.textBodyColor,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(32)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(child: ApplyAgainButtonWidget()),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(12)),
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
