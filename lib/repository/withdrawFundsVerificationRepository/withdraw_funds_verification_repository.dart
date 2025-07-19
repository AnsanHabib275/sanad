import '../../../data/network/network_api_services_with_out_eid.dart';
import '../../../res/urls/app_url.dart';

class WithdrawFundsVerificationRepository {
  final _apiServices = NetworkApiServicesWithOutEID();

  Future<dynamic> withdrawFundsVerificationApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.withdrawFundsVerificationUrl);
    return response;
  }
}
