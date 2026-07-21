class NetworkConstant {
  static const String validateLogin = "validatelogin";
  static const String beneficiaries = "getbeneficiarylist";
  static const String transactions = "transactions";
  static const String getQueryTypes = "getquerytype";
  static const String getpromotionlist = "getpromotionlist";
  static const String deRegisterDevice = "rmaderegisterdevice";
  static const String validateClientPreference = "validateclientpreference";
  static const String transactionDetails = "transactiondetails";
  static const String forgotPassword = "forgotpassword";
  static const String validateOTP = "validateotp";
  static const String validateOTPRma = "rmavalidateotp";
  static const String changeLoginCredential = "changecredential";
  static const String organisationDetails = "rmacompanydetails";
  static const String contactUs = "rmacontactus";
  static const String customerDetails = "getcustomerdetails";
  static const String getRate = "getrate";
  static const String getRateAlert = "GetRateAlert";
  static const String sendMoney = "rmasendmoney";
  static const String renderpaymentgateway = "renderpaymentgateway";
  static const String confirmTransaction = "confirmtransaction";
  static const String makeAvailableTransaction = "makeavailabletransaction";
  static const String cancelTransaction = "rmacanceltransaction";
  static const String notifications = "getinappnotifications";
  static const String setNotification = "setinappnotificationdetails";
  static const String addBeneficiary = "addbeneficiary";
  static const String updateBeneficiary = "rmaupdatebeneficiary";
  static const String beneficiaryTask = "beneficiarytasks";
  static const String registerDevice = "registerdevice";
  static const String addCustomer = "addnewcustomer";
  static const String getCatalogue = "getcatalogue";
  static const String getcataloguedetails = "getcataloguedetails";
  static const String getRemitCurrency = "getremitcurrency";
  static const String getServiceProvider = "GetServiceProvider";
  static const String getServiceProvider1 = "getserviceprovider";
  static const String createAlert = "createalert";
  static const String paymentModes = "getavailablepaymentmodes";
  static const String paymentgateway = "getpaymentmode";
  static const String paymentModeBanks = "getpaymentmodebanks";
  static const String getSource = "listsourceoffunds";
  static const String sendFeedback = "setfeedback";
  static const String transactionComplaint = "postenquiry";
  static const String getEnquiry = "getEnquiry";
  static const String branchLocator = "rmabranchlocator";
  static const String notificationAlert = "notificationalert";
  static const String documentUpload = "documentupload";
  static const String updateCustomerProfile = "updatecustomerprofile";
  static const String getUploadedDocument = "getdocumentuploaded";
  static const String uploadMedia = "uploadFiles";
  static const String getPurposes = "getpurpose";
  static const String getIdExpiry = "idexpirydatelimits";

  // static const String getBanks = "getbanks";
  // static const String getBanks2 = "getbanks2";
  static const String getBanks3 = "getorganization";
  static const String currencyCalculator = "currencycalculator";
  static const String getRateCharge = "getratecharge";

  // static const String getBeneficiaryBankBranches = "getbeneficiarybankbranches";
  // static const String getBeneficiaryBankBranches2 = "getbeneficiarybankbranches2";
  static const String getBeneficiaryBankBranches3 = "getbranches";
  static const String getOrganisationBanking = "getorganisationbanking";
  static const String loginNotification = "loginnotification";
  static const String setLoginCredentials = "setlogincredentials";
  static const String faq = "getfaq";
  static const String validateCredentials = "validatecredentialpostlogin";
  static const String validateDevice = "validatedevice";
  static const String validateIdRegistration = "validateidregistration";
  static const String getGuestRate = "getguestrate";

  //static const String promotions = "promotions";
  static const String promotions = "rmaadvertisements";

  static const String news = "getnews";

  static const String privacyPolicy = "rmaprivacypolicy";
  static const String aboutUs = "rmaaboutus";

  static const String termsAndConditions = "rmatermsandcondition";
  static const String renderPaymentUI = "renderUI";
  static const String activateToken = "activatetoken";
  static const String resetPassword = "resetpassword";
  static const String resetMPIN = "resetmpin";
  static const String createOTP = "createotp";
  static const String getUserDocumentDetails = "getuserdocumentdetails";
  static const String fetchUAEPassDoc = "fetchuaepassdoc";
  static const String validateUUID = "validateuuid";
  static const String resendOTP = "resendotp";
  static const String resendOTPRma = "rmaresendotp";

  static const String validateAML = 'validateaml';

  static const String uaePassEKYCDetails = "ekycuserdetails";

  // static const String readNotification = "changenotificationreadstatus";
  static const String validateUsername = 'validateusername';
  static const String forgotUsername = 'forgotusername';

  // static const String serviceCountry = "getservicecountry";
  // static const String serviceCurrency = "getservicecurrency";
  static const String debitBanks = 'getdebitbanks';

  static const String createMailOTP = 'createemailotp';
  static const String validateCustomerInformation = 'validatecustomerinfo';

  static const setForexBooking = 'setforexbooking';

  // UAEPASS
  // static const String createUaePassAccessToken = 'token';
  static const String createUaePassAccessToken = 'token';
  static const String getUaePassUserInfo = 'userinfo';

  // cb limit notification api
  static const String cblimits = 'cblimits';
  static const String getProviderFields = 'getproviderfields';
  static const String providerCountryValidation = 'getprovidercountryvalidation';

  static const String deactivateSession = 'deactivatesession';

  // new headers
  static const contentSecurityPolicyValue = "default-src 'self'";
  static const contentXContentTypeOptionsValue = 'nosniff';
  static const contentXFrameOptionsValue = 'DENY';
  static const contentXXSSProtectionValue = '1; mode=block';
  static const contentStrictTransportSecurityValue = 'max-age=31536000; includeSubDomains';
  static const contentReferrerPolicyValue = 'no-referrer';
  static const contentPermissionsPolicyValue = 'geolocation=(self), microphone=()';

  static const contentSecurityPolicyKey = "Content-Security-Policy";
  static const contentXContentTypeOptionsKey = 'X-Content-Type-Options';
  static const contentXFrameOptionsKey = 'X-Frame-Options';
  static const contentXXSSProtectionKey = 'X-XSS-Protection';
  static const contentStrictTransportSecurityKey = 'Strict-Transport-Security';
  static const contentReferrerPolicyKey = 'Referrer-Policy';
  static const contentPermissionsPolicyKey = 'Permissions-Policy';

  // vapt
  static const String safeQuery = 'SafeQuery';
  static const String safeQueryV1 = 'SafeQueryV1';
}
