import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sanad/res/routes/routes_name.dart';

import '../../viewModels/controller/userPreference/user_preference_view_model.dart';
import '../exceptions/app_exceptions.dart';
import 'base_api_services_new.dart';

dynamic parseJson(String responseBody) => jsonDecode(responseBody);

class NetworkApiServices extends BaseApiServicesNew {
  static const Duration _timeout = Duration(seconds: 15);
  static const Duration _uploadTimeout = Duration(seconds: 30);
  final _cache = <String, dynamic>{};

  final userVM =
      Get.isRegistered<UserPreference>() ? Get.find<UserPreference>() : null;

  Future<Map<String, String>> get _safeHeaders async {
    final eid = await Get.find<UserPreference>().getEid();
    if (eid.isEmpty) {
      throw UnauthenticatedException('session_expired'.tr);
    }
    return {
      'Content-Type': 'application/json',
      'E_ID': eid,
      'Connection': 'keep-alive',
    };
  }

  @override
  Future<dynamic> getApi(String url, {bool useCache = false}) async {
    if (useCache && _cache.containsKey(url)) return _cache[url];

    try {
      final uri = Uri.parse(url);
      final response = await http
          .get(uri, headers: await _safeHeaders)
          .timeout(_timeout);

      final json = await compute(parseJson, response.body);
      if (useCache) _cache[url] = json;
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

  @override
  Future<dynamic> postApi(var data, String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http
          .post(uri, headers: await _safeHeaders, body: jsonEncode(data))
          .timeout(_timeout);

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

  @override
  Future<dynamic> postFormDataApi(
    Map<String, String> data,
    String url, {
    List<http.MultipartFile>? files,
  }) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(await _safeHeaders);
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

  @override
  Future<dynamic> postFormDataFilesApi(
    String url, {
    List<http.MultipartFile>? files,
  }) async {
    try {
      final uri = Uri.parse(url);
      final request = http.MultipartRequest('POST', uri);
      request.headers.addAll(await _safeHeaders);
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

  @override
  Future<dynamic> postWithOutBodyApi(String url) async {
    try {
      final uri = Uri.parse(url);
      final response = await http
          .post(uri, headers: await _safeHeaders)
          .timeout(_timeout);

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
      default:
        throw FetchDataException(
          'error_while_communicating_with_server'.tr +
              response.statusCode.toString(),
        );
    }
  }

  Future<void> _handleInvalidSession() async {
    await Get.find<UserPreference>().removeUser();
    Get.offAllNamed(RoutesName.loginScreen);
  }
}
