class PaymentGatewayRequest {
  final String sessionId;
  final String amount;
  final String refNo;
  final String? transactionRequestDate;
  final String clientUrl;
  final String customerCode;
  final String payMode;
  final String language;
  final String customerName;
  final String primaryColor;
  final String secondaryColor;
  final String theme;
  final String paymentGatewayKey;
  final String clientId;
  final String token;
  final String currencyCode;

  PaymentGatewayRequest({
    required this.sessionId,
    required this.amount,
    required this.refNo,
    this.transactionRequestDate,
    required this.clientUrl,
    required this.customerCode,
    required this.payMode,
    required this.language,
    required this.customerName,
    required this.primaryColor,
    required this.secondaryColor,
    required this.theme,
    required this.paymentGatewayKey,
    required this.clientId,
    required this.token,
    required this.currencyCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'SessionId': sessionId,
      'Amount': amount,
      'RefNo': refNo,
      'TransactionRequestDate': transactionRequestDate,
      'ClientUrl': clientUrl,
      'CustomerCode': customerCode,
      'PayMode': payMode,
      'Language': language,
      'CustomerName': customerName,
      'PrimaryColor': primaryColor,
      'SecondaryColor': secondaryColor,
      'Theme': theme,
      'PaymentGatewayKey': paymentGatewayKey,
      'ClientId': clientId,
      'Token': token,
      'CurrencyCode': currencyCode,
    };
  }

  factory PaymentGatewayRequest.fromJson(Map<String, dynamic> json) {
    return PaymentGatewayRequest(
      sessionId: json['SessionId'],
      amount: json['Amount'],
      refNo: json['RefNo'],
      transactionRequestDate: json['TransactionRequestDate'],
      clientUrl: json['ClientUrl'],
      customerCode: json['CustomerCode'],
      payMode: json['PayMode'],
      language: json['Language'],
      customerName: json['CustomerName'],
      primaryColor: json['PrimaryColor'],
      secondaryColor: json['SecondaryColor'],
      theme: json['Theme'],
      paymentGatewayKey: json['PaymentGatewayKey'],
      clientId: json['ClientId'],
      token: json['Token'],
      currencyCode: json['CurrencyCode'],
    );
  }
}
