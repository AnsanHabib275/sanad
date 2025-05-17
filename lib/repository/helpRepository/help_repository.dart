import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class HelpRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> helpListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.helpUrl);
    return response;
  }
}
