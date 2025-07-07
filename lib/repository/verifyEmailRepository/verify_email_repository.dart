import 'package:sanad/data/network/network_api_services_with_out_eid.dart';
import '../../../res/urls/app_url.dart';
class VerifyEmailRepository {
  final _apiServices = NetworkApiServicesWithOutEID();

  Future<dynamic> verifyEmailApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.verifyEmailUrl);
    return response;
  }

  Future<dynamic> resendCodeApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.resendCodeUrl);
    return response;
  }
}
