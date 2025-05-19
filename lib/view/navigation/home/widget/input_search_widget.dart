import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/viewModels/controller/navigation/home/home_view_model.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class InputSearchWidget extends StatelessWidget {
  final Function(String) onSearch;

  InputSearchWidget({super.key, required this.onSearch});
  final jobsVM = Get.put(HomeViewModel());
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return SearchBar(
      elevation: WidgetStatePropertyAll(0),
      controller: jobsVM.searchController.value,
      focusNode: jobsVM.searchFocusNode.value,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      textStyle: WidgetStateProperty.all(
        TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontSize: Get.height * Utils.getResponsiveSize(16),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w400,
        ),
      ),
      hintText: 'search_home_hint'.tr,
      hintStyle: WidgetStateProperty.all(
        Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      leading: Image.asset(IconAssets.icSearch),
      // backgroundColor: WidgetStateProperty.all(AppColor.whiteColor),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          // side: BorderSide(color: Theme.of(context).cardTheme.surfaceTintColor!, width: 1.0),
          borderRadius: BorderRadius.circular(
            Get.height * Utils.getResponsiveSize(8),
          ),
        ),
      ),
      // constraints: BoxConstraints(minHeight: 40),
      onChanged: onSearch,
    );
    // });
  }
}
