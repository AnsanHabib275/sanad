class TransactionsModel {
  final int transactionID;
  final String paymentID;
  final String amount;
  final String paymentMethod;
  final String time;
  final String name;
  final String paymentType;
  final String transactionDate;
  final String accountNumber;

  TransactionsModel(
    this.transactionID,
    this.paymentID,
    this.amount,
    this.paymentMethod,
    this.time,
    this.name,
    this.paymentType,
    this.transactionDate,
    this.accountNumber,
  );
}
