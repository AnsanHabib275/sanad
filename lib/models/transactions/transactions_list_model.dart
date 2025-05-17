class TransactionsListModel {
  bool? isSuccessfull;
  String? message;
  List<Transactions>? transactions;

  TransactionsListModel({this.isSuccessfull, this.message, this.transactions});

  factory TransactionsListModel.fromJson(Map<String, dynamic> json) {
    return TransactionsListModel(
      isSuccessfull: json["IsSuccessfull"],
      message: json["message"],
      transactions:
          json["transactions"] != null
              ? List<Transactions>.from(json["transactions"].map((x) => Transactions.fromJson(x)))
              : [],
    );
  }
}

class Transactions {
  int? transactionID;
  String? paymentID;
  String? amount;
  String? paymentMethod;

  Transactions({
    this.transactionID,
    this.paymentID,
    this.amount,
    this.paymentMethod,
  });

  factory Transactions.fromJson(Map<String, dynamic> json) {
    return Transactions(
      transactionID: json['TransactionID'],
      paymentID: json['PaymentID'],
      amount: json['Amount'],
      paymentMethod: json['PaymentMethod'],
    );
  }
}
