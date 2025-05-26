import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import '../../../repository/signupRepository/sign_up_repository.dart';
import '../../../res/routes/routes_name.dart';
import '../../../utils/utils.dart';

class SignUpViewModel extends GetxController {
  final _api = SignUpRepository();

  final fullNameController = TextEditingController().obs;
  final taglineController = TextEditingController().obs;
  final countryCodeController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final noteController = TextEditingController().obs;

  final fullNameFocusNode = FocusNode().obs;
  final taglineFocusNode = FocusNode().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final mobileNumberFocusNode = FocusNode().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final noteFocusNode = FocusNode().obs;

  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
  RxBool isEnable = true.obs;
  RxString imagePath = ''.obs;
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
      'Password': passwordController.value.text,
      'Note': noteController.value.text,
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
}
