class TransactionsModel {
  final int transactionID;
  final String paymentID;
  final String amount;
  final String paymentMethod;

  TransactionsModel(
    this.transactionID,
    this.paymentID,
    this.amount,
    this.paymentMethod,
  );
}
