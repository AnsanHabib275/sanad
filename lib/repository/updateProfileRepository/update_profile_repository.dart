import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class UpdateProfileRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> updateProfileApi(var data) async {
    dynamic response = await _apiServices.postFormDataApi(
      data,
      AppUrl.updateProfileUrl,
    );
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
