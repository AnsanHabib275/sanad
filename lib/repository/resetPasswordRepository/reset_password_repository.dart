import '../../data/network/network_api_services_with_out_eid.dart';
import '../../res/urls/app_url.dart';

class ResetPasswordRepository {
  final _apiServices = NetworkApiServicesWithOutEID();

  Future<dynamic> resetPasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.resetPassUrl);
    return response;
  }
}
