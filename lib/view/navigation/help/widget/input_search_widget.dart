import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/viewModels/controller/navigation/transactions/transactions_view_model.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../utils/utils.dart';

class InputSearchWidget extends StatelessWidget {
  final Function(String) onSearch;

  InputSearchWidget({super.key, required this.onSearch});
  final transactionsVM = Get.put(TransactionsViewModel());
  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return SearchBar(
      elevation: WidgetStatePropertyAll(0),
      controller: transactionsVM.searchController.value,
      focusNode: transactionsVM.searchFocusNode.value,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      textStyle: WidgetStateProperty.all(
        TextStyle(
          color: AppColor.textPrimaryColor,
          fontSize: Get.height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
        ),
      ),
      hintText: 'search_hint'.tr,
      hintStyle: WidgetStateProperty.all(
        TextStyle(
          color: AppColor.textSecondaryColor,
          fontSize: Get.height * Utils.getResponsiveSize(14),
          fontFamily: 'Manrope',
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Image.asset(IconAssets.icSearch),
      // backgroundColor: WidgetStateProperty.all(AppColor.whiteColor),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide(color: AppColor.searchBarBorderColor, width: 1.0),
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
