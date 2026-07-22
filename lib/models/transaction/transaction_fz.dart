// import 'package:mobiremit/others/constants.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:intl/intl.dart';
//
// part 'transaction_fz.freezed.dart';
// part 'transaction_fz.g.dart';
//
// DateTime? _fromJsonDateTime(String? date) {
//   if (date == null) return null;
//
//   String normalizedDate = date.replaceAll('@', ':');
//
//   try {
//     return DateFormat('dd/MMM/yyyy HH:mm:ss').parse(normalizedDate);
//   } catch (e) {
//     logger.e('Error parsing date: $normalizedDate');
//     return null;
//   }
// }
//
// String? _toJsonDateTime(DateTime? date) {
//   if (date == null) return null;
//
//   return DateFormat('dd/MMM/yyyy HH@mm@ss').format(date);
// }
//
// Object? _readCustName(Map json, String key) {
//   String name = "";
//   if (json['CustomerFirstName'] != null && json['CustomerFirstName'] != "") {
//     name += json['CustomerFirstName'];
//   }
//   if (json['CustomerMiddleName'] != null && json['CustomerMiddleName'] != "") {
//     name += " ${json['CustomerMiddleName']}";
//   }
//   if (json['CustomerLastName'] != null && json['CustomerLastName'] != "") {
//     name += " ${json['CustomerLastName']}";
//   }
//   if (name != "") {
//     return name;
//   }
//   return json[key];
// }
//
// Object? _readBenefName(Map json, String key) {
//   String name = "";
//   if (json['BenfName'] != null && json['BenfName'] != "") {
//     name += json['BenfName'];
//   }
//   if (json['BenfName2'] != null && json['BenfName2'] != "") {
//     name += " ${json['BenfName2']}";
//   }
//   if (json['BenfName3'] != null && json['BenfName3'] != "") {
//     name += " ${json['BenfName3']}";
//   }
//   if (name != "") {
//     return name;
//   }
//   return json[key];
// }
//
// bool? _fromJsonBool(String? value) =>
//     value != null && value.toLowerCase() == 'true' ? true : false;
//
// String? _toJsonBool(bool? value) => value == true ? 'True' : 'False';
//
// @freezed
// abstract class Transaction with _$Transaction {
//   const factory Transaction({
//     @JsonKey(name: 'ReferenceNo') String? referenceNo,
//     @JsonKey(name: 'ChqNo') String? chqNo,
//     @JsonKey(
//         name: 'TranDate', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime)
//     DateTime? tranDate,
//     @JsonKey(name: "CustomerName", readValue: _readCustName)
//     String? customerName,
//     @JsonKey(name: 'CustomerFirstName') String? custFirstName,
//     @JsonKey(name: 'CustomerMiddleName') String? custMiddleName,
//     @JsonKey(name: 'CustomerLastName') String? custLastName,
//     @JsonKey(name: "BeneficiaryName", readValue: _readBenefName)
//     String? beneficiaryName,
//     @JsonKey(name: 'BenfName') String? benfName,
//     @JsonKey(name: 'BenfName2') String? benfName2,
//     @JsonKey(name: 'BenfName3') String? benfName3,
//     @JsonKey(name: 'BenfCountry') String? benfCountry,
//     @JsonKey(name: 'BenfCurrencyCode') String? benfCurrencyCode,
//     @JsonKey(name: 'CurrencyCode') String? currencyCode,
//     @JsonKey(name: 'AccountNo') String? accountNo,
//     @JsonKey(name: 'BankName') String? bankName,
//     @JsonKey(name: 'FcyAmount') double? fcyAmount,
//     @JsonKey(name: 'LcyAmount') String? lcyAmount,
//     @JsonKey(name: 'Charges') String? charges,
//     @JsonKey(name: 'TaxAmount') double? taxAmount,
//     @JsonKey(name: 'NetAmount') double? netAmount,
//     @JsonKey(name: 'MultiplicationRate') double? multiplicationRate,
//     @JsonKey(name: 'Status') String? status,
//     @JsonKey(name: 'BeneficiaryMobile') String? beneficiaryMobile,
//     @JsonKey(name: 'ServMode') String? servMode,
//     @JsonKey(name: 'PinNumber') String? pinNumber,
//     @JsonKey(name: 'PayMode') String? payMode,
//     @JsonKey(name: 'PayModeDesc') String? payModeDesc,
//     @JsonKey(name: 'PaymentStatus') String? paymentStatus,
//     @JsonKey(name: 'BneficiaryId') String? beneficiaryId,
//     @JsonKey(name: 'ServiceCode') String? serviceCode,
//     @JsonKey(name: 'ServiceType') String? serviceType,
//     @JsonKey(name: 'BenfActiveStatus') String? benfActiveStatus,
//     @JsonKey(name: 'ReadyForCancel') String? readyForCancel,
//     @JsonKey(name: 'TransactionStatus') String? transactionStatus,
//     @JsonKey(name: 'ServiceProvider') String? serviceProvider,
//     @JsonKey(name: 'PaymentRefNo') String? paymentRefNo,
//     @JsonKey(name: 'DivisionRate') double? divisionRate,
//     @JsonKey(name: 'Header') String? header,
//     @JsonKey(name: 'IsMobileTxn', fromJson: _fromJsonBool, toJson: _toJsonBool)
//     bool? isMobileTxn,
//     @JsonKey(name: 'IsCorrespondentActive') String? isCorrespondentActive,
//     @JsonKey(name: 'BranchName') String? branchName,
//     @JsonKey(name: 'Purpose') String? purpose,
//   }) = _Transaction;
//
//   factory Transaction.fromJson(Map<String, dynamic> json) =>
//       _$TransactionFromJson(json);
// }
