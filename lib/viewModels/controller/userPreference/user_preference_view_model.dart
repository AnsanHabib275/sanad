import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/login/login_model.dart';

class UserPreference extends GetxController {
  RxString userEid = ''.obs;
  RxString userFullName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userImageURL = ''.obs;
  RxString userMobileNumber = ''.obs;
  RxString userCountryCode = ''.obs;
  RxString userGender = ''.obs;
  RxString userDob = ''.obs;
  RxBool isNotificationEnabled = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
    getNotificationStatus();
  }

  void fetchUserDetails() async {
    var user = await getUser();
    userEid.value = user.user?.eID ?? '';
    userFullName.value = user.user?.fullName ?? '';
    userEmail.value = user.user?.email ?? '';
    userImageURL.value = user.user?.imageURL ?? '';
    userMobileNumber.value = user.user?.mobileNumbre ?? '';
    userCountryCode.value = user.user?.countryCode ?? '';
    userGender.value = user.user?.gender ?? '';
    userDob.value = user.user?.dOB ?? '';
  }

  Future<bool> saveUser(LoginModel responseModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isSuccessfull', responseModel.isSuccessfull ?? false);
    sp.setString('message', responseModel.message ?? '');
    sp.setString('userFullName', responseModel.user?.fullName ?? '');
    sp.setString('userEmail', responseModel.user?.email ?? '');
    sp.setString('userFirstName', responseModel.user?.firstName ?? '');
    sp.setString('userLastName', responseModel.user?.lastName ?? '');
    sp.setString('userMobileNumber', responseModel.user?.mobileNumbre ?? '');
    sp.setString('user_creationDate', responseModel.user?.creationDate ?? '');
    sp.setString('userEid', responseModel.user?.eID ?? '');
    sp.setString('userDob', responseModel.user?.dOB ?? '');
    sp.setString('userGender', responseModel.user?.gender ?? '');
    sp.setString('userCountryCode', responseModel.user?.countryCode ?? '');
    sp.setString('userImageURL', responseModel.user?.imageURL ?? '');
    sp.setInt('errorcode', responseModel.errorcode ?? 0);
    return true;
  }

  Future<bool> saveFirstUse(bool isFirstUse) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isFirstUse', isFirstUse);
    return true;
  }

  Future<bool> getFirstUse() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getBool('isFirstUse') ?? true; // Default to true if not set
  }

  Future<void> saveNotificationStatus(bool value) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setBool('isEnableNotification', value);
    isNotificationEnabled.value = value;
  }

  Future<void> getNotificationStatus() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    isNotificationEnabled.value = sp.getBool('isEnableNotification') ?? true;
  }

  Future<LoginModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isSuccessfull = sp.getBool('isSuccessfull') ?? false;
    String message = sp.getString('message') ?? '';
    int errorcode = sp.getInt('errorcode') ?? 0;

    User user = User(
      fullName: sp.getString('userFullName') ?? '',
      email: sp.getString('userEmail') ?? '',
      firstName: sp.getString('userFirstName') ?? '',
      lastName: sp.getString('userLastName') ?? '',
      mobileNumbre: sp.getString('userMobileNumber') ?? '',
      creationDate: sp.getString('user_creationDate') ?? '',
      eID: sp.getString('userEid') ?? '',
      dOB: sp.getString('userDob') ?? '',
      gender: sp.getString('userGender') ?? '',
      countryCode: sp.getString('userCountryCode') ?? '',
      imageURL: sp.getString('userImageURL') ?? '',
    );

    return LoginModel(
      isSuccessfull: isSuccessfull,
      message: message,
      user: user,
      errorcode: errorcode,
    );
  }

  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool isFirstUse = sp.getBool('isFirstUse') ?? true;
    sp.clear();
    await sp.setBool('isFirstUse', isFirstUse);
    return true;
  }
}
