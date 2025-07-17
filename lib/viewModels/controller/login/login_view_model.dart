import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';

import '../../../../models/login/login_model.dart';
import '../../../../repository/loginRepository/login_repository.dart';
import '../../../../res/routes/routes_name.dart';
import '../registerFirebaseToken/register_firebase_token_view_model.dart';
import '../userPreference/user_preference_view_model.dart';

class LoginViewModel extends GetxController {
  final _api = LoginRepository();
  final userVM = Get.put(UserPreference());
  final firebaseTokenVM = Get.put(RegisterFirebaseTokenViewModel());
  final countryCodeController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final mobileNumberFocusNode = FocusNode().obs;

  // NotificationServices notificationServices = NotificationServices();
  RxBool loading = false.obs;
  RxBool isEnable = true.obs;
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

  void loginApi() {
    loading.value = true;
    Map data = {'MobileNumber': mobileNumberController.value.text};
    _api
        .loginApi(data)
        .then((value) {
          loading.value = false;
          if (value['isSuccessfull'] == false) {
            apiErrorMessage.value = value['message'];
          } else {
            // if (Platform.isIOS) {
            //   notificationServices.getDeviceToken().then(
            //     (value) => firebaseTokenVM.firebaseTokenApi(value, 'ios'),
            //   );
            // } else {
            //   notificationServices.getDeviceToken().then(
            //     (value) => firebaseTokenVM.firebaseTokenApi(value, 'android'),
            //   );
            // }
            apiErrorMessage.value = '';
            LoginModel loginModel = LoginModel.fromJson(value);
            userVM
                .saveUser(loginModel)
                .then((value) {
                  if ((loginModel.user?.imageURL?.isEmpty ?? true) ||
                      (loginModel.user?.gender?.isEmpty ?? true) ||
                      (loginModel.user?.mobileNumbre?.isEmpty ?? true)) {
                    Get.offAllNamed(RoutesName.navigationScreen);
                  } else {
                    Get.offAllNamed(RoutesName.navigationScreen);
                  }
                })
                .onError((error, stackTrace) {
                  apiErrorMessage.value = error.toString();
                });
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          apiErrorMessage.value = error.toString();
        });
  }
}
