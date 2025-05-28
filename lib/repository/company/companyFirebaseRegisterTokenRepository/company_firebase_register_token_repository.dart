import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class CompanyFirebaseRegisterTokenRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> firebaseTokenApi(var data) async {
    dynamic response =
        await _apiServices.postApi(data, AppUrl.registerFirebaseCloudTokenUrl);
    return response;
  }
}
