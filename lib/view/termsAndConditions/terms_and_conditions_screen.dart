import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/termsAndConditions/widget/accept_button_widget.dart';
import 'package:sanad/view/termsAndConditions/widget/decline_button_widget.dart';

import '../../../../res/assets/icon_assets.dart';
import '../../../../res/themes/app_themes.dart';
import '../../../../utils/utils.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
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
              height: Utils.getResponsiveHeight(24),
              width: Utils.getResponsiveWidth(24),
              color: Theme.of(context).iconTheme.color,
            ),
            onPressed: () => Get.back(),
          ),
          centerTitle: true,
          title: Text('terms_and_conditions'.tr),
          titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          shape: Border(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: 1.0,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Utils.getResponsiveWidth(16),
                    vertical: Utils.getResponsiveHeight(16),
                  ),
                  child: Text(
                    'terms_and_conditions_description'.tr,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textSecondaryColor,
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
                      fontSize: Utils.getResponsiveSize(14),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).extension<AppColors>()?.cardBg,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Utils.getResponsiveWidth(16),
                  vertical: Utils.getResponsiveHeight(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: DeclineButtonWidget()),
                    SizedBox(width: Utils.getResponsiveWidth(12)),
                    Expanded(child: AcceptButtonWidget()),
                  ],
                ),
              ),
            ),
            SizedBox(height: Utils.getResponsiveHeight(15)),
          ],
        ),
      ),
    );
  }
}
