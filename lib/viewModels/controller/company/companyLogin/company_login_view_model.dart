import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:phone_number/phone_number.dart';
import 'package:sanad/models/company/companyLogin/company_login_model.dart';
import 'package:sanad/repository/company/companyLoginRepository/company_login_repository.dart';
import '../../../../res/routes/routes_name.dart';
import '../../userPreference/user_preference_view_model.dart';
import '../companyRegisterFirebaseToken/company_register_firebase_token_view_model.dart';

class CompanyLoginViewModel extends GetxController {
  final _api = CompanyLoginRepository();
  final userVM = Get.put(UserPreference());
  final firebaseTokenVM = Get.put(CompanyRegisterFirebaseTokenViewModel());
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final countryCodeController = TextEditingController().obs;
  final mobileNumberController = TextEditingController().obs;
  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;
  final countryCodeFocusNode = FocusNode().obs;
  final mobileNumberFocusNode = FocusNode().obs;
  // NotificationServices notificationServices = NotificationServices();
  RxBool loading = false.obs;
  RxBool isVisible = true.obs;
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
            CompanyLoginModel loginModel = CompanyLoginModel.fromJson(value);
            userVM
                .saveCompanyUser(loginModel)
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
