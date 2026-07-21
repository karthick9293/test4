import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../customer_details/customer_data_fz.dart';
import '../masters/master_response_fz.dart';

part 'form_rules_response_fz.freezed.dart';
part 'form_rules_response_fz.g.dart';
// ignore_for_file: non_constant_identifier_names

@freezed
abstract class FormRulesResponseFZ with _$FormRulesResponseFZ {
  const factory FormRulesResponseFZ({
    @JsonKey(name: 'StatusCode') @Default('') String statusCode,
    @JsonKey(name: 'StatusMessage') @Default('') String statusMessage,
    @JsonKey(name: 'Data') FormRulesData? formRulesData,
    @JsonKey(name: 'CustomMessageDetails')
    CustomMessageDetails? customMessageDetails,
  }) = _FormRulesResponseFZ;

  factory FormRulesResponseFZ.fromJson(Map<String, Object?> json) =>
      _$FormRulesResponseFZFromJson(json);
}

@freezed
abstract class FormRulesData with _$FormRulesData {
  const factory FormRulesData({
    @JsonKey(name: 'Rules') @Default([]) List<FormFieldItem> formFieldItem,
    @JsonKey(name: 'CriteriaMap') @Default('') String criteriaMap,
  }) = _FormRulesData;

  factory FormRulesData.fromJson(Map<String, Object?> json) =>
      _$FormRulesDataFromJson(json);
}

@freezed
abstract class FormFieldItem with _$FormFieldItem {
  const factory FormFieldItem({
    @JsonKey(name: 'Id') @Default(0) int Id,
    @JsonKey(name: 'LicenseCountry') @Default('') String LicenseCountry,
    @JsonKey(name: 'ClientCode') @Default('') String ClientCode,
    @JsonKey(name: 'ApplicationName') @Default('') String ApplicationName,
    @JsonKey(name: 'ModuleName') @Default('') String ModuleName,
    @JsonKey(name: 'FormName') @Default('') String FormName,
    @JsonKey(name: 'CriteriaId') @Default('') String CriteriaId,
    @JsonKey(name: 'CriteriaMap') @Default('') String CriteriaMap,
    @JsonKey(name: 'CriteriaMapSplit') @Default('') String CriteriaMapSplit,
    @JsonKey(name: 'RuleSelected') @Default('') String RuleSelected,
    @JsonKey(name: 'FieldId') @Default('') String FieldId,
    @JsonKey(name: 'FzParamName') @Default('') String FzParamName,
    @JsonKey(name: 'FzParamName2') @Default('') String FzParamName2,
    @JsonKey(name: 'IsMandatory') @Default('') String IsMandatory,
    @JsonKey(name: 'IsEnable') @Default('') String IsEnable,
    @JsonKey(name: 'IsVisible') @Default('') String IsVisible,
    @JsonKey(name: 'FieldDisplayName') @Default('') String FieldDisplayName,
    @JsonKey(name: 'FieldType') @Default('') String FieldTypeNew,
    @JsonKey(name: 'FieldDisplayOrder') @Default('') String FieldDisplayOrder,
    @JsonKey(name: 'Regex') @Default('') String Regex,
    @JsonKey(name: 'RegexMessage') @Default('') String RegexMessage,
    @JsonKey(name: 'DefaultValue') @Default('') String DefaultValue,
    @JsonKey(name: 'SetOptions') @Default('') String SetOptions,
    @JsonKey(name: 'Masking') @Default('') String Masking,
    @JsonKey(name: 'ApiKey') @Default('') String ApiKey,
    @JsonKey(name: 'ApiKey1') @Default('') String ApiKey1,
    @JsonKey(name: 'Block') @Default('') String Block,
    @JsonKey(name: 'BlockMessageCode') @Default('') String BlockMessageCode,
    @JsonKey(name: 'BlockMessageDescription')
    @Default('')
    String BlockMessageDescription,
    @JsonKey(name: 'Warning') @Default('') String Warning,
    @JsonKey(name: 'WarningMessageCode') @Default('') String WarningMessageCode,
    @JsonKey(name: 'WarningMessageDescription')
    @Default('')
    String WarningMessageDescription,
    @JsonKey(name: 'CheckDuplicate') @Default('') String CheckDuplicate,
    @JsonKey(name: 'DisplayInNewLine') @Default('') String DisplayInNewLine,
    @JsonKey(name: 'MinLength') @Default('') String MinLength,
    @JsonKey(name: 'MaxLength') @Default('') String MaxLength,
    @JsonKey(name: 'ValidValues') @Default('') String ValidValues,
    @JsonKey(name: 'DisplayValidValuesOnHover')
    @Default('')
    String DisplayValidValuesOnHover,
    @JsonKey(name: 'FormRuleCode') @Default('') String FormRuleCode,
    @JsonKey(name: 'FormRuleSubCode') @Default('') String FormRuleSubCode,
    @JsonKey(name: 'FormRuleDescription')
    @Default('')
    String FormRuleDescription,
    @JsonKey(name: 'DisplaySection') @Default('') String DisplaySection,
    @JsonKey(name: 'DisplaySectionOrder')
    @Default('')
    String DisplaySectionOrder,
    @JsonKey(name: 'Linked') @Default('') String Linked,
    @JsonKey(name: 'LinkedWith') @Default('') String LinkedWith,
    @JsonKey(name: 'CreatedBy') @Default('') String CreatedBy,
    @JsonKey(name: 'CreateDatetime') @Default('') String CreateDatetime,
    @JsonKey(name: 'UpdatedBy') @Default('') String UpdatedBy,
    @JsonKey(name: 'UpdateDatetime') @Default('') String UpdateDatetime,
    @JsonKey(name: 'Status') @Default('') String Status,
    @JsonKey(name: 'RuleSeq') @Default('') String RuleSeq,
    @JsonKey(name: 'Prefix') @Default('') String Prefix,
    @JsonKey(name: 'Suffix') @Default('') String Suffix,
    @JsonKey(name: 'CriteriaMapOrg') @Default('') String CriteriaMapOrg,
  }) = _FormFieldItem;

  String get FieldType => FieldTypeNew.toLowerCase();

  bool get optional => !IsMandatory.toString().toLowerCase().contains('true');

  bool get enabled => IsEnable.toString().toLowerCase().contains('true');

  int? get minLength => int.tryParse(MinLength.toLowerCase());

  int? get maxLength => int.tryParse(MaxLength.toLowerCase());

  List<MasterResponseFZ>? setOptions() {
    if (SetOptions.isEmpty) return null;

    String temp = SetOptions.trim();
    temp = temp.replaceAll('\\n', '').replaceAll('\\r', '').trim();

    try {
      dynamic decoded = json.decode(temp);
      if (decoded is String) {
        decoded = json.decode(decoded);
      }
      if (decoded is List) {
        return decoded
            .cast<Map<String, dynamic>>()
            .map((e) => MasterResponseFZ.fromJson(e))
            .toList();
      }
    } catch (_) {
      return null;
    }
    return null;
  }

  // List<SourceBV>? setOptions() {
  //   if (SetOptions != null) {
  //     String temp = SetOptions!.replaceAll(' ', '').replaceAll('\\n', '').replaceAll('\\', '');
  //     temp = temp.substring(1, temp.length - 2);
  //     temp = '{"data":$temp}';
  //     Map<String, dynamic> map = json.decode(temp);
  //     return (map["data"] as List<dynamic>).map((e) => SourceBV.fromMap(e)!).toList();
  //
  //   } else {
  //     return null;
  //   }
  // }

  int get index => int.tryParse(FieldDisplayOrder) ?? 9999;

  // Duration get initialDurationFromNow => (initialDurationFromNowStr ?? '').parseDuration();
  //
  // Duration get startDurationFromNow => (startDurationFromNowStr ?? '').parseDuration();
  //
  // Duration get endDurationFromNow => (endDurationFromNowStr ?? '').parseDuration();

  const FormFieldItem._();

  factory FormFieldItem.fromJson(Map<String, Object?> json) =>
      _$FormFieldItemFromJson(json);
}
