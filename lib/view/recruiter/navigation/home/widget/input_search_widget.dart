import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/viewModels/controller/recruiter/navigation/home/home_view_model.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
class InputSearchWidget extends StatelessWidget {
  final Function(String) onSearch;

  InputSearchWidget({super.key, required this.onSearch});
  final jobsVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return SearchBar(
      backgroundColor: WidgetStateProperty.all(
        Theme.of(context).extension<AppColors>()?.cardBg,
      ),
      elevation: WidgetStatePropertyAll(0),
      controller: jobsVM.searchController.value,
      focusNode: jobsVM.searchFocusNode.value,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      textStyle: WidgetStateProperty.all(
        Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      hintText: 'search_home_hint'.tr,
      hintStyle: WidgetStateProperty.all(
        Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      leading: Image.asset(
        IconAssets.icSearch,
        height: Get.height * Utils.getResponsiveHeight(24),
        width: Get.width * Utils.getResponsiveWidth(24),
        color: Theme.of(context).iconTheme.color,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Get.height * Utils.getResponsiveSize(8),
          ),
        ),
      ),
      onChanged: onSearch,
    );
    // });
  }
}
