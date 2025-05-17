class PaymentListModel {
  bool? isSuccessfull;
  String? message;
  List<Payment>? payment;

  PaymentListModel({this.isSuccessfull, this.message, this.payment});

  factory PaymentListModel.fromJson(Map<String, dynamic> json) {
    return PaymentListModel(
      isSuccessfull: json["IsSuccessfull"],
      message: json["message"],
      payment:
          json["payment"] != null
              ? List<Payment>.from(json["payment"].map((x) => Payment.fromJson(x)))
              : [],
    );
  }
}

class Payment {
  String? paymentID;
  String? paymentDate;
  String? amount;
  String? status;

  Payment({
    this.paymentID,
    this.paymentDate,
    this.amount,
    this.status,
  });

  factory Payment.fromJson(Map<String, dynamic> json) {
    return Payment(
      paymentID: json['paymentID'],
      paymentDate: json['paymentDate'],
      amount: json['amount'],
      status: json['status'],
    );
  }
}
