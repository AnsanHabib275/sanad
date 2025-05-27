import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/viewModels/controller/navigation/transactions/transactions_view_model.dart';
import '../../../../res/themes/app_themes.dart';
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
        Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      hintText: 'search_hint'.tr,
      hintStyle: WidgetStateProperty.all(
        Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      leading: Image.asset(
        IconAssets.icSearch,
        height: Get.height * Utils.getResponsiveHeight(24),
        width: Get.width * Utils.getResponsiveWidth(24),
        color: Theme.of(context).iconTheme.color,
      ),
      backgroundColor: WidgetStateProperty.all(
        Theme.of(context).extension<AppColors>()?.cardBg,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
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
