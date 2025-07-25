import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/help/help_model.dart';
import 'package:sanad/view/navigation/help/widget/help_cart_widget.dart';
import 'package:sanad/view/navigation/transactions/widget/input_search_widget.dart';

import '../../../../../res/themes/app_themes.dart';
import '../../../../../utils/utils.dart';
import '../../../../res/assets/icon_assets.dart';
import '../../../../viewModels/controller/navigation/help/help_view_model.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final helpVM = Get.put(HelpViewModel());
  final List<HelpModel> helpItems = [
    HelpModel(
      1,
      'Tip  ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor ',
    ),
    HelpModel(
      2,
      'Tip  ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor ',
    ),
    HelpModel(
      3,
      'Tip  ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor ',
    ),
    HelpModel(
      4,
      'Tip  ipsum dolor sit amet, consectetur\nadipiscing elit, sed do eiusmod tempor ',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: IconButton(
            icon: Image.asset(
              IconAssets.icArrowLeft,
              height: Utils.getResponsiveHeight(context, 24),
              width: Utils.getResponsiveWidth(context, 24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('help'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: Utils.getResponsiveHeight(context, 16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(context, 16),
              ),
              child: InputSearchWidget(
                onSearch: (query) => helpVM.filterHelp(query),
              ),
            ),
            SizedBox(height: Utils.getResponsiveHeight(context, 32)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.getResponsiveWidth(context, 16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'help_title'.tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: Utils.getResponsiveSize(context, 16),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: Utils.getResponsiveHeight(context, 16)),
                  Text(
                    'help_description'.tr,
                    textAlign: TextAlign.left,
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
            SizedBox(height: Utils.getResponsiveHeight(context, 16)),
            Divider(
              height: Utils.getResponsiveHeight(context, 1),
              color: Theme.of(context).dividerColor,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: helpItems.length,
                itemBuilder: (context, index) {
                  return HelpCartWidget(help: helpItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
