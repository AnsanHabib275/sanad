import 'package:sanad/data/network/network_api_services_with_out_eid.dart';
import '../../res/urls/app_url.dart';

class SignUpRepository {
  final _apiServices = NetworkApiServicesWithOutEID();

  Future<dynamic> signUpApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.signupUrl);
    return response;
  }

  Future<dynamic> signUpIndividualApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.signupUrl);
    return response;
  }
}
