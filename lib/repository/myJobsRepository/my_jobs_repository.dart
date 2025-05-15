import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class MyJobsRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> myJobsListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.myJobsUrl);
    return response;
  }
}
