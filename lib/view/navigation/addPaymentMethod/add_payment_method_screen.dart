import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/res/assets/icon_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/res/themes/app_themes.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/navigation/addPaymentMethod/widget/save_details_button_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/apply_now_button_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/custom_tab_bar_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/job_specifications_cart_widget.dart';
import 'package:sanad/view/navigation/viewJob/widget/software_program_cart_widget.dart';

import '../../../../viewModels/controller/navigation/applyJob/apply_job_view_model.dart';

class AddPaymentMethodScreen extends StatefulWidget {
  const AddPaymentMethodScreen({super.key});

  @override
  State<AddPaymentMethodScreen> createState() => _AddPaymentMethodScreenState();
}

class _AddPaymentMethodScreenState extends State<AddPaymentMethodScreen> {
  final applyJobVM = Get.put(ApplyJobViewModel());

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
              height: Get.height * Utils.getResponsiveHeight(24),
              width: Get.width * Utils.getResponsiveWidth(24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('payment_method'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(16),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                Text(
                  'job_details'.tr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color:
                        Theme.of(
                          context,
                        ).extension<AppColors>()?.textPrimaryColor,
                    fontSize: Get.height * Utils.getResponsiveSize(18),
                    fontFamily: 'Manrope',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                CustomTabBar(),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                Divider(
                  color: Theme.of(context).dividerColor,
                  height: Get.height * Utils.getResponsiveHeight(1),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                SizedBox(
                  child: Obx(() {
                    return applyJobVM.selectedTab.value == 'general'
                        ? Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                    Get.width * Utils.getResponsiveWidth(16),
                              ),
                              child: SizedBox(),
                            ),
                          ],
                        )
                        : Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: Get.height * Utils.getResponsiveHeight(8),
                            ),
                          ],
                        );
                  }),
                ),
                SizedBox(height: Get.height * Utils.getResponsiveHeight(16)),
                SaveDetailsButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
