import '../../../data/network/network_api_services.dart';
import '../../../res/urls/app_url.dart';

class NotificationRepository {
  final _apiServices = NetworkApiServices();

  Future<dynamic> notificationListApi() async {
    dynamic response = await _apiServices.getApi(AppUrl.notificationUrl);
    return response;
  }

  Future<dynamic> markNotificationViewedApi(String notificationId) async {
    dynamic response = await _apiServices.postWithOutBodyApi(
      AppUrl.markNotificationViewedUrl + notificationId,
    );
    return response;
  }
}
