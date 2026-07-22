import 'package:freezed_annotation/freezed_annotation.dart';

// ignore_for_file: non_constant_identifier_names

part 'settings_fz.freezed.dart';
part 'settings_fz.g.dart';

@freezed
abstract class SettingsFZ with _$SettingsFZ {
  factory SettingsFZ.fromJson(Map<String, Object?> json) =>
      _$SettingsFZFromJson(json);

  const factory SettingsFZ({
    // system
    @JsonKey(name: 'APP_VERSION') @Default('') String appVersion,

    ///auth part
    //beneficiary auth type
    @JsonKey(name: 'ADD_BENEFICIARY_AUTHENTICATION')
    @Default('')
    String authBenfAdd,
    // transaction auth type
    @JsonKey(name: 'TRASNACTION_AUTHENTICATION')
    @Default('')
    String authRemittance,
    // edit beneficiary auth type
    @JsonKey(name: 'EDIT_BENEFICIARY_AUTHENTICATION')
    @Default('')
    String authBenfEdit,

    // customer reg auth type
    @JsonKey(name: 'CUSTOMER_REGISTRATION_AUTHENTICATION')
    @Default('')
    String addCustomerAuthType,
    // min age for customer registration
    @JsonKey(name: 'ALLOWED_MINIMUM_AGE') @Default('18') String allowedMinAge,
    // edit customer / profile reg auth type
    @JsonKey(name: 'EDIT_CUSTOMER_AUTHENTICATION')
    @Default('')
    String editCustomerAuthType,
    @JsonKey(name: 'LOGIN_AUTHENTICATION_PRIMARY')
    @Default('')
    String LOGINAUTHENTICATIONPRIMARY,
    @JsonKey(name: 'LOGIN_AUTHENTICATION_SECONDARY')
    @Default('')
    String LOGINAUTHENTICATIONSECONDARY,
    @JsonKey(name: 'LOGIN_AUTHENTICATION_TWOFACTOR')
    @Default('')
    String LOGINAUTHENTICATIONTWOFACTOR,
    @JsonKey(name: 'REQUIRED_LOGIN_METHODS')
    @Default('DEFAULT')
    String REQUIREDLOGINMETHODS,
    @JsonKey(name: 'COUNTRY_DIALING_CODE')
    @Default('')
    String COUNTRYDIALINGCODE,

    ///personalization part
    // client logo
    @JsonKey(name: 'CLIENT_LOGO') @Default('') String clientLogo,
    // client name
    @JsonKey(name: 'CLIENT_NAME') @Default('') String clientName,
    // app theme primary and secondary
    @JsonKey(name: 'THEME_COLORS') String? THEMECOLORS,
    //add beneficiary allow
    @JsonKey(name: 'ALLOW_ADD_BENEFECIARY') @Default(false) bool enableAddBenf,
    // edit beneficiary allow
    @JsonKey(name: 'ALLOW_EDIT_BENEFECIARY')
    @Default(false)
    bool enableEditBenf,
    // edit customer / edit profile allow
    @JsonKey(name: 'ALLOW_EDIT_CUSTOMER')
    @Default(false)
    bool enableEditProfile,
    // enable deregister device allow
    @JsonKey(name: 'ALLOW_LOGIN_DEREGISTRATION_BYCUSTOMER')
    @Default(false)
    bool enableDeRegistration,
    // ocr required allow
    @JsonKey(name: 'ALLOW_OCR_PARSING') @Default(false) bool ocrRequired,
    // service allowed on country or if blank then it for all
    @JsonKey(name: 'ALLOWED_COUNTRY')
    @Default('')
    String countriesForBeneficiaries,
    // enable multi device login
    @JsonKey(name: 'ALLOWED_NOOFDEVICE_REGISTRATION')
    @Default('')
    String multiDeviceLoginLength,
    // enable promotion to dashboard
    @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_DASHBOARD')
    @Default(false)
    bool enablePromotionDashboard,
    // enable prelogin promotion
    @JsonKey(name: 'REQUIRED_ADVTCAROUSAL_AT_LOGIN')
    @Default(false)
    bool enablePromotionPreLogin,
    // enable branch locator
    @JsonKey(name: 'REQUIRED_BRANCHLOCATOR')
    @Default(false)
    bool enableBranchLocator,
    // kyc type normal or uaepass
    @JsonKey(name: 'REQUIRED_EKYC_METHOD') @Default('') String processEkycAs,
    @JsonKey(name: 'REQUIRED_EKYC_UPDATE_METHOD')
    @Default('')
    String REQUIREDEKYCUPDATEMETHOD,
    @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_DASHBOARD')
    @Default(false)
    bool REQUIREDNEWSATPREDASHBOARD,
    @JsonKey(name: 'REQUIRED_NEWS_AT_PRE_LOGIN')
    @Default(false)
    bool REQUIREDNEWSATPRELOGIN,
    // pre login required
    @JsonKey(name: 'REQUIRED_PRELOGIN') @Default(false) bool preLogin,
    // create alert screen required
    @JsonKey(name: 'REQUIRED_CREATEALERT')
    @Default(false)
    bool enableCreateAlert,
    // enable utility feature from list
    @JsonKey(name: 'REQUIRED_UTILITY') @Default('') String enableUTILITY,
    // enable vat
    @JsonKey(name: 'REQUIRED_VAT') @Default(false) bool enableVat,
    // enable whats app
    @JsonKey(name: 'REQUIRED_WHATSAPPCHAT')
    @Default(false)
    bool enableWhatsAppChat,
    // enable loyalty offers
    @JsonKey(name: 'REQUIRED_LOYALTYTEST') @Default(false) bool enableLoyalty,
    // check beneficiary auth enable or not
    @JsonKey(name: 'REQUIRED_NEWBENEFICARY_AUTHORIZATION')
    @Default(false)
    bool checkBeneficiaryAuth,
    // check edit beneficiary auth enable or not
    @JsonKey(name: 'REQUIRED_EDITBENEFICARY_AUTHORIZATION')
    @Default(false)
    bool checkEditBeneficiaryAuth,
    // check edit customer auth enable or not
    @JsonKey(name: 'REQUIRED_EDITCUSTOMER_AUTHORIZATION')
    @Default(false)
    bool checkEditCustomerAuth,
    // check customer auth enable or not
    @JsonKey(name: 'REQUIRED_NEWCUSTOMER_AUTHORIZATION')
    @Default(false)
    bool checkCustomerAuth,
    // check payment auth enable or not
    @JsonKey(name: 'REQUIRED_PAYMENT_AUTHORIZATION')
    @Default(false)
    bool checkPaymentAuth,
    // check transaction auth enable or not
    @JsonKey(name: 'REQUIRED_TRANSACTION_AUTHORIZATION')
    @Default(false)
    bool checkTransactionAuth,

    ////
    ///
    //
    // handle from backend
    @JsonKey(name: 'ALLOW_BANK_TRANSFER_MTO')
    @Default(false)
    bool BankTransferMTO,
    // @JsonKey(name: 'ALLOW_KYC_UPDATE') @Default(false) bool isRenewKYCAfterOneYear,
    // handle from backend in login
    @JsonKey(name: 'ALLOW_RENEW_KYC_AFTER_ONE_YEAR')
    @Default(false)
    bool allowUpdateKYC,
    @JsonKey(name: 'ALLOW_MULTI_DEVICE_LOGIN')
    @Default(false)
    bool multiDeviceLogin,
    // handle from backend
    @JsonKey(name: 'ALLOW_AML_TRANSACTION')
    @Default(false)
    bool amlForTransaction,
    @JsonKey(name: 'ALLOW_PRE_BG_FROM_PROMOTION')
    @Default(false)
    bool preBgFromPromotion,
    // implement in future
    @JsonKey(name: 'ALLOW_LOYALTY') @Default(false) bool loyalty,
    @JsonKey(name: 'ALLOW_BIOMETRIC') @Default(false) bool enableBiometric,

    // from form rule
    @JsonKey(name: 'Required_remittance_limit_popup')
    @Default(false)
    bool remittanceLimitPopup,
    @JsonKey(name: 'ALLOW_ZERO_IN_NATIONAL_ID')
    @Default(false)
    bool blockZerosInNid,
    @JsonKey(name: 'ALLOW_FORCE_UPDATE') @Default(false) bool ForceUpdate,
    @JsonKey(name: 'ALLOW_GALLERY') @Default(false) bool EnableGallery,
    @JsonKey(name: 'ALLOW_FILE') @Default(false) bool EnableFile,
    // this for all client
    @JsonKey(name: 'ALLOW_TRACK_REMITTANCE')
    @Default(false)
    bool EnableTrackRemittance,
    @JsonKey(name: 'ALLOW_PAYMENT_SOUND')
    @Default(false)
    bool EnablePaymentSound,
    // this for all client
    @JsonKey(name: 'ALLOW_SET_FOREX_BOOKING')
    @Default(false)
    bool EnableSetForexBooking,
    @JsonKey(name: 'ALLOW_SWIPE_BUTTON') @Default(false) bool EnableSwipeButton,
    // this for all client
    @JsonKey(name: 'ALLOW_TERMS_FOR_INTERNAL_PAGES')
    @Default(false)
    bool EnableTermsForInternalPages,

    // handle from backend
    @JsonKey(name: 'CURRENCY_DECIMAL_LENGTH') int? currencyDecimalLength,
    @JsonKey(name: 'FOREX_DECIMAL') @Default('7') String forexDecimalLength,
    // from form rule
    @JsonKey(name: 'MOBILE_MIN_LENGTH') @Default(9) int mobileMinLength,
    // from form rule
    @JsonKey(name: 'MOBILE_MAX_LENGTH') @Default(15) int mobileMaxLength,
    // from form rule
    @JsonKey(name: 'NATIONAL_ID_MAX_LENGTH') @Default(15) int nidMaxLength,
    // from form rule
    @JsonKey(name: 'NATIONAL_ID_MIN_LENGTH') @Default(7) int nidMinLength,
    // @JsonKey(name: 'SWIPE_BUTTON_COLOR') @Default('FFFFFFFF') String SWIPECOLORNO,
    @JsonKey(name: 'HIGHLIGHT_THEME_COLOR')
    @Default('FFFFFFFF')
    String? highlitedColor,
    @JsonKey(name: 'COMPLEMENTARY_THEME_COLOR')
    @Default('FFFFFFFF')
    String? complementaryColr,
    @JsonKey(name: 'ACCENT_THEME_COLOR')
    @Default('FF189AB4')
    String? accentColor,
    @JsonKey(name: 'SECONDARY_THEME_COLOR')
    @Default('FF75E6DA')
    String? themeSecondary,
    @JsonKey(name: 'PRIMARY_THEME_COLOR')
    @Default('FF05445e')
    String? themePrimary,
    @JsonKey(name: 'PRIMARY_DOCUMENT_IDTYPECODE')
    @Default('')
    String primaryDocID,
    @JsonKey(name: 'PRIMARY_DOCUMENT_ID_NAME')
    @Default('')
    String primaryDocIDName,
    @JsonKey(name: 'ALLOWED_CURRENCY')
    @Default('')
    String currenciesForBeneficiaries,
    @JsonKey(name: "REQUIRED_VPN_DETECTION")
    @Default(false)
    bool requiredVPNDetection,
    @JsonKey(name: "EnableScreenMirrorDetection")
    @Default(false)
    bool enableScreenMirrorDetection,
    @JsonKey(name: "IsRenewKYCAfterOneYear")
    @Default(false)
    bool isRenewKYCAfterOneYear,
    @JsonKey(name: "EnableEncryption") @Default(false) bool enableEncryption,
    @JsonKey(name: 'SESSION_TIMEOUT') @Default("5") String mobileSessionTimeout,
    @JsonKey(name: "REQUIRED_AGENT_STATUS")
    @Default(false)
    bool requiredAgentStatus,
    @JsonKey(name: "REQUIRED_CURRENCY_SYMBOL")
    @Default(true)
    bool requiredCurrencySymbol,
    @JsonKey(name: "RECEIPT_HEADER_ALIGNMENT")
    @Default("center")
    String receiptHeaderAlignment,
    @JsonKey(name: "UI_TEMPLATE")
    @AppUIConverter()
    @Default(AppUI.defaultUI)
    AppUI primaryUI,
  }) = _SettingsFZ;
}

enum AppUI {
  uiOne('UIOne'),
  uiTwo('UITwo'),
  uiThree('UIThree'),
  uiFour('UIFour'),
  uiFive('UIFive'),
  uiSix('UISix'),
  uiSeven('UISeven'),
  defaultUI('default');

  final String value;

  const AppUI(this.value);

  static AppUI fromString(String value) {
    return AppUI.values.firstWhere(
      (type) => type.value == value,
      orElse: () => AppUI.defaultUI,
    );
  }
}

extension AppUIMatcher on AppUI {
  T when<T>({
    required T Function() uiOne,
    required T Function() uiTwo,
    required T Function() uiThree,
    required T Function() uiFour,
    required T Function() uiFive,
    required T Function() uiSix,
    required T Function() uiSeven,
    required T Function() defaultUI,
  }) {
    return switch (this) {
      AppUI.uiOne => uiOne(),
      AppUI.uiTwo => uiTwo(),
      AppUI.uiThree => uiThree(),
      AppUI.uiFour => uiFour(),
      AppUI.uiFive => uiFive(),
      AppUI.uiSix => uiSix(),
      AppUI.uiSeven => uiSeven(),
      AppUI.defaultUI => defaultUI(),
    };
  }
}

class AppUIConverter implements JsonConverter<AppUI, String> {
  const AppUIConverter();

  @override
  AppUI fromJson(String json) {
    return AppUI.fromString(json);
  }

  @override
  String toJson(AppUI object) {
    return object.value;
  }
}
