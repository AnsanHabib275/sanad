import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/models/help/help_model.dart';
import 'package:sanad/models/transactions/transactions_model.dart';
import 'package:sanad/view/navigation/help/widget/help_cart_widget.dart';
import 'package:sanad/view/navigation/transactions/widget/input_search_widget.dart';
import 'package:sanad/view/navigation/transactions/widget/transactions_cart_widget.dart';
import 'package:sanad/viewModels/controller/navigation/transactions/transactions_view_model.dart';
import '../../../res/colors/app_color.dart';
import '../../../utils/utils.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final transactionsVM = Get.put(TransactionsViewModel());
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
        backgroundColor: AppColor.whiteColor,
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          centerTitle: true,
          title: Text('help'.tr),
          titleTextStyle: TextStyle(
            color: AppColor.textPrimaryColor,
            fontFamily: 'Manrope',
            fontWeight: FontWeight.w600,
            fontSize: Get.height * Utils.getResponsiveSize(24),
          ),
          shape: Border(
            bottom: BorderSide(
              color: AppColor.searchBarBorderColor,
              width: 1.0,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
              ),
              child: InputSearchWidget(
                onSearch: (query) => transactionsVM.filterJobs(query),
              ),
            ),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(32)),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(16),
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
                      color: AppColor.blackColor,
                      fontSize: Get.height * Utils.getResponsiveSize(16),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                  Text(
                    'help_description'.tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: AppColor.textSecondaryColor,
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
            Divider(
              height: Get.height * Utils.getResponsiveHeight(1),
              color: AppColor.searchBarBorderColor,
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
