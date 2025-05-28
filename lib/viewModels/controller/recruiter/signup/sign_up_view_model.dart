import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:phone_number/phone_number.dart';
import 'package:http/http.dart' as http;

import '../../../../repository/recruiter/signupRepository/sign_up_repository.dart';
import '../../../../res/routes/routes_name.dart';
import '../../../../res/urls/app_url.dart';
import '../../../../utils/utils.dart';
import '../../userPreference/user_preference_view_model.dart';

class SignUpViewModel extends GetxController {
  final _api = SignUpRepository();

  final fullNameController = TextEditingController().obs;
  final taglineController = TextEditingController().obs;
  final countryCodeController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final organizationTypeController = TextEditingController().obs;

  final fullNameFocusNode = FocusNode().obs;
  final taglineFocusNode = FocusNode().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final mobileNumberFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final organizationTypeFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isEnable = true.obs;
  RxString imagePath = ''.obs;
  RxString filePath = ''.obs;
  RxString imagePathError = ''.obs;
  RxString errorMessage = ''.obs;
  RxString apiErrorMessage = ''.obs;
  RxBool isFormValid = false.obs;
  final phoneError = RxString('');
  final countryCodeError = RxString('');
  final RxString selectedCountryCode = ''.obs;

  void handleCountrySelection(Country country) {
    isEnable.value = true;
    selectedCountryCode.value = country.countryCode;
    countryCodeController.value.text = '+${country.phoneCode}';
  }

  void getRegionCode(String value) async {
    selectedCountryCode.value = await PhoneNumberUtil().carrierRegionCode();
  }

  Future<void> validatePhoneNumber(String value) async {
    if (selectedCountryCode.isEmpty) {
      phoneError.value = 'please_select_country_code_first'.tr;
      return;
    }
    try {
      final isValid = await PhoneNumberUtil().validate(
        value,
        regionCode: selectedCountryCode.value,
      );
      if (!isValid) {
        phoneError.value = 'invalid_phone_number_format'.tr;
      } else {
        phoneError.value = '';
      }
    } catch (e) {
      phoneError.value = 'invalid_phone_number'.tr;
    }
  }

  Future<void> formatPhoneNumber(String value) async {
    if (selectedCountryCode.isNotEmpty && value.isNotEmpty) {
      try {
        final formatted = await PhoneNumberUtil().format(
          value,
          selectedCountryCode.value,
        );
        mobileNumberController.value.text = formatted;
        mobileNumberController.value.selection = TextSelection.fromPosition(
          TextPosition(offset: mobileNumberController.value.text.length),
        );
      } catch (e) {
        // Handle formatting error
      }
    }
  }

  void validateForm() {
    isFormValid.value =
        countryCodeController.value.text.isNotEmpty &&
        mobileNumberController.value.text.isNotEmpty &&
        phoneError.value.isEmpty;
  }

  void signUpApi() {
    loading.value = true;
    Map data = {
      'FullName': fullNameController.value.text,
      'Tagline': taglineController.value.text,
      'CountryCode': countryCodeController.value.text,
      'MobileNumber': mobileNumberController.value.text,
      'Email': emailController.value.text,
      // 'Password': passwordController.value.text,
      // 'Note': noteController.value.text,
    };
    _api
        .signUpApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            apiErrorMessage.value = '';
            Utils.toastMessage("OTP Sent To Your Email Account");
            Get.toNamed(
              RoutesName.verifyEmailScreen,
              arguments: {
                'Accountid': value['Accountid'],
                'email': emailController.value.text,
              },
            );
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          apiErrorMessage.value = error.toString();
        });
  }

  void signUpIndividualApi() {
    loading.value = true;
    Map data = {
      'CountryCode': countryCodeController.value.text,
      'MobileNumber': mobileNumberController.value.text,
    };
    _api
        .signUpIndividualApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            apiErrorMessage.value = '';
            Utils.toastMessage("OTP Sent To Your Email Account");
            Get.toNamed(
              RoutesName.verifyEmailScreen,
              arguments: {
                'Accountid': value['Accountid'],
                'MobileNumber':
                    '${countryCodeController.value.text}${mobileNumberController.value.text}',
              },
            );
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          apiErrorMessage.value = error.toString();
        });
  }

  final ImagePicker picker = ImagePicker();

  Future<void> getImageFromCamera() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 85,
      preferredCameraDevice: CameraDevice.rear,
    );

    if (image != null) {
      await handleImageFile(image);
    }
  }

  Future<void> getImageFromGallery() async {
    final XFile? image = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image != null) {
      await handleImageFile(image);
    }
  }

  Future<void> handleImageFile(XFile xFile) async {
    try {
      final File file = File(xFile.path);

      if (await file.exists()) {
        final String fileName = path.basename(file.path);
        final String mimeType = lookupMimeType(file.path) ?? 'image/jpeg';
        filePath.value = file.path;
        final multipartFile = await http.MultipartFile.fromPath(
          'file',
          file.path,
          filename: fileName,
          contentType: MediaType.parse(mimeType),
        );

        await uploadProfileImageApi(multipartFile);
      } else {
        if (kDebugMode) {
          print('File does not exist at path: ${file.path}');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error handling file: $e');
      }
    }
  }

  Future<void> uploadProfileImageApi(http.MultipartFile file) async {
    loading.value = true;
    Map<String, String> data = {
      'E_ID': Get.find<UserPreference>().userEid.value.trim(),
    };
    List<http.MultipartFile> files = [];
    files.add(file);
    _api
        .uploadProfileImageApi(data, files)
        .then((value) {
          loading.value = false;
          if (value['IsSuccessfull'] == false) {
            Utils.toastMessage(value['message']);
          } else {
            String imageUrl = value['imageURL'];
            imagePath.value = AppUrl.baseUrl + imageUrl;
            if (kDebugMode) {
              print(AppUrl.baseUrl + imageUrl);
            }
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          Utils.toastMessage(error.toString());
        });
  }
}
