import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanad/view/signup/agency/widget/input_email_widget.dart';
import 'package:sanad/view/signup/agency/widget/input_full_name_widget.dart';
import 'package:sanad/view/signup/agency/widget/input_note_widget.dart';
import 'package:sanad/view/signup/agency/widget/input_password_widget.dart';
import 'package:sanad/view/signup/agency/widget/input_phone_number_widget.dart';
import 'package:sanad/view/signup/agency/widget/input_tagline_widget.dart';
import 'package:sanad/view/signup/agency/widget/input_upload_profile_picture_widget.dart';
import 'package:sanad/view/signup/agency/widget/continue_button_widget.dart';
import '../../../res/assets/image_assets.dart';
import 'package:sanad/res/colors/app_color.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/signup/sign_up_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpVM = Get.put(SignUpViewModel());
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      // child: PopScope(
      // canPop: false,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width * Utils.getResponsiveWidth(32),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(111)),
                  Image(
                    height: Get.height * Utils.getResponsiveHeight(27),
                    width: Get.width * Utils.getResponsiveWidth(77),
                    image: AssetImage(ImageAssets.appLogoSmall),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(24)),
                  Text(
                    'please_fill_the_required_information'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: Get.height * Utils.getResponsiveSize(20),
                      fontFamily: 'Manrope',
                      fontWeight: FontWeight.w500,
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
                          'full_name'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputFullNameWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'tagline'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputTaglineWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'phone_number'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputPhoneNumberWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'email'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputEmailWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'password_at_least'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputPasswordWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'upload_profile_picture'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputUploadProfilePictureWidget(),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(16),
                        ),
                        Text(
                          'add_note'.tr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            fontSize: Get.height * Utils.getResponsiveSize(14),
                            fontFamily: 'Manrope',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * Utils.getResponsiveHeight(8),
                        ),
                        InputNoteWidget(),
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(32)),
                  ContinueButtonWidget(formKey: formKey),
                  SizedBox(height: Get.height * Utils.getResponsiveHeight(111)),
                ],
              ),
            ),
          ),
        ),
      ),
      // ),
    );
  }
}
