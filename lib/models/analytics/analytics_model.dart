class AnalyticsModel {
  bool? isSuccessfull;
  String? message;
  Data? data;
  int? errorcode;

  AnalyticsModel({this.isSuccessfull, this.message, this.data, this.errorcode});

  AnalyticsModel.fromJson(Map<String, dynamic> json) {
    isSuccessfull = json['isSuccessfull'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errorcode = json['errorcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> analyticsData = <String, dynamic>{};
    analyticsData['isSuccessfull'] = isSuccessfull;
    analyticsData['message'] = message;
    if (data != null) {
      analyticsData['data'] = data!.toJson();
    }
    analyticsData['errorcode'] = errorcode;
    return analyticsData;
  }
}

class Data {
  String? walletImage;
  String? walletName;
  String? walletAmount;
  String? totalCvSublimed;
  String? totalCvBought;
  String? totalCvSubmitted;
  String? totalCvAccepted;
  String? userProfileImage;
  String? userName;
  String? userDetail;
  double? rating;
  String? review;

  Data({
    this.walletImage,
    this.walletName,
    this.walletAmount,
    this.totalCvSublimed,
    this.totalCvBought,
    this.totalCvSubmitted,
    this.totalCvAccepted,
    this.userProfileImage,
    this.userName,
    this.userDetail,
    this.rating,
    this.review,
  });

  Data.fromJson(Map<String, dynamic> json) {
    walletImage = json['WalletImage'];
    walletName = json['WalletName'];
    walletAmount = json['WalletAmount'];
    totalCvSublimed = json['TotalCvSublimed'];
    totalCvBought = json['TotalCvBought'];
    totalCvSubmitted = json['TotalCvSubmitted'];
    totalCvAccepted = json['TotalCvAccepted'];
    userProfileImage = json['UserProfileImage'];
    userName = json['UserName'];
    userDetail = json['UserDetail'];
    rating = json['Rating']?.toDouble();
    review = json['Review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['WalletImage'] = walletImage;
    data['WalletName'] = walletName;
    data['WalletAmount'] = walletAmount;
    data['TotalCvSublimed'] = totalCvSublimed;
    data['TotalCvBought'] = totalCvBought;
    data['TotalCvSubmitted'] = totalCvSubmitted;
    data['TotalCvAccepted'] = totalCvAccepted;
    data['UserProfileImage'] = userProfileImage;
    data['UserName'] = userName;
    data['UserDetail'] = userDetail;
    data['Rating'] = rating;
    data['Review'] = review;
    return data;
  }
}
