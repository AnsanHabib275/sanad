import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../models/onBoarding/on_boarding_list_model.dart';
import '../../../res/colors/app_color.dart';

class OnBoardingPage extends StatelessWidget {
  final OnBoardingListModel onBoardingList;

  const OnBoardingPage({super.key, required this.onBoardingList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Image.asset(
              onBoardingList.imagePath,
              height: Get.height * Utils.getResponsiveHeight(350),
              width: Get.width * 1,
              fit: BoxFit.contain,
              color: Theme.of(context).iconTheme.color,
            ),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(100)),
            Text(
              onBoardingList.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Get.height * Utils.getResponsiveSize(24),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w800,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(12)),
            Text(
              onBoardingList.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: Get.height * Utils.getResponsiveSize(14),
                fontFamily: 'Manrope',
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ],
        );
      },
    );
  }
}
