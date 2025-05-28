import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class HomeRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> jobsListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.jobsUrl);
    return response;
  }
}
