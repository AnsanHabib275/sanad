import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/navigation/changePassword/widget/input_new_password_widget.dart';
import 'package:sanad/view/navigation/changePassword/widget/input_old_password_widget.dart';
import 'package:sanad/view/navigation/changePassword/widget/update_password_button_widget.dart';

import '../../../res/assets/icon_assets.dart';
import '../../../res/themes/app_themes.dart';
import '../../../utils/utils.dart';
import '../navigation_screen.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            leading: IconButton(
              icon: Image.asset(IconAssets.icArrowLeft),
              onPressed:
                  () => Get.offAll(() => NavigationScreen(initialIndex: 4)),
            ),
            centerTitle: true,
            title: Text('change_password'.tr),
            titleTextStyle: Theme.of(context).appBarTheme.titleTextStyle,
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'please_enter_the_following_credentials'.tr,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color:
                          Theme.of(
                            context,
                          ).extension<AppColors>()?.textSecondaryColor,
                      fontSize: Get.height * Utils.getResponsiveSize(14),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(25)),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'existing_password'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(10),
                        ),
                        InputOldPasswordWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(15),
                        ),
                        Text(
                          'new_password'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color:
                                Theme.of(
                                  context,
                                ).extension<AppColors>()?.textSecondaryColor,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(10),
                        ),
                        InputNewPasswordWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(20)),
                  Spacer(),
                  UpdatePasswordButtonWidget(formKey: formKey),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(52)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
