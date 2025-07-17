import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sanad/res/routes/routes_name.dart';
import 'package:sanad/viewModels/controller/userPreference/user_preference_view_model.dart';

import '../exceptions/app_exceptions.dart';
import 'base_api_services.dart';

dynamic parseJson(String responseBody) => jsonDecode(responseBody);

class NetworkApiServicesWithOutEID extends BaseApiServices {
  static const Duration _timeout = Duration(seconds: 15);
  static const Duration _uploadTimeout = Duration(seconds: 30);

  @override
  Future<dynamic> postApi(var data, String url, {String? eID}) async {
    final uri = Uri.parse(url);
    final headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
      if (eID != null) 'E_ID': eID,
    };

    try {
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(data))
          .timeout(_timeout);
      final json = await compute(parseJson, response.body);
      return _handleStatus(response,json);
    } on SocketException {
      throw InternetException('No internet connection');
    } on RequestTimeOut {
      throw RequestTimeOut('Request timed out');
    } on UnauthenticatedException {
      await _handleInvalidSession();
      rethrow;
    } catch (e) {
      throw FetchDataException('Unexpected error: $e');
    }
  }

  @override
  Future<dynamic> postFormDataApi(
      Map<String, String> data,
      String url, {
        List<http.MultipartFile>? files,
      }) async {
    final uri = Uri.parse(url);
    final headers = {
      'Content-Type': 'application/json',
      'Connection': 'keep-alive',
    };
    try {
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(data);
      if (files != null && files.isNotEmpty) {
        request.files.addAll(files);
      }

      final streamedResponse = await request.send().timeout(
        files?.isNotEmpty ?? false ? _uploadTimeout : _timeout,
      );
      final response = await http.Response.fromStream(streamedResponse);
      final json = await compute(parseJson, response.body);
      return _handleStatus(response, json);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    } on UnauthenticatedException {
      await _handleInvalidSession();
      rethrow;
    }
  }

  dynamic _handleStatus(http.Response response, dynamic json) {
    switch (response.statusCode) {
      case 200:
        return json;
      case 400:
        return json;
      case 401:
        throw UnauthenticatedException('session_expired'.tr);
      case 403:
        throw InvalidUrlException('Unauthorized: ${response.body}');
      case 500:
      case 502:
      case 503:
        throw ServerException('Server error: ${response.statusCode}');
      default:
        throw FetchDataException(
          '${'error_while_communicating_with_server'.tr} (${response.statusCode})',
        );
    }
  }

  Future<void> _handleInvalidSession() async {
    await Get.find<UserPreference>().removeUser();
    Get.offAllNamed(RoutesName.loginScreen);
  }
}
