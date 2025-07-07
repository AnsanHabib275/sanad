import 'dart:async';

import 'package:get/get.dart';
import 'package:sanad/utils/utils.dart';

import '../../../../../data/response/status.dart';
import '../../../../../models/notification/notification_list_model.dart';
import '../../../../../repository/notificationRepository/notification_repository.dart';

class NotificationViewModel extends GetxController {
  final _api = NotificationRepository();
  final rxRequestStatus = Status.loading.obs;
  RxString errorMessage = ''.obs;
  RxBool loading = false.obs;
  var notificationDataList = <Notifications>[].obs;
  var unreadNotificationDataList = <Notifications>[].obs;

  // Add stream controller
  final _notificationStreamController =
      StreamController<List<Notifications>>.broadcast();

  Stream<List<Notifications>> get notifications =>
      _notificationStreamController.stream;

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
        unreadNotificationDataList.assignAll(
          notificationList.notifications!.where((n) => n.isViewed == false),
        );
        _notificationStreamController.add(notificationList.notifications!);
      } else {
        setError('no_notification'.tr);
      }
    } catch (e) {
      loading.value = false;
      setError(e.toString());
      _notificationStreamController.addError(e);
    }
  }

  Map<String, List<Notifications>> get groupedNotificationsList {
    final now = DateTime.now().toLocal();
    final today = DateTime(now.year, now.month, now.day);
    final grouped = <String, List<Notifications>>{
      'New': [],
      'Today': [],
      'Yesterday': [],
      'A Week Ago': [],
      'A Month Ago': [],
      'Older': [],
    };
    for (final notification in notificationDataList) {
      final complaintDate =
          DateTime.parse(notification.complaintDate!).toLocal();
      final notificationDay = DateTime(
        complaintDate.year,
        complaintDate.month,
        complaintDate.day,
      );

      final difference = today.difference(notificationDay).inDays;
      if (notification.isViewed == false) {
        grouped['New']!.add(notification);
      } else if (difference == 0) {
        grouped['Today']!.add(notification);
      } else if (difference == 1) {
        grouped['Yesterday']!.add(notification);
      } else if (difference <= 7) {
        grouped['A Week Ago']!.add(notification);
      } else if (difference <= 30) {
        grouped['A Month Ago']!.add(notification);
      } else {
        grouped['Older']!.add(notification);
      }
    }

    return grouped;
  }

  void handleNewComplaint(Map<String, dynamic> complaintData) {
    final newComplaint = Notifications(
      // complaintId: int.parse(complaintData['complaintId']),
      // status: int.parse(complaintData['status']),
      // datetime: DateTime.now().toString(),
      // Add other fields as needed
      notificationId: complaintData['NotificationId'],
      isViewed: complaintData['IsViewed'],
      detail: complaintData['IsViewed'],
      photos: complaintData['Photos'],
      userAddress: complaintData['UserAddress'],
      complaintDate: complaintData['ComplaintDate'],
      createdOn: complaintData['CreatedOn'],
      qRCodeNo: complaintData['QR_Code_No'],
    );

    final currentNotifications = List<Notifications>.from(notificationDataList);
    currentNotifications.insert(0, newComplaint);
    notificationDataList.insert(0, newComplaint);
    _notificationStreamController.add(currentNotifications);
  }

  void markNotificationViewedApi(String notificationId) {
    loading.value = true;
    _api
        .markNotificationViewedApi(notificationId)
        .then((value) {
          loading.value = false;
          if (value['IsSuccessfull'] == false) {
            errorMessage.value = value['message'];
            Utils.toastMessage(value['message']);
          } else {
            notificationListApi();
          }
        })
        .onError((error, stackTrace) {
          loading.value = false;
          errorMessage.value = error.toString();
          Utils.toastMessage(error.toString());
        });
  }

  // @override
  // void onInit() {
  //   _loadNotifications();
  //   super.onInit();
  // }
  //
  // Future<void> _loadNotifications() async {
  //   final all = _notificationBox.values.toList();
  //   notificationDataList.assignAll(all);
  //   unreadNotificationDataList.assignAll(all.where((n) => n.isViewed == false));
  // }
  //
  // void addNotification(Notifications notification) {
  //   notificationDataList.insert(0, notification);
  //   if (notification.isViewed == false) {
  //     unreadNotificationDataList.add(notification);
  //   }
  // }
  //
  // Future<void> markAsRead(String id) async {
  //   final notification = _notificationBox.get(id);
  //   if (notification != null) {
  //     notification.isViewed = true;
  //     await _notificationBox.put(id, notification);
  //     unreadNotificationDataList.removeWhere(
  //       (n) => n.notificationId == notification.notificationId,
  //     );
  //     notificationDataList.refresh();
  //   }
  // }
}
