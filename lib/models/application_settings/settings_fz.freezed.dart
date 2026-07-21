// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_fz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsFZ {
// system
  @JsonKey(name: 'APP_VERSION')
  String get appVersion;

  ///auth part
//beneficiary auth type
  @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION')
  String get authBenfAdd; // transaction auth type
  @JsonKey(name: 'TRASNACTION_AUTHENTICATION')
  String get authRemittance; // edit beneficiary auth type
  @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION')
  String get authBenfEdit; // customer reg auth type
  @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
  String get addCustomerAuthType; // min age for customer registration
  @JsonKey(name: 'ALLOWED_MINIMUM_AGE')
  String get allowedMinAge; // edit customer / profile reg auth type
  @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
  String get editCustomerAuthType;
  @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
  String get LOGINAUTHENTICATIONPRIMARY;
  @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
  String get LOGINAUTHENTICATIONSECONDARY;
  @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
  String get LOGINAUTHENTICATIONTWOFACTOR;
  @JsonKey(name: 'REQUIRED_LOGIN_METHODS')
  String get REQUIREDLOGINMETHODS;
  @JsonKey(name: 'COUNTRY_DIALING_CODE')
  String get COUNTRYDIALINGCODE;

  ///personalization part
// client logo
  @JsonKey(name: 'CLIENT_LOGO')
  String get clientLogo; // client name
  @JsonKey(name: 'CLIENT_NAME')
  String get clientName; // app theme primary and secondary
  @JsonKey(name: 'THEME_COLORS')
  String? get THEMECOLORS; //add beneficiary allow
  @JsonKey(name: 'ALLOW_ADD_BENEFECIARY')
  bool get enableAddBenf; // edit beneficiary allow
  @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY')
  bool get enableEditBenf; // edit customer / edit profile allow
  @JsonKey(name: 'ALLOW_EDIT_CUSTOMER')
  bool get enableEditProfile; // enable deregister device allow
  @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
  bool get enableDeRegistration; // ocr required allow
  @JsonKey(name: 'ALLOW_OCR_PARSING')
  bool
      get ocrRequired; // service allowed on country or if blank then it for all
  @JsonKey(name: 'ALLOWED_COUNTRY')
  String get countriesForBeneficiaries; // enable multi device login
  @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
  String get multiDeviceLoginLength; // enable promotion to dashboard
  @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
  bool get enablePromotionDashboard; // enable prelogin promotion
  @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
  bool get enablePromotionPreLogin; // enable branch locator
  @JsonKey(name: 'REQUIRED_BRANCHLOCATOR')
  bool get enableBranchLocator; // kyc type normal or uaepass
  @JsonKey(name: 'REQUIRED_EKYC_METHOD')
  String get processEkycAs;
  @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
  String get REQUIREDEKYCUPDATEMETHOD;
  @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
  bool get REQUIREDNEWSATPREDASHBOARD;
  @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN')
  bool get REQUIREDNEWSATPRELOGIN; // pre login required
  @JsonKey(name: 'REQUIRED_PRELOGIN')
  bool get preLogin; // create alert screen required
  @JsonKey(name: 'REQUIRED_CREATEALERT')
  bool get enableCreateAlert; // enable utility feature from list
  @JsonKey(name: 'REQUIRED_UTILITY')
  String get enableUTILITY; // enable vat
  @JsonKey(name: 'REQUIRED_VAT')
  bool get enableVat; // enable whats app
  @JsonKey(name: 'REQUIRED_WHATSAPPCHAT')
  bool get enableWhatsAppChat; // enable loyalty offers
  @JsonKey(name: 'REQUIRED_LOYALTYTEST')
  bool get enableLoyalty; // check beneficiary auth enable or not
  @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
  bool get checkBeneficiaryAuth; // check edit beneficiary auth enable or not
  @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
  bool get checkEditBeneficiaryAuth; // check edit customer auth enable or not
  @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
  bool get checkEditCustomerAuth; // check customer auth enable or not
  @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
  bool get checkCustomerAuth; // check payment auth enable or not
  @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION')
  bool get checkPaymentAuth; // check transaction auth enable or not
  @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
  bool get checkTransactionAuth; ////
  ///
//
// handle from backend
  @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO')
  bool
      get BankTransferMTO; // @JsonKey(name: 'ALLOW_KYC_UPDATE') @Default(false) bool isRenewKYCAfterOneYear,
// handle from backend in login
  @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR')
  bool get allowUpdateKYC;
  @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN')
  bool get multiDeviceLogin; // handle from backend
  @JsonKey(name: 'ALLOW_AML_TRANSACTION')
  bool get amlForTransaction;
  @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION')
  bool get preBgFromPromotion; // implement in future
  @JsonKey(name: 'ALLOW_LOYALTY')
  bool get loyalty;
  @JsonKey(name: 'ALLOW_BIOMETRIC')
  bool get enableBiometric; // from form rule
  @JsonKey(name: 'Required_remittance_limit_popup')
  bool get remittanceLimitPopup;
  @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID')
  bool get blockZerosInNid;
  @JsonKey(name: 'ALLOW_FORCE_UPDATE')
  bool get ForceUpdate;
  @JsonKey(name: 'ALLOW_GALLERY')
  bool get EnableGallery;
  @JsonKey(name: 'ALLOW_FILE')
  bool get EnableFile; // this for all client
  @JsonKey(name: 'ALLOW_TRACK_REMITTANCE')
  bool get EnableTrackRemittance;
  @JsonKey(name: 'ALLOW_PAYMENT_SOUND')
  bool get EnablePaymentSound; // this for all client
  @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING')
  bool get EnableSetForexBooking;
  @JsonKey(name: 'ALLOW_SWIPE_BUTTON')
  bool get EnableSwipeButton; // this for all client
  @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
  bool get EnableTermsForInternalPages; // handle from backend
  @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH')
  int? get currencyDecimalLength;
  @JsonKey(name: 'FOREX_DECIMAL')
  String get forexDecimalLength; // from form rule
  @JsonKey(name: 'MOBILE_MIN_LENGTH')
  int get mobileMinLength; // from form rule
  @JsonKey(name: 'MOBILE_MAX_LENGTH')
  int get mobileMaxLength; // from form rule
  @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH')
  int get nidMaxLength; // from form rule
  @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH')
  int get nidMinLength; // @JsonKey(name: 'SWIPE_BUTTON_COLOR') @Default('FFFFFFFF') String SWIPECOLORNO,
  @JsonKey(name: 'HIGHLIGHT_THEME_COLOR')
  String? get highlitedColor;
  @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR')
  String? get complementaryColr;
  @JsonKey(name: 'ACCENT_THEME_COLOR')
  String? get accentColor;
  @JsonKey(name: 'SECONDARY_THEME_COLOR')
  String? get themeSecondary;
  @JsonKey(name: 'PRIMARY_THEME_COLOR')
  String? get themePrimary;
  @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE')
  String get primaryDocID;
  @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME')
  String get primaryDocIDName;
  @JsonKey(name: 'ALLOWED_CURRENCY')
  String get currenciesForBeneficiaries;
  @JsonKey(name: "REQUIRED_VPN_DETECTION")
  bool get requiredVPNDetection;
  @JsonKey(name: "EnableScreenMirrorDetection")
  bool get enableScreenMirrorDetection;
  @JsonKey(name: "IsRenewKYCAfterOneYear")
  bool get isRenewKYCAfterOneYear;
  @JsonKey(name: "EnableEncryption")
  bool get enableEncryption;
  @JsonKey(name: 'SESSION_TIMEOUT')
  String get mobileSessionTimeout;
  @JsonKey(name: "REQUIRED_AGENT_STATUS")
  bool get requiredAgentStatus;
  @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL")
  bool get requiredCurrencySymbol;
  @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT")
  String get receiptHeaderAlignment;
  @JsonKey(name: "UI_TEMPLATE")
  @AppUIConverter()
  AppUI get primaryUI;

  /// Create a copy of SettingsFZ
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsFZCopyWith<SettingsFZ> get copyWith =>
      _$SettingsFZCopyWithImpl<SettingsFZ>(this as SettingsFZ, _$identity);

  /// Serializes this SettingsFZ to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsFZ &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.authBenfAdd, authBenfAdd) ||
                other.authBenfAdd == authBenfAdd) &&
            (identical(other.authRemittance, authRemittance) ||
                other.authRemittance == authRemittance) &&
            (identical(other.authBenfEdit, authBenfEdit) ||
                other.authBenfEdit == authBenfEdit) &&
            (identical(other.addCustomerAuthType, addCustomerAuthType) ||
                other.addCustomerAuthType == addCustomerAuthType) &&
            (identical(other.allowedMinAge, allowedMinAge) ||
                other.allowedMinAge == allowedMinAge) &&
            (identical(other.editCustomerAuthType, editCustomerAuthType) ||
                other.editCustomerAuthType == editCustomerAuthType) &&
            (identical(other.LOGINAUTHENTICATIONPRIMARY, LOGINAUTHENTICATIONPRIMARY) ||
                other.LOGINAUTHENTICATIONPRIMARY ==
                    LOGINAUTHENTICATIONPRIMARY) &&
            (identical(other.LOGINAUTHENTICATIONSECONDARY, LOGINAUTHENTICATIONSECONDARY) ||
                other.LOGINAUTHENTICATIONSECONDARY ==
                    LOGINAUTHENTICATIONSECONDARY) &&
            (identical(other.LOGINAUTHENTICATIONTWOFACTOR, LOGINAUTHENTICATIONTWOFACTOR) ||
                other.LOGINAUTHENTICATIONTWOFACTOR ==
                    LOGINAUTHENTICATIONTWOFACTOR) &&
            (identical(other.REQUIREDLOGINMETHODS, REQUIREDLOGINMETHODS) ||
                other.REQUIREDLOGINMETHODS == REQUIREDLOGINMETHODS) &&
            (identical(other.COUNTRYDIALINGCODE, COUNTRYDIALINGCODE) ||
                other.COUNTRYDIALINGCODE == COUNTRYDIALINGCODE) &&
            (identical(other.clientLogo, clientLogo) ||
                other.clientLogo == clientLogo) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.THEMECOLORS, THEMECOLORS) ||
                other.THEMECOLORS == THEMECOLORS) &&
            (identical(other.enableAddBenf, enableAddBenf) ||
                other.enableAddBenf == enableAddBenf) &&
            (identical(other.enableEditBenf, enableEditBenf) ||
                other.enableEditBenf == enableEditBenf) &&
            (identical(other.enableEditProfile, enableEditProfile) ||
                other.enableEditProfile == enableEditProfile) &&
            (identical(other.enableDeRegistration, enableDeRegistration) ||
                other.enableDeRegistration == enableDeRegistration) &&
            (identical(other.ocrRequired, ocrRequired) ||
                other.ocrRequired == ocrRequired) &&
            (identical(other.countriesForBeneficiaries, countriesForBeneficiaries) ||
                other.countriesForBeneficiaries == countriesForBeneficiaries) &&
            (identical(other.multiDeviceLoginLength, multiDeviceLoginLength) ||
                other.multiDeviceLoginLength == multiDeviceLoginLength) &&
            (identical(other.enablePromotionDashboard, enablePromotionDashboard) ||
                other.enablePromotionDashboard == enablePromotionDashboard) &&
            (identical(other.enablePromotionPreLogin, enablePromotionPreLogin) ||
                other.enablePromotionPreLogin == enablePromotionPreLogin) &&
            (identical(other.enableBranchLocator, enableBranchLocator) ||
                other.enableBranchLocator == enableBranchLocator) &&
            (identical(other.processEkycAs, processEkycAs) ||
                other.processEkycAs == processEkycAs) &&
            (identical(other.REQUIREDEKYCUPDATEMETHOD, REQUIREDEKYCUPDATEMETHOD) ||
                other.REQUIREDEKYCUPDATEMETHOD == REQUIREDEKYCUPDATEMETHOD) &&
            (identical(other.REQUIREDNEWSATPREDASHBOARD, REQUIREDNEWSATPREDASHBOARD) || other.REQUIREDNEWSATPREDASHBOARD == REQUIREDNEWSATPREDASHBOARD) &&
            (identical(other.REQUIREDNEWSATPRELOGIN, REQUIREDNEWSATPRELOGIN) || other.REQUIREDNEWSATPRELOGIN == REQUIREDNEWSATPRELOGIN) &&
            (identical(other.preLogin, preLogin) || other.preLogin == preLogin) &&
            (identical(other.enableCreateAlert, enableCreateAlert) || other.enableCreateAlert == enableCreateAlert) &&
            (identical(other.enableUTILITY, enableUTILITY) || other.enableUTILITY == enableUTILITY) &&
            (identical(other.enableVat, enableVat) || other.enableVat == enableVat) &&
            (identical(other.enableWhatsAppChat, enableWhatsAppChat) || other.enableWhatsAppChat == enableWhatsAppChat) &&
            (identical(other.enableLoyalty, enableLoyalty) || other.enableLoyalty == enableLoyalty) &&
            (identical(other.checkBeneficiaryAuth, checkBeneficiaryAuth) || other.checkBeneficiaryAuth == checkBeneficiaryAuth) &&
            (identical(other.checkEditBeneficiaryAuth, checkEditBeneficiaryAuth) || other.checkEditBeneficiaryAuth == checkEditBeneficiaryAuth) &&
            (identical(other.checkEditCustomerAuth, checkEditCustomerAuth) || other.checkEditCustomerAuth == checkEditCustomerAuth) &&
            (identical(other.checkCustomerAuth, checkCustomerAuth) || other.checkCustomerAuth == checkCustomerAuth) &&
            (identical(other.checkPaymentAuth, checkPaymentAuth) || other.checkPaymentAuth == checkPaymentAuth) &&
            (identical(other.checkTransactionAuth, checkTransactionAuth) || other.checkTransactionAuth == checkTransactionAuth) &&
            (identical(other.BankTransferMTO, BankTransferMTO) || other.BankTransferMTO == BankTransferMTO) &&
            (identical(other.allowUpdateKYC, allowUpdateKYC) || other.allowUpdateKYC == allowUpdateKYC) &&
            (identical(other.multiDeviceLogin, multiDeviceLogin) || other.multiDeviceLogin == multiDeviceLogin) &&
            (identical(other.amlForTransaction, amlForTransaction) || other.amlForTransaction == amlForTransaction) &&
            (identical(other.preBgFromPromotion, preBgFromPromotion) || other.preBgFromPromotion == preBgFromPromotion) &&
            (identical(other.loyalty, loyalty) || other.loyalty == loyalty) &&
            (identical(other.enableBiometric, enableBiometric) || other.enableBiometric == enableBiometric) &&
            (identical(other.remittanceLimitPopup, remittanceLimitPopup) || other.remittanceLimitPopup == remittanceLimitPopup) &&
            (identical(other.blockZerosInNid, blockZerosInNid) || other.blockZerosInNid == blockZerosInNid) &&
            (identical(other.ForceUpdate, ForceUpdate) || other.ForceUpdate == ForceUpdate) &&
            (identical(other.EnableGallery, EnableGallery) || other.EnableGallery == EnableGallery) &&
            (identical(other.EnableFile, EnableFile) || other.EnableFile == EnableFile) &&
            (identical(other.EnableTrackRemittance, EnableTrackRemittance) || other.EnableTrackRemittance == EnableTrackRemittance) &&
            (identical(other.EnablePaymentSound, EnablePaymentSound) || other.EnablePaymentSound == EnablePaymentSound) &&
            (identical(other.EnableSetForexBooking, EnableSetForexBooking) || other.EnableSetForexBooking == EnableSetForexBooking) &&
            (identical(other.EnableSwipeButton, EnableSwipeButton) || other.EnableSwipeButton == EnableSwipeButton) &&
            (identical(other.EnableTermsForInternalPages, EnableTermsForInternalPages) || other.EnableTermsForInternalPages == EnableTermsForInternalPages) &&
            (identical(other.currencyDecimalLength, currencyDecimalLength) || other.currencyDecimalLength == currencyDecimalLength) &&
            (identical(other.forexDecimalLength, forexDecimalLength) || other.forexDecimalLength == forexDecimalLength) &&
            (identical(other.mobileMinLength, mobileMinLength) || other.mobileMinLength == mobileMinLength) &&
            (identical(other.mobileMaxLength, mobileMaxLength) || other.mobileMaxLength == mobileMaxLength) &&
            (identical(other.nidMaxLength, nidMaxLength) || other.nidMaxLength == nidMaxLength) &&
            (identical(other.nidMinLength, nidMinLength) || other.nidMinLength == nidMinLength) &&
            (identical(other.highlitedColor, highlitedColor) || other.highlitedColor == highlitedColor) &&
            (identical(other.complementaryColr, complementaryColr) || other.complementaryColr == complementaryColr) &&
            (identical(other.accentColor, accentColor) || other.accentColor == accentColor) &&
            (identical(other.themeSecondary, themeSecondary) || other.themeSecondary == themeSecondary) &&
            (identical(other.themePrimary, themePrimary) || other.themePrimary == themePrimary) &&
            (identical(other.primaryDocID, primaryDocID) || other.primaryDocID == primaryDocID) &&
            (identical(other.primaryDocIDName, primaryDocIDName) || other.primaryDocIDName == primaryDocIDName) &&
            (identical(other.currenciesForBeneficiaries, currenciesForBeneficiaries) || other.currenciesForBeneficiaries == currenciesForBeneficiaries) &&
            (identical(other.requiredVPNDetection, requiredVPNDetection) || other.requiredVPNDetection == requiredVPNDetection) &&
            (identical(other.enableScreenMirrorDetection, enableScreenMirrorDetection) || other.enableScreenMirrorDetection == enableScreenMirrorDetection) &&
            (identical(other.isRenewKYCAfterOneYear, isRenewKYCAfterOneYear) || other.isRenewKYCAfterOneYear == isRenewKYCAfterOneYear) &&
            (identical(other.enableEncryption, enableEncryption) || other.enableEncryption == enableEncryption) &&
            (identical(other.mobileSessionTimeout, mobileSessionTimeout) || other.mobileSessionTimeout == mobileSessionTimeout) &&
            (identical(other.requiredAgentStatus, requiredAgentStatus) || other.requiredAgentStatus == requiredAgentStatus) &&
            (identical(other.requiredCurrencySymbol, requiredCurrencySymbol) || other.requiredCurrencySymbol == requiredCurrencySymbol) &&
            (identical(other.receiptHeaderAlignment, receiptHeaderAlignment) || other.receiptHeaderAlignment == receiptHeaderAlignment) &&
            (identical(other.primaryUI, primaryUI) || other.primaryUI == primaryUI));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        appVersion,
        authBenfAdd,
        authRemittance,
        authBenfEdit,
        addCustomerAuthType,
        allowedMinAge,
        editCustomerAuthType,
        LOGINAUTHENTICATIONPRIMARY,
        LOGINAUTHENTICATIONSECONDARY,
        LOGINAUTHENTICATIONTWOFACTOR,
        REQUIREDLOGINMETHODS,
        COUNTRYDIALINGCODE,
        clientLogo,
        clientName,
        THEMECOLORS,
        enableAddBenf,
        enableEditBenf,
        enableEditProfile,
        enableDeRegistration,
        ocrRequired,
        countriesForBeneficiaries,
        multiDeviceLoginLength,
        enablePromotionDashboard,
        enablePromotionPreLogin,
        enableBranchLocator,
        processEkycAs,
        REQUIREDEKYCUPDATEMETHOD,
        REQUIREDNEWSATPREDASHBOARD,
        REQUIREDNEWSATPRELOGIN,
        preLogin,
        enableCreateAlert,
        enableUTILITY,
        enableVat,
        enableWhatsAppChat,
        enableLoyalty,
        checkBeneficiaryAuth,
        checkEditBeneficiaryAuth,
        checkEditCustomerAuth,
        checkCustomerAuth,
        checkPaymentAuth,
        checkTransactionAuth,
        BankTransferMTO,
        allowUpdateKYC,
        multiDeviceLogin,
        amlForTransaction,
        preBgFromPromotion,
        loyalty,
        enableBiometric,
        remittanceLimitPopup,
        blockZerosInNid,
        ForceUpdate,
        EnableGallery,
        EnableFile,
        EnableTrackRemittance,
        EnablePaymentSound,
        EnableSetForexBooking,
        EnableSwipeButton,
        EnableTermsForInternalPages,
        currencyDecimalLength,
        forexDecimalLength,
        mobileMinLength,
        mobileMaxLength,
        nidMaxLength,
        nidMinLength,
        highlitedColor,
        complementaryColr,
        accentColor,
        themeSecondary,
        themePrimary,
        primaryDocID,
        primaryDocIDName,
        currenciesForBeneficiaries,
        requiredVPNDetection,
        enableScreenMirrorDetection,
        isRenewKYCAfterOneYear,
        enableEncryption,
        mobileSessionTimeout,
        requiredAgentStatus,
        requiredCurrencySymbol,
        receiptHeaderAlignment,
        primaryUI
      ]);

  @override
  String toString() {
    return 'SettingsFZ(appVersion: $appVersion, authBenfAdd: $authBenfAdd, authRemittance: $authRemittance, authBenfEdit: $authBenfEdit, addCustomerAuthType: $addCustomerAuthType, allowedMinAge: $allowedMinAge, editCustomerAuthType: $editCustomerAuthType, LOGINAUTHENTICATIONPRIMARY: $LOGINAUTHENTICATIONPRIMARY, LOGINAUTHENTICATIONSECONDARY: $LOGINAUTHENTICATIONSECONDARY, LOGINAUTHENTICATIONTWOFACTOR: $LOGINAUTHENTICATIONTWOFACTOR, REQUIREDLOGINMETHODS: $REQUIREDLOGINMETHODS, COUNTRYDIALINGCODE: $COUNTRYDIALINGCODE, clientLogo: $clientLogo, clientName: $clientName, THEMECOLORS: $THEMECOLORS, enableAddBenf: $enableAddBenf, enableEditBenf: $enableEditBenf, enableEditProfile: $enableEditProfile, enableDeRegistration: $enableDeRegistration, ocrRequired: $ocrRequired, countriesForBeneficiaries: $countriesForBeneficiaries, multiDeviceLoginLength: $multiDeviceLoginLength, enablePromotionDashboard: $enablePromotionDashboard, enablePromotionPreLogin: $enablePromotionPreLogin, enableBranchLocator: $enableBranchLocator, processEkycAs: $processEkycAs, REQUIREDEKYCUPDATEMETHOD: $REQUIREDEKYCUPDATEMETHOD, REQUIREDNEWSATPREDASHBOARD: $REQUIREDNEWSATPREDASHBOARD, REQUIREDNEWSATPRELOGIN: $REQUIREDNEWSATPRELOGIN, preLogin: $preLogin, enableCreateAlert: $enableCreateAlert, enableUTILITY: $enableUTILITY, enableVat: $enableVat, enableWhatsAppChat: $enableWhatsAppChat, enableLoyalty: $enableLoyalty, checkBeneficiaryAuth: $checkBeneficiaryAuth, checkEditBeneficiaryAuth: $checkEditBeneficiaryAuth, checkEditCustomerAuth: $checkEditCustomerAuth, checkCustomerAuth: $checkCustomerAuth, checkPaymentAuth: $checkPaymentAuth, checkTransactionAuth: $checkTransactionAuth, BankTransferMTO: $BankTransferMTO, allowUpdateKYC: $allowUpdateKYC, multiDeviceLogin: $multiDeviceLogin, amlForTransaction: $amlForTransaction, preBgFromPromotion: $preBgFromPromotion, loyalty: $loyalty, enableBiometric: $enableBiometric, remittanceLimitPopup: $remittanceLimitPopup, blockZerosInNid: $blockZerosInNid, ForceUpdate: $ForceUpdate, EnableGallery: $EnableGallery, EnableFile: $EnableFile, EnableTrackRemittance: $EnableTrackRemittance, EnablePaymentSound: $EnablePaymentSound, EnableSetForexBooking: $EnableSetForexBooking, EnableSwipeButton: $EnableSwipeButton, EnableTermsForInternalPages: $EnableTermsForInternalPages, currencyDecimalLength: $currencyDecimalLength, forexDecimalLength: $forexDecimalLength, mobileMinLength: $mobileMinLength, mobileMaxLength: $mobileMaxLength, nidMaxLength: $nidMaxLength, nidMinLength: $nidMinLength, highlitedColor: $highlitedColor, complementaryColr: $complementaryColr, accentColor: $accentColor, themeSecondary: $themeSecondary, themePrimary: $themePrimary, primaryDocID: $primaryDocID, primaryDocIDName: $primaryDocIDName, currenciesForBeneficiaries: $currenciesForBeneficiaries, requiredVPNDetection: $requiredVPNDetection, enableScreenMirrorDetection: $enableScreenMirrorDetection, isRenewKYCAfterOneYear: $isRenewKYCAfterOneYear, enableEncryption: $enableEncryption, mobileSessionTimeout: $mobileSessionTimeout, requiredAgentStatus: $requiredAgentStatus, requiredCurrencySymbol: $requiredCurrencySymbol, receiptHeaderAlignment: $receiptHeaderAlignment, primaryUI: $primaryUI)';
  }
}

/// @nodoc
abstract mixin class $SettingsFZCopyWith<$Res> {
  factory $SettingsFZCopyWith(
          SettingsFZ value, $Res Function(SettingsFZ) _then) =
      _$SettingsFZCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'APP_VERSION') String appVersion,
      @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION') String authBenfAdd,
      @JsonKey(name: 'TRASNACTION_AUTHENTICATION') String authRemittance,
      @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION') String authBenfEdit,
      @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
      String addCustomerAuthType,
      @JsonKey(name: 'ALLOWED_MINIMUM_AGE') String allowedMinAge,
      @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
      String editCustomerAuthType,
      @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
      String LOGINAUTHENTICATIONPRIMARY,
      @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
      String LOGINAUTHENTICATIONSECONDARY,
      @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
      String LOGINAUTHENTICATIONTWOFACTOR,
      @JsonKey(name: 'REQUIRED_LOGIN_METHODS') String REQUIREDLOGINMETHODS,
      @JsonKey(name: 'COUNTRY_DIALING_CODE') String COUNTRYDIALINGCODE,
      @JsonKey(name: 'CLIENT_LOGO') String clientLogo,
      @JsonKey(name: 'CLIENT_NAME') String clientName,
      @JsonKey(name: 'THEME_COLORS') String? THEMECOLORS,
      @JsonKey(name: 'ALLOW_ADD_BENEFECIARY') bool enableAddBenf,
      @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY') bool enableEditBenf,
      @JsonKey(name: 'ALLOW_EDIT_CUSTOMER') bool enableEditProfile,
      @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
      bool enableDeRegistration,
      @JsonKey(name: 'ALLOW_OCR_PARSING') bool ocrRequired,
      @JsonKey(name: 'ALLOWED_COUNTRY') String countriesForBeneficiaries,
      @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
      String multiDeviceLoginLength,
      @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
      bool enablePromotionDashboard,
      @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
      bool enablePromotionPreLogin,
      @JsonKey(name: 'REQUIRED_BRANCHLOCATOR') bool enableBranchLocator,
      @JsonKey(name: 'REQUIRED_EKYC_METHOD') String processEkycAs,
      @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
      String REQUIREDEKYCUPDATEMETHOD,
      @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
      bool REQUIREDNEWSATPREDASHBOARD,
      @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN') bool REQUIREDNEWSATPRELOGIN,
      @JsonKey(name: 'REQUIRED_PRELOGIN') bool preLogin,
      @JsonKey(name: 'REQUIRED_CREATEALERT') bool enableCreateAlert,
      @JsonKey(name: 'REQUIRED_UTILITY') String enableUTILITY,
      @JsonKey(name: 'REQUIRED_VAT') bool enableVat,
      @JsonKey(name: 'REQUIRED_WHATSAPPCHAT') bool enableWhatsAppChat,
      @JsonKey(name: 'REQUIRED_LOYALTYTEST') bool enableLoyalty,
      @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
      bool checkBeneficiaryAuth,
      @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
      bool checkEditBeneficiaryAuth,
      @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
      bool checkEditCustomerAuth,
      @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
      bool checkCustomerAuth,
      @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION') bool checkPaymentAuth,
      @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
      bool checkTransactionAuth,
      @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO') bool BankTransferMTO,
      @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR') bool allowUpdateKYC,
      @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN') bool multiDeviceLogin,
      @JsonKey(name: 'ALLOW_AML_TRANSACTION') bool amlForTransaction,
      @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION') bool preBgFromPromotion,
      @JsonKey(name: 'ALLOW_LOYALTY') bool loyalty,
      @JsonKey(name: 'ALLOW_BIOMETRIC') bool enableBiometric,
      @JsonKey(name: 'Required_remittance_limit_popup')
      bool remittanceLimitPopup,
      @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID') bool blockZerosInNid,
      @JsonKey(name: 'ALLOW_FORCE_UPDATE') bool ForceUpdate,
      @JsonKey(name: 'ALLOW_GALLERY') bool EnableGallery,
      @JsonKey(name: 'ALLOW_FILE') bool EnableFile,
      @JsonKey(name: 'ALLOW_TRACK_REMITTANCE') bool EnableTrackRemittance,
      @JsonKey(name: 'ALLOW_PAYMENT_SOUND') bool EnablePaymentSound,
      @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING') bool EnableSetForexBooking,
      @JsonKey(name: 'ALLOW_SWIPE_BUTTON') bool EnableSwipeButton,
      @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
      bool EnableTermsForInternalPages,
      @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH') int? currencyDecimalLength,
      @JsonKey(name: 'FOREX_DECIMAL') String forexDecimalLength,
      @JsonKey(name: 'MOBILE_MIN_LENGTH') int mobileMinLength,
      @JsonKey(name: 'MOBILE_MAX_LENGTH') int mobileMaxLength,
      @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH') int nidMaxLength,
      @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH') int nidMinLength,
      @JsonKey(name: 'HIGHLIGHT_THEME_COLOR') String? highlitedColor,
      @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR') String? complementaryColr,
      @JsonKey(name: 'ACCENT_THEME_COLOR') String? accentColor,
      @JsonKey(name: 'SECONDARY_THEME_COLOR') String? themeSecondary,
      @JsonKey(name: 'PRIMARY_THEME_COLOR') String? themePrimary,
      @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE') String primaryDocID,
      @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME') String primaryDocIDName,
      @JsonKey(name: 'ALLOWED_CURRENCY') String currenciesForBeneficiaries,
      @JsonKey(name: "REQUIRED_VPN_DETECTION") bool requiredVPNDetection,
      @JsonKey(name: "EnableScreenMirrorDetection")
      bool enableScreenMirrorDetection,
      @JsonKey(name: "IsRenewKYCAfterOneYear") bool isRenewKYCAfterOneYear,
      @JsonKey(name: "EnableEncryption") bool enableEncryption,
      @JsonKey(name: 'SESSION_TIMEOUT') String mobileSessionTimeout,
      @JsonKey(name: "REQUIRED_AGENT_STATUS") bool requiredAgentStatus,
      @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL") bool requiredCurrencySymbol,
      @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT") String receiptHeaderAlignment,
      @JsonKey(name: "UI_TEMPLATE") @AppUIConverter() AppUI primaryUI});
}

/// @nodoc
class _$SettingsFZCopyWithImpl<$Res> implements $SettingsFZCopyWith<$Res> {
  _$SettingsFZCopyWithImpl(this._self, this._then);

  final SettingsFZ _self;
  final $Res Function(SettingsFZ) _then;

  /// Create a copy of SettingsFZ
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
    Object? authBenfAdd = null,
    Object? authRemittance = null,
    Object? authBenfEdit = null,
    Object? addCustomerAuthType = null,
    Object? allowedMinAge = null,
    Object? editCustomerAuthType = null,
    Object? LOGINAUTHENTICATIONPRIMARY = null,
    Object? LOGINAUTHENTICATIONSECONDARY = null,
    Object? LOGINAUTHENTICATIONTWOFACTOR = null,
    Object? REQUIREDLOGINMETHODS = null,
    Object? COUNTRYDIALINGCODE = null,
    Object? clientLogo = null,
    Object? clientName = null,
    Object? THEMECOLORS = freezed,
    Object? enableAddBenf = null,
    Object? enableEditBenf = null,
    Object? enableEditProfile = null,
    Object? enableDeRegistration = null,
    Object? ocrRequired = null,
    Object? countriesForBeneficiaries = null,
    Object? multiDeviceLoginLength = null,
    Object? enablePromotionDashboard = null,
    Object? enablePromotionPreLogin = null,
    Object? enableBranchLocator = null,
    Object? processEkycAs = null,
    Object? REQUIREDEKYCUPDATEMETHOD = null,
    Object? REQUIREDNEWSATPREDASHBOARD = null,
    Object? REQUIREDNEWSATPRELOGIN = null,
    Object? preLogin = null,
    Object? enableCreateAlert = null,
    Object? enableUTILITY = null,
    Object? enableVat = null,
    Object? enableWhatsAppChat = null,
    Object? enableLoyalty = null,
    Object? checkBeneficiaryAuth = null,
    Object? checkEditBeneficiaryAuth = null,
    Object? checkEditCustomerAuth = null,
    Object? checkCustomerAuth = null,
    Object? checkPaymentAuth = null,
    Object? checkTransactionAuth = null,
    Object? BankTransferMTO = null,
    Object? allowUpdateKYC = null,
    Object? multiDeviceLogin = null,
    Object? amlForTransaction = null,
    Object? preBgFromPromotion = null,
    Object? loyalty = null,
    Object? enableBiometric = null,
    Object? remittanceLimitPopup = null,
    Object? blockZerosInNid = null,
    Object? ForceUpdate = null,
    Object? EnableGallery = null,
    Object? EnableFile = null,
    Object? EnableTrackRemittance = null,
    Object? EnablePaymentSound = null,
    Object? EnableSetForexBooking = null,
    Object? EnableSwipeButton = null,
    Object? EnableTermsForInternalPages = null,
    Object? currencyDecimalLength = freezed,
    Object? forexDecimalLength = null,
    Object? mobileMinLength = null,
    Object? mobileMaxLength = null,
    Object? nidMaxLength = null,
    Object? nidMinLength = null,
    Object? highlitedColor = freezed,
    Object? complementaryColr = freezed,
    Object? accentColor = freezed,
    Object? themeSecondary = freezed,
    Object? themePrimary = freezed,
    Object? primaryDocID = null,
    Object? primaryDocIDName = null,
    Object? currenciesForBeneficiaries = null,
    Object? requiredVPNDetection = null,
    Object? enableScreenMirrorDetection = null,
    Object? isRenewKYCAfterOneYear = null,
    Object? enableEncryption = null,
    Object? mobileSessionTimeout = null,
    Object? requiredAgentStatus = null,
    Object? requiredCurrencySymbol = null,
    Object? receiptHeaderAlignment = null,
    Object? primaryUI = null,
  }) {
    return _then(_self.copyWith(
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      authBenfAdd: null == authBenfAdd
          ? _self.authBenfAdd
          : authBenfAdd // ignore: cast_nullable_to_non_nullable
              as String,
      authRemittance: null == authRemittance
          ? _self.authRemittance
          : authRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      authBenfEdit: null == authBenfEdit
          ? _self.authBenfEdit
          : authBenfEdit // ignore: cast_nullable_to_non_nullable
              as String,
      addCustomerAuthType: null == addCustomerAuthType
          ? _self.addCustomerAuthType
          : addCustomerAuthType // ignore: cast_nullable_to_non_nullable
              as String,
      allowedMinAge: null == allowedMinAge
          ? _self.allowedMinAge
          : allowedMinAge // ignore: cast_nullable_to_non_nullable
              as String,
      editCustomerAuthType: null == editCustomerAuthType
          ? _self.editCustomerAuthType
          : editCustomerAuthType // ignore: cast_nullable_to_non_nullable
              as String,
      LOGINAUTHENTICATIONPRIMARY: null == LOGINAUTHENTICATIONPRIMARY
          ? _self.LOGINAUTHENTICATIONPRIMARY
          : LOGINAUTHENTICATIONPRIMARY // ignore: cast_nullable_to_non_nullable
              as String,
      LOGINAUTHENTICATIONSECONDARY: null == LOGINAUTHENTICATIONSECONDARY
          ? _self.LOGINAUTHENTICATIONSECONDARY
          : LOGINAUTHENTICATIONSECONDARY // ignore: cast_nullable_to_non_nullable
              as String,
      LOGINAUTHENTICATIONTWOFACTOR: null == LOGINAUTHENTICATIONTWOFACTOR
          ? _self.LOGINAUTHENTICATIONTWOFACTOR
          : LOGINAUTHENTICATIONTWOFACTOR // ignore: cast_nullable_to_non_nullable
              as String,
      REQUIREDLOGINMETHODS: null == REQUIREDLOGINMETHODS
          ? _self.REQUIREDLOGINMETHODS
          : REQUIREDLOGINMETHODS // ignore: cast_nullable_to_non_nullable
              as String,
      COUNTRYDIALINGCODE: null == COUNTRYDIALINGCODE
          ? _self.COUNTRYDIALINGCODE
          : COUNTRYDIALINGCODE // ignore: cast_nullable_to_non_nullable
              as String,
      clientLogo: null == clientLogo
          ? _self.clientLogo
          : clientLogo // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      THEMECOLORS: freezed == THEMECOLORS
          ? _self.THEMECOLORS
          : THEMECOLORS // ignore: cast_nullable_to_non_nullable
              as String?,
      enableAddBenf: null == enableAddBenf
          ? _self.enableAddBenf
          : enableAddBenf // ignore: cast_nullable_to_non_nullable
              as bool,
      enableEditBenf: null == enableEditBenf
          ? _self.enableEditBenf
          : enableEditBenf // ignore: cast_nullable_to_non_nullable
              as bool,
      enableEditProfile: null == enableEditProfile
          ? _self.enableEditProfile
          : enableEditProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDeRegistration: null == enableDeRegistration
          ? _self.enableDeRegistration
          : enableDeRegistration // ignore: cast_nullable_to_non_nullable
              as bool,
      ocrRequired: null == ocrRequired
          ? _self.ocrRequired
          : ocrRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      countriesForBeneficiaries: null == countriesForBeneficiaries
          ? _self.countriesForBeneficiaries
          : countriesForBeneficiaries // ignore: cast_nullable_to_non_nullable
              as String,
      multiDeviceLoginLength: null == multiDeviceLoginLength
          ? _self.multiDeviceLoginLength
          : multiDeviceLoginLength // ignore: cast_nullable_to_non_nullable
              as String,
      enablePromotionDashboard: null == enablePromotionDashboard
          ? _self.enablePromotionDashboard
          : enablePromotionDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePromotionPreLogin: null == enablePromotionPreLogin
          ? _self.enablePromotionPreLogin
          : enablePromotionPreLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBranchLocator: null == enableBranchLocator
          ? _self.enableBranchLocator
          : enableBranchLocator // ignore: cast_nullable_to_non_nullable
              as bool,
      processEkycAs: null == processEkycAs
          ? _self.processEkycAs
          : processEkycAs // ignore: cast_nullable_to_non_nullable
              as String,
      REQUIREDEKYCUPDATEMETHOD: null == REQUIREDEKYCUPDATEMETHOD
          ? _self.REQUIREDEKYCUPDATEMETHOD
          : REQUIREDEKYCUPDATEMETHOD // ignore: cast_nullable_to_non_nullable
              as String,
      REQUIREDNEWSATPREDASHBOARD: null == REQUIREDNEWSATPREDASHBOARD
          ? _self.REQUIREDNEWSATPREDASHBOARD
          : REQUIREDNEWSATPREDASHBOARD // ignore: cast_nullable_to_non_nullable
              as bool,
      REQUIREDNEWSATPRELOGIN: null == REQUIREDNEWSATPRELOGIN
          ? _self.REQUIREDNEWSATPRELOGIN
          : REQUIREDNEWSATPRELOGIN // ignore: cast_nullable_to_non_nullable
              as bool,
      preLogin: null == preLogin
          ? _self.preLogin
          : preLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCreateAlert: null == enableCreateAlert
          ? _self.enableCreateAlert
          : enableCreateAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      enableUTILITY: null == enableUTILITY
          ? _self.enableUTILITY
          : enableUTILITY // ignore: cast_nullable_to_non_nullable
              as String,
      enableVat: null == enableVat
          ? _self.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      enableWhatsAppChat: null == enableWhatsAppChat
          ? _self.enableWhatsAppChat
          : enableWhatsAppChat // ignore: cast_nullable_to_non_nullable
              as bool,
      enableLoyalty: null == enableLoyalty
          ? _self.enableLoyalty
          : enableLoyalty // ignore: cast_nullable_to_non_nullable
              as bool,
      checkBeneficiaryAuth: null == checkBeneficiaryAuth
          ? _self.checkBeneficiaryAuth
          : checkBeneficiaryAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkEditBeneficiaryAuth: null == checkEditBeneficiaryAuth
          ? _self.checkEditBeneficiaryAuth
          : checkEditBeneficiaryAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkEditCustomerAuth: null == checkEditCustomerAuth
          ? _self.checkEditCustomerAuth
          : checkEditCustomerAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkCustomerAuth: null == checkCustomerAuth
          ? _self.checkCustomerAuth
          : checkCustomerAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkPaymentAuth: null == checkPaymentAuth
          ? _self.checkPaymentAuth
          : checkPaymentAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTransactionAuth: null == checkTransactionAuth
          ? _self.checkTransactionAuth
          : checkTransactionAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      BankTransferMTO: null == BankTransferMTO
          ? _self.BankTransferMTO
          : BankTransferMTO // ignore: cast_nullable_to_non_nullable
              as bool,
      allowUpdateKYC: null == allowUpdateKYC
          ? _self.allowUpdateKYC
          : allowUpdateKYC // ignore: cast_nullable_to_non_nullable
              as bool,
      multiDeviceLogin: null == multiDeviceLogin
          ? _self.multiDeviceLogin
          : multiDeviceLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      amlForTransaction: null == amlForTransaction
          ? _self.amlForTransaction
          : amlForTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
      preBgFromPromotion: null == preBgFromPromotion
          ? _self.preBgFromPromotion
          : preBgFromPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      loyalty: null == loyalty
          ? _self.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBiometric: null == enableBiometric
          ? _self.enableBiometric
          : enableBiometric // ignore: cast_nullable_to_non_nullable
              as bool,
      remittanceLimitPopup: null == remittanceLimitPopup
          ? _self.remittanceLimitPopup
          : remittanceLimitPopup // ignore: cast_nullable_to_non_nullable
              as bool,
      blockZerosInNid: null == blockZerosInNid
          ? _self.blockZerosInNid
          : blockZerosInNid // ignore: cast_nullable_to_non_nullable
              as bool,
      ForceUpdate: null == ForceUpdate
          ? _self.ForceUpdate
          : ForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableGallery: null == EnableGallery
          ? _self.EnableGallery
          : EnableGallery // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableFile: null == EnableFile
          ? _self.EnableFile
          : EnableFile // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableTrackRemittance: null == EnableTrackRemittance
          ? _self.EnableTrackRemittance
          : EnableTrackRemittance // ignore: cast_nullable_to_non_nullable
              as bool,
      EnablePaymentSound: null == EnablePaymentSound
          ? _self.EnablePaymentSound
          : EnablePaymentSound // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableSetForexBooking: null == EnableSetForexBooking
          ? _self.EnableSetForexBooking
          : EnableSetForexBooking // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableSwipeButton: null == EnableSwipeButton
          ? _self.EnableSwipeButton
          : EnableSwipeButton // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableTermsForInternalPages: null == EnableTermsForInternalPages
          ? _self.EnableTermsForInternalPages
          : EnableTermsForInternalPages // ignore: cast_nullable_to_non_nullable
              as bool,
      currencyDecimalLength: freezed == currencyDecimalLength
          ? _self.currencyDecimalLength
          : currencyDecimalLength // ignore: cast_nullable_to_non_nullable
              as int?,
      forexDecimalLength: null == forexDecimalLength
          ? _self.forexDecimalLength
          : forexDecimalLength // ignore: cast_nullable_to_non_nullable
              as String,
      mobileMinLength: null == mobileMinLength
          ? _self.mobileMinLength
          : mobileMinLength // ignore: cast_nullable_to_non_nullable
              as int,
      mobileMaxLength: null == mobileMaxLength
          ? _self.mobileMaxLength
          : mobileMaxLength // ignore: cast_nullable_to_non_nullable
              as int,
      nidMaxLength: null == nidMaxLength
          ? _self.nidMaxLength
          : nidMaxLength // ignore: cast_nullable_to_non_nullable
              as int,
      nidMinLength: null == nidMinLength
          ? _self.nidMinLength
          : nidMinLength // ignore: cast_nullable_to_non_nullable
              as int,
      highlitedColor: freezed == highlitedColor
          ? _self.highlitedColor
          : highlitedColor // ignore: cast_nullable_to_non_nullable
              as String?,
      complementaryColr: freezed == complementaryColr
          ? _self.complementaryColr
          : complementaryColr // ignore: cast_nullable_to_non_nullable
              as String?,
      accentColor: freezed == accentColor
          ? _self.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String?,
      themeSecondary: freezed == themeSecondary
          ? _self.themeSecondary
          : themeSecondary // ignore: cast_nullable_to_non_nullable
              as String?,
      themePrimary: freezed == themePrimary
          ? _self.themePrimary
          : themePrimary // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryDocID: null == primaryDocID
          ? _self.primaryDocID
          : primaryDocID // ignore: cast_nullable_to_non_nullable
              as String,
      primaryDocIDName: null == primaryDocIDName
          ? _self.primaryDocIDName
          : primaryDocIDName // ignore: cast_nullable_to_non_nullable
              as String,
      currenciesForBeneficiaries: null == currenciesForBeneficiaries
          ? _self.currenciesForBeneficiaries
          : currenciesForBeneficiaries // ignore: cast_nullable_to_non_nullable
              as String,
      requiredVPNDetection: null == requiredVPNDetection
          ? _self.requiredVPNDetection
          : requiredVPNDetection // ignore: cast_nullable_to_non_nullable
              as bool,
      enableScreenMirrorDetection: null == enableScreenMirrorDetection
          ? _self.enableScreenMirrorDetection
          : enableScreenMirrorDetection // ignore: cast_nullable_to_non_nullable
              as bool,
      isRenewKYCAfterOneYear: null == isRenewKYCAfterOneYear
          ? _self.isRenewKYCAfterOneYear
          : isRenewKYCAfterOneYear // ignore: cast_nullable_to_non_nullable
              as bool,
      enableEncryption: null == enableEncryption
          ? _self.enableEncryption
          : enableEncryption // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileSessionTimeout: null == mobileSessionTimeout
          ? _self.mobileSessionTimeout
          : mobileSessionTimeout // ignore: cast_nullable_to_non_nullable
              as String,
      requiredAgentStatus: null == requiredAgentStatus
          ? _self.requiredAgentStatus
          : requiredAgentStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      requiredCurrencySymbol: null == requiredCurrencySymbol
          ? _self.requiredCurrencySymbol
          : requiredCurrencySymbol // ignore: cast_nullable_to_non_nullable
              as bool,
      receiptHeaderAlignment: null == receiptHeaderAlignment
          ? _self.receiptHeaderAlignment
          : receiptHeaderAlignment // ignore: cast_nullable_to_non_nullable
              as String,
      primaryUI: null == primaryUI
          ? _self.primaryUI
          : primaryUI // ignore: cast_nullable_to_non_nullable
              as AppUI,
    ));
  }
}

/// Adds pattern-matching-related methods to [SettingsFZ].
extension SettingsFZPatterns on SettingsFZ {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SettingsFZ value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsFZ() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SettingsFZ value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsFZ():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SettingsFZ value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsFZ() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'APP_VERSION') String appVersion,
            @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION') String authBenfAdd,
            @JsonKey(name: 'TRASNACTION_AUTHENTICATION') String authRemittance,
            @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION')
            String authBenfEdit,
            @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
            String addCustomerAuthType,
            @JsonKey(name: 'ALLOWED_MINIMUM_AGE') String allowedMinAge,
            @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
            String editCustomerAuthType,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
            String LOGINAUTHENTICATIONPRIMARY,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
            String LOGINAUTHENTICATIONSECONDARY,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
            String LOGINAUTHENTICATIONTWOFACTOR,
            @JsonKey(name: 'REQUIRED_LOGIN_METHODS')
            String REQUIREDLOGINMETHODS,
            @JsonKey(name: 'COUNTRY_DIALING_CODE') String COUNTRYDIALINGCODE,
            @JsonKey(name: 'CLIENT_LOGO') String clientLogo,
            @JsonKey(name: 'CLIENT_NAME') String clientName,
            @JsonKey(name: 'THEME_COLORS') String? THEMECOLORS,
            @JsonKey(name: 'ALLOW_ADD_BENEFECIARY') bool enableAddBenf,
            @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY') bool enableEditBenf,
            @JsonKey(name: 'ALLOW_EDIT_CUSTOMER') bool enableEditProfile,
            @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
            bool enableDeRegistration,
            @JsonKey(name: 'ALLOW_OCR_PARSING') bool ocrRequired,
            @JsonKey(name: 'ALLOWED_COUNTRY') String countriesForBeneficiaries,
            @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
            String multiDeviceLoginLength,
            @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
            bool enablePromotionDashboard,
            @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
            bool enablePromotionPreLogin,
            @JsonKey(name: 'REQUIRED_BRANCHLOCATOR') bool enableBranchLocator,
            @JsonKey(name: 'REQUIRED_EKYC_METHOD') String processEkycAs,
            @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
            String REQUIREDEKYCUPDATEMETHOD,
            @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
            bool REQUIREDNEWSATPREDASHBOARD,
            @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN')
            bool REQUIREDNEWSATPRELOGIN,
            @JsonKey(name: 'REQUIRED_PRELOGIN') bool preLogin,
            @JsonKey(name: 'REQUIRED_CREATEALERT') bool enableCreateAlert,
            @JsonKey(name: 'REQUIRED_UTILITY') String enableUTILITY,
            @JsonKey(name: 'REQUIRED_VAT') bool enableVat,
            @JsonKey(name: 'REQUIRED_WHATSAPPCHAT') bool enableWhatsAppChat,
            @JsonKey(name: 'REQUIRED_LOYALTYTEST') bool enableLoyalty,
            @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
            bool checkBeneficiaryAuth,
            @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
            bool checkEditBeneficiaryAuth,
            @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
            bool checkEditCustomerAuth,
            @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
            bool checkCustomerAuth,
            @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION')
            bool checkPaymentAuth,
            @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
            bool checkTransactionAuth,
            @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO') bool BankTransferMTO,
            @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR')
            bool allowUpdateKYC,
            @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN') bool multiDeviceLogin,
            @JsonKey(name: 'ALLOW_AML_TRANSACTION') bool amlForTransaction,
            @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION')
            bool preBgFromPromotion,
            @JsonKey(name: 'ALLOW_LOYALTY') bool loyalty,
            @JsonKey(name: 'ALLOW_BIOMETRIC') bool enableBiometric,
            @JsonKey(name: 'Required_remittance_limit_popup')
            bool remittanceLimitPopup,
            @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID') bool blockZerosInNid,
            @JsonKey(name: 'ALLOW_FORCE_UPDATE') bool ForceUpdate,
            @JsonKey(name: 'ALLOW_GALLERY') bool EnableGallery,
            @JsonKey(name: 'ALLOW_FILE') bool EnableFile,
            @JsonKey(name: 'ALLOW_TRACK_REMITTANCE') bool EnableTrackRemittance,
            @JsonKey(name: 'ALLOW_PAYMENT_SOUND') bool EnablePaymentSound,
            @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING')
            bool EnableSetForexBooking,
            @JsonKey(name: 'ALLOW_SWIPE_BUTTON') bool EnableSwipeButton,
            @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
            bool EnableTermsForInternalPages,
            @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH')
            int? currencyDecimalLength,
            @JsonKey(name: 'FOREX_DECIMAL') String forexDecimalLength,
            @JsonKey(name: 'MOBILE_MIN_LENGTH') int mobileMinLength,
            @JsonKey(name: 'MOBILE_MAX_LENGTH') int mobileMaxLength,
            @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH') int nidMaxLength,
            @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH') int nidMinLength,
            @JsonKey(name: 'HIGHLIGHT_THEME_COLOR') String? highlitedColor,
            @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR')
            String? complementaryColr,
            @JsonKey(name: 'ACCENT_THEME_COLOR') String? accentColor,
            @JsonKey(name: 'SECONDARY_THEME_COLOR') String? themeSecondary,
            @JsonKey(name: 'PRIMARY_THEME_COLOR') String? themePrimary,
            @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE') String primaryDocID,
            @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME') String primaryDocIDName,
            @JsonKey(name: 'ALLOWED_CURRENCY')
            String currenciesForBeneficiaries,
            @JsonKey(name: "REQUIRED_VPN_DETECTION") bool requiredVPNDetection,
            @JsonKey(name: "EnableScreenMirrorDetection")
            bool enableScreenMirrorDetection,
            @JsonKey(name: "IsRenewKYCAfterOneYear")
            bool isRenewKYCAfterOneYear,
            @JsonKey(name: "EnableEncryption") bool enableEncryption,
            @JsonKey(name: 'SESSION_TIMEOUT') String mobileSessionTimeout,
            @JsonKey(name: "REQUIRED_AGENT_STATUS") bool requiredAgentStatus,
            @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL")
            bool requiredCurrencySymbol,
            @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT")
            String receiptHeaderAlignment,
            @JsonKey(name: "UI_TEMPLATE") @AppUIConverter() AppUI primaryUI)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsFZ() when $default != null:
        return $default(
            _that.appVersion,
            _that.authBenfAdd,
            _that.authRemittance,
            _that.authBenfEdit,
            _that.addCustomerAuthType,
            _that.allowedMinAge,
            _that.editCustomerAuthType,
            _that.LOGINAUTHENTICATIONPRIMARY,
            _that.LOGINAUTHENTICATIONSECONDARY,
            _that.LOGINAUTHENTICATIONTWOFACTOR,
            _that.REQUIREDLOGINMETHODS,
            _that.COUNTRYDIALINGCODE,
            _that.clientLogo,
            _that.clientName,
            _that.THEMECOLORS,
            _that.enableAddBenf,
            _that.enableEditBenf,
            _that.enableEditProfile,
            _that.enableDeRegistration,
            _that.ocrRequired,
            _that.countriesForBeneficiaries,
            _that.multiDeviceLoginLength,
            _that.enablePromotionDashboard,
            _that.enablePromotionPreLogin,
            _that.enableBranchLocator,
            _that.processEkycAs,
            _that.REQUIREDEKYCUPDATEMETHOD,
            _that.REQUIREDNEWSATPREDASHBOARD,
            _that.REQUIREDNEWSATPRELOGIN,
            _that.preLogin,
            _that.enableCreateAlert,
            _that.enableUTILITY,
            _that.enableVat,
            _that.enableWhatsAppChat,
            _that.enableLoyalty,
            _that.checkBeneficiaryAuth,
            _that.checkEditBeneficiaryAuth,
            _that.checkEditCustomerAuth,
            _that.checkCustomerAuth,
            _that.checkPaymentAuth,
            _that.checkTransactionAuth,
            _that.BankTransferMTO,
            _that.allowUpdateKYC,
            _that.multiDeviceLogin,
            _that.amlForTransaction,
            _that.preBgFromPromotion,
            _that.loyalty,
            _that.enableBiometric,
            _that.remittanceLimitPopup,
            _that.blockZerosInNid,
            _that.ForceUpdate,
            _that.EnableGallery,
            _that.EnableFile,
            _that.EnableTrackRemittance,
            _that.EnablePaymentSound,
            _that.EnableSetForexBooking,
            _that.EnableSwipeButton,
            _that.EnableTermsForInternalPages,
            _that.currencyDecimalLength,
            _that.forexDecimalLength,
            _that.mobileMinLength,
            _that.mobileMaxLength,
            _that.nidMaxLength,
            _that.nidMinLength,
            _that.highlitedColor,
            _that.complementaryColr,
            _that.accentColor,
            _that.themeSecondary,
            _that.themePrimary,
            _that.primaryDocID,
            _that.primaryDocIDName,
            _that.currenciesForBeneficiaries,
            _that.requiredVPNDetection,
            _that.enableScreenMirrorDetection,
            _that.isRenewKYCAfterOneYear,
            _that.enableEncryption,
            _that.mobileSessionTimeout,
            _that.requiredAgentStatus,
            _that.requiredCurrencySymbol,
            _that.receiptHeaderAlignment,
            _that.primaryUI);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'APP_VERSION') String appVersion,
            @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION') String authBenfAdd,
            @JsonKey(name: 'TRASNACTION_AUTHENTICATION') String authRemittance,
            @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION')
            String authBenfEdit,
            @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
            String addCustomerAuthType,
            @JsonKey(name: 'ALLOWED_MINIMUM_AGE') String allowedMinAge,
            @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
            String editCustomerAuthType,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
            String LOGINAUTHENTICATIONPRIMARY,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
            String LOGINAUTHENTICATIONSECONDARY,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
            String LOGINAUTHENTICATIONTWOFACTOR,
            @JsonKey(name: 'REQUIRED_LOGIN_METHODS')
            String REQUIREDLOGINMETHODS,
            @JsonKey(name: 'COUNTRY_DIALING_CODE') String COUNTRYDIALINGCODE,
            @JsonKey(name: 'CLIENT_LOGO') String clientLogo,
            @JsonKey(name: 'CLIENT_NAME') String clientName,
            @JsonKey(name: 'THEME_COLORS') String? THEMECOLORS,
            @JsonKey(name: 'ALLOW_ADD_BENEFECIARY') bool enableAddBenf,
            @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY') bool enableEditBenf,
            @JsonKey(name: 'ALLOW_EDIT_CUSTOMER') bool enableEditProfile,
            @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
            bool enableDeRegistration,
            @JsonKey(name: 'ALLOW_OCR_PARSING') bool ocrRequired,
            @JsonKey(name: 'ALLOWED_COUNTRY') String countriesForBeneficiaries,
            @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
            String multiDeviceLoginLength,
            @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
            bool enablePromotionDashboard,
            @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
            bool enablePromotionPreLogin,
            @JsonKey(name: 'REQUIRED_BRANCHLOCATOR') bool enableBranchLocator,
            @JsonKey(name: 'REQUIRED_EKYC_METHOD') String processEkycAs,
            @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
            String REQUIREDEKYCUPDATEMETHOD,
            @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
            bool REQUIREDNEWSATPREDASHBOARD,
            @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN')
            bool REQUIREDNEWSATPRELOGIN,
            @JsonKey(name: 'REQUIRED_PRELOGIN') bool preLogin,
            @JsonKey(name: 'REQUIRED_CREATEALERT') bool enableCreateAlert,
            @JsonKey(name: 'REQUIRED_UTILITY') String enableUTILITY,
            @JsonKey(name: 'REQUIRED_VAT') bool enableVat,
            @JsonKey(name: 'REQUIRED_WHATSAPPCHAT') bool enableWhatsAppChat,
            @JsonKey(name: 'REQUIRED_LOYALTYTEST') bool enableLoyalty,
            @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
            bool checkBeneficiaryAuth,
            @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
            bool checkEditBeneficiaryAuth,
            @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
            bool checkEditCustomerAuth,
            @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
            bool checkCustomerAuth,
            @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION')
            bool checkPaymentAuth,
            @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
            bool checkTransactionAuth,
            @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO') bool BankTransferMTO,
            @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR')
            bool allowUpdateKYC,
            @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN') bool multiDeviceLogin,
            @JsonKey(name: 'ALLOW_AML_TRANSACTION') bool amlForTransaction,
            @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION')
            bool preBgFromPromotion,
            @JsonKey(name: 'ALLOW_LOYALTY') bool loyalty,
            @JsonKey(name: 'ALLOW_BIOMETRIC') bool enableBiometric,
            @JsonKey(name: 'Required_remittance_limit_popup')
            bool remittanceLimitPopup,
            @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID') bool blockZerosInNid,
            @JsonKey(name: 'ALLOW_FORCE_UPDATE') bool ForceUpdate,
            @JsonKey(name: 'ALLOW_GALLERY') bool EnableGallery,
            @JsonKey(name: 'ALLOW_FILE') bool EnableFile,
            @JsonKey(name: 'ALLOW_TRACK_REMITTANCE') bool EnableTrackRemittance,
            @JsonKey(name: 'ALLOW_PAYMENT_SOUND') bool EnablePaymentSound,
            @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING')
            bool EnableSetForexBooking,
            @JsonKey(name: 'ALLOW_SWIPE_BUTTON') bool EnableSwipeButton,
            @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
            bool EnableTermsForInternalPages,
            @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH')
            int? currencyDecimalLength,
            @JsonKey(name: 'FOREX_DECIMAL') String forexDecimalLength,
            @JsonKey(name: 'MOBILE_MIN_LENGTH') int mobileMinLength,
            @JsonKey(name: 'MOBILE_MAX_LENGTH') int mobileMaxLength,
            @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH') int nidMaxLength,
            @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH') int nidMinLength,
            @JsonKey(name: 'HIGHLIGHT_THEME_COLOR') String? highlitedColor,
            @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR')
            String? complementaryColr,
            @JsonKey(name: 'ACCENT_THEME_COLOR') String? accentColor,
            @JsonKey(name: 'SECONDARY_THEME_COLOR') String? themeSecondary,
            @JsonKey(name: 'PRIMARY_THEME_COLOR') String? themePrimary,
            @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE') String primaryDocID,
            @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME') String primaryDocIDName,
            @JsonKey(name: 'ALLOWED_CURRENCY')
            String currenciesForBeneficiaries,
            @JsonKey(name: "REQUIRED_VPN_DETECTION") bool requiredVPNDetection,
            @JsonKey(name: "EnableScreenMirrorDetection")
            bool enableScreenMirrorDetection,
            @JsonKey(name: "IsRenewKYCAfterOneYear")
            bool isRenewKYCAfterOneYear,
            @JsonKey(name: "EnableEncryption") bool enableEncryption,
            @JsonKey(name: 'SESSION_TIMEOUT') String mobileSessionTimeout,
            @JsonKey(name: "REQUIRED_AGENT_STATUS") bool requiredAgentStatus,
            @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL")
            bool requiredCurrencySymbol,
            @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT")
            String receiptHeaderAlignment,
            @JsonKey(name: "UI_TEMPLATE") @AppUIConverter() AppUI primaryUI)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsFZ():
        return $default(
            _that.appVersion,
            _that.authBenfAdd,
            _that.authRemittance,
            _that.authBenfEdit,
            _that.addCustomerAuthType,
            _that.allowedMinAge,
            _that.editCustomerAuthType,
            _that.LOGINAUTHENTICATIONPRIMARY,
            _that.LOGINAUTHENTICATIONSECONDARY,
            _that.LOGINAUTHENTICATIONTWOFACTOR,
            _that.REQUIREDLOGINMETHODS,
            _that.COUNTRYDIALINGCODE,
            _that.clientLogo,
            _that.clientName,
            _that.THEMECOLORS,
            _that.enableAddBenf,
            _that.enableEditBenf,
            _that.enableEditProfile,
            _that.enableDeRegistration,
            _that.ocrRequired,
            _that.countriesForBeneficiaries,
            _that.multiDeviceLoginLength,
            _that.enablePromotionDashboard,
            _that.enablePromotionPreLogin,
            _that.enableBranchLocator,
            _that.processEkycAs,
            _that.REQUIREDEKYCUPDATEMETHOD,
            _that.REQUIREDNEWSATPREDASHBOARD,
            _that.REQUIREDNEWSATPRELOGIN,
            _that.preLogin,
            _that.enableCreateAlert,
            _that.enableUTILITY,
            _that.enableVat,
            _that.enableWhatsAppChat,
            _that.enableLoyalty,
            _that.checkBeneficiaryAuth,
            _that.checkEditBeneficiaryAuth,
            _that.checkEditCustomerAuth,
            _that.checkCustomerAuth,
            _that.checkPaymentAuth,
            _that.checkTransactionAuth,
            _that.BankTransferMTO,
            _that.allowUpdateKYC,
            _that.multiDeviceLogin,
            _that.amlForTransaction,
            _that.preBgFromPromotion,
            _that.loyalty,
            _that.enableBiometric,
            _that.remittanceLimitPopup,
            _that.blockZerosInNid,
            _that.ForceUpdate,
            _that.EnableGallery,
            _that.EnableFile,
            _that.EnableTrackRemittance,
            _that.EnablePaymentSound,
            _that.EnableSetForexBooking,
            _that.EnableSwipeButton,
            _that.EnableTermsForInternalPages,
            _that.currencyDecimalLength,
            _that.forexDecimalLength,
            _that.mobileMinLength,
            _that.mobileMaxLength,
            _that.nidMaxLength,
            _that.nidMinLength,
            _that.highlitedColor,
            _that.complementaryColr,
            _that.accentColor,
            _that.themeSecondary,
            _that.themePrimary,
            _that.primaryDocID,
            _that.primaryDocIDName,
            _that.currenciesForBeneficiaries,
            _that.requiredVPNDetection,
            _that.enableScreenMirrorDetection,
            _that.isRenewKYCAfterOneYear,
            _that.enableEncryption,
            _that.mobileSessionTimeout,
            _that.requiredAgentStatus,
            _that.requiredCurrencySymbol,
            _that.receiptHeaderAlignment,
            _that.primaryUI);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'APP_VERSION') String appVersion,
            @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION') String authBenfAdd,
            @JsonKey(name: 'TRASNACTION_AUTHENTICATION') String authRemittance,
            @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION')
            String authBenfEdit,
            @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
            String addCustomerAuthType,
            @JsonKey(name: 'ALLOWED_MINIMUM_AGE') String allowedMinAge,
            @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
            String editCustomerAuthType,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
            String LOGINAUTHENTICATIONPRIMARY,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
            String LOGINAUTHENTICATIONSECONDARY,
            @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
            String LOGINAUTHENTICATIONTWOFACTOR,
            @JsonKey(name: 'REQUIRED_LOGIN_METHODS')
            String REQUIREDLOGINMETHODS,
            @JsonKey(name: 'COUNTRY_DIALING_CODE') String COUNTRYDIALINGCODE,
            @JsonKey(name: 'CLIENT_LOGO') String clientLogo,
            @JsonKey(name: 'CLIENT_NAME') String clientName,
            @JsonKey(name: 'THEME_COLORS') String? THEMECOLORS,
            @JsonKey(name: 'ALLOW_ADD_BENEFECIARY') bool enableAddBenf,
            @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY') bool enableEditBenf,
            @JsonKey(name: 'ALLOW_EDIT_CUSTOMER') bool enableEditProfile,
            @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
            bool enableDeRegistration,
            @JsonKey(name: 'ALLOW_OCR_PARSING') bool ocrRequired,
            @JsonKey(name: 'ALLOWED_COUNTRY') String countriesForBeneficiaries,
            @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
            String multiDeviceLoginLength,
            @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
            bool enablePromotionDashboard,
            @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
            bool enablePromotionPreLogin,
            @JsonKey(name: 'REQUIRED_BRANCHLOCATOR') bool enableBranchLocator,
            @JsonKey(name: 'REQUIRED_EKYC_METHOD') String processEkycAs,
            @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
            String REQUIREDEKYCUPDATEMETHOD,
            @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
            bool REQUIREDNEWSATPREDASHBOARD,
            @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN')
            bool REQUIREDNEWSATPRELOGIN,
            @JsonKey(name: 'REQUIRED_PRELOGIN') bool preLogin,
            @JsonKey(name: 'REQUIRED_CREATEALERT') bool enableCreateAlert,
            @JsonKey(name: 'REQUIRED_UTILITY') String enableUTILITY,
            @JsonKey(name: 'REQUIRED_VAT') bool enableVat,
            @JsonKey(name: 'REQUIRED_WHATSAPPCHAT') bool enableWhatsAppChat,
            @JsonKey(name: 'REQUIRED_LOYALTYTEST') bool enableLoyalty,
            @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
            bool checkBeneficiaryAuth,
            @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
            bool checkEditBeneficiaryAuth,
            @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
            bool checkEditCustomerAuth,
            @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
            bool checkCustomerAuth,
            @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION')
            bool checkPaymentAuth,
            @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
            bool checkTransactionAuth,
            @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO') bool BankTransferMTO,
            @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR')
            bool allowUpdateKYC,
            @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN') bool multiDeviceLogin,
            @JsonKey(name: 'ALLOW_AML_TRANSACTION') bool amlForTransaction,
            @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION')
            bool preBgFromPromotion,
            @JsonKey(name: 'ALLOW_LOYALTY') bool loyalty,
            @JsonKey(name: 'ALLOW_BIOMETRIC') bool enableBiometric,
            @JsonKey(name: 'Required_remittance_limit_popup')
            bool remittanceLimitPopup,
            @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID') bool blockZerosInNid,
            @JsonKey(name: 'ALLOW_FORCE_UPDATE') bool ForceUpdate,
            @JsonKey(name: 'ALLOW_GALLERY') bool EnableGallery,
            @JsonKey(name: 'ALLOW_FILE') bool EnableFile,
            @JsonKey(name: 'ALLOW_TRACK_REMITTANCE') bool EnableTrackRemittance,
            @JsonKey(name: 'ALLOW_PAYMENT_SOUND') bool EnablePaymentSound,
            @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING')
            bool EnableSetForexBooking,
            @JsonKey(name: 'ALLOW_SWIPE_BUTTON') bool EnableSwipeButton,
            @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
            bool EnableTermsForInternalPages,
            @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH')
            int? currencyDecimalLength,
            @JsonKey(name: 'FOREX_DECIMAL') String forexDecimalLength,
            @JsonKey(name: 'MOBILE_MIN_LENGTH') int mobileMinLength,
            @JsonKey(name: 'MOBILE_MAX_LENGTH') int mobileMaxLength,
            @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH') int nidMaxLength,
            @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH') int nidMinLength,
            @JsonKey(name: 'HIGHLIGHT_THEME_COLOR') String? highlitedColor,
            @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR')
            String? complementaryColr,
            @JsonKey(name: 'ACCENT_THEME_COLOR') String? accentColor,
            @JsonKey(name: 'SECONDARY_THEME_COLOR') String? themeSecondary,
            @JsonKey(name: 'PRIMARY_THEME_COLOR') String? themePrimary,
            @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE') String primaryDocID,
            @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME') String primaryDocIDName,
            @JsonKey(name: 'ALLOWED_CURRENCY')
            String currenciesForBeneficiaries,
            @JsonKey(name: "REQUIRED_VPN_DETECTION") bool requiredVPNDetection,
            @JsonKey(name: "EnableScreenMirrorDetection")
            bool enableScreenMirrorDetection,
            @JsonKey(name: "IsRenewKYCAfterOneYear")
            bool isRenewKYCAfterOneYear,
            @JsonKey(name: "EnableEncryption") bool enableEncryption,
            @JsonKey(name: 'SESSION_TIMEOUT') String mobileSessionTimeout,
            @JsonKey(name: "REQUIRED_AGENT_STATUS") bool requiredAgentStatus,
            @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL")
            bool requiredCurrencySymbol,
            @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT")
            String receiptHeaderAlignment,
            @JsonKey(name: "UI_TEMPLATE") @AppUIConverter() AppUI primaryUI)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsFZ() when $default != null:
        return $default(
            _that.appVersion,
            _that.authBenfAdd,
            _that.authRemittance,
            _that.authBenfEdit,
            _that.addCustomerAuthType,
            _that.allowedMinAge,
            _that.editCustomerAuthType,
            _that.LOGINAUTHENTICATIONPRIMARY,
            _that.LOGINAUTHENTICATIONSECONDARY,
            _that.LOGINAUTHENTICATIONTWOFACTOR,
            _that.REQUIREDLOGINMETHODS,
            _that.COUNTRYDIALINGCODE,
            _that.clientLogo,
            _that.clientName,
            _that.THEMECOLORS,
            _that.enableAddBenf,
            _that.enableEditBenf,
            _that.enableEditProfile,
            _that.enableDeRegistration,
            _that.ocrRequired,
            _that.countriesForBeneficiaries,
            _that.multiDeviceLoginLength,
            _that.enablePromotionDashboard,
            _that.enablePromotionPreLogin,
            _that.enableBranchLocator,
            _that.processEkycAs,
            _that.REQUIREDEKYCUPDATEMETHOD,
            _that.REQUIREDNEWSATPREDASHBOARD,
            _that.REQUIREDNEWSATPRELOGIN,
            _that.preLogin,
            _that.enableCreateAlert,
            _that.enableUTILITY,
            _that.enableVat,
            _that.enableWhatsAppChat,
            _that.enableLoyalty,
            _that.checkBeneficiaryAuth,
            _that.checkEditBeneficiaryAuth,
            _that.checkEditCustomerAuth,
            _that.checkCustomerAuth,
            _that.checkPaymentAuth,
            _that.checkTransactionAuth,
            _that.BankTransferMTO,
            _that.allowUpdateKYC,
            _that.multiDeviceLogin,
            _that.amlForTransaction,
            _that.preBgFromPromotion,
            _that.loyalty,
            _that.enableBiometric,
            _that.remittanceLimitPopup,
            _that.blockZerosInNid,
            _that.ForceUpdate,
            _that.EnableGallery,
            _that.EnableFile,
            _that.EnableTrackRemittance,
            _that.EnablePaymentSound,
            _that.EnableSetForexBooking,
            _that.EnableSwipeButton,
            _that.EnableTermsForInternalPages,
            _that.currencyDecimalLength,
            _that.forexDecimalLength,
            _that.mobileMinLength,
            _that.mobileMaxLength,
            _that.nidMaxLength,
            _that.nidMinLength,
            _that.highlitedColor,
            _that.complementaryColr,
            _that.accentColor,
            _that.themeSecondary,
            _that.themePrimary,
            _that.primaryDocID,
            _that.primaryDocIDName,
            _that.currenciesForBeneficiaries,
            _that.requiredVPNDetection,
            _that.enableScreenMirrorDetection,
            _that.isRenewKYCAfterOneYear,
            _that.enableEncryption,
            _that.mobileSessionTimeout,
            _that.requiredAgentStatus,
            _that.requiredCurrencySymbol,
            _that.receiptHeaderAlignment,
            _that.primaryUI);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SettingsFZ implements SettingsFZ {
  const _SettingsFZ(
      {@JsonKey(name: 'APP_VERSION') this.appVersion = '',
      @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION') this.authBenfAdd = '',
      @JsonKey(name: 'TRASNACTION_AUTHENTICATION') this.authRemittance = '',
      @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION') this.authBenfEdit = '',
      @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
      this.addCustomerAuthType = '',
      @JsonKey(name: 'ALLOWED_MINIMUM_AGE') this.allowedMinAge = '18',
      @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
      this.editCustomerAuthType = '',
      @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
      this.LOGINAUTHENTICATIONPRIMARY = '',
      @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
      this.LOGINAUTHENTICATIONSECONDARY = '',
      @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
      this.LOGINAUTHENTICATIONTWOFACTOR = '',
      @JsonKey(name: 'REQUIRED_LOGIN_METHODS')
      this.REQUIREDLOGINMETHODS = 'DEFAULT',
      @JsonKey(name: 'COUNTRY_DIALING_CODE') this.COUNTRYDIALINGCODE = '',
      @JsonKey(name: 'CLIENT_LOGO') this.clientLogo = '',
      @JsonKey(name: 'CLIENT_NAME') this.clientName = '',
      @JsonKey(name: 'THEME_COLORS') this.THEMECOLORS,
      @JsonKey(name: 'ALLOW_ADD_BENEFECIARY') this.enableAddBenf = false,
      @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY') this.enableEditBenf = false,
      @JsonKey(name: 'ALLOW_EDIT_CUSTOMER') this.enableEditProfile = false,
      @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
      this.enableDeRegistration = false,
      @JsonKey(name: 'ALLOW_OCR_PARSING') this.ocrRequired = false,
      @JsonKey(name: 'ALLOWED_COUNTRY') this.countriesForBeneficiaries = '',
      @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
      this.multiDeviceLoginLength = '',
      @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
      this.enablePromotionDashboard = false,
      @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
      this.enablePromotionPreLogin = false,
      @JsonKey(name: 'REQUIRED_BRANCHLOCATOR') this.enableBranchLocator = false,
      @JsonKey(name: 'REQUIRED_EKYC_METHOD') this.processEkycAs = '',
      @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
      this.REQUIREDEKYCUPDATEMETHOD = '',
      @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
      this.REQUIREDNEWSATPREDASHBOARD = false,
      @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN')
      this.REQUIREDNEWSATPRELOGIN = false,
      @JsonKey(name: 'REQUIRED_PRELOGIN') this.preLogin = false,
      @JsonKey(name: 'REQUIRED_CREATEALERT') this.enableCreateAlert = false,
      @JsonKey(name: 'REQUIRED_UTILITY') this.enableUTILITY = '',
      @JsonKey(name: 'REQUIRED_VAT') this.enableVat = false,
      @JsonKey(name: 'REQUIRED_WHATSAPPCHAT') this.enableWhatsAppChat = false,
      @JsonKey(name: 'REQUIRED_LOYALTYTEST') this.enableLoyalty = false,
      @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
      this.checkBeneficiaryAuth = false,
      @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
      this.checkEditBeneficiaryAuth = false,
      @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
      this.checkEditCustomerAuth = false,
      @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
      this.checkCustomerAuth = false,
      @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION')
      this.checkPaymentAuth = false,
      @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
      this.checkTransactionAuth = false,
      @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO') this.BankTransferMTO = false,
      @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR') this.allowUpdateKYC = false,
      @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN') this.multiDeviceLogin = false,
      @JsonKey(name: 'ALLOW_AML_TRANSACTION') this.amlForTransaction = false,
      @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION') this.preBgFromPromotion = false,
      @JsonKey(name: 'ALLOW_LOYALTY') this.loyalty = false,
      @JsonKey(name: 'ALLOW_BIOMETRIC') this.enableBiometric = false,
      @JsonKey(name: 'Required_remittance_limit_popup') this.remittanceLimitPopup = false,
      @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID') this.blockZerosInNid = false,
      @JsonKey(name: 'ALLOW_FORCE_UPDATE') this.ForceUpdate = false,
      @JsonKey(name: 'ALLOW_GALLERY') this.EnableGallery = false,
      @JsonKey(name: 'ALLOW_FILE') this.EnableFile = false,
      @JsonKey(name: 'ALLOW_TRACK_REMITTANCE') this.EnableTrackRemittance = false,
      @JsonKey(name: 'ALLOW_PAYMENT_SOUND') this.EnablePaymentSound = false,
      @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING') this.EnableSetForexBooking = false,
      @JsonKey(name: 'ALLOW_SWIPE_BUTTON') this.EnableSwipeButton = false,
      @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES') this.EnableTermsForInternalPages = false,
      @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH') this.currencyDecimalLength,
      @JsonKey(name: 'FOREX_DECIMAL') this.forexDecimalLength = '7',
      @JsonKey(name: 'MOBILE_MIN_LENGTH') this.mobileMinLength = 9,
      @JsonKey(name: 'MOBILE_MAX_LENGTH') this.mobileMaxLength = 15,
      @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH') this.nidMaxLength = 15,
      @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH') this.nidMinLength = 7,
      @JsonKey(name: 'HIGHLIGHT_THEME_COLOR') this.highlitedColor = 'FFFFFFFF',
      @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR') this.complementaryColr = 'FFFFFFFF',
      @JsonKey(name: 'ACCENT_THEME_COLOR') this.accentColor = 'FF189AB4',
      @JsonKey(name: 'SECONDARY_THEME_COLOR') this.themeSecondary = 'FF75E6DA',
      @JsonKey(name: 'PRIMARY_THEME_COLOR') this.themePrimary = 'FF05445e',
      @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE') this.primaryDocID = '',
      @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME') this.primaryDocIDName = '',
      @JsonKey(name: 'ALLOWED_CURRENCY') this.currenciesForBeneficiaries = '',
      @JsonKey(name: "REQUIRED_VPN_DETECTION") this.requiredVPNDetection = false,
      @JsonKey(name: "EnableScreenMirrorDetection") this.enableScreenMirrorDetection = false,
      @JsonKey(name: "IsRenewKYCAfterOneYear") this.isRenewKYCAfterOneYear = false,
      @JsonKey(name: "EnableEncryption") this.enableEncryption = false,
      @JsonKey(name: 'SESSION_TIMEOUT') this.mobileSessionTimeout = "5",
      @JsonKey(name: "REQUIRED_AGENT_STATUS") this.requiredAgentStatus = false,
      @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL") this.requiredCurrencySymbol = true,
      @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT") this.receiptHeaderAlignment = "center",
      @JsonKey(name: "UI_TEMPLATE") @AppUIConverter() this.primaryUI = AppUI.defaultUI});
  factory _SettingsFZ.fromJson(Map<String, dynamic> json) =>
      _$SettingsFZFromJson(json);

// system
  @override
  @JsonKey(name: 'APP_VERSION')
  final String appVersion;

  ///auth part
//beneficiary auth type
  @override
  @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION')
  final String authBenfAdd;
// transaction auth type
  @override
  @JsonKey(name: 'TRASNACTION_AUTHENTICATION')
  final String authRemittance;
// edit beneficiary auth type
  @override
  @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION')
  final String authBenfEdit;
// customer reg auth type
  @override
  @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
  final String addCustomerAuthType;
// min age for customer registration
  @override
  @JsonKey(name: 'ALLOWED_MINIMUM_AGE')
  final String allowedMinAge;
// edit customer / profile reg auth type
  @override
  @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
  final String editCustomerAuthType;
  @override
  @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
  final String LOGINAUTHENTICATIONPRIMARY;
  @override
  @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
  final String LOGINAUTHENTICATIONSECONDARY;
  @override
  @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
  final String LOGINAUTHENTICATIONTWOFACTOR;
  @override
  @JsonKey(name: 'REQUIRED_LOGIN_METHODS')
  final String REQUIREDLOGINMETHODS;
  @override
  @JsonKey(name: 'COUNTRY_DIALING_CODE')
  final String COUNTRYDIALINGCODE;

  ///personalization part
// client logo
  @override
  @JsonKey(name: 'CLIENT_LOGO')
  final String clientLogo;
// client name
  @override
  @JsonKey(name: 'CLIENT_NAME')
  final String clientName;
// app theme primary and secondary
  @override
  @JsonKey(name: 'THEME_COLORS')
  final String? THEMECOLORS;
//add beneficiary allow
  @override
  @JsonKey(name: 'ALLOW_ADD_BENEFECIARY')
  final bool enableAddBenf;
// edit beneficiary allow
  @override
  @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY')
  final bool enableEditBenf;
// edit customer / edit profile allow
  @override
  @JsonKey(name: 'ALLOW_EDIT_CUSTOMER')
  final bool enableEditProfile;
// enable deregister device allow
  @override
  @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
  final bool enableDeRegistration;
// ocr required allow
  @override
  @JsonKey(name: 'ALLOW_OCR_PARSING')
  final bool ocrRequired;
// service allowed on country or if blank then it for all
  @override
  @JsonKey(name: 'ALLOWED_COUNTRY')
  final String countriesForBeneficiaries;
// enable multi device login
  @override
  @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
  final String multiDeviceLoginLength;
// enable promotion to dashboard
  @override
  @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
  final bool enablePromotionDashboard;
// enable prelogin promotion
  @override
  @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
  final bool enablePromotionPreLogin;
// enable branch locator
  @override
  @JsonKey(name: 'REQUIRED_BRANCHLOCATOR')
  final bool enableBranchLocator;
// kyc type normal or uaepass
  @override
  @JsonKey(name: 'REQUIRED_EKYC_METHOD')
  final String processEkycAs;
  @override
  @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
  final String REQUIREDEKYCUPDATEMETHOD;
  @override
  @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
  final bool REQUIREDNEWSATPREDASHBOARD;
  @override
  @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN')
  final bool REQUIREDNEWSATPRELOGIN;
// pre login required
  @override
  @JsonKey(name: 'REQUIRED_PRELOGIN')
  final bool preLogin;
// create alert screen required
  @override
  @JsonKey(name: 'REQUIRED_CREATEALERT')
  final bool enableCreateAlert;
// enable utility feature from list
  @override
  @JsonKey(name: 'REQUIRED_UTILITY')
  final String enableUTILITY;
// enable vat
  @override
  @JsonKey(name: 'REQUIRED_VAT')
  final bool enableVat;
// enable whats app
  @override
  @JsonKey(name: 'REQUIRED_WHATSAPPCHAT')
  final bool enableWhatsAppChat;
// enable loyalty offers
  @override
  @JsonKey(name: 'REQUIRED_LOYALTYTEST')
  final bool enableLoyalty;
// check beneficiary auth enable or not
  @override
  @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
  final bool checkBeneficiaryAuth;
// check edit beneficiary auth enable or not
  @override
  @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
  final bool checkEditBeneficiaryAuth;
// check edit customer auth enable or not
  @override
  @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
  final bool checkEditCustomerAuth;
// check customer auth enable or not
  @override
  @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
  final bool checkCustomerAuth;
// check payment auth enable or not
  @override
  @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION')
  final bool checkPaymentAuth;
// check transaction auth enable or not
  @override
  @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
  final bool checkTransactionAuth;
////
  ///
//
// handle from backend
  @override
  @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO')
  final bool BankTransferMTO;
// @JsonKey(name: 'ALLOW_KYC_UPDATE') @Default(false) bool isRenewKYCAfterOneYear,
// handle from backend in login
  @override
  @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR')
  final bool allowUpdateKYC;
  @override
  @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN')
  final bool multiDeviceLogin;
// handle from backend
  @override
  @JsonKey(name: 'ALLOW_AML_TRANSACTION')
  final bool amlForTransaction;
  @override
  @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION')
  final bool preBgFromPromotion;
// implement in future
  @override
  @JsonKey(name: 'ALLOW_LOYALTY')
  final bool loyalty;
  @override
  @JsonKey(name: 'ALLOW_BIOMETRIC')
  final bool enableBiometric;
// from form rule
  @override
  @JsonKey(name: 'Required_remittance_limit_popup')
  final bool remittanceLimitPopup;
  @override
  @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID')
  final bool blockZerosInNid;
  @override
  @JsonKey(name: 'ALLOW_FORCE_UPDATE')
  final bool ForceUpdate;
  @override
  @JsonKey(name: 'ALLOW_GALLERY')
  final bool EnableGallery;
  @override
  @JsonKey(name: 'ALLOW_FILE')
  final bool EnableFile;
// this for all client
  @override
  @JsonKey(name: 'ALLOW_TRACK_REMITTANCE')
  final bool EnableTrackRemittance;
  @override
  @JsonKey(name: 'ALLOW_PAYMENT_SOUND')
  final bool EnablePaymentSound;
// this for all client
  @override
  @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING')
  final bool EnableSetForexBooking;
  @override
  @JsonKey(name: 'ALLOW_SWIPE_BUTTON')
  final bool EnableSwipeButton;
// this for all client
  @override
  @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
  final bool EnableTermsForInternalPages;
// handle from backend
  @override
  @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH')
  final int? currencyDecimalLength;
  @override
  @JsonKey(name: 'FOREX_DECIMAL')
  final String forexDecimalLength;
// from form rule
  @override
  @JsonKey(name: 'MOBILE_MIN_LENGTH')
  final int mobileMinLength;
// from form rule
  @override
  @JsonKey(name: 'MOBILE_MAX_LENGTH')
  final int mobileMaxLength;
// from form rule
  @override
  @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH')
  final int nidMaxLength;
// from form rule
  @override
  @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH')
  final int nidMinLength;
// @JsonKey(name: 'SWIPE_BUTTON_COLOR') @Default('FFFFFFFF') String SWIPECOLORNO,
  @override
  @JsonKey(name: 'HIGHLIGHT_THEME_COLOR')
  final String? highlitedColor;
  @override
  @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR')
  final String? complementaryColr;
  @override
  @JsonKey(name: 'ACCENT_THEME_COLOR')
  final String? accentColor;
  @override
  @JsonKey(name: 'SECONDARY_THEME_COLOR')
  final String? themeSecondary;
  @override
  @JsonKey(name: 'PRIMARY_THEME_COLOR')
  final String? themePrimary;
  @override
  @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE')
  final String primaryDocID;
  @override
  @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME')
  final String primaryDocIDName;
  @override
  @JsonKey(name: 'ALLOWED_CURRENCY')
  final String currenciesForBeneficiaries;
  @override
  @JsonKey(name: "REQUIRED_VPN_DETECTION")
  final bool requiredVPNDetection;
  @override
  @JsonKey(name: "EnableScreenMirrorDetection")
  final bool enableScreenMirrorDetection;
  @override
  @JsonKey(name: "IsRenewKYCAfterOneYear")
  final bool isRenewKYCAfterOneYear;
  @override
  @JsonKey(name: "EnableEncryption")
  final bool enableEncryption;
  @override
  @JsonKey(name: 'SESSION_TIMEOUT')
  final String mobileSessionTimeout;
  @override
  @JsonKey(name: "REQUIRED_AGENT_STATUS")
  final bool requiredAgentStatus;
  @override
  @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL")
  final bool requiredCurrencySymbol;
  @override
  @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT")
  final String receiptHeaderAlignment;
  @override
  @JsonKey(name: "UI_TEMPLATE")
  @AppUIConverter()
  final AppUI primaryUI;

  /// Create a copy of SettingsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsFZCopyWith<_SettingsFZ> get copyWith =>
      __$SettingsFZCopyWithImpl<_SettingsFZ>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SettingsFZToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsFZ &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.authBenfAdd, authBenfAdd) ||
                other.authBenfAdd == authBenfAdd) &&
            (identical(other.authRemittance, authRemittance) ||
                other.authRemittance == authRemittance) &&
            (identical(other.authBenfEdit, authBenfEdit) ||
                other.authBenfEdit == authBenfEdit) &&
            (identical(other.addCustomerAuthType, addCustomerAuthType) ||
                other.addCustomerAuthType == addCustomerAuthType) &&
            (identical(other.allowedMinAge, allowedMinAge) ||
                other.allowedMinAge == allowedMinAge) &&
            (identical(other.editCustomerAuthType, editCustomerAuthType) ||
                other.editCustomerAuthType == editCustomerAuthType) &&
            (identical(other.LOGINAUTHENTICATIONPRIMARY, LOGINAUTHENTICATIONPRIMARY) ||
                other.LOGINAUTHENTICATIONPRIMARY ==
                    LOGINAUTHENTICATIONPRIMARY) &&
            (identical(other.LOGINAUTHENTICATIONSECONDARY, LOGINAUTHENTICATIONSECONDARY) ||
                other.LOGINAUTHENTICATIONSECONDARY ==
                    LOGINAUTHENTICATIONSECONDARY) &&
            (identical(other.LOGINAUTHENTICATIONTWOFACTOR, LOGINAUTHENTICATIONTWOFACTOR) ||
                other.LOGINAUTHENTICATIONTWOFACTOR ==
                    LOGINAUTHENTICATIONTWOFACTOR) &&
            (identical(other.REQUIREDLOGINMETHODS, REQUIREDLOGINMETHODS) ||
                other.REQUIREDLOGINMETHODS == REQUIREDLOGINMETHODS) &&
            (identical(other.COUNTRYDIALINGCODE, COUNTRYDIALINGCODE) ||
                other.COUNTRYDIALINGCODE == COUNTRYDIALINGCODE) &&
            (identical(other.clientLogo, clientLogo) ||
                other.clientLogo == clientLogo) &&
            (identical(other.clientName, clientName) ||
                other.clientName == clientName) &&
            (identical(other.THEMECOLORS, THEMECOLORS) ||
                other.THEMECOLORS == THEMECOLORS) &&
            (identical(other.enableAddBenf, enableAddBenf) ||
                other.enableAddBenf == enableAddBenf) &&
            (identical(other.enableEditBenf, enableEditBenf) ||
                other.enableEditBenf == enableEditBenf) &&
            (identical(other.enableEditProfile, enableEditProfile) ||
                other.enableEditProfile == enableEditProfile) &&
            (identical(other.enableDeRegistration, enableDeRegistration) ||
                other.enableDeRegistration == enableDeRegistration) &&
            (identical(other.ocrRequired, ocrRequired) ||
                other.ocrRequired == ocrRequired) &&
            (identical(other.countriesForBeneficiaries, countriesForBeneficiaries) ||
                other.countriesForBeneficiaries == countriesForBeneficiaries) &&
            (identical(other.multiDeviceLoginLength, multiDeviceLoginLength) ||
                other.multiDeviceLoginLength == multiDeviceLoginLength) &&
            (identical(other.enablePromotionDashboard, enablePromotionDashboard) ||
                other.enablePromotionDashboard == enablePromotionDashboard) &&
            (identical(other.enablePromotionPreLogin, enablePromotionPreLogin) ||
                other.enablePromotionPreLogin == enablePromotionPreLogin) &&
            (identical(other.enableBranchLocator, enableBranchLocator) ||
                other.enableBranchLocator == enableBranchLocator) &&
            (identical(other.processEkycAs, processEkycAs) ||
                other.processEkycAs == processEkycAs) &&
            (identical(other.REQUIREDEKYCUPDATEMETHOD, REQUIREDEKYCUPDATEMETHOD) ||
                other.REQUIREDEKYCUPDATEMETHOD == REQUIREDEKYCUPDATEMETHOD) &&
            (identical(other.REQUIREDNEWSATPREDASHBOARD, REQUIREDNEWSATPREDASHBOARD) || other.REQUIREDNEWSATPREDASHBOARD == REQUIREDNEWSATPREDASHBOARD) &&
            (identical(other.REQUIREDNEWSATPRELOGIN, REQUIREDNEWSATPRELOGIN) || other.REQUIREDNEWSATPRELOGIN == REQUIREDNEWSATPRELOGIN) &&
            (identical(other.preLogin, preLogin) || other.preLogin == preLogin) &&
            (identical(other.enableCreateAlert, enableCreateAlert) || other.enableCreateAlert == enableCreateAlert) &&
            (identical(other.enableUTILITY, enableUTILITY) || other.enableUTILITY == enableUTILITY) &&
            (identical(other.enableVat, enableVat) || other.enableVat == enableVat) &&
            (identical(other.enableWhatsAppChat, enableWhatsAppChat) || other.enableWhatsAppChat == enableWhatsAppChat) &&
            (identical(other.enableLoyalty, enableLoyalty) || other.enableLoyalty == enableLoyalty) &&
            (identical(other.checkBeneficiaryAuth, checkBeneficiaryAuth) || other.checkBeneficiaryAuth == checkBeneficiaryAuth) &&
            (identical(other.checkEditBeneficiaryAuth, checkEditBeneficiaryAuth) || other.checkEditBeneficiaryAuth == checkEditBeneficiaryAuth) &&
            (identical(other.checkEditCustomerAuth, checkEditCustomerAuth) || other.checkEditCustomerAuth == checkEditCustomerAuth) &&
            (identical(other.checkCustomerAuth, checkCustomerAuth) || other.checkCustomerAuth == checkCustomerAuth) &&
            (identical(other.checkPaymentAuth, checkPaymentAuth) || other.checkPaymentAuth == checkPaymentAuth) &&
            (identical(other.checkTransactionAuth, checkTransactionAuth) || other.checkTransactionAuth == checkTransactionAuth) &&
            (identical(other.BankTransferMTO, BankTransferMTO) || other.BankTransferMTO == BankTransferMTO) &&
            (identical(other.allowUpdateKYC, allowUpdateKYC) || other.allowUpdateKYC == allowUpdateKYC) &&
            (identical(other.multiDeviceLogin, multiDeviceLogin) || other.multiDeviceLogin == multiDeviceLogin) &&
            (identical(other.amlForTransaction, amlForTransaction) || other.amlForTransaction == amlForTransaction) &&
            (identical(other.preBgFromPromotion, preBgFromPromotion) || other.preBgFromPromotion == preBgFromPromotion) &&
            (identical(other.loyalty, loyalty) || other.loyalty == loyalty) &&
            (identical(other.enableBiometric, enableBiometric) || other.enableBiometric == enableBiometric) &&
            (identical(other.remittanceLimitPopup, remittanceLimitPopup) || other.remittanceLimitPopup == remittanceLimitPopup) &&
            (identical(other.blockZerosInNid, blockZerosInNid) || other.blockZerosInNid == blockZerosInNid) &&
            (identical(other.ForceUpdate, ForceUpdate) || other.ForceUpdate == ForceUpdate) &&
            (identical(other.EnableGallery, EnableGallery) || other.EnableGallery == EnableGallery) &&
            (identical(other.EnableFile, EnableFile) || other.EnableFile == EnableFile) &&
            (identical(other.EnableTrackRemittance, EnableTrackRemittance) || other.EnableTrackRemittance == EnableTrackRemittance) &&
            (identical(other.EnablePaymentSound, EnablePaymentSound) || other.EnablePaymentSound == EnablePaymentSound) &&
            (identical(other.EnableSetForexBooking, EnableSetForexBooking) || other.EnableSetForexBooking == EnableSetForexBooking) &&
            (identical(other.EnableSwipeButton, EnableSwipeButton) || other.EnableSwipeButton == EnableSwipeButton) &&
            (identical(other.EnableTermsForInternalPages, EnableTermsForInternalPages) || other.EnableTermsForInternalPages == EnableTermsForInternalPages) &&
            (identical(other.currencyDecimalLength, currencyDecimalLength) || other.currencyDecimalLength == currencyDecimalLength) &&
            (identical(other.forexDecimalLength, forexDecimalLength) || other.forexDecimalLength == forexDecimalLength) &&
            (identical(other.mobileMinLength, mobileMinLength) || other.mobileMinLength == mobileMinLength) &&
            (identical(other.mobileMaxLength, mobileMaxLength) || other.mobileMaxLength == mobileMaxLength) &&
            (identical(other.nidMaxLength, nidMaxLength) || other.nidMaxLength == nidMaxLength) &&
            (identical(other.nidMinLength, nidMinLength) || other.nidMinLength == nidMinLength) &&
            (identical(other.highlitedColor, highlitedColor) || other.highlitedColor == highlitedColor) &&
            (identical(other.complementaryColr, complementaryColr) || other.complementaryColr == complementaryColr) &&
            (identical(other.accentColor, accentColor) || other.accentColor == accentColor) &&
            (identical(other.themeSecondary, themeSecondary) || other.themeSecondary == themeSecondary) &&
            (identical(other.themePrimary, themePrimary) || other.themePrimary == themePrimary) &&
            (identical(other.primaryDocID, primaryDocID) || other.primaryDocID == primaryDocID) &&
            (identical(other.primaryDocIDName, primaryDocIDName) || other.primaryDocIDName == primaryDocIDName) &&
            (identical(other.currenciesForBeneficiaries, currenciesForBeneficiaries) || other.currenciesForBeneficiaries == currenciesForBeneficiaries) &&
            (identical(other.requiredVPNDetection, requiredVPNDetection) || other.requiredVPNDetection == requiredVPNDetection) &&
            (identical(other.enableScreenMirrorDetection, enableScreenMirrorDetection) || other.enableScreenMirrorDetection == enableScreenMirrorDetection) &&
            (identical(other.isRenewKYCAfterOneYear, isRenewKYCAfterOneYear) || other.isRenewKYCAfterOneYear == isRenewKYCAfterOneYear) &&
            (identical(other.enableEncryption, enableEncryption) || other.enableEncryption == enableEncryption) &&
            (identical(other.mobileSessionTimeout, mobileSessionTimeout) || other.mobileSessionTimeout == mobileSessionTimeout) &&
            (identical(other.requiredAgentStatus, requiredAgentStatus) || other.requiredAgentStatus == requiredAgentStatus) &&
            (identical(other.requiredCurrencySymbol, requiredCurrencySymbol) || other.requiredCurrencySymbol == requiredCurrencySymbol) &&
            (identical(other.receiptHeaderAlignment, receiptHeaderAlignment) || other.receiptHeaderAlignment == receiptHeaderAlignment) &&
            (identical(other.primaryUI, primaryUI) || other.primaryUI == primaryUI));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        appVersion,
        authBenfAdd,
        authRemittance,
        authBenfEdit,
        addCustomerAuthType,
        allowedMinAge,
        editCustomerAuthType,
        LOGINAUTHENTICATIONPRIMARY,
        LOGINAUTHENTICATIONSECONDARY,
        LOGINAUTHENTICATIONTWOFACTOR,
        REQUIREDLOGINMETHODS,
        COUNTRYDIALINGCODE,
        clientLogo,
        clientName,
        THEMECOLORS,
        enableAddBenf,
        enableEditBenf,
        enableEditProfile,
        enableDeRegistration,
        ocrRequired,
        countriesForBeneficiaries,
        multiDeviceLoginLength,
        enablePromotionDashboard,
        enablePromotionPreLogin,
        enableBranchLocator,
        processEkycAs,
        REQUIREDEKYCUPDATEMETHOD,
        REQUIREDNEWSATPREDASHBOARD,
        REQUIREDNEWSATPRELOGIN,
        preLogin,
        enableCreateAlert,
        enableUTILITY,
        enableVat,
        enableWhatsAppChat,
        enableLoyalty,
        checkBeneficiaryAuth,
        checkEditBeneficiaryAuth,
        checkEditCustomerAuth,
        checkCustomerAuth,
        checkPaymentAuth,
        checkTransactionAuth,
        BankTransferMTO,
        allowUpdateKYC,
        multiDeviceLogin,
        amlForTransaction,
        preBgFromPromotion,
        loyalty,
        enableBiometric,
        remittanceLimitPopup,
        blockZerosInNid,
        ForceUpdate,
        EnableGallery,
        EnableFile,
        EnableTrackRemittance,
        EnablePaymentSound,
        EnableSetForexBooking,
        EnableSwipeButton,
        EnableTermsForInternalPages,
        currencyDecimalLength,
        forexDecimalLength,
        mobileMinLength,
        mobileMaxLength,
        nidMaxLength,
        nidMinLength,
        highlitedColor,
        complementaryColr,
        accentColor,
        themeSecondary,
        themePrimary,
        primaryDocID,
        primaryDocIDName,
        currenciesForBeneficiaries,
        requiredVPNDetection,
        enableScreenMirrorDetection,
        isRenewKYCAfterOneYear,
        enableEncryption,
        mobileSessionTimeout,
        requiredAgentStatus,
        requiredCurrencySymbol,
        receiptHeaderAlignment,
        primaryUI
      ]);

  @override
  String toString() {
    return 'SettingsFZ(appVersion: $appVersion, authBenfAdd: $authBenfAdd, authRemittance: $authRemittance, authBenfEdit: $authBenfEdit, addCustomerAuthType: $addCustomerAuthType, allowedMinAge: $allowedMinAge, editCustomerAuthType: $editCustomerAuthType, LOGINAUTHENTICATIONPRIMARY: $LOGINAUTHENTICATIONPRIMARY, LOGINAUTHENTICATIONSECONDARY: $LOGINAUTHENTICATIONSECONDARY, LOGINAUTHENTICATIONTWOFACTOR: $LOGINAUTHENTICATIONTWOFACTOR, REQUIREDLOGINMETHODS: $REQUIREDLOGINMETHODS, COUNTRYDIALINGCODE: $COUNTRYDIALINGCODE, clientLogo: $clientLogo, clientName: $clientName, THEMECOLORS: $THEMECOLORS, enableAddBenf: $enableAddBenf, enableEditBenf: $enableEditBenf, enableEditProfile: $enableEditProfile, enableDeRegistration: $enableDeRegistration, ocrRequired: $ocrRequired, countriesForBeneficiaries: $countriesForBeneficiaries, multiDeviceLoginLength: $multiDeviceLoginLength, enablePromotionDashboard: $enablePromotionDashboard, enablePromotionPreLogin: $enablePromotionPreLogin, enableBranchLocator: $enableBranchLocator, processEkycAs: $processEkycAs, REQUIREDEKYCUPDATEMETHOD: $REQUIREDEKYCUPDATEMETHOD, REQUIREDNEWSATPREDASHBOARD: $REQUIREDNEWSATPREDASHBOARD, REQUIREDNEWSATPRELOGIN: $REQUIREDNEWSATPRELOGIN, preLogin: $preLogin, enableCreateAlert: $enableCreateAlert, enableUTILITY: $enableUTILITY, enableVat: $enableVat, enableWhatsAppChat: $enableWhatsAppChat, enableLoyalty: $enableLoyalty, checkBeneficiaryAuth: $checkBeneficiaryAuth, checkEditBeneficiaryAuth: $checkEditBeneficiaryAuth, checkEditCustomerAuth: $checkEditCustomerAuth, checkCustomerAuth: $checkCustomerAuth, checkPaymentAuth: $checkPaymentAuth, checkTransactionAuth: $checkTransactionAuth, BankTransferMTO: $BankTransferMTO, allowUpdateKYC: $allowUpdateKYC, multiDeviceLogin: $multiDeviceLogin, amlForTransaction: $amlForTransaction, preBgFromPromotion: $preBgFromPromotion, loyalty: $loyalty, enableBiometric: $enableBiometric, remittanceLimitPopup: $remittanceLimitPopup, blockZerosInNid: $blockZerosInNid, ForceUpdate: $ForceUpdate, EnableGallery: $EnableGallery, EnableFile: $EnableFile, EnableTrackRemittance: $EnableTrackRemittance, EnablePaymentSound: $EnablePaymentSound, EnableSetForexBooking: $EnableSetForexBooking, EnableSwipeButton: $EnableSwipeButton, EnableTermsForInternalPages: $EnableTermsForInternalPages, currencyDecimalLength: $currencyDecimalLength, forexDecimalLength: $forexDecimalLength, mobileMinLength: $mobileMinLength, mobileMaxLength: $mobileMaxLength, nidMaxLength: $nidMaxLength, nidMinLength: $nidMinLength, highlitedColor: $highlitedColor, complementaryColr: $complementaryColr, accentColor: $accentColor, themeSecondary: $themeSecondary, themePrimary: $themePrimary, primaryDocID: $primaryDocID, primaryDocIDName: $primaryDocIDName, currenciesForBeneficiaries: $currenciesForBeneficiaries, requiredVPNDetection: $requiredVPNDetection, enableScreenMirrorDetection: $enableScreenMirrorDetection, isRenewKYCAfterOneYear: $isRenewKYCAfterOneYear, enableEncryption: $enableEncryption, mobileSessionTimeout: $mobileSessionTimeout, requiredAgentStatus: $requiredAgentStatus, requiredCurrencySymbol: $requiredCurrencySymbol, receiptHeaderAlignment: $receiptHeaderAlignment, primaryUI: $primaryUI)';
  }
}

/// @nodoc
abstract mixin class _$SettingsFZCopyWith<$Res>
    implements $SettingsFZCopyWith<$Res> {
  factory _$SettingsFZCopyWith(
          _SettingsFZ value, $Res Function(_SettingsFZ) _then) =
      __$SettingsFZCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'APP_VERSION') String appVersion,
      @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION') String authBenfAdd,
      @JsonKey(name: 'TRASNACTION_AUTHENTICATION') String authRemittance,
      @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION') String authBenfEdit,
      @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
      String addCustomerAuthType,
      @JsonKey(name: 'ALLOWED_MINIMUM_AGE') String allowedMinAge,
      @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
      String editCustomerAuthType,
      @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
      String LOGINAUTHENTICATIONPRIMARY,
      @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
      String LOGINAUTHENTICATIONSECONDARY,
      @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
      String LOGINAUTHENTICATIONTWOFACTOR,
      @JsonKey(name: 'REQUIRED_LOGIN_METHODS') String REQUIREDLOGINMETHODS,
      @JsonKey(name: 'COUNTRY_DIALING_CODE') String COUNTRYDIALINGCODE,
      @JsonKey(name: 'CLIENT_LOGO') String clientLogo,
      @JsonKey(name: 'CLIENT_NAME') String clientName,
      @JsonKey(name: 'THEME_COLORS') String? THEMECOLORS,
      @JsonKey(name: 'ALLOW_ADD_BENEFECIARY') bool enableAddBenf,
      @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY') bool enableEditBenf,
      @JsonKey(name: 'ALLOW_EDIT_CUSTOMER') bool enableEditProfile,
      @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
      bool enableDeRegistration,
      @JsonKey(name: 'ALLOW_OCR_PARSING') bool ocrRequired,
      @JsonKey(name: 'ALLOWED_COUNTRY') String countriesForBeneficiaries,
      @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
      String multiDeviceLoginLength,
      @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
      bool enablePromotionDashboard,
      @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
      bool enablePromotionPreLogin,
      @JsonKey(name: 'REQUIRED_BRANCHLOCATOR') bool enableBranchLocator,
      @JsonKey(name: 'REQUIRED_EKYC_METHOD') String processEkycAs,
      @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
      String REQUIREDEKYCUPDATEMETHOD,
      @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
      bool REQUIREDNEWSATPREDASHBOARD,
      @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN') bool REQUIREDNEWSATPRELOGIN,
      @JsonKey(name: 'REQUIRED_PRELOGIN') bool preLogin,
      @JsonKey(name: 'REQUIRED_CREATEALERT') bool enableCreateAlert,
      @JsonKey(name: 'REQUIRED_UTILITY') String enableUTILITY,
      @JsonKey(name: 'REQUIRED_VAT') bool enableVat,
      @JsonKey(name: 'REQUIRED_WHATSAPPCHAT') bool enableWhatsAppChat,
      @JsonKey(name: 'REQUIRED_LOYALTYTEST') bool enableLoyalty,
      @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
      bool checkBeneficiaryAuth,
      @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
      bool checkEditBeneficiaryAuth,
      @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
      bool checkEditCustomerAuth,
      @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
      bool checkCustomerAuth,
      @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION') bool checkPaymentAuth,
      @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
      bool checkTransactionAuth,
      @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO') bool BankTransferMTO,
      @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR') bool allowUpdateKYC,
      @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN') bool multiDeviceLogin,
      @JsonKey(name: 'ALLOW_AML_TRANSACTION') bool amlForTransaction,
      @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION') bool preBgFromPromotion,
      @JsonKey(name: 'ALLOW_LOYALTY') bool loyalty,
      @JsonKey(name: 'ALLOW_BIOMETRIC') bool enableBiometric,
      @JsonKey(name: 'Required_remittance_limit_popup')
      bool remittanceLimitPopup,
      @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID') bool blockZerosInNid,
      @JsonKey(name: 'ALLOW_FORCE_UPDATE') bool ForceUpdate,
      @JsonKey(name: 'ALLOW_GALLERY') bool EnableGallery,
      @JsonKey(name: 'ALLOW_FILE') bool EnableFile,
      @JsonKey(name: 'ALLOW_TRACK_REMITTANCE') bool EnableTrackRemittance,
      @JsonKey(name: 'ALLOW_PAYMENT_SOUND') bool EnablePaymentSound,
      @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING') bool EnableSetForexBooking,
      @JsonKey(name: 'ALLOW_SWIPE_BUTTON') bool EnableSwipeButton,
      @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
      bool EnableTermsForInternalPages,
      @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH') int? currencyDecimalLength,
      @JsonKey(name: 'FOREX_DECIMAL') String forexDecimalLength,
      @JsonKey(name: 'MOBILE_MIN_LENGTH') int mobileMinLength,
      @JsonKey(name: 'MOBILE_MAX_LENGTH') int mobileMaxLength,
      @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH') int nidMaxLength,
      @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH') int nidMinLength,
      @JsonKey(name: 'HIGHLIGHT_THEME_COLOR') String? highlitedColor,
      @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR') String? complementaryColr,
      @JsonKey(name: 'ACCENT_THEME_COLOR') String? accentColor,
      @JsonKey(name: 'SECONDARY_THEME_COLOR') String? themeSecondary,
      @JsonKey(name: 'PRIMARY_THEME_COLOR') String? themePrimary,
      @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE') String primaryDocID,
      @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME') String primaryDocIDName,
      @JsonKey(name: 'ALLOWED_CURRENCY') String currenciesForBeneficiaries,
      @JsonKey(name: "REQUIRED_VPN_DETECTION") bool requiredVPNDetection,
      @JsonKey(name: "EnableScreenMirrorDetection")
      bool enableScreenMirrorDetection,
      @JsonKey(name: "IsRenewKYCAfterOneYear") bool isRenewKYCAfterOneYear,
      @JsonKey(name: "EnableEncryption") bool enableEncryption,
      @JsonKey(name: 'SESSION_TIMEOUT') String mobileSessionTimeout,
      @JsonKey(name: "REQUIRED_AGENT_STATUS") bool requiredAgentStatus,
      @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL") bool requiredCurrencySymbol,
      @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT") String receiptHeaderAlignment,
      @JsonKey(name: "UI_TEMPLATE") @AppUIConverter() AppUI primaryUI});
}

/// @nodoc
class __$SettingsFZCopyWithImpl<$Res> implements _$SettingsFZCopyWith<$Res> {
  __$SettingsFZCopyWithImpl(this._self, this._then);

  final _SettingsFZ _self;
  final $Res Function(_SettingsFZ) _then;

  /// Create a copy of SettingsFZ
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? appVersion = null,
    Object? authBenfAdd = null,
    Object? authRemittance = null,
    Object? authBenfEdit = null,
    Object? addCustomerAuthType = null,
    Object? allowedMinAge = null,
    Object? editCustomerAuthType = null,
    Object? LOGINAUTHENTICATIONPRIMARY = null,
    Object? LOGINAUTHENTICATIONSECONDARY = null,
    Object? LOGINAUTHENTICATIONTWOFACTOR = null,
    Object? REQUIREDLOGINMETHODS = null,
    Object? COUNTRYDIALINGCODE = null,
    Object? clientLogo = null,
    Object? clientName = null,
    Object? THEMECOLORS = freezed,
    Object? enableAddBenf = null,
    Object? enableEditBenf = null,
    Object? enableEditProfile = null,
    Object? enableDeRegistration = null,
    Object? ocrRequired = null,
    Object? countriesForBeneficiaries = null,
    Object? multiDeviceLoginLength = null,
    Object? enablePromotionDashboard = null,
    Object? enablePromotionPreLogin = null,
    Object? enableBranchLocator = null,
    Object? processEkycAs = null,
    Object? REQUIREDEKYCUPDATEMETHOD = null,
    Object? REQUIREDNEWSATPREDASHBOARD = null,
    Object? REQUIREDNEWSATPRELOGIN = null,
    Object? preLogin = null,
    Object? enableCreateAlert = null,
    Object? enableUTILITY = null,
    Object? enableVat = null,
    Object? enableWhatsAppChat = null,
    Object? enableLoyalty = null,
    Object? checkBeneficiaryAuth = null,
    Object? checkEditBeneficiaryAuth = null,
    Object? checkEditCustomerAuth = null,
    Object? checkCustomerAuth = null,
    Object? checkPaymentAuth = null,
    Object? checkTransactionAuth = null,
    Object? BankTransferMTO = null,
    Object? allowUpdateKYC = null,
    Object? multiDeviceLogin = null,
    Object? amlForTransaction = null,
    Object? preBgFromPromotion = null,
    Object? loyalty = null,
    Object? enableBiometric = null,
    Object? remittanceLimitPopup = null,
    Object? blockZerosInNid = null,
    Object? ForceUpdate = null,
    Object? EnableGallery = null,
    Object? EnableFile = null,
    Object? EnableTrackRemittance = null,
    Object? EnablePaymentSound = null,
    Object? EnableSetForexBooking = null,
    Object? EnableSwipeButton = null,
    Object? EnableTermsForInternalPages = null,
    Object? currencyDecimalLength = freezed,
    Object? forexDecimalLength = null,
    Object? mobileMinLength = null,
    Object? mobileMaxLength = null,
    Object? nidMaxLength = null,
    Object? nidMinLength = null,
    Object? highlitedColor = freezed,
    Object? complementaryColr = freezed,
    Object? accentColor = freezed,
    Object? themeSecondary = freezed,
    Object? themePrimary = freezed,
    Object? primaryDocID = null,
    Object? primaryDocIDName = null,
    Object? currenciesForBeneficiaries = null,
    Object? requiredVPNDetection = null,
    Object? enableScreenMirrorDetection = null,
    Object? isRenewKYCAfterOneYear = null,
    Object? enableEncryption = null,
    Object? mobileSessionTimeout = null,
    Object? requiredAgentStatus = null,
    Object? requiredCurrencySymbol = null,
    Object? receiptHeaderAlignment = null,
    Object? primaryUI = null,
  }) {
    return _then(_SettingsFZ(
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      authBenfAdd: null == authBenfAdd
          ? _self.authBenfAdd
          : authBenfAdd // ignore: cast_nullable_to_non_nullable
              as String,
      authRemittance: null == authRemittance
          ? _self.authRemittance
          : authRemittance // ignore: cast_nullable_to_non_nullable
              as String,
      authBenfEdit: null == authBenfEdit
          ? _self.authBenfEdit
          : authBenfEdit // ignore: cast_nullable_to_non_nullable
              as String,
      addCustomerAuthType: null == addCustomerAuthType
          ? _self.addCustomerAuthType
          : addCustomerAuthType // ignore: cast_nullable_to_non_nullable
              as String,
      allowedMinAge: null == allowedMinAge
          ? _self.allowedMinAge
          : allowedMinAge // ignore: cast_nullable_to_non_nullable
              as String,
      editCustomerAuthType: null == editCustomerAuthType
          ? _self.editCustomerAuthType
          : editCustomerAuthType // ignore: cast_nullable_to_non_nullable
              as String,
      LOGINAUTHENTICATIONPRIMARY: null == LOGINAUTHENTICATIONPRIMARY
          ? _self.LOGINAUTHENTICATIONPRIMARY
          : LOGINAUTHENTICATIONPRIMARY // ignore: cast_nullable_to_non_nullable
              as String,
      LOGINAUTHENTICATIONSECONDARY: null == LOGINAUTHENTICATIONSECONDARY
          ? _self.LOGINAUTHENTICATIONSECONDARY
          : LOGINAUTHENTICATIONSECONDARY // ignore: cast_nullable_to_non_nullable
              as String,
      LOGINAUTHENTICATIONTWOFACTOR: null == LOGINAUTHENTICATIONTWOFACTOR
          ? _self.LOGINAUTHENTICATIONTWOFACTOR
          : LOGINAUTHENTICATIONTWOFACTOR // ignore: cast_nullable_to_non_nullable
              as String,
      REQUIREDLOGINMETHODS: null == REQUIREDLOGINMETHODS
          ? _self.REQUIREDLOGINMETHODS
          : REQUIREDLOGINMETHODS // ignore: cast_nullable_to_non_nullable
              as String,
      COUNTRYDIALINGCODE: null == COUNTRYDIALINGCODE
          ? _self.COUNTRYDIALINGCODE
          : COUNTRYDIALINGCODE // ignore: cast_nullable_to_non_nullable
              as String,
      clientLogo: null == clientLogo
          ? _self.clientLogo
          : clientLogo // ignore: cast_nullable_to_non_nullable
              as String,
      clientName: null == clientName
          ? _self.clientName
          : clientName // ignore: cast_nullable_to_non_nullable
              as String,
      THEMECOLORS: freezed == THEMECOLORS
          ? _self.THEMECOLORS
          : THEMECOLORS // ignore: cast_nullable_to_non_nullable
              as String?,
      enableAddBenf: null == enableAddBenf
          ? _self.enableAddBenf
          : enableAddBenf // ignore: cast_nullable_to_non_nullable
              as bool,
      enableEditBenf: null == enableEditBenf
          ? _self.enableEditBenf
          : enableEditBenf // ignore: cast_nullable_to_non_nullable
              as bool,
      enableEditProfile: null == enableEditProfile
          ? _self.enableEditProfile
          : enableEditProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      enableDeRegistration: null == enableDeRegistration
          ? _self.enableDeRegistration
          : enableDeRegistration // ignore: cast_nullable_to_non_nullable
              as bool,
      ocrRequired: null == ocrRequired
          ? _self.ocrRequired
          : ocrRequired // ignore: cast_nullable_to_non_nullable
              as bool,
      countriesForBeneficiaries: null == countriesForBeneficiaries
          ? _self.countriesForBeneficiaries
          : countriesForBeneficiaries // ignore: cast_nullable_to_non_nullable
              as String,
      multiDeviceLoginLength: null == multiDeviceLoginLength
          ? _self.multiDeviceLoginLength
          : multiDeviceLoginLength // ignore: cast_nullable_to_non_nullable
              as String,
      enablePromotionDashboard: null == enablePromotionDashboard
          ? _self.enablePromotionDashboard
          : enablePromotionDashboard // ignore: cast_nullable_to_non_nullable
              as bool,
      enablePromotionPreLogin: null == enablePromotionPreLogin
          ? _self.enablePromotionPreLogin
          : enablePromotionPreLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBranchLocator: null == enableBranchLocator
          ? _self.enableBranchLocator
          : enableBranchLocator // ignore: cast_nullable_to_non_nullable
              as bool,
      processEkycAs: null == processEkycAs
          ? _self.processEkycAs
          : processEkycAs // ignore: cast_nullable_to_non_nullable
              as String,
      REQUIREDEKYCUPDATEMETHOD: null == REQUIREDEKYCUPDATEMETHOD
          ? _self.REQUIREDEKYCUPDATEMETHOD
          : REQUIREDEKYCUPDATEMETHOD // ignore: cast_nullable_to_non_nullable
              as String,
      REQUIREDNEWSATPREDASHBOARD: null == REQUIREDNEWSATPREDASHBOARD
          ? _self.REQUIREDNEWSATPREDASHBOARD
          : REQUIREDNEWSATPREDASHBOARD // ignore: cast_nullable_to_non_nullable
              as bool,
      REQUIREDNEWSATPRELOGIN: null == REQUIREDNEWSATPRELOGIN
          ? _self.REQUIREDNEWSATPRELOGIN
          : REQUIREDNEWSATPRELOGIN // ignore: cast_nullable_to_non_nullable
              as bool,
      preLogin: null == preLogin
          ? _self.preLogin
          : preLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      enableCreateAlert: null == enableCreateAlert
          ? _self.enableCreateAlert
          : enableCreateAlert // ignore: cast_nullable_to_non_nullable
              as bool,
      enableUTILITY: null == enableUTILITY
          ? _self.enableUTILITY
          : enableUTILITY // ignore: cast_nullable_to_non_nullable
              as String,
      enableVat: null == enableVat
          ? _self.enableVat
          : enableVat // ignore: cast_nullable_to_non_nullable
              as bool,
      enableWhatsAppChat: null == enableWhatsAppChat
          ? _self.enableWhatsAppChat
          : enableWhatsAppChat // ignore: cast_nullable_to_non_nullable
              as bool,
      enableLoyalty: null == enableLoyalty
          ? _self.enableLoyalty
          : enableLoyalty // ignore: cast_nullable_to_non_nullable
              as bool,
      checkBeneficiaryAuth: null == checkBeneficiaryAuth
          ? _self.checkBeneficiaryAuth
          : checkBeneficiaryAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkEditBeneficiaryAuth: null == checkEditBeneficiaryAuth
          ? _self.checkEditBeneficiaryAuth
          : checkEditBeneficiaryAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkEditCustomerAuth: null == checkEditCustomerAuth
          ? _self.checkEditCustomerAuth
          : checkEditCustomerAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkCustomerAuth: null == checkCustomerAuth
          ? _self.checkCustomerAuth
          : checkCustomerAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkPaymentAuth: null == checkPaymentAuth
          ? _self.checkPaymentAuth
          : checkPaymentAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTransactionAuth: null == checkTransactionAuth
          ? _self.checkTransactionAuth
          : checkTransactionAuth // ignore: cast_nullable_to_non_nullable
              as bool,
      BankTransferMTO: null == BankTransferMTO
          ? _self.BankTransferMTO
          : BankTransferMTO // ignore: cast_nullable_to_non_nullable
              as bool,
      allowUpdateKYC: null == allowUpdateKYC
          ? _self.allowUpdateKYC
          : allowUpdateKYC // ignore: cast_nullable_to_non_nullable
              as bool,
      multiDeviceLogin: null == multiDeviceLogin
          ? _self.multiDeviceLogin
          : multiDeviceLogin // ignore: cast_nullable_to_non_nullable
              as bool,
      amlForTransaction: null == amlForTransaction
          ? _self.amlForTransaction
          : amlForTransaction // ignore: cast_nullable_to_non_nullable
              as bool,
      preBgFromPromotion: null == preBgFromPromotion
          ? _self.preBgFromPromotion
          : preBgFromPromotion // ignore: cast_nullable_to_non_nullable
              as bool,
      loyalty: null == loyalty
          ? _self.loyalty
          : loyalty // ignore: cast_nullable_to_non_nullable
              as bool,
      enableBiometric: null == enableBiometric
          ? _self.enableBiometric
          : enableBiometric // ignore: cast_nullable_to_non_nullable
              as bool,
      remittanceLimitPopup: null == remittanceLimitPopup
          ? _self.remittanceLimitPopup
          : remittanceLimitPopup // ignore: cast_nullable_to_non_nullable
              as bool,
      blockZerosInNid: null == blockZerosInNid
          ? _self.blockZerosInNid
          : blockZerosInNid // ignore: cast_nullable_to_non_nullable
              as bool,
      ForceUpdate: null == ForceUpdate
          ? _self.ForceUpdate
          : ForceUpdate // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableGallery: null == EnableGallery
          ? _self.EnableGallery
          : EnableGallery // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableFile: null == EnableFile
          ? _self.EnableFile
          : EnableFile // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableTrackRemittance: null == EnableTrackRemittance
          ? _self.EnableTrackRemittance
          : EnableTrackRemittance // ignore: cast_nullable_to_non_nullable
              as bool,
      EnablePaymentSound: null == EnablePaymentSound
          ? _self.EnablePaymentSound
          : EnablePaymentSound // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableSetForexBooking: null == EnableSetForexBooking
          ? _self.EnableSetForexBooking
          : EnableSetForexBooking // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableSwipeButton: null == EnableSwipeButton
          ? _self.EnableSwipeButton
          : EnableSwipeButton // ignore: cast_nullable_to_non_nullable
              as bool,
      EnableTermsForInternalPages: null == EnableTermsForInternalPages
          ? _self.EnableTermsForInternalPages
          : EnableTermsForInternalPages // ignore: cast_nullable_to_non_nullable
              as bool,
      currencyDecimalLength: freezed == currencyDecimalLength
          ? _self.currencyDecimalLength
          : currencyDecimalLength // ignore: cast_nullable_to_non_nullable
              as int?,
      forexDecimalLength: null == forexDecimalLength
          ? _self.forexDecimalLength
          : forexDecimalLength // ignore: cast_nullable_to_non_nullable
              as String,
      mobileMinLength: null == mobileMinLength
          ? _self.mobileMinLength
          : mobileMinLength // ignore: cast_nullable_to_non_nullable
              as int,
      mobileMaxLength: null == mobileMaxLength
          ? _self.mobileMaxLength
          : mobileMaxLength // ignore: cast_nullable_to_non_nullable
              as int,
      nidMaxLength: null == nidMaxLength
          ? _self.nidMaxLength
          : nidMaxLength // ignore: cast_nullable_to_non_nullable
              as int,
      nidMinLength: null == nidMinLength
          ? _self.nidMinLength
          : nidMinLength // ignore: cast_nullable_to_non_nullable
              as int,
      highlitedColor: freezed == highlitedColor
          ? _self.highlitedColor
          : highlitedColor // ignore: cast_nullable_to_non_nullable
              as String?,
      complementaryColr: freezed == complementaryColr
          ? _self.complementaryColr
          : complementaryColr // ignore: cast_nullable_to_non_nullable
              as String?,
      accentColor: freezed == accentColor
          ? _self.accentColor
          : accentColor // ignore: cast_nullable_to_non_nullable
              as String?,
      themeSecondary: freezed == themeSecondary
          ? _self.themeSecondary
          : themeSecondary // ignore: cast_nullable_to_non_nullable
              as String?,
      themePrimary: freezed == themePrimary
          ? _self.themePrimary
          : themePrimary // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryDocID: null == primaryDocID
          ? _self.primaryDocID
          : primaryDocID // ignore: cast_nullable_to_non_nullable
              as String,
      primaryDocIDName: null == primaryDocIDName
          ? _self.primaryDocIDName
          : primaryDocIDName // ignore: cast_nullable_to_non_nullable
              as String,
      currenciesForBeneficiaries: null == currenciesForBeneficiaries
          ? _self.currenciesForBeneficiaries
          : currenciesForBeneficiaries // ignore: cast_nullable_to_non_nullable
              as String,
      requiredVPNDetection: null == requiredVPNDetection
          ? _self.requiredVPNDetection
          : requiredVPNDetection // ignore: cast_nullable_to_non_nullable
              as bool,
      enableScreenMirrorDetection: null == enableScreenMirrorDetection
          ? _self.enableScreenMirrorDetection
          : enableScreenMirrorDetection // ignore: cast_nullable_to_non_nullable
              as bool,
      isRenewKYCAfterOneYear: null == isRenewKYCAfterOneYear
          ? _self.isRenewKYCAfterOneYear
          : isRenewKYCAfterOneYear // ignore: cast_nullable_to_non_nullable
              as bool,
      enableEncryption: null == enableEncryption
          ? _self.enableEncryption
          : enableEncryption // ignore: cast_nullable_to_non_nullable
              as bool,
      mobileSessionTimeout: null == mobileSessionTimeout
          ? _self.mobileSessionTimeout
          : mobileSessionTimeout // ignore: cast_nullable_to_non_nullable
              as String,
      requiredAgentStatus: null == requiredAgentStatus
          ? _self.requiredAgentStatus
          : requiredAgentStatus // ignore: cast_nullable_to_non_nullable
              as bool,
      requiredCurrencySymbol: null == requiredCurrencySymbol
          ? _self.requiredCurrencySymbol
          : requiredCurrencySymbol // ignore: cast_nullable_to_non_nullable
              as bool,
      receiptHeaderAlignment: null == receiptHeaderAlignment
          ? _self.receiptHeaderAlignment
          : receiptHeaderAlignment // ignore: cast_nullable_to_non_nullable
              as String,
      primaryUI: null == primaryUI
          ? _self.primaryUI
          : primaryUI // ignore: cast_nullable_to_non_nullable
              as AppUI,
    ));
  }
}

// dart format on
