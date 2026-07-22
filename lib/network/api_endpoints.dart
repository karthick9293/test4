class APIEndPoints {
  static const String tokenGen = "gettoken";
  static const String companySettings = "getcompanysettings";
  static const String privacyPolicy = "getprivacypolicy";
  static const String termsAndConditions = "GetTermsAndCondition";
  static const String aboutUs = "getaboutus";
  static const String getNews = "getnews";
  static const String contactDetails = "GetContactDetails";
  static const String branchLocator = "GetBranchLocator";
  static const String faq = "getfaq";
  static const String dashboardCurrency = "GetCurrencyWithImage";
  static const String guestRate = "GetRate";
  static const String getratealerts = "getratealerts";
  static const String getRateCharge = "GetCharges";
  static const String advertisement = "getadvertisements";
  static const String getAllCurrencyRate = "getallcurrencyrate";
  static const String masterDetails = "getmasters";
  static const String getBankRouting = "getbankroutingcriteriadetailslist";
  static const String getService = "GetService";
  static const String getRateAlerts = "GetRateAlerts";
  static const String setratealerts = "setratealerts";
  static const String rateCalculator = "ratecalculator";
  static const String getCustomer = "GetCustomer";
  static const String syncBeneficiaries = "syncbeneficiaries";
  static const String updateCustomerDetails = "updatecustomerdetails";
  static const String correspondent = "GetCorrespondent";

  /// Bank
  static const String getBanks = "listbank";
  static const String getBranches = "listbranch";
  static const String moneyServiceProvider = "listserviceprovider";
  static const String validateAccountNoLength = "validateaccountlength";

  static const String getDraweeBank = "GetDraweeBank";

  /// Transaction
  static const String postTransaction = "PostTransaction";
  static const String transactions = "GetTransactions";
  static const String validateAML = "validateAML";
  static const String addBeneficiary = "AddBeneficiary";
  static const String beneficiaries = "getbeneficiarydetails";
  static const String beneficiaryTask = "managebeneficiary";
  static const String getBicMandatoryField = "GetBicMandatoryField";
  static const String getSource = "GetSource";
  static const String getPurpose = "listpurpose";
  static const String listserviceprovider = "listserviceprovider";
  static const String setBeneficiaryPreference = "SetBeneficiaryPreference";
  static const String getPaymentMode = "GetPaymentMode";
  static const String sendFeedback = "SetFeedBack";
  static const String postRateBookingRequest = "postratebookingrequest";
  static const String getratesCharges = "getrates&charges";

  static const String postEnquiry = "postenquiry";

  ///Login
  static const String generateOTP = "resendotp";
  static const String validateOTP = "ValidateOTP";
  static const String validateUserName = "rmavalidateusername";

  static const String deActivateLogin = "DeActivateLogin";
  static const String deRegisterDevice = "DeRegisterDevice";
  static const String setCredential = "setCredential";
  static const String resetCredential = "ResetCredential";
  static const String registerDevice = "RegisteDevice";

  static const String postValidateLogin = "postvalidatelogin";
  static const String postDigitalAddCustomer = "postdigitaladdcustomer";

  /// Settings Admin
  static const String getApplicationSettings = "getapplicationsetting";

  /// form rules
  static const String getFormRules = "getformrulessetting";
  static const String getCMS = "getcms";

  /// document upload api
  static const String postDocumentUpload = "uploaddigitalekycdata";
  static const String uploadcustomerdocuments = "uploadcustomerdocuments";
  static const String rmaekycdocuments = "rmaekycdocuments";
  static const String forgotPassword = "forgotcredential";

  /// notifications part
  static const String notificationModuleType = "gettemplatemodule";
  static const String notificationEventType = "geteventtype";
  static const String inAppNotification = "getnotifications";
  static const String sendReceiptAsEmail = "sendreceiptasemail";

  static const String storeToken = "digitalactivatetoken";
  static const String rmaCreateOtp = "rmacreateotp";
  static const String getCurrencySymbol = "getcurrencysymbol";
  static const String getApiTransactionStatus = "getapitransactionstatus";

  /// State and city
  static const String listState = "liststate";
  static const String listCity = "listcity";

}

/// Catalog type
class CatalogType {
  static const String NATIONALITY = 'NATIONALITY';
  static const String RELATIONSHIP = 'RELATIONSHIP';
  static const String ROUTINGCATEGORY = 'ROUTINGCATEGORY';
  static const String IDTYPE = 'IDTYPE';
  static const String COUNTRY = 'COUNTRY';
  static const String PROFESSION = 'PROFESSION';
  static const String EMPLOYER = 'EMPLOYER';
  static const String CURRENCY = 'CURRENCY';
  static const String SERVICECATEGORY = 'SERVICECATEGORY';
}

/// Service Type code
class ServiceType {
  static const String CASH_PICKUP = "C";
  static const String BANK_TRANSFER = "B";
  static const String WALLET_TRANNSFER = "W";
}

class OtpType {
  static const String CREATE_ADDBENEFICIARY_OTP = "CREATE_ADDBENEFICIARY_OTP";
  static const String CREATE_ADDNEWCUSTOMER_OTP = "CREATE_ADDNEWCUSTOMER_OTP";
  static const String CREATE_CUSTOMEREMAIL_OTP = "CREATE_CUSTOMEREMAIL_OTP";
  static const String CREATE_TRANSACTION_OTP = "CREATE_TRANSACTION_OTP";
  static const String CREATE_FORGOT_MPIN_OTP = "CREATE_FORGOT_MPIN_OTP";
}
