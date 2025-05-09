import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/components/round_button_border.dart';
import '../../../../viewModels/controller/navigation/navigation_view_model.dart';

class ScanNowButtonWidget extends StatelessWidget {
  ScanNowButtonWidget({super.key});

  final navigationVM = Get.put(NavigationViewModel());

  @override
  Widget build(BuildContext context) {
    return RoundButtonBorder(
      width: 137,
      title: 'scan_now'.tr,
      onPress: () {
        // Get.toNamed(RoutesName.scanProductScreen);
      },
    );
  }
}
