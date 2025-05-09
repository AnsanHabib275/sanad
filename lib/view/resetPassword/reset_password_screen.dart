import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/resetPassword/widget/input_confirm_password_widget.dart';
import 'package:sanad/view/resetPassword/widget/input_new_password_widget.dart';
import 'package:sanad/view/resetPassword/widget/reset_password_button_widget.dart';

import '../../res/assets/icon_assets.dart';
import '../../res/assets/image_assets.dart';
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
            backgroundColor: AppColor.transparent,
            leading: IconButton(
              icon: Image.asset(IconAssets.icArrowLeft),
              onPressed: () => Get.back(),
            ),
            centerTitle: false,
            title: Text(
              'reset_password'.tr,
              style: TextStyle(
                  color: AppColor.blue,
                  fontSize: Get.height * Utils.getResponsiveSize(20),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Outfit'),
            ),
          ),
          extendBody: true,
          extendBodyBehindAppBar: true,
          body: Container(
            height: Get.height * 1,
            width: Get.width * 1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageAssets.bg),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  Get.width * Utils.getResponsiveWidth(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'please_enter_the_following_credentials'.tr,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColor.grey,
                                  fontSize:
                                      Get.height * Utils.getResponsiveSize(14),
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(25),
                              ),
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
                                        color: AppColor.darkGrey,
                                        fontSize: Get.height *
                                            Utils.getResponsiveSize(14),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height *
                                          Utils.getResponsiveHeight(10),
                                    ),
                                    InputNewPasswordWidget(),
                                    SizedBox(
                                      height: Get.height *
                                          Utils.getResponsiveHeight(15),
                                    ),
                                    Text(
                                      'confirm_password'.tr,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: AppColor.darkGrey,
                                        fontSize: Get.height *
                                            Utils.getResponsiveSize(14),
                                        fontFamily: 'Manrope',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height *
                                          Utils.getResponsiveHeight(10),
                                    ),
                                    InputConfirmPasswordWidget(),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    Get.height * Utils.getResponsiveHeight(20),
                              ),
                              Spacer(),
                              ResetPasswordButtonWidget(
                                  formKey: formKey, eID: eID),
                              SizedBox(
                                  height: Get.height *
                                      Utils.getResponsiveHeight(52)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
