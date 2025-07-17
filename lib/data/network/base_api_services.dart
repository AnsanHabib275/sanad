import 'package:http/http.dart' as http;

abstract class BaseApiServices {
  Future<dynamic> postApi(dynamic data, String url, {String? eID});
  Future<dynamic> postFormDataApi(
    Map<String, String> data,
    String url, {
    List<http.MultipartFile>? files,
  });
}
