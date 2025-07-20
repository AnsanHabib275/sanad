class PaymentMethodModel {
  final String paymentID;
  final String image;
  final String name;
  final String code;
  final String expiry;

  PaymentMethodModel(
    this.paymentID,
    this.image,
    this.name,
    this.code,
    this.expiry,
  );
}
