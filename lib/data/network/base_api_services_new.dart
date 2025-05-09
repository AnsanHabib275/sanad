import 'package:http/http.dart' as http;

abstract class BaseApiServicesNew {
  Future<dynamic> getApi(String url);

  Future<dynamic> postApi(dynamic data, String url);

  Future<dynamic> postFormDataApi(Map<String, String> data, String url,
      {List<http.MultipartFile>? files});

  Future<dynamic> postWithOutBodyApi(String url);

  Future<dynamic> deleteApi(String url);

  Future<dynamic> postFormDataFilesApi(String url,
      {List<http.MultipartFile>? files});
}
