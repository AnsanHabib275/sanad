import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../viewModels/controller/userPreference/user_preference_view_model.dart';
import '../exceptions/app_exceptions.dart';
import 'base_api_services_new.dart';

class NetworkApiServicesNew extends BaseApiServicesNew {
  late String apiKey;

  @override
  Future<dynamic> getApi(String url) async {
    apiKey = Get.find<UserPreference>().userEid.value;
    final timestamp = DateTime.now().toUtc().toIso8601String();

    final signature = generateGetSignature(
      apiKey: apiKey,
      timestamp: timestamp,
    );

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-api-key': apiKey,
      'x-timestamp': timestamp,
      'x-signature': signature,
    };

    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postApi(var data, String url) async {
    apiKey = Get.find<UserPreference>().userEid.value;
    final timestamp = DateTime.now().toUtc().toIso8601String();
    final signature = generatePostSignature(
      apiKey: apiKey,
      body: data,
      timestamp: timestamp,
    );

    final headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
      'x-api-key': apiKey,
      'x-timestamp': timestamp,
      'x-signature': signature,
    };

    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers, body: generateBodyHash(data))
          .timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postFormDataApi(
    Map<String, String> data,
    String url, {
    List<http.MultipartFile>? files,
  }) async {
    apiKey = Get.find<UserPreference>().userEid.value;
    final timestamp = DateTime.now().toUtc().toIso8601String();

    final signature = generatePostSignature(
      apiKey: apiKey,
      body: data,
      timestamp: timestamp,
    );

    final headers = {
      HttpHeaders.contentTypeHeader: 'multipart/form-data',
      'x-api-key': apiKey,
      'x-timestamp': timestamp,
      'x-signature': signature,
    };

    dynamic responseJson;
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      request.fields.addAll(data);
      if (files != null && files.isNotEmpty) {
        request.files.addAll(files);
      }

      var response = await request.send().timeout(const Duration(seconds: 12));
      var responseString = await http.Response.fromStream(response);
      responseJson = returnResponse(responseString);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postFormDataFilesApi(
    String url, {
    List<http.MultipartFile>? files,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'multipart/form-data',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      'E_ID': Get.find<UserPreference>().userEid.value,
    };
    dynamic responseJson;
    try {
      var uri = Uri.parse(url);
      var request = http.MultipartRequest('POST', uri);
      request.headers.addAll(headers);
      if (files != null && files.isNotEmpty) {
        request.files.addAll(files);
      }

      var response = await request.send().timeout(const Duration(seconds: 12));
      var responseString = await http.Response.fromStream(response);
      responseJson = returnResponse(responseString);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  @override
  Future<dynamic> postWithOutBodyApi(String url) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
      'Access-Control-Allow-Headers': 'Content-Type, Authorization',
      'E_ID': Get.find<UserPreference>().userEid.value,
    };
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), headers: headers)
          .timeout(const Duration(seconds: 12));
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('');
    } on RequestTimeOut {
      throw RequestTimeOut('');
    }
    if (kDebugMode) {
      print(responseJson);
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      default:
        throw FetchDataException(
          'error_while_communicating_with_server'.tr +
              response.statusCode.toString(),
        );
    }
  }

  String generateGetSignature({
    required String apiKey,
    required String timestamp,
  }) {
    final concatenatedString = '$apiKey$timestamp';

    final signature =
        sha256.convert(utf8.encode(concatenatedString)).toString();

    return signature;
  }

  String generatePostSignature({
    required String apiKey,
    required Map<String, dynamic> body,
    required String timestamp,
  }) {
    final bodyJson = jsonEncode(body);
    final bodyHash = sha256.convert(utf8.encode(bodyJson)).toString();
    final concatenatedString = '$apiKey$bodyHash$timestamp';
    final signature =
        sha256.convert(utf8.encode(concatenatedString)).toString();
    return signature;
  }

  String generateBodyHash(Map<String, dynamic> body) {
    final bodyJson = jsonEncode(body);
    final bodyHash = sha256.convert(utf8.encode(bodyJson)).toString();
    return bodyHash;
  }
}
