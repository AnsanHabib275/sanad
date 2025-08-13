import 'dart:async';
import 'package:get/get.dart';
import '../../../../../data/response/status.dart';
import '../../../../../models/notification/notification_list_model.dart';
import '../../../../../repository/notificationRepository/notification_repository.dart';

class NotificationViewModel extends GetxController {
  final _api = NotificationRepository();
  final rxRequestStatus = Status.loading.obs;
  RxString errorMessage = ''.obs;
  RxBool loading = false.obs;
  var notificationDataList = <Notifications>[].obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setError(String value) => errorMessage.value = value;

  Future<void> notificationListApi() async {
    loading.value = true;
    try {
      var result = await _api.notificationListApi();
      var notificationList = NotificationListModel.fromJson(result);
      loading.value = false;
      if (notificationList.isSuccessfull == true &&
          notificationList.notifications != null) {
        notificationDataList.assignAll(notificationList.notifications!);
      } else {
        setError('no_notification'.tr);
      }
    } catch (e) {
      loading.value = false;
      setError(e.toString());
    }
  }
}
