import 'package:flutter/foundation.dart';
import '../../../data/network/network_api_services_with_out_eid.dart';
import '../../../res/urls/app_url.dart';
import 'package:http/http.dart' as http;

class CompanySignUpRepository {
  final _apiServices = NetworkApiServicesWithOutEID();

  Future<dynamic> signUpApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.signupUrl);
    return response;
  }

  Future<dynamic> signUpIndividualApi(var data) async {
    dynamic response = await _apiServices.postApi(data, AppUrl.signupUrl);
    return response;
  }

  Future<dynamic> uploadProfileImageApi(
    var data,
    List<http.MultipartFile> files,
  ) async {
    dynamic response = await _apiServices.postFormDataApi(
      data,
      files: files,
      AppUrl.uploadProfilePhotoUrl,
    );
    if (kDebugMode) {
      print(response);
    }
    return response;
  }
}
