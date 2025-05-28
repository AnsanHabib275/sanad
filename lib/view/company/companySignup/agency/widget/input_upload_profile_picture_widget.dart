import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/company/companySignup/company_sign_up_view_model.dart';

import '../../../../../res/themes/app_themes.dart';

class InputUploadProfilePictureWidget extends StatelessWidget {
  InputUploadProfilePictureWidget({super.key});

  final signUpVM = Get.put(CompanySignUpViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Get.height * Utils.getResponsiveHeight(46),
            width: Get.width * 1,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    Theme.of(
                      context,
                    ).inputDecorationTheme.border!.borderSide.color,
              ),
              borderRadius: BorderRadius.circular(
                Get.height * Utils.getResponsiveSize(8),
              ),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Utils.hideKeyboardGlobally();
                  },
                  child: Container(
                    height: Get.height * Utils.getResponsiveHeight(46),
                    width: Get.width * Utils.getResponsiveWidth(115),
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.buttonBg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          Get.height * Utils.getResponsiveSize(8),
                        ),
                        bottomLeft: Radius.circular(
                          Get.height * Utils.getResponsiveSize(8),
                        ),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'choose_file'.tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color:
                              Theme.of(
                                context,
                              ).extension<AppColors>()?.textPrimaryColor,
                          fontSize: Get.height * Utils.getResponsiveSize(14),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Get.height * Utils.getResponsiveHeight(46),
                  width: Get.width * Utils.getResponsiveWidth(1),
                  color: Theme.of(context).extension<AppColors>()?.cardBg,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Get.width * Utils.getResponsiveWidth(16),
                      vertical: Get.height * Utils.getResponsiveHeight(12),
                    ),
                    child: Text(
                      'choose_file_hint'.tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color:
                            Theme.of(
                              context,
                            ).extension<AppColors>()?.textPrimaryColor,
                        fontSize: Get.height * Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (signUpVM.imagePath.value.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: Get.width * Utils.getResponsiveWidth(15),
                top: Get.height * Utils.getResponsiveHeight(4),
              ),
              child: Text(
                signUpVM.imagePathError.value,
                style: TextStyle(
                  color: AppColor.redColor,
                  fontSize: Get.height * Utils.getResponsiveSize(16),
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
        ],
      );
    });
  }
}
