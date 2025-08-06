import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/res/urls/app_url.dart';
import 'package:sanad/utils/utils.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';

import '../../../../repository/signupRepository/individual/sign_up_repository.dart';

class SignUpViewModel extends GetxController {
  final _api = SignUpRepository();

  final countryCodeController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;

  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final taglineController = TextEditingController().obs;
  final emailController = TextEditingController().obs;

  final countryCodeFocusNode = FocusNode().obs;
  final mobileNumberFocusNode = FocusNode().obs;

  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  final taglineFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isAgree = false.obs;
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

  void signUpIndividualApi() {
    loading.value = true;
    final Map data = {
      'ProfileImage': imagePath.value,
      'FirstName': firstNameController.value.text,
      'LastName': lastNameController.value.text,
      'Tagline': taglineController.value.text,
      'Email': emailController.value.text,
    };
    _api
        .signUpIndividualApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            apiErrorMessage.value = '';
            Utils.snackBar('success'.tr, 'OTP Sent To Your Email Account');
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

  void signUpApi() {
    loading.value = true;
    Map data = {
      'CountryCode': countryCodeController.value.text,
      'MobileNumber': mobileNumberController.value.text,
    };
    _api
        .signUpApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            apiErrorMessage.value = '';
            Utils.snackBar('success'.tr, "OTP Sent To Your Phone Number");
            Get.toNamed(
              RoutesName.otpScreen,
              arguments: {
                'from': 'individual',
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
        // final String fileName = path.basename(file.path);
        // final String mimeType = lookupMimeType(file.path) ?? 'image/jpeg';
        filePath.value = file.path;
        // final multipartFile = await http.MultipartFile.fromPath(
        //   'file',
        //   file.path,
        //   filename: fileName,
        //   contentType: MediaType.parse(mimeType),
        // );

        // await uploadProfileImageApi(multipartFile);
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
            Utils.snackBar('error'.tr, value['Message']);
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
          Utils.snackBar('error'.tr, error.toString());
        });
  }
}
