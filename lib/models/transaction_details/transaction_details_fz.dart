import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:mobiremit/models/custom_message/custom_message_details_fz.dart';

import '../../core/flavours/constants.dart';

part 'transaction_details_fz.freezed.dart';
part 'transaction_details_fz.g.dart';

DateTime? _fromJsonDateTime(String? date) {
  if (date == null || date.isEmpty) return null;

  String normalizedDate = date.replaceAll('@', ':');

  try {
    if (normalizedDate.contains(':')) {
      return DateFormat('dd/MMM/yyyy HH:mm:ss').parse(normalizedDate);
    } else {
      return DateFormat('dd/MMM/yyyy').parse(normalizedDate);
    }
  } catch (e) {
    logger.e('Error parsing date: $normalizedDate - Error: $e');
    return null;
  }
}

String? _toJsonDateTime(DateTime? date) {
  if (date == null) return null;

  return DateFormat('dd/MMM/yyyy HH:mm:ss').format(date).replaceAll(':', '@');
}

Object? _readCustName(Map json, String key) {
  String name = "";
  if (json['CustomerFirstName'] != null && json['CustomerFirstName'] != "") {
    name += json['CustomerFirstName'];
  }
  if (json['CustomerMiddleName'] != null && json['CustomerMiddleName'] != "") {
    name += " ${json['CustomerMiddleName']}";
  }
  if (json['CustomerLastName'] != null && json['CustomerLastName'] != "") {
    name += " ${json['CustomerLastName']}";
  }
  if (name != "") {
    return name;
  }
  return json[key];
}

Object? _readBenefName(Map json, String key) {
  String name = "";
  if (json['BenfName'] != null && json['BenfName'] != "") {
    name += json['BenfName'];
  }
  if (json['BenfName2'] != null && json['BenfName2'] != "") {
    name += " ${json['BenfName2']}";
  }
  if (json['BenfName3'] != null && json['BenfName3'] != "") {
    name += " ${json['BenfName3']}";
  }
  if (name != "") {
    return name;
  }
  return json[key];
}

Object? _readCustomerVatin(Map json, String key) {
  if (json['CustomerVatin'] != null && json['CustomerVatin'] != "") {
    return json['CustomerVatin'];
  } else if (json['CustomerVatin'] == "") {
    return 0;
  }
  return json[key];
}

@freezed
abstract class TransactionFz with _$TransactionFz {
  const factory TransactionFz({
    @JsonKey(name: "StatusCode") @Default('') String statusCode,
    @JsonKey(name: "StatusMessage") @Default('') String statusMessage,
    @JsonKey(name: "PageSize") @Default(0) int pageSize,
    @JsonKey(name: "CurrentPage") @Default(0) int currentPage,
    @JsonKey(name: "TotalPages") @Default(0) int totalPages,
    @JsonKey(name: "TotalCount") @Default(0) int totalCount,
    @JsonKey(name: "Data") @Default([]) List<TransactionDetailsFz> data,
  }) = _TransactionFz;

  factory TransactionFz.fromJson(Map<String, dynamic> json) => _$TransactionFzFromJson(json);
}

@freezed
abstract class TransactionDetailsFz with _$TransactionDetailsFz {
  const factory TransactionDetailsFz({
    @JsonKey(name: 'ReferenceNo') String? transactionReference,
    @JsonKey(name: 'ChqNo') String? chqNo,
    @JsonKey(name: 'TranDate', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime) DateTime? transactionDate,
    @JsonKey(name: "CustomerName", readValue: _readCustName) String? customerName,
    @JsonKey(name: 'CustomerFirstName') String? custFirstName,
    @JsonKey(name: 'CustomerMiddleName') String? custMiddleName,
    @JsonKey(name: 'CustomerLastName') String? custLastName,
    @JsonKey(name: "BeneficiaryName", readValue: _readBenefName) String? beneficiaryName,
    @JsonKey(name: 'BenfName') String? benfFirstName,
    @JsonKey(name: 'BenfName2') String? benfMiddleName,
    @JsonKey(name: 'BenfName3') String? benfLastName,
    @JsonKey(name: 'BenfCountry') String? benfCountry,
    @JsonKey(name: 'BenfCurrencyCode') String? toCurrencyCode,
    @JsonKey(name: 'CurrencyCode') String? fromCurrencyCode,
    @JsonKey(name: 'AccountNo') String? accountNumber,
    @JsonKey(name: 'BankName') String? bankName,
    @JsonKey(name: 'FcyAmount') double? paymentAmount,
    @JsonKey(name: 'LcyAmount') String? receivedAmount,
    @JsonKey(name: 'Charges') String? charge,
    @JsonKey(name: 'TaxAmount') double? taxAmount,
    @JsonKey(name: 'NetAmount') double? netAmount,
    @JsonKey(name: 'MultiplicationRate') double? multiplicationRate,
    // @JsonKey(name: 'Status') String? status,
    @JsonKey(name: 'BeneficiaryMobile') String? beneficiaryMobile,
    @JsonKey(name: 'ServMode') String? servMode,
    @JsonKey(name: 'PinNumber') String? pinNumber,
    @JsonKey(name: 'PayMode') String? payMode,
    @JsonKey(name: 'PayModeDesc') String? payModeDesc,
    @JsonKey(name: 'PaymentStatus') String? paymentStatus,
    @JsonKey(name: 'BneficiaryId') String? bneficiaryId,
    @JsonKey(name: 'ServiceCode') String? serviceCode,
    @JsonKey(name: 'ServiceType') String? serviceType,
    @JsonKey(name: 'BenfActiveStatus') String? benfActiveStatus,
    @JsonKey(name: 'ReadyForCancel') String? readyForCancel,
    @JsonKey(name: 'TransactionStatus') String? transactionStatus,
    @JsonKey(name: 'ServiceProvider') String? serviceProvider,
    @JsonKey(name: 'PaymentRefNo') String? paymentRefNo,
    @JsonKey(name: 'DivisionRate') double? divisionRate,
    @JsonKey(name: 'Header') String? header,
    @JsonKey(name: 'IsMobileTxn') bool? isMobileTxn,
    @JsonKey(name: 'IsCorrespondentActive') String? isCorrespondentActive,
    @JsonKey(name: 'BranchName') String? branchName,
    @JsonKey(name: 'Purpose') String? purpose,
    @JsonKey(name: 'IfscCode') String? ifscCode,
    @JsonKey(name: 'Rebate') String? rebate,
    @JsonKey(name: 'BranchCode') String? branchCode,
    @JsonKey(name: 'Customer') String? customer,
    @JsonKey(name: 'Email') String? email,
    @JsonKey(name: 'TaxCard') String? taxCard,
    @JsonKey(name: 'CustomerVatin', readValue: _readCustomerVatin) double? customerVatin,
    @JsonKey(name: 'ArieEmployeeFlag') String? arieEmployeeFlag,
    @JsonKey(name: 'Relationship') String? relationship,
    @JsonKey(name: 'DestinationCountryCode') String? destinationCountryCode,
    @JsonKey(name: 'DestinationCountry') String? destinationCountry,
    @JsonKey(name: 'CR') String? cr,
    @JsonKey(name: 'CustomerNationality') String? customerNationality,
    @JsonKey(name: 'CustomerNationalityCode') String? customerNationalityCode,
    @JsonKey(name: 'Source') String? source,
    @JsonKey(name: 'BeneficiaryNationality') String? beneficiaryNationality,
    @JsonKey(name: 'BeneficiaryAddress') String? beneficiaryAddress,
    @JsonKey(name: 'BeneficiaryCountryCode') String? beneficiaryCountryCode,
    @JsonKey(name: 'Correspondent') String? correspondent,
    @JsonKey(name: 'Profession') String? profession,
    @JsonKey(name: 'BeneficiaryType') String? beneficiaryType,
    @JsonKey(name: 'CustomerIdDescription') String? customerIdDescription,
    @JsonKey(name: 'VisaType') String? visaType,
    @JsonKey(name: 'CustomerType') String? customerType,
    @JsonKey(name: 'BranchId') String? branchId,
    @JsonKey(name: 'BirthCountryCode') String? birthCountryCode,
    @JsonKey(name: 'BirthCountry') String? birthCountry,
    @JsonKey(name: 'CustomerIdNo') String? customerIdNo,
    @JsonKey(name: 'CustomerCode') String? customerCode,
    @JsonKey(name: 'IsPep') String? isPep,
    @JsonKey(name: 'IdCode') String? idCode,
    @JsonKey(name: 'PaymentType') String? paymentType,
    @JsonKey(name: 'CustomerDob') String? customerDob,
    @JsonKey(name: 'IdIssuePlace') String? idIssuePlace,
    @JsonKey(name: 'IdIssueDate', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime) DateTime? idIssueDate,
    @JsonKey(name: 'IdType') String? idType,
    @JsonKey(name: 'IdDescription') String? idDescription,
    @JsonKey(name: 'IdExpiry', fromJson: _fromJsonDateTime, toJson: _toJsonDateTime) DateTime? idExpiry,
    @JsonKey(name: 'Phone') String? phone,
    @JsonKey(name: 'Address') String? address,
    @JsonKey(name: 'CompanyName') String? companyName,
    @JsonKey(name: 'TransactionService') String? transactionService,
    @JsonKey(name: 'IsIntegration') String? isIntegration,
  }) = _TransactionDetailsFz;

  factory TransactionDetailsFz.fromJson(Map<String, dynamic> json) => _$TransactionDetailsFzFromJson(json);
}

class TrackTxnResult {
  final TransactionDetailsFz? data;
  final CustomMessageDetailsFZ? error;

  TrackTxnResult.success(this.data) : error = null;

  TrackTxnResult.error(this.error) : data = null;

  bool get isSuccess => data != null;
}
