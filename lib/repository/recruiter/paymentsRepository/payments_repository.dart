import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class PaymentsRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> paymentsListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.paymentsUrl);
    return response;
  }
}
