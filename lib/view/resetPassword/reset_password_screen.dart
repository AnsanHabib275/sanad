import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/resetPassword/widget/input_confirm_password_widget.dart';
import 'package:sanad/view/resetPassword/widget/input_new_password_widget.dart';
import 'package:sanad/view/resetPassword/widget/next_button_widget.dart';

import '../../res/assets/icon_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/utils.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final eID = Get.arguments['eID'] ?? '';
  // final eID = '';

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            leading: IconButton(
              icon: Image.asset(IconAssets.icArrowLeft,
                height: Get.height * Utils.getResponsiveHeight(24),
                width: Get.width * Utils.getResponsiveWidth(24),),
              onPressed: () => Get.back(),
            ),
            centerTitle: true,
            title: Text(
              'reset_password'.tr,
              style: TextStyle(
                color: AppColor.textPrimaryColor,
                fontSize: Get.height * Utils.getResponsiveSize(24),
                fontWeight: FontWeight.w600,
                fontFamily: 'Manrope',
              ),
            ),
            shape: Border(
              bottom: BorderSide(
                color: AppColor.searchBarBorderColor,
                width: 1.0,
              ),
            ),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(32),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(124)),
                  Text(
                    'reset_password_description'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.textPrimaryColor,
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'new_password'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColor.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputNewPasswordWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(20),
                        ),
                        Text(
                          'confirm_password'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColor.textPrimaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputConfirmPasswordWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(65)),
                  NextButtonWidget(formKey: formKey, eID: eID),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(20)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
