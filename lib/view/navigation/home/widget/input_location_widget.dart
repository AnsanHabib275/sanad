import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/viewModels/controller/navigation/home/jobs_view_model.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class InputLocationWidget extends StatelessWidget {
  InputLocationWidget({super.key});
  final jobsVM = Get.put(JobsViewModel());
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * Utils.getResponsiveWidth(16),
          vertical: Get.height * Utils.getResponsiveHeight(8),
        ),
        child: Row(
          children: [
            Image.asset(
              IconAssets.icMapPin,
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
            ),
            SizedBox(width: Get.width * Utils.getResponsiveWidth(10)),
            Text(
              'location'.tr,
              style: TextStyle(
                color: AppColor.textSecondaryColor,
                fontSize: Get.height * Utils.getResponsiveSize(14),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ), // Color of the divider
    );
    // });
  }
}
