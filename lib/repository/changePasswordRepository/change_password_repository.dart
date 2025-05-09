import '../../data/network/network_api_services.dart';
import '../../res/urls/app_url.dart';

class ChangePasswordRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> changePasswordApi(var data) async {
    dynamic response = await _apiServices.postApi(
      data,
      AppUrl.changePassUrl,
    );
    return response;
  }
}
