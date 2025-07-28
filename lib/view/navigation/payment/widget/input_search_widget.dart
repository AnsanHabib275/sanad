import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/navigation/payments/payments_view_model.dart';

class InputSearchWidget extends StatelessWidget {
  final Function(String) onSearch;

  InputSearchWidget({super.key, required this.onSearch});

  final paymentsVM = Get.put(PaymentsViewModel());

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return SearchBar(
      elevation: WidgetStatePropertyAll(0),
      controller: paymentsVM.searchController.value,
      focusNode: paymentsVM.searchFocusNode.value,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      textStyle: WidgetStateProperty.all(
        Theme.of(context).inputDecorationTheme.labelStyle,
      ),
      hintText: 'search_hint'.tr,
      hintStyle: WidgetStateProperty.all(
        Theme.of(context).inputDecorationTheme.hintStyle,
      ),
      leading: Image.asset(
        IconAssets.icSearch,
        height: Utils.getResponsiveHeight(context, 24),
        width: Utils.getResponsiveWidth(context, 24),
        color: Theme.of(context).iconTheme.color,
      ),
      backgroundColor: WidgetStateProperty.all(
        Theme.of(context).extension<AppColors>()?.cardBg,
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor, width: 1.0),
          borderRadius: BorderRadius.circular(
            Utils.getResponsiveSize(context, 8),
          ),
        ),
      ),
      onChanged: onSearch,
    );
    // });
  }
}
