import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../viewModels/controller/navigation/updateProfile/update_profile_view_model.dart';

class InputUploadProfilePictureWidget extends StatelessWidget {
  InputUploadProfilePictureWidget({super.key});

  final updateProfileVM = Get.put(UpdateProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: Utils.getResponsiveHeight(46),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(
                color:
                    Theme.of(
                      context,
                    ).inputDecorationTheme.border!.borderSide.color,
              ),
              borderRadius: BorderRadius.circular(Utils.getResponsiveSize(8)),
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Utils.hideKeyboardGlobally();
                  },
                  child: Container(
                    height: Utils.getResponsiveHeight(46),
                    width: Utils.getResponsiveWidth(115),
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<AppColors>()?.buttonBg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Utils.getResponsiveSize(8)),
                        bottomLeft: Radius.circular(Utils.getResponsiveSize(8)),
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
                          fontSize: Utils.getResponsiveSize(14),
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: Utils.getResponsiveHeight(46),
                  width: Utils.getResponsiveWidth(1),
                  color: Theme.of(context).extension<AppColors>()?.cardBg,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: Utils.getResponsiveWidth(16),
                      vertical: Utils.getResponsiveHeight(12),
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
                        fontSize: Utils.getResponsiveSize(14),
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (updateProfileVM.imagePath.value.isNotEmpty)
            Padding(
              padding: EdgeInsets.only(
                left: Utils.getResponsiveWidth(15),
                top: Utils.getResponsiveHeight(4),
              ),
              child: Text(
                updateProfileVM.imagePathError.value,
                style: TextStyle(
                  color: AppColor.redColor,
                  fontSize: Utils.getResponsiveSize(16),
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
