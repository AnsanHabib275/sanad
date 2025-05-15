import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class RateUsRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> rateUsApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.rateUsUrl);
    return response;
  }
}
