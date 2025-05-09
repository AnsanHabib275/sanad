import 'package:sanad/utils/utils.dart';
import 'package:sanad/view/login/widget/login_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/assets/image_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/routes/routes_name.dart';
import '../../viewModels/controller/login/login_view_model.dart';
import '../login/widget/input_email_widget.dart';
import '../login/widget/input_password_widget.dart';

class SelectRoleScreen extends StatefulWidget {
  const SelectRoleScreen({super.key});

  @override
  State<SelectRoleScreen> createState() => _SelectRoleScreenState();
}

class _SelectRoleScreenState extends State<SelectRoleScreen> {
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: PopScope(
        canPop: false,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Get.width * Utils.getResponsiveWidth(32),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: Get.height * Utils.getResponsiveHeight(54),
                    width: Get.width * Utils.getResponsiveWidth(155),
                    image: AssetImage(ImageAssets.appLogo),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(50)),
                  Text(
                    'are_you_company_or_recruiter'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColor.textPrimaryColor,
                      fontSize: Get.height * Utils.getResponsiveSize(24),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'don’t_have_an_account'.tr,
                        textScaler: TextScaler.linear(1),
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w400,
                          fontSize: Get.height * Utils.getResponsiveSize(12),
                          color: AppColor.textSecondaryColor,
                        ),
                      ),
                      SizedBox(width: Get.width * Utils.getResponsiveWidth(4)),
                      InkWell(
                        onTap: () {
                          Utils.hideKeyboardGlobally();
                          Get.offAllNamed(RoutesName.signUpScreen);
                        },
                        child: Text(
                          'request_one'.tr,
                          style: TextStyle(
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                            fontSize: Get.height * Utils.getResponsiveSize(12),
                            color: AppColor.textPrimaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
