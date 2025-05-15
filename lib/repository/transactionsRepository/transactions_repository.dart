import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class TransactionsRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> transactionsListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.transactionsUrl);
    return response;
  }
}
