// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_rules_response_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FormRulesResponseFZ _$FormRulesResponseFZFromJson(Map<String, dynamic> json) =>
    _FormRulesResponseFZ(
      statusCode: json['StatusCode'] as String? ?? '',
      statusMessage: json['StatusMessage'] as String? ?? '',
      formRulesData: json['Data'] == null
          ? null
          : FormRulesData.fromJson(json['Data'] as Map<String, dynamic>),
      customMessageDetails: json['CustomMessageDetails'] == null
          ? null
          : CustomMessageDetails.fromJson(
              json['CustomMessageDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FormRulesResponseFZToJson(
        _FormRulesResponseFZ instance) =>
    <String, dynamic>{
      'StatusCode': instance.statusCode,
      'StatusMessage': instance.statusMessage,
      'Data': instance.formRulesData,
      'CustomMessageDetails': instance.customMessageDetails,
    };

_FormRulesData _$FormRulesDataFromJson(Map<String, dynamic> json) =>
    _FormRulesData(
      formFieldItem: (json['Rules'] as List<dynamic>?)
              ?.map((e) => FormFieldItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      criteriaMap: json['CriteriaMap'] as String? ?? '',
    );

Map<String, dynamic> _$FormRulesDataToJson(_FormRulesData instance) =>
    <String, dynamic>{
      'Rules': instance.formFieldItem,
      'CriteriaMap': instance.criteriaMap,
    };

_FormFieldItem _$FormFieldItemFromJson(Map<String, dynamic> json) =>
    _FormFieldItem(
      Id: (json['Id'] as num?)?.toInt() ?? 0,
      LicenseCountry: json['LicenseCountry'] as String? ?? '',
      ClientCode: json['ClientCode'] as String? ?? '',
      ApplicationName: json['ApplicationName'] as String? ?? '',
      ModuleName: json['ModuleName'] as String? ?? '',
      FormName: json['FormName'] as String? ?? '',
      CriteriaId: json['CriteriaId'] as String? ?? '',
      CriteriaMap: json['CriteriaMap'] as String? ?? '',
      CriteriaMapSplit: json['CriteriaMapSplit'] as String? ?? '',
      RuleSelected: json['RuleSelected'] as String? ?? '',
      FieldId: json['FieldId'] as String? ?? '',
      FzParamName: json['FzParamName'] as String? ?? '',
      FzParamName2: json['FzParamName2'] as String? ?? '',
      IsMandatory: json['IsMandatory'] as String? ?? '',
      IsEnable: json['IsEnable'] as String? ?? '',
      IsVisible: json['IsVisible'] as String? ?? '',
      FieldDisplayName: json['FieldDisplayName'] as String? ?? '',
      FieldTypeNew: json['FieldType'] as String? ?? '',
      FieldDisplayOrder: json['FieldDisplayOrder'] as String? ?? '',
      Regex: json['Regex'] as String? ?? '',
      RegexMessage: json['RegexMessage'] as String? ?? '',
      DefaultValue: json['DefaultValue'] as String? ?? '',
      SetOptions: json['SetOptions'] as String? ?? '',
      Masking: json['Masking'] as String? ?? '',
      ApiKey: json['ApiKey'] as String? ?? '',
      ApiKey1: json['ApiKey1'] as String? ?? '',
      Block: json['Block'] as String? ?? '',
      BlockMessageCode: json['BlockMessageCode'] as String? ?? '',
      BlockMessageDescription: json['BlockMessageDescription'] as String? ?? '',
      Warning: json['Warning'] as String? ?? '',
      WarningMessageCode: json['WarningMessageCode'] as String? ?? '',
      WarningMessageDescription:
          json['WarningMessageDescription'] as String? ?? '',
      CheckDuplicate: json['CheckDuplicate'] as String? ?? '',
      DisplayInNewLine: json['DisplayInNewLine'] as String? ?? '',
      MinLength: json['MinLength'] as String? ?? '',
      MaxLength: json['MaxLength'] as String? ?? '',
      ValidValues: json['ValidValues'] as String? ?? '',
      DisplayValidValuesOnHover:
          json['DisplayValidValuesOnHover'] as String? ?? '',
      FormRuleCode: json['FormRuleCode'] as String? ?? '',
      FormRuleSubCode: json['FormRuleSubCode'] as String? ?? '',
      FormRuleDescription: json['FormRuleDescription'] as String? ?? '',
      DisplaySection: json['DisplaySection'] as String? ?? '',
      DisplaySectionOrder: json['DisplaySectionOrder'] as String? ?? '',
      Linked: json['Linked'] as String? ?? '',
      LinkedWith: json['LinkedWith'] as String? ?? '',
      CreatedBy: json['CreatedBy'] as String? ?? '',
      CreateDatetime: json['CreateDatetime'] as String? ?? '',
      UpdatedBy: json['UpdatedBy'] as String? ?? '',
      UpdateDatetime: json['UpdateDatetime'] as String? ?? '',
      Status: json['Status'] as String? ?? '',
      RuleSeq: json['RuleSeq'] as String? ?? '',
      Prefix: json['Prefix'] as String? ?? '',
      Suffix: json['Suffix'] as String? ?? '',
      CriteriaMapOrg: json['CriteriaMapOrg'] as String? ?? '',
    );

Map<String, dynamic> _$FormFieldItemToJson(_FormFieldItem instance) =>
    <String, dynamic>{
      'Id': instance.Id,
      'LicenseCountry': instance.LicenseCountry,
      'ClientCode': instance.ClientCode,
      'ApplicationName': instance.ApplicationName,
      'ModuleName': instance.ModuleName,
      'FormName': instance.FormName,
      'CriteriaId': instance.CriteriaId,
      'CriteriaMap': instance.CriteriaMap,
      'CriteriaMapSplit': instance.CriteriaMapSplit,
      'RuleSelected': instance.RuleSelected,
      'FieldId': instance.FieldId,
      'FzParamName': instance.FzParamName,
      'FzParamName2': instance.FzParamName2,
      'IsMandatory': instance.IsMandatory,
      'IsEnable': instance.IsEnable,
      'IsVisible': instance.IsVisible,
      'FieldDisplayName': instance.FieldDisplayName,
      'FieldType': instance.FieldTypeNew,
      'FieldDisplayOrder': instance.FieldDisplayOrder,
      'Regex': instance.Regex,
      'RegexMessage': instance.RegexMessage,
      'DefaultValue': instance.DefaultValue,
      'SetOptions': instance.SetOptions,
      'Masking': instance.Masking,
      'ApiKey': instance.ApiKey,
      'ApiKey1': instance.ApiKey1,
      'Block': instance.Block,
      'BlockMessageCode': instance.BlockMessageCode,
      'BlockMessageDescription': instance.BlockMessageDescription,
      'Warning': instance.Warning,
      'WarningMessageCode': instance.WarningMessageCode,
      'WarningMessageDescription': instance.WarningMessageDescription,
      'CheckDuplicate': instance.CheckDuplicate,
      'DisplayInNewLine': instance.DisplayInNewLine,
      'MinLength': instance.MinLength,
      'MaxLength': instance.MaxLength,
      'ValidValues': instance.ValidValues,
      'DisplayValidValuesOnHover': instance.DisplayValidValuesOnHover,
      'FormRuleCode': instance.FormRuleCode,
      'FormRuleSubCode': instance.FormRuleSubCode,
      'FormRuleDescription': instance.FormRuleDescription,
      'DisplaySection': instance.DisplaySection,
      'DisplaySectionOrder': instance.DisplaySectionOrder,
      'Linked': instance.Linked,
      'LinkedWith': instance.LinkedWith,
      'CreatedBy': instance.CreatedBy,
      'CreateDatetime': instance.CreateDatetime,
      'UpdatedBy': instance.UpdatedBy,
      'UpdateDatetime': instance.UpdateDatetime,
      'Status': instance.Status,
      'RuleSeq': instance.RuleSeq,
      'Prefix': instance.Prefix,
      'Suffix': instance.Suffix,
      'CriteriaMapOrg': instance.CriteriaMapOrg,
    };
