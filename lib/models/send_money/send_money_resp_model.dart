class SendMoneyResp {
  String token;
  String transactionReference;
  String customerCode;
  String localCountyCode;
  String localCurrencyCode;
  double lcyAmount;
  double netAmount;
  double discount;
  String paymentStatus;
  String userName;
  String cancelStatus;
  double balanceAmount;
  String chequePaidStatus;
  String paymentModeCode;
  String posBankCode;
  String bankName;

  SendMoneyResp({
    this.token = "",
    this.transactionReference = "",
    this.customerCode = "",
    this.localCountyCode = "",
    this.localCurrencyCode = "",
    this.lcyAmount = 0.0,
    this.netAmount = 0.0,
    this.discount = 0.0,
    this.paymentStatus = "",
    this.userName = "",
    this.cancelStatus = "",
    this.balanceAmount = 0.0,
    this.chequePaidStatus = "",
    this.paymentModeCode = "",
    this.posBankCode = "",
    this.bankName = "",
  });

  factory SendMoneyResp.fromJson(Map<String, dynamic> json) => SendMoneyResp(
        token: json["Token"] ?? "",
        transactionReference: json["TransactionReference"] ?? "",
        customerCode: json["CustomerCode"] ?? "",
        localCountyCode: json["LocalCountyCode"] ?? "",
        localCurrencyCode: json["LocalCurrencyCode"] ?? "",
        lcyAmount: json["LcyAmount"] != null ? double.parse(json["LcyAmount"].toString()) : 0.0,
        netAmount: json["NetAmount"] != null ? double.parse(json["NetAmount"].toString()) : 0.0,
        discount: json["Discount"] != null ? double.parse(json["Discount"].toString()) : 0.0,
        paymentStatus: json["PaymentStatus"] ?? "",
        userName: json["UserName"] ?? "",
        cancelStatus: json["CancelStatus"] ?? "",
        balanceAmount: json["BalanceAmount"] != null ? double.parse(json["BalanceAmount"].toString()) : 0.0,
        chequePaidStatus: json["ChequePaidStatus"] ?? "",
        paymentModeCode: json["PaymentModeCode"] ?? "",
        posBankCode: json["PosBankCode"] ?? "",
        bankName: json['BankName'] ?? "",
      );

  Map<String, dynamic> toJson() {
    return {
      "CustomerCode": customerCode,
      "TransactionRefNo": transactionReference,
      "DigitalData": {
        "TokenNo": token,
        "LocalCountyCode": localCountyCode,
        "LocalCurrencyCode": localCurrencyCode,
        "LcyAmount": lcyAmount,
        "NetAmount": netAmount,
        "Discount": discount,
        "PaymentStatus": paymentStatus,
        "UserName": userName,
        "CancelStatus": cancelStatus,
        "BalanceAmount": balanceAmount,
        "ChequePaidStatus": chequePaidStatus,
        "PaymentModeCode": paymentModeCode,
        "PosBankCode": posBankCode,
        "BankName": bankName,
      }
    };
  }
}
