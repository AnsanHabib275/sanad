import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/viewModels/controller/navigation/home/home_view_model.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';

class InputLocationWidget extends StatelessWidget {
  InputLocationWidget({super.key});

  final jobsVM = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.getResponsiveWidth(context, 16),
          vertical: Utils.getResponsiveHeight(context, 8),
        ),
        child: Row(
          children: [
            Image.asset(
              IconAssets.icMapPin,
              height: Utils.getResponsiveHeight(context, 24),
              width: Utils.getResponsiveWidth(context, 24),
              color: Theme.of(context).iconTheme.color,
            ),
            SizedBox(width: Utils.getResponsiveWidth(context, 10)),
            Text(
              'location'.tr,
              style: TextStyle(
                color:
                    Theme.of(
                      context,
                    ).extension<AppColors>()?.textSecondaryColor,
                fontSize: Utils.getResponsiveSize(context, 14),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
    // });
  }
}
