import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';
import '../../../../viewModels/controller/navigation/help/help_view_model.dart';

class InputSearchWidget extends StatelessWidget {
  final Function(String) onSearch;

  InputSearchWidget({super.key, required this.onSearch});
  final helpVM = Get.put(HelpViewModel());
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return SearchBar(
      elevation: WidgetStatePropertyAll(0),
      controller: helpVM.searchController.value,
      focusNode: helpVM.searchFocusNode.value,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      textStyle: WidgetStateProperty.all(
        TextStyle(
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontSize: Get.height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
        ),
      ),
      hintText: 'search_hint'.tr,
      hintStyle: WidgetStateProperty.all(
        Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      leading: Image.asset(IconAssets.icSearch),
      // backgroundColor: WidgetStateProperty.all(AppColor.whiteColor),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).cardTheme.surfaceTintColor!,
            width: 1.0,
          ),
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
