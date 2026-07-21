// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_fz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsFZ _$SettingsFZFromJson(Map<String, dynamic> json) => _SettingsFZ(
      appVersion: json['APP_VERSION'] as String? ?? '',
      authBenfAdd: json['ADD_BENEFICIARY_AUTHENTICATION'] as String? ?? '',
      authRemittance: json['TRASNACTION_AUTHENTICATION'] as String? ?? '',
      authBenfEdit: json['EDIT_BENEFICIARY_AUTHENTICATION'] as String? ?? '',
      addCustomerAuthType:
          json['CUSTOMER_REGISTRATION_AUTHENTICATION'] as String? ?? '',
      allowedMinAge: json['ALLOWED_MINIMUM_AGE'] as String? ?? '18',
      editCustomerAuthType:
          json['EDIT_CUSTOMER_AUTHENTICATION'] as String? ?? '',
      LOGINAUTHENTICATIONPRIMARY:
          json['LOGIN_AUTHENTICATION_PRIMARY'] as String? ?? '',
      LOGINAUTHENTICATIONSECONDARY:
          json['LOGIN_AUTHENTICATION_SECONDARY'] as String? ?? '',
      LOGINAUTHENTICATIONTWOFACTOR:
          json['LOGIN_AUTHENTICATION_TWOFACTOR'] as String? ?? '',
      REQUIREDLOGINMETHODS:
          json['REQUIRED_LOGIN_METHODS'] as String? ?? 'DEFAULT',
      COUNTRYDIALINGCODE: json['COUNTRY_DIALING_CODE'] as String? ?? '',
      clientLogo: json['CLIENT_LOGO'] as String? ?? '',
      clientName: json['CLIENT_NAME'] as String? ?? '',
      THEMECOLORS: json['THEME_COLORS'] as String?,
      enableAddBenf: json['ALLOW_ADD_BENEFECIARY'] as bool? ?? false,
      enableEditBenf: json['ALLOW_EDIT_BENEFECIARY'] as bool? ?? false,
      enableEditProfile: json['ALLOW_EDIT_CUSTOMER'] as bool? ?? false,
      enableDeRegistration:
          json['ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER'] as bool? ?? false,
      ocrRequired: json['ALLOW_OCR_PARSING'] as bool? ?? false,
      countriesForBeneficiaries: json['ALLOWED_COUNTRY'] as String? ?? '',
      multiDeviceLoginLength:
          json['ALLOWED_NOOFDEVICE_REGISTRATION'] as String? ?? '',
      enablePromotionDashboard:
          json['REQUIRED_ADVTCAROUSAL_AT_DASHBOARD'] as bool? ?? false,
      enablePromotionPreLogin:
          json['REQUIRED_ADVTCAROUSAL_AT_LOGIN'] as bool? ?? false,
      enableBranchLocator: json['REQUIRED_BRANCHLOCATOR'] as bool? ?? false,
      processEkycAs: json['REQUIRED_EKYC_METHOD'] as String? ?? '',
      REQUIREDEKYCUPDATEMETHOD:
          json['REQUIRED_EKYC_UPDATE_METHOD'] as String? ?? '',
      REQUIREDNEWSATPREDASHBOARD:
          json['REQUIRED_NEWS_AT_PRE_DASHBOARD'] as bool? ?? false,
      REQUIREDNEWSATPRELOGIN:
          json['REQUIRED_NEWS_AT_PRE_LOGIN'] as bool? ?? false,
      preLogin: json['REQUIRED_PRELOGIN'] as bool? ?? false,
      enableCreateAlert: json['REQUIRED_CREATEALERT'] as bool? ?? false,
      enableUTILITY: json['REQUIRED_UTILITY'] as String? ?? '',
      enableVat: json['REQUIRED_VAT'] as bool? ?? false,
      enableWhatsAppChat: json['REQUIRED_WHATSAPPCHAT'] as bool? ?? false,
      enableLoyalty: json['REQUIRED_LOYALTYTEST'] as bool? ?? false,
      checkBeneficiaryAuth:
          json['REQUIRED_NEWBENEFICARY_AUTHORIZATION'] as bool? ?? false,
      checkEditBeneficiaryAuth:
          json['REQUIRED_EDITBENEFICARY_AUTHORIZATION'] as bool? ?? false,
      checkEditCustomerAuth:
          json['REQUIRED_EDITCUSTOMER_AUTHORIZATION'] as bool? ?? false,
      checkCustomerAuth:
          json['REQUIRED_NEWCUSTOMER_AUTHORIZATION'] as bool? ?? false,
      checkPaymentAuth:
          json['REQUIRED_PAYMENT_AUTHORIZATION'] as bool? ?? false,
      checkTransactionAuth:
          json['REQUIRED_TRANSACTION_AUTHORIZATION'] as bool? ?? false,
      BankTransferMTO: json['ALLOW_BANK_TRANSFER_MTO'] as bool? ?? false,
      allowUpdateKYC: json['ALLOW_RENEW_KYC_AFTER_ONE_YEAR'] as bool? ?? false,
      multiDeviceLogin: json['ALLOW_MULTI_DEVICE_LOGIN'] as bool? ?? false,
      amlForTransaction: json['ALLOW_AML_TRANSACTION'] as bool? ?? false,
      preBgFromPromotion: json['ALLOW_PRE_BG_FROM_PROMOTION'] as bool? ?? false,
      loyalty: json['ALLOW_LOYALTY'] as bool? ?? false,
      enableBiometric: json['ALLOW_BIOMETRIC'] as bool? ?? false,
      remittanceLimitPopup:
          json['Required_remittance_limit_popup'] as bool? ?? false,
      blockZerosInNid: json['ALLOW_ZERO_IN_NATIONAL_ID'] as bool? ?? false,
      ForceUpdate: json['ALLOW_FORCE_UPDATE'] as bool? ?? false,
      EnableGallery: json['ALLOW_GALLERY'] as bool? ?? false,
      EnableFile: json['ALLOW_FILE'] as bool? ?? false,
      EnableTrackRemittance: json['ALLOW_TRACK_REMITTANCE'] as bool? ?? false,
      EnablePaymentSound: json['ALLOW_PAYMENT_SOUND'] as bool? ?? false,
      EnableSetForexBooking: json['ALLOW_SET_FOREX_BOOKING'] as bool? ?? false,
      EnableSwipeButton: json['ALLOW_SWIPE_BUTTON'] as bool? ?? false,
      EnableTermsForInternalPages:
          json['ALLOW_TERMS_FOR_INTERNAL_PAGES'] as bool? ?? false,
      currencyDecimalLength: (json['CURRENCY_DECIMAL_LENGTH'] as num?)?.toInt(),
      forexDecimalLength: json['FOREX_DECIMAL'] as String? ?? '7',
      mobileMinLength: (json['MOBILE_MIN_LENGTH'] as num?)?.toInt() ?? 9,
      mobileMaxLength: (json['MOBILE_MAX_LENGTH'] as num?)?.toInt() ?? 15,
      nidMaxLength: (json['NATIONAL_ID_MAX_LENGTH'] as num?)?.toInt() ?? 15,
      nidMinLength: (json['NATIONAL_ID_MIN_LENGTH'] as num?)?.toInt() ?? 7,
      highlitedColor: json['HIGHLIGHT_THEME_COLOR'] as String? ?? 'FFFFFFFF',
      complementaryColr:
          json['COMPLEMENTARY_THEME_COLOR'] as String? ?? 'FFFFFFFF',
      accentColor: json['ACCENT_THEME_COLOR'] as String? ?? 'FF189AB4',
      themeSecondary: json['SECONDARY_THEME_COLOR'] as String? ?? 'FF75E6DA',
      themePrimary: json['PRIMARY_THEME_COLOR'] as String? ?? 'FF05445e',
      primaryDocID: json['PRIMARY_DOCUMENT_IDTYPECODE'] as String? ?? '',
      primaryDocIDName: json['PRIMARY_DOCUMENT_ID_NAME'] as String? ?? '',
      currenciesForBeneficiaries: json['ALLOWED_CURRENCY'] as String? ?? '',
      requiredVPNDetection: json['REQUIRED_VPN_DETECTION'] as bool? ?? false,
      enableScreenMirrorDetection:
          json['EnableScreenMirrorDetection'] as bool? ?? false,
      isRenewKYCAfterOneYear: json['IsRenewKYCAfterOneYear'] as bool? ?? false,
      enableEncryption: json['EnableEncryption'] as bool? ?? false,
      mobileSessionTimeout: json['SESSION_TIMEOUT'] as String? ?? "5",
      requiredAgentStatus: json['REQUIRED_AGENT_STATUS'] as bool? ?? false,
      requiredCurrencySymbol: json['REQUIRED_CURRENCY_SYMBOL'] as bool? ?? true,
      receiptHeaderAlignment:
          json['RECEIPT_HEADER_ALIGNMENT'] as String? ?? "center",
      primaryUI: json['UI_TEMPLATE'] == null
          ? AppUI.defaultUI
          : const AppUIConverter().fromJson(json['UI_TEMPLATE'] as String),
    );

Map<String, dynamic> _$SettingsFZToJson(_SettingsFZ instance) =>
    <String, dynamic>{
      'APP_VERSION': instance.appVersion,
      'ADD_BENEFICIARY_AUTHENTICATION': instance.authBenfAdd,
      'TRASNACTION_AUTHENTICATION': instance.authRemittance,
      'EDIT_BENEFICIARY_AUTHENTICATION': instance.authBenfEdit,
      'CUSTOMER_REGISTRATION_AUTHENTICATION': instance.addCustomerAuthType,
      'ALLOWED_MINIMUM_AGE': instance.allowedMinAge,
      'EDIT_CUSTOMER_AUTHENTICATION': instance.editCustomerAuthType,
      'LOGIN_AUTHENTICATION_PRIMARY': instance.LOGINAUTHENTICATIONPRIMARY,
      'LOGIN_AUTHENTICATION_SECONDARY': instance.LOGINAUTHENTICATIONSECONDARY,
      'LOGIN_AUTHENTICATION_TWOFACTOR': instance.LOGINAUTHENTICATIONTWOFACTOR,
      'REQUIRED_LOGIN_METHODS': instance.REQUIREDLOGINMETHODS,
      'COUNTRY_DIALING_CODE': instance.COUNTRYDIALINGCODE,
      'CLIENT_LOGO': instance.clientLogo,
      'CLIENT_NAME': instance.clientName,
      'THEME_COLORS': instance.THEMECOLORS,
      'ALLOW_ADD_BENEFECIARY': instance.enableAddBenf,
      'ALLOW_EDIT_BENEFECIARY': instance.enableEditBenf,
      'ALLOW_EDIT_CUSTOMER': instance.enableEditProfile,
      'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER': instance.enableDeRegistration,
      'ALLOW_OCR_PARSING': instance.ocrRequired,
      'ALLOWED_COUNTRY': instance.countriesForBeneficiaries,
      'ALLOWED_NOOFDEVICE_REGISTRATION': instance.multiDeviceLoginLength,
      'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD': instance.enablePromotionDashboard,
      'REQUIRED_ADVTCAROUSAL_AT_LOGIN': instance.enablePromotionPreLogin,
      'REQUIRED_BRANCHLOCATOR': instance.enableBranchLocator,
      'REQUIRED_EKYC_METHOD': instance.processEkycAs,
      'REQUIRED_EKYC_UPDATE_METHOD': instance.REQUIREDEKYCUPDATEMETHOD,
      'REQUIRED_NEWS_AT_PRE_DASHBOARD': instance.REQUIREDNEWSATPREDASHBOARD,
      'REQUIRED_NEWS_AT_PRE_LOGIN': instance.REQUIREDNEWSATPRELOGIN,
      'REQUIRED_PRELOGIN': instance.preLogin,
      'REQUIRED_CREATEALERT': instance.enableCreateAlert,
      'REQUIRED_UTILITY': instance.enableUTILITY,
      'REQUIRED_VAT': instance.enableVat,
      'REQUIRED_WHATSAPPCHAT': instance.enableWhatsAppChat,
      'REQUIRED_LOYALTYTEST': instance.enableLoyalty,
      'REQUIRED_NEWBENEFICARY_AUTHORIZATION': instance.checkBeneficiaryAuth,
      'REQUIRED_EDITBENEFICARY_AUTHORIZATION':
          instance.checkEditBeneficiaryAuth,
      'REQUIRED_EDITCUSTOMER_AUTHORIZATION': instance.checkEditCustomerAuth,
      'REQUIRED_NEWCUSTOMER_AUTHORIZATION': instance.checkCustomerAuth,
      'REQUIRED_PAYMENT_AUTHORIZATION': instance.checkPaymentAuth,
      'REQUIRED_TRANSACTION_AUTHORIZATION': instance.checkTransactionAuth,
      'ALLOW_BANK_TRANSFER_MTO': instance.BankTransferMTO,
      'ALLOW_RENEW_KYC_AFTER_ONE_YEAR': instance.allowUpdateKYC,
      'ALLOW_MULTI_DEVICE_LOGIN': instance.multiDeviceLogin,
      'ALLOW_AML_TRANSACTION': instance.amlForTransaction,
      'ALLOW_PRE_BG_FROM_PROMOTION': instance.preBgFromPromotion,
      'ALLOW_LOYALTY': instance.loyalty,
      'ALLOW_BIOMETRIC': instance.enableBiometric,
      'Required_remittance_limit_popup': instance.remittanceLimitPopup,
      'ALLOW_ZERO_IN_NATIONAL_ID': instance.blockZerosInNid,
      'ALLOW_FORCE_UPDATE': instance.ForceUpdate,
      'ALLOW_GALLERY': instance.EnableGallery,
      'ALLOW_FILE': instance.EnableFile,
      'ALLOW_TRACK_REMITTANCE': instance.EnableTrackRemittance,
      'ALLOW_PAYMENT_SOUND': instance.EnablePaymentSound,
      'ALLOW_SET_FOREX_BOOKING': instance.EnableSetForexBooking,
      'ALLOW_SWIPE_BUTTON': instance.EnableSwipeButton,
      'ALLOW_TERMS_FOR_INTERNAL_PAGES': instance.EnableTermsForInternalPages,
      'CURRENCY_DECIMAL_LENGTH': instance.currencyDecimalLength,
      'FOREX_DECIMAL': instance.forexDecimalLength,
      'MOBILE_MIN_LENGTH': instance.mobileMinLength,
      'MOBILE_MAX_LENGTH': instance.mobileMaxLength,
      'NATIONAL_ID_MAX_LENGTH': instance.nidMaxLength,
      'NATIONAL_ID_MIN_LENGTH': instance.nidMinLength,
      'HIGHLIGHT_THEME_COLOR': instance.highlitedColor,
      'COMPLEMENTARY_THEME_COLOR': instance.complementaryColr,
      'ACCENT_THEME_COLOR': instance.accentColor,
      'SECONDARY_THEME_COLOR': instance.themeSecondary,
      'PRIMARY_THEME_COLOR': instance.themePrimary,
      'PRIMARY_DOCUMENT_IDTYPECODE': instance.primaryDocID,
      'PRIMARY_DOCUMENT_ID_NAME': instance.primaryDocIDName,
      'ALLOWED_CURRENCY': instance.currenciesForBeneficiaries,
      'REQUIRED_VPN_DETECTION': instance.requiredVPNDetection,
      'EnableScreenMirrorDetection': instance.enableScreenMirrorDetection,
      'IsRenewKYCAfterOneYear': instance.isRenewKYCAfterOneYear,
      'EnableEncryption': instance.enableEncryption,
      'SESSION_TIMEOUT': instance.mobileSessionTimeout,
      'REQUIRED_AGENT_STATUS': instance.requiredAgentStatus,
      'REQUIRED_CURRENCY_SYMBOL': instance.requiredCurrencySymbol,
      'RECEIPT_HEADER_ALIGNMENT': instance.receiptHeaderAlignment,
      'UI_TEMPLATE': const AppUIConverter().toJson(instance.primaryUI),
    };
