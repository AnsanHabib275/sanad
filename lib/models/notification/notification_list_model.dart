class NotificationListModel {
  bool? isSuccessfull;
  String? message;
  List<Notifications>? notifications;

  NotificationListModel({this.isSuccessfull, this.message, this.notifications});

  factory NotificationListModel.fromJson(Map<String, dynamic> json) {
    return NotificationListModel(
      isSuccessfull: json["IsSuccessfull"],
      message: json["message"],
      notifications:
          json["notifications"] != null
              ? List<Notifications>.from(
                json["notifications"].map((x) => Notifications.fromJson(x)),
              )
              : [],
    );
  }
}

class Notifications {
  int? notificationId;
  bool? isViewed;
  String? detail;
  List<String>? photos;
  String? userAddress;
  String? complaintDate;
  String? createdOn;
  int? qRCodeNo;

  Notifications({
    this.notificationId,
    this.isViewed,
    this.detail,
    this.photos,
    this.userAddress,
    this.complaintDate,
    this.createdOn,
    this.qRCodeNo,
  });

  factory Notifications.fromJson(Map<String, dynamic> json) {
    return Notifications(
      notificationId: json['NotificationId'],
      isViewed: json['IsViewed'],
      detail: json['Detail'],

      photos:
          (json['Photos'] as List?)?.map((e) => e.toString()).toList() ?? [],
      userAddress: json['UserAddress'],
      complaintDate: json['ComplaintDate'],
      createdOn: json['CreatedOn'],
      qRCodeNo: json['QR_Code_No'],
    );
  }
}
