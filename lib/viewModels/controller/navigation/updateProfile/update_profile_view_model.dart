import 'dart:io';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
// import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';
// import 'package:path/path.dart' as path;
import 'package:phone_number/phone_number.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../../models/login/login_model.dart';
import '../../../../../repository/updateProfileRepository/update_profile_repository.dart';
import '../../../../../res/urls/app_url.dart';
import '../../../../../view/navigation/navigation_screen.dart';
import '../../userPreference/user_preference_view_model.dart';

class UpdateProfileViewModel extends GetxController {
  final _api = UpdateProfileRepository();
  final userVM = Get.find<UserPreference>();
  final firstNameController = TextEditingController().obs;
  final lastNameController = TextEditingController().obs;
  final countryCodeController = TextEditingController().obs;
  final phoneNumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final streetController = TextEditingController().obs;
  final cityController = TextEditingController().obs;
  final postalCodeController = TextEditingController().obs;
  final countryController = TextEditingController().obs;
  final taglineController = TextEditingController().obs;

  final firstNameFocusNode = FocusNode().obs;
  final lastNameFocusNode = FocusNode().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final phoneNumberFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final streetFocusNode = FocusNode().obs;
  final cityFocusNode = FocusNode().obs;
  final postalCodeFocusNode = FocusNode().obs;
  final countryFocusNode = FocusNode().obs;
  final taglineFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isEnable = false.obs;
  RxString errorMessage = ''.obs;
  RxString imagePathError = ''.obs;
  RxString imagePath = ''.obs;
  RxString filePath = ''.obs;
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
        phoneNumberController.value.text = formatted;
        phoneNumberController.value.selection = TextSelection.fromPosition(
          TextPosition(offset: phoneNumberController.value.text.length),
        );
      } catch (e) {
        // Handle formatting error
      }
    }
  }

  void updateProfileApi() {
    loading.value = true;
    Map<String, String> data = {
      "E_ID": Get.find<UserPreference>().userEid.value,
      "ImageURL": imagePath.value,
      "FirstName": firstNameController.value.text,
      "LastName": lastNameController.value.text,
      "CountryCode": countryCodeController.value.text,
      "MobileNumber": phoneNumberController.value.text,
      "Street": streetController.value.text,
      "City": cityController.value.text,
      "PostalCode": postalCodeController.value.text,
      "Country": countryController.value.text,
      "Tagline": taglineController.value.text,
    };
    _api
        .updateProfileApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            errorMessage.value = value['message'];
          } else {
            LoginModel loginModel = LoginModel.fromJson(value);
            userVM
                .saveUser(loginModel)
                .then((value) {
                  Utils.snackBar('success'.tr, 'Profile Update Successfully');
                  Get.offAll(() => NavigationScreen(initialIndex: 4));
                })
                .onError((error, stackTrace) {
                  Utils.snackBar('error'.tr, error.toString());
                });
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
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
