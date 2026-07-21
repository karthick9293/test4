import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:app_links/app_links.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:device_safety_info/new_version_check.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:mobiremit/core/uae_pass_login_handler.dart';
import 'package:mobiremit/models/Enquiry/enquiry_fz.dart';
import 'package:mobiremit/models/cblimit/cblimit_fz.dart';
import 'package:mobiremit/models/customer_ekyc/customer_ekyc.dart';
import 'package:mobiremit/models/forgot_password/forgotPassword.dart';
import 'package:mobiremit/models/transaction_details/transaction_details_fz.dart';
import 'package:mobiremit/network/api_endpoints.dart';
import 'package:open_store/open_store.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:mobiremit/others/app_environments.dart';

import '../../flavors.dart';
import '../../main.dart';
import '../../models/all_rates/all_rates_fz.dart';
import '../../models/contact_us/contact_us_fz.dart';
import '../../models/customer_details/customer_data_fz.dart';
import '../../models/faq/faqfz.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../../models/rate_calculator/rate_calculator_fz.dart';
import '../../models/uae_pass/fetch_uae_pass_doc.dart';
import '../../models/uae_pass/uae_pass_profile_fz.dart';
import '../../network/api_service_new.dart';
import '../../ui_common/forgot_login_otp.dart';
import '../../ui_one/custom_widgets/error_alert.dart';
import '../../ui_one/screens/sign_up/nid_alerts.dart';
import '../editing_controllers.dart/attributes.dart';
import '../exports/controllers.dart';
import '../exports/ui_one_custom_widgets.dart';
import '../exports/ui_one_pages.dart';
import '../flavours/constants.dart';
import '../models/security_page_parameters.dart';

class AccountController extends GetxController {
  CarouselSliderController sliderController = CarouselSliderController();
  SignUpAttributes signUpAttributes = SignUpAttributes();
  List<MasterResponseFZ> currencies = [], dashboardCurrencies = [];
  ForexBookingAttributes? fBA;
  CreateAlertAttributes remittanceAttributes = CreateAlertAttributes(),
      forexAttributes = CreateAlertAttributes(),
      setForexAttributes = CreateAlertAttributes();
  FormRulesData? myProfileFormBV,
      forgotMpinFormBV,
      changeMpinFormBV,
      forgotPasswordFormFZ,
      changePasswordFormFZ,
      forgotUsernameFormFZ;
  bool showNewPwd = true, showCnfPwd = true;
  FormParameters form = FormParameters(type: FormType.myProfile);

  FormParameters forgotMpinForm = FormParameters(type: FormType.forgotMpin);
  FormParameters changeMpinForm = FormParameters(type: FormType.changeMpin);

  FormParameters forgotPasswordForm =
      FormParameters(type: FormType.forgotPassword);
  FormParameters changePasswordForm =
      FormParameters(type: FormType.changePassword);

  FormParameters forgotUsernameForm =
      FormParameters(type: FormType.forgotUsername);

  int starCount = 0;
  int index = 0;
  int? loginNotificationIndex;
  String stepOrderID = "";
  FormType? pageRouting;

  RxBool feedbackStatus = false.obs;
  bool retryLoading = false;

  String forexType = 'buy',
      currencyRatesType = 'rates',
      downloadStatus = '',
      buyRate = '',
      sellRate = '';

  bool loading = false,
      loginLoader = false,
      uaeLButtonLoading = false,
      // rememberMe = true,
      completingKYC = false,
      showIDFront = false,
      showIDBack = false;
  int forgotPageCount = 0;
  int forgotUserPageCount = 0;

  RxInt idSideActiveIdx = 0.obs;

  ThemeType themeType = Box3.theme;
  KYCStatus kycStatus = Box3.kycStatus;
  LoginAttributes ltc = LoginAttributes();
  ChangePasswordAttributes attributes = ChangePasswordAttributes();

  FeedbackControllers feedbackControllers = FeedbackControllers();
  ForgotPasswordTextControllers fptc = ForgotPasswordTextControllers();
  bool isDark = Box3.theme == ThemeType.dark
      ? true
      : Box3.theme == ThemeType.light
          ? false
          : WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark;
  TextEditingController //forexRateSearchController = TextEditingController(),
      fromAmtCtrl = TextEditingController(text: '1'),
      toAmtCtrl = TextEditingController(),
      idLabelController = TextEditingController(),
      transLimitCtrlr = TextEditingController();
  String? fromCur = APIConstants.currency;
  MasterResponseFZ? toCur;
  MasterResponseFZ? remittanceToCur;
  MasterResponseFZ? forexToCur;
  MasterResponseFZ? calculatorToCur;

  FocusNode faqNode = FocusNode();
  SecuritySettingsParams ssp = SecuritySettingsParams();
  double forgotPwdStrength = 0;
  List<int> years =
      Iterable<int>.generate(100, (i) => i = DateTime.now().year - i).toList();
  List<int> months = Iterable<int>.generate(12, (i) => i + 1).toList();
  bool buttonLoading = false,
      button2Loading = false,
      myProfileFormLoading = false;

  AppStatus appStatus = Box3.status;
  String? postLoginDestination;

  XFile? profilePhoto;

  CBLimitFz? cbLimit;

  /// PreLogin AppDrawer tile
  List<BranchDetail>? branches;

  ContactUsFz? contactUs; //By Rahul
  List<CurrencyRateList>? rates;
  List<CurrencyRateList>? filterRates;

  List<FaqResponselist>? faqs;
  String? privacyPolicy, termsAndConditions, aboutUS;
  String oneUnitRate = '-', oneRemRate = '-', oneForRate = '-';

  CustomerDataFZ? customerDetails;
  CustomerEkyc? customerEKYC;
  String? frontImage;
  String? backImage;
  Rxn<String> selfieImage = Rxn<String>();
  Map<String, dynamic> docIds = {};
  int imageFetchCount = 1;
  bool _isFetchingImage = false;

  bool branchFailed = false,
      contactUsFailed = false,
      customerDetailsFailed = false,
      faqFailed = false,
      aboutUSFailed = false,
      termsAndConditionsFailed = false,
      privacyPolicyFailed = false;

  /// otp part
  TextEditingController mobOTP = TextEditingController();
  bool isResend = false;
  bool sending = false;
  int timeToResend = 60;
  Timer? otpTimer;
  String errorText = '';

  Future<void> userLogout() async {
    Get.find<AccountController>()
      ..isYesNoLoader = false
      ..update();
    await ApiService().logoutApp();
    Get.find<AccountController>()
      ..isYesNoLoader = false
      ..selfieImage.value = null
      ..update();

    Get.find<DataController>().clear();
    Get.offAllNamed(
        (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);
    Get.find<MainController>()
      ..pages.clear()
      ..appBars.clear()
      ..push(const DashBoardPage(), dashBoardAppbar())
      ..update();
    errorAlert(title: "Success", content: "Successfully logged out");
  }

  Future<void> onUserBlocked({String? title, String? content}) async {
    Get.find<MainController>()
      ..pages.clear()
      ..appBars.clear()
      ..push(AppRoutes.getPage(AppRoutes.dashboard), dashBoardAppbar())
      ..update();

    if (Get.isRegistered<AccountController>()) {
      Get.find<AccountController>().selfieImage.value = null;
    }

    Get.offAllNamed(
        (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);

    errorAlert(title: title ?? 'Blocked', content: content ?? '');
  }

  void startTimer1() {
    if (otpTimer != null) {
      otpTimer?.cancel();
    }
    timeToResend = 60;
    const oneSec = Duration(seconds: 1);
    otpTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timeToResend == 0) {
          otpTimer?.cancel();
          update(['OTP_POPUP']);
        } else {
          timeToResend--;
          update(['OTP_POPUP']);
        }
      },
    );
  }

  void stopTimer1() {
    if (otpTimer != null) {
      otpTimer?.cancel();
    }
  }

  Future<void> getBranches() async {
    if (branches?.isNotEmpty != true && !branchFailed) {
      branches = (await ApiService().branchLocator())
          ?.where((element) => element.status == 'A')
          .toList();
      branchFailed = branches == null;
      update();
    }
  }

  Future<void> getContactUs({bool force = false}) async {
    if (contactUs == null || force) {
      contactUs = (await ApiService().getOrganisationDetails());
      contactUsFailed = contactUs == null;
      update();
    }
  }

  Future<void> getMyProfileForm({Map<String, dynamic>? data}) async {
    if (Box3.myProfileFormBV == null) {
      myProfileFormLoading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        update();
      });
    }
    FormRulesData? f = Box3.myProfileFormBV;
    if (f == null) {
      await Box3.getMyProfileForm();
      f = Box3.myProfileFormBV;
    }
    if (f != null) {
      form.initialiseForm(f.formFieldItem, data: data);
      myProfileFormBV = f;
    }

    myProfileFormLoading = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  Future<void> getForgotMpinForm({Map<String, dynamic>? data}) async {
    FormRulesData? f = Box3.forgotMpinFormBV;
    if (f == null) {
      await Box3.getForgotMpinForm();
      f = Box3.forgotMpinFormBV;
      loading == false;
      update();
    }
    if (f != null) {
      forgotMpinForm.initialiseForm(f.formFieldItem, data: data);
      forgotMpinFormBV = f;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  Future<void> getForgotPasswordForm({Map<String, dynamic>? data}) async {
    FormRulesData? f = Box3.forgotPasswordFormFZ;
    if (f == null) {
      await Box3.getForgotPasswordForm();
      f = Box3.forgotPasswordFormFZ;
      loading == false;
      update();
    }
    if (f != null) {
      forgotPasswordForm.initialiseForm(f.formFieldItem, data: data);
      forgotPasswordFormFZ = f;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  Future<void> getForgotUserNameForm({Map<String, dynamic>? data}) async {
    FormRulesData? f = Box3.forgotMpinFormBV;
    if (f == null) {
      await Box3.getForgotUserNameForm();
      f = Box3.forgotMpinFormBV;
      loading == false;
      update();
    }
    if (f != null) {
      forgotMpinForm.initialiseForm(f.formFieldItem, data: data);
      forgotMpinFormBV = f;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  Future<void> getChangeMpinForm({Map<String, dynamic>? data}) async {
    FormRulesData? f = Box3.changeMpinFormBV;
    if (f == null) {
      await Box3.getChangeMpinForm();
      f = Box3.changeMpinFormBV;
      loading == false;
      update();
    }
    if (f != null) {
      changeMpinForm.initialiseForm(f.formFieldItem, data: data);
      changeMpinFormBV = f;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  Future<void> getChangePasswordForm({Map<String, dynamic>? data}) async {
    FormRulesData? f = Box3.changePasswordFormFZ;
    if (f == null) {
      await Box3.getChangePasswordForm();
      f = Box3.changePasswordFormFZ;
      loading == false;
      update();
    }
    if (f != null) {
      changePasswordForm.initialiseForm(f.formFieldItem, data: data);
      changePasswordFormFZ = f;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  Future<void> getDashboardCurrencies() async {
    var data = await ApiService()
        .getCatalogue(typeData: {"Type": "CURRENCY"}, type: "CURRENCY");

    dashboardCurrencies = data;
    var myCur = dashboardCurrencies
        .where((element) => element.Code.toLowerCase().contains(
            Box3.companyDataFZ?.companySettings?.crossCurrency.toLowerCase() ??
                ''))
        .toList();
    if (myCur.isNotEmpty == true) {
      toCur = myCur.firstOrNull;
      remittanceToCur = toCur;
      forexToCur = toCur;
      remittanceAttributes.toCurrency = remittanceToCur;
    } else {
      toCur = dashboardCurrencies.firstOrNull;
      remittanceToCur = toCur;
      forexToCur = toCur;
      remittanceAttributes.toCurrency = remittanceToCur;
    }
    if (Get.isRegistered<TransferController>()) {
      Get.find<TransferController>()
        ..toAmtCur = toCur?.Code
        ..update();
    } else {
      Get.put(TransferController(transferType: TransferType.all));
      Get.find<TransferController>()
        ..toAmtCur = toCur?.Code
        ..update();
    }

    if (Get.isRegistered<DataController>() == true) {
      if (Get.isRegistered<MainController>() != true) {
        Get.put(MainController());
      }
      await Get.find<DataController>().oneUnitRate();
    } else {
      await Get.put(DataController()).oneUnitRate();
    }
  }

  Future<void> ensureSelfieImageLoaded() async {
    if (appStatus == AppStatus.loggedIn &&
        selfieImage.value == null &&
        !_isFetchingImage &&
        imageFetchCount < 3) {
      _isFetchingImage = true;
      imageFetchCount++;
      try {
        await getEKYCData(isSelfie: true);
      } finally {
        _isFetchingImage = false;
      }
    }
  }

  Future<void> getEKYCData({bool isSelfie = false}) async {
    syncIdImagesFromCustomerData();
    if (customerEKYC != null && isSelfie == false) return;

    customerEKYC = await ApiService().getEKYCDocument();
    if (customerEKYC != null) {
      customerEKYC?.documentDetails?.forEach((e) async {
        if (e.documentName!.toLowerCase().contains("SELFIE".toLowerCase())) {
          var originalData = Box3.customerDetailsFZ!.toJson();
          Map<String, dynamic> c = Box3.customerDetailsFZ!.data!.toJson();
          c['profilePic'] = e.documentContent;
          originalData['Data'] = c;
          selfieImage.value = e.documentContent;
          docIds.addAll({"SELFIE": e.documentId});
          // update();
          await Box3.refreshUserInfo(originalData);
        }
        if (e.documentName!.toLowerCase().contains("IDFRONT".toLowerCase())) {
          frontImage = e.documentContent;
          docIds.addAll({"IDFRONT": e.documentId});
        }
        if (e.documentName!.toLowerCase().contains("IDBACK".toLowerCase())) {
          backImage = e.documentContent;
          docIds.addAll({"IDBACK": e.documentId});
        }
        if (e.documentName!.toLowerCase().contains("VIDEO_KYC".toLowerCase())) {
          docIds.addAll({"VIDEO_KYC": e.documentId});
        }
      });
    }
    syncIdImagesFromCustomerData();
    update();
  }

  void syncIdImagesFromCustomerData() {
    final data = Box3.customerDetailsFZ?.data;
    frontImage = (data != null && data.imageFront.isNotEmpty)
        ? data.imageFront
        : null;
    backImage = (data != null && data.imageBack.isNotEmpty)
        ? data.imageBack
        : null;
  }
  Future<void> clearUserData()async{
    appStatus = AppStatus.onBoarded;
    customerDetails = null;
    selfieImage.value = null;
    frontImage = null;
    backImage = null;
    docIds.clear();
    customerEKYC = null;
    update();
  }


  Future<void> getFAQ() async {
    if (faqs == null && !faqFailed) {
      var myfaq = await ApiService().getFAQ();
      faqs = myfaq?.faqData?.faqResponselist;
      faqFailed = faqs == null;
      update();
    }
  }

  Future<void> getPrivacyPolicy() async {
    if (privacyPolicy == null || privacyPolicyFailed) {
      privacyPolicy = await ApiService().privacypolicy();
      privacyPolicyFailed = privacyPolicy == null;

      update();
    }
  }

  Future<void> getTermsAndConditions() async {
    if (termsAndConditions == null || termsAndConditionsFailed) {
      termsAndConditions = await ApiService().termsAndConditions();
      termsAndConditionsFailed = termsAndConditions == null;
      update();
    }
  }

  Future<void> getAboutus() async {
    if (aboutUS?.isNotEmpty != true || aboutUSFailed) {
      aboutUS = await ApiService().aboutUs();
      aboutUSFailed = aboutUS == null;
      update();
    }
  }

  Future<void> getRates() async {
    if (rates == null) {
      rates = await ApiService().getRate();
      filterRates = rates;
      getBuyRatesByCurrency();
      getSellRatesByCurrency();
      await updateOneUnit(null);
    }
  }

  Future<void> getFilterRate(String val) async {
    if (val.isNotEmpty) {
      filterRates = rates!
          .where(
              (e) => e.currencyCode.toLowerCase().contains(val.toLowerCase()))
          .toList();
    } else {
      filterRates = rates;
    }
    update(['all-rates']);
  }

  void getBuyRatesByCurrency({String currency1 = 'AFN'}) {
    for (var rate in rates!) {
      if (currency1 == rate.currencyCode) {
        buyRate = rate.cashRateBuy.toString();
      }
    }
    update(['all-rates']);
  }

  void getSellRatesByCurrency({String currency1 = 'AFN'}) {
    for (var rate in rates!) {
      if (currency1 == rate.currencyCode) {
        sellRate = rate.cashRateSell.toString();
      }
    }
    update(['all-rates']);
  }

  Future<void> updateOneUnit(MasterResponseFZ? currencyCode) async {
    String? curCode = toCur?.Code;
    if (currencyCode != null) {
      curCode = currencyCode.Code;
    }
    oneUnitRate = '-';
    update(['calc_rate']);
    RateCalculatorFz? g =
        await ApiService().guestRate(amount: '1', currency: curCode, type: 'L');
    if (g != null) {
      oneUnitRate = g.fcyAmount?.toString() ?? '-';
    }
    update(['calc_rate']);
  }

  Future<void> onBoard() async {
    await Box3.setStatus(AppStatus.onBoarded);
    Get.put(DataController(beforeLogin: true), permanent: true);
    Get.offAllNamed(
        (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.nid);
  }

  List<Widget> getFAQChildren({String text = ''}) {
    List<String> suggestions = faqs!.map((e) => e.Question).toList();
    List<Widget> children = [const SizedBox(height: 16)];
    suggestions
        .where((e0) => e0.toLowerCase().contains(text.toLowerCase()))
        .forEach((e1) {
      children.add(
        Text(
          e1,
          style:
              TS.f12.copyWith(color: isDark ? AppConfigs.g8f : AppConfigs.g4),
        ),
      );
      children.add(const SizedBox(height: 16));
    });
    return children;
  }

  Future<void> updateToCurency(
      {required String s, required String type, String? currency}) async {
    if (fromCur == toCur?.Code) {
      if (type == 'L') {
        toAmtCtrl.text = fromAmtCtrl.text;
      }
      if (type == 'F') {
        fromAmtCtrl.text = toAmtCtrl.text;
      }
    } else {
      RateCalculatorFz? g = await ApiService()
          .guestRate(amount: s, currency: currency ?? toCur?.Code, type: type);

      if (g != null) {
        if (type == 'L' && fromAmtCtrl.text.isNotEmpty) {
          toAmtCtrl.text = g.fcyAmount!.toString();
        }
        if (type == 'F' && toAmtCtrl.text.isNotEmpty) {
          fromAmtCtrl.text = g.lcyAmount.toString();
        }
      }
    }
    update();
  }

  Future<void> updateToCurrencyCalc(
      {required String s, required String type, String? currency}) async {
    if (fromCur == toCur?.Code) {
      if (type == 'L') {
        toAmtCtrl.text = fromAmtCtrl.text;
      }
      if (type == 'F') {
        fromAmtCtrl.text = toAmtCtrl.text;
      }
    } else {
      RateCalculatorFz? g = await ApiService().guestRate(
          amount: s,
          currency: currency ?? calculatorToCur?.Code ?? toCur?.Code,
          type: type);

      if (g != null) {
        if (type == 'L' && fromAmtCtrl.text.isNotEmpty) {
          toAmtCtrl.text = g.fcyAmount!.toString();
        }
        if (type == 'F' && toAmtCtrl.text.isNotEmpty) {
          fromAmtCtrl.text = g.lcyAmount.toString();
        }
      }
    }
    update(['calc_rate']);
  }

  void preLoginAlert({String? postLoginDestination}) {
    // Get.toNamed(AppRoutes.signUp);
    // return;
    if (Get.isRegistered<SignUpController>()) {
      Get.find<SignUpController>().signUpAttributes = SignUpAttributes();
    }
    this.postLoginDestination = postLoginDestination;
    ltc.usernameCtrl.clear();
    Get.toNamed(
        appStatus == AppStatus.loggedIn ? AppRoutes.login : AppRoutes.nid);
  }

  String? consumePostLoginDestination() {
    final destination = postLoginDestination;
    postLoginDestination = null;
    return destination;
  }

  void kycAlert() {
    Get.dialog(
      Container(
        alignment: Alignment.center,
        child: Material(
          color: Colors.transparent,
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x29000000),
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  color: isDark ? const Color(0xff000000) : AppConfigs.w),
              child: Stack(children: [
                Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(top: 15, right: 15),
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: SvgPicture.asset(
                      ImagePath.close,
                      height: 20,
                      width: 20,
                      colorFilter: ColorFilter.mode(
                          AppConfigs.primaryColor, BlendMode.srcIn),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 17),
                    SvgPicture.asset(
                      ImagePath.updatekycicon,
                      height: 44,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      alignment: Alignment.center,
                      child: Text(
                        'Complete_KYC'.tr,
                        style: TextStyles.font20.copyWith(
                            color: isDark ? AppConfigs.w : AppConfigs.g4),
                      ),
                    ),
                    Text(
                      'Get_verified_with_your_National_ID_OTP_and_PAN'.tr,
                      style: TextStyles.font12.copyWith(
                          color: isDark ? AppConfigs.g8f : AppConfigs.g77),
                    ),
                    roundButton("Let_Do_it".tr, top: 16, bottom: 15, onTap: () {
                      Get.back();
                      Get.toNamed(AppRoutes.uploadDocuments);
                    }),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
      barrierColor: isDark ? AppConfigs.w.withOpacity(0.3) : null,
    );
  }

  Future<void> login(String authenticationMethod2,
      {String? authenticationMethod1,
      required String customerCode,
      String? stepOrderId}) async {
    loginLoader = true;
    update();
    print(authenticationMethod1);
    print(authenticationMethod2);
    print(Box3.settings.LOGINAUTHENTICATIONPRIMARY);
    switch (
        authenticationMethod1 ?? (Box3.settings.LOGINAUTHENTICATIONSECONDARY)) {
      case 'USERNAME':
        if (ltc.usernameCtrl.text.isEmpty) {
          ltc.userNameError = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else if (ltc.usernameCtrl.text.length < 6) {
          ltc.userNameError = 'Username should be minimum 6 characters'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          await authenticationType2(
              'USERNAME', ltc.usernameCtrl.text, authenticationMethod2,
              customerCode: customerCode, stepOrderId: stepOrderId);
        }

        break;
      case 'PASSWORD':
        if (ltc.pwd.text.isEmpty) {
          ltc.passwordErrorText = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          await authenticationType2(
              'PASSWORD', ltc.usernameCtrl.text, authenticationMethod2,
              customerCode: customerCode, stepOrderId: stepOrderId);
        }

        break;
      case 'MPIN':
        if (ltc.mpin.text.isEmpty) {
          ltc.mpinErrorText = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          await authenticationType2(
              'MPIN', ltc.mpin.text, authenticationMethod2,
              customerCode: customerCode, stepOrderId: stepOrderId);
        }

        break;
      case 'PASSWORD_MPIN':
        if (ltc.pwd.text.isEmpty) {
          ltc.passwordErrorText = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          await authenticationType2(
              'PASSWORD_MPIN', ltc.usernameCtrl.text, authenticationMethod2,
              customerCode: customerCode, stepOrderId: stepOrderId);
        }

        break;
      case 'MOBILE':
        if (!(authenticationMethod2 == 'MPIN' &&
                (Box3.settings.LOGINAUTHENTICATIONSECONDARY) ==
                    'PASSWORD_MPIN') &&
            ltc.mobileNoCtrl.text.isEmpty) {
          ltc.mobileNoError = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          await authenticationType2(
              'MobileNo',
              '${(appStatus == AppStatus.loggedIn ? Box3.customerDetailsFZ?.data?.mobileNo : Box3.countryCode + ltc.mobileNoCtrl.text)}',
              authenticationMethod2,
              stepOrderId: stepOrderId,
              customerCode: customerCode);
        }
        break;
    }
    loginLoader = false;
    buttonLoading = false;
    update();
  }

  Future<void> authenticationType2(
      String type1, String value1, String authenticationMethod2,
      {required String customerCode, String? stepOrderId}) async {
    loginLoader = true;
    update();
    switch (authenticationMethod2) {
      case 'MPIN':
        if (ltc.mpin.text.isEmpty) {
          ltc.mpinErrorText = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else if (ltc.mpin.text.length < 6) {
          ltc.mpinErrorText = 'Mpin should be 6 characters'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          var validateMPINData = {
            "IdNo": Box3.customerDetailsFZ?.data?.idNo ?? ltc.idNo.text,
            "Mobile": Box3.customerDetailsFZ?.data?.mobileNo ??
                "${Box3.countryCode}${ltc.mobileNoCtrl.text}",
            "Mpin": ltc.mpin.text,
            "CUSTOMERCODE": Box3.customerDetailsFZ?.data?.customerCode ?? '',
          };
          if (Get.isRegistered<SignUpController>()) {
            await Get.find<SignUpController>().validateNid(
              stepOrderId: (stepOrderId != null && stepOrderId != "")
                  ? stepOrderId
                  : '0',
              authData: validateMPINData,
            );
          } else {
            await Get.put(SignUpController()).validateNid(
              stepOrderId: (stepOrderId != null && stepOrderId != "")
                  ? stepOrderId
                  : '0',
              authData: validateMPINData,
            );
          }
          ltc.mpin.clear();
        }
        break;
      case 'PASSWORD':
        if (ltc.pwd.text.isEmpty) {
          ltc.passwordErrorText = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else if (ltc.pwd.text.length < 8) {
          ltc.passwordErrorText = 'Password should be minimum 8 characters'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          var validateMPINData = {
            "IdNo": Box3.customerDetailsFZ?.data?.idNo ?? ltc.idNo.text,
            "Mobile": Box3.customerDetailsFZ?.data?.mobileNo ??
                "${Box3.countryCode}${ltc.mobileNoCtrl.text}",
            "Password": ltc.pwd.text,
            "UserName": ltc.usernameCtrl.text,
            "CUSTOMERCODE": Box3.customerDetailsFZ?.data?.customerCode ?? '',
          };

          if (Get.isRegistered<SignUpController>()) {
            await Get.find<SignUpController>().validateNid(
              stepOrderId: (stepOrderId != null && stepOrderId != "")
                  ? stepOrderId
                  : '0',
              authData: validateMPINData,
            );
          } else {
            await Get.put(SignUpController()).validateNid(
              stepOrderId: (stepOrderId != null && stepOrderId != "")
                  ? stepOrderId
                  : '0',
              authData: validateMPINData,
            );
          }

          await Get.find<SignUpController>().validateNid(
            stepOrderId:
                (stepOrderId != null && stepOrderId != "") ? stepOrderId : '0',
            authData: validateMPINData,
          );
        }
        break;
      case 'PASSWORD_MPIN':
        if (ltc.pwd.text.isEmpty) {
          ltc.passwordErrorText = 'required'.tr;
          loginLoader = false;
          update();
          return;
        } else if (ltc.pwd.text.length < 8) {
          ltc.passwordErrorText = 'Password should be minimum 8 characters'.tr;
          loginLoader = false;
          update();
          return;
        } else {
          var validateMPINData = {
            "IdNo": Box3.customerDetailsFZ?.data?.idNo ?? ltc.idNo.text,
            "Mobile": Box3.customerDetailsFZ?.data?.mobileNo ??
                "${Box3.countryCode}${ltc.mobileNoCtrl.text}",
            "UserName": ltc.usernameCtrl.text,
            "Password": ltc.pwd.text,
            "CUSTOMERCODE": Box3.customerDetailsFZ?.data?.customerCode ?? '',
          };
          if (Get.isRegistered<SignUpController>()) {
            await Get.find<SignUpController>().validateNid(
              stepOrderId: (stepOrderId != null && stepOrderId != "")
                  ? stepOrderId
                  : '0',
              authData: validateMPINData,
            );
          } else {
            await Get.put(SignUpController()).validateNid(
              stepOrderId: (stepOrderId != null && stepOrderId != "")
                  ? stepOrderId
                  : '0',
              authData: validateMPINData,
            );
          }
        }
        break;
    }
    loginLoader = false;
    update();
  }

  Map<String, String>? formData = {};
  List<String>? urls = [];
  List<FetchUAEPassDoc>? uaePassData;
  FetchUAEPassDoc? singleUAEPASSData;

  Future isUAEPassData({required String eID, required String uuID}) async {
    // DateTime? dobs;
    // DateTime? ieobs;
    // String? pobs;
    // String employerName;

    formData?.clear();
    urls?.clear();
    uaePassData?.clear();
    singleUAEPASSData = null;

    uaePassData =
        await ApiService().fetchUAEPassDocUUIDEID(eID: eID, uuID: uuID);

    if (kDebugMode) {
      print(uaePassData);
    }

    if (uaePassData?.isNotEmpty == true) {
      Box3.fetchUAEPassDoc = uaePassData?[0];
      FetchUAEPassDoc? myData = uaePassData?.firstOrNull;

      if (myData?.documentCode1 != null &&
          myData?.documentCode1?.isNotEmpty == true) {
        urls?.addAll((myData?.documentCode1 as String).split(','));
        urls?.add((myData?.documentCode1 as String));
      }

      if (myData?.documentCode2 != null &&
          myData?.documentCode2?.isNotEmpty == true) {
        urls?.addAll((myData?.documentCode2 as String).split(','));
        urls?.add((myData?.documentCode2 as String));
      }

      // if (myData?.dateOfBirth != null) {
      //   dobs = myData!.dateOfBirth;
      // }
      // if (myData?.placeOfBirth != null &&
      //     myData?.placeOfBirth?.isNotEmpty == true) {
      //   pobs = myData!.placeOfBirth;
      // }
      // if (myData?.expiryDate1 != null) {
      //   ieobs = myData!.expiryDate1;
      // }
      update();
    }
  }

  List<String> languages = [
    'मराठी',
    'English',
    'हिंदी',
    'தமிழ்',
    'తెలుగు',
    'ગુજરાતી',
    'বাঙ্গালা'
  ];
  String? selectedLanguage = 'English';

  void setLanguage(String s) {
    selectedLanguage = s;
    update();
  }

  bool disable = false;

  void setTheme(bool b) {
    isDark = themeType == ThemeType.dark
        ? true
        : themeType == ThemeType.light
            ? false
            : b;
    b = isDark;

    update();
    if (appStatus == AppStatus.loggedIn || (Box3.settings.preLogin)) {
      if (!Get.isRegistered<MainController>()) {
        Get.put(MainController(), permanent: true);
      }

      Get.find<MainController>()
        ..isDark = b
        ..update();
      if (Get.isRegistered<AuthController>()) {
        Get.find<AuthController>()
          ..isDark = b
          ..update();
      }
    }
    if (Get.isRegistered<SignUpController>()) {
      Get.find<SignUpController>()
        ..isDark = b
        ..update();
    }
    if (Get.isRegistered<LanguageController>()) {
      Get.find<LanguageController>()
        ..isDark = b
        ..update();
    }
    if (Get.isRegistered<KycController>()) {
      Get.find<KycController>()
        ..isDark = b
        ..update();
    }
    if (Get.isRegistered<TransferController>()) {
      Get.find<TransferController>()
        ..isDark = b
        ..update();
    }
    if (Get.isRegistered<TransactionController>()) {
      Get.find<TransactionController>()
        ..isDark = b
        ..update();
    }
    if (Get.isRegistered<BillPayController>()) {
      Get.find<BillPayController>()
        ..isDark = b
        ..update();
    }
    if (Get.isRegistered<BeneficiaryController>()) {
      Get.find<BeneficiaryController>()
        ..isDark = b
        ..update();
    }
    if (Get.isRegistered<TimerContoller>()) {
      Get.find<TimerContoller>()
        ..isDark = b
        ..update();
    }
  }

  @override
  void onInit() {
    initFirebase();
    getToken();
    checkForUpdate();
    getDashboardCurrencies();
    getContactUs();

    final window = WidgetsBinding.instance.platformDispatcher;

    window.onPlatformBrightnessChanged = () {
      if (faqNode.hasFocus) {
        faqNode.unfocus();
      }
      setTheme(window.platformBrightness == Brightness.dark);
    };
    try {
      initDeepLinks();
    } catch (e) {
      debugPrint(e.toString());
    }

    super.onInit();
  }

  // CBLimitCheckResult checkRateLimitExceeded(String amt,
  //     {required BeneficiaryFz selectedBeneficiary}) {
  //   // TODO :: Note: confirm which beneficiary id we are getting from
  //   // TODO :: the transaction response.(CoreBeneficiaryUID or BeneficiaryID)
  //   // TODO :: comparison between the trasaction and selected beneficiary based on coreBeneficiaryUID now.

  //   if (cbLimit != null) {
  //     double amount = double.parse(amt);
  //     final unfailedTransactions =
  //         Get.find<DataController>().transactions.where((txn) {
  //       final txnFailed =
  //           txn.transactionStatus?.toLowerCase().contains('cancel') == true ||
  //               txn.transactionStatus?.toLowerCase().contains('failed') == true;
  //       return !txnFailed;
  //     }).toList();

  //     final startOfToday = DateTime(now.year, now.month, now.day);
  //     final startOfTomorrow = startOfToday.add(const Duration(days: 1));

  //     // <<<<<<<<<<<<<< Txn count per day limit >>>>>>>>>>>>>>>
  //     if (cbLimit!.maxTrnCountPerDayStatus == LimitStatus.active) {
  //       final noOfTxnsToday = unfailedTransactions.where((txn) {
  //         final date = txn.transactionDate;

  //         return date != null &&
  //             txn.transactionStatus != null &&
  //             date.isAfter(startOfToday) &&
  //             date.isBefore(startOfTomorrow);
  //       }).length;

  //       if (_checkLimitViolation(
  //           cbLimit!.maxTrnCountPerDay, noOfTxnsToday.toDouble())) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.count,
  //           limit: cbLimit!.maxTrnCountPerDay?.removePrefixSpecialChars() ?? '',
  //           message: cbLimit!.maxTrnCountPerDayBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<<<<<<<<<<< Txn count per month limit >>>>>>>>>>>>>>
  //     if (cbLimit!.maxTrnCountPerMonthStatus == LimitStatus.active) {
  //       final now = DateTime.now();
  //       final noOfTxnsCurrentMonth = unfailedTransactions.where((txn) {
  //         final date = txn.transactionDate;

  //         return date != null &&
  //             date.year == now.year &&
  //             date.month == now.month &&
  //             txn.transactionStatus != null;
  //       }).length;

  //       if (_checkLimitViolation(
  //           cbLimit!.maxTrnCountPerMonth, noOfTxnsCurrentMonth.toDouble())) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.count,
  //           limit:
  //               cbLimit!.maxTrnCountPerMonth?.removePrefixSpecialChars() ?? '',
  //           message: cbLimit!.maxTrnCountPerMonthBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<<<<<<<<< Txn Count to beneficiary per day limit >>>>>>>>>>>>
  //     if (cbLimit!.maxTrnCountToBenefPerDayStatus == LimitStatus.active) {
  //       final noOfTxnsToBenefToday = unfailedTransactions.where((txn) {
  //         final date = txn.transactionDate;

  //         return txn.bneficiaryId?.isNotEmpty == true &&
  //             txn.bneficiaryId == selectedBeneficiary.coreBeneficiaryUid &&
  //             date != null &&
  //             txn.transactionStatus != null &&
  //             date.isAfter(startOfToday) &&
  //             date.isBefore(startOfTomorrow);
  //       }).length;

  //       if (_checkLimitViolation(cbLimit!.maxTrnCountToBenefPerDay,
  //           noOfTxnsToBenefToday.toDouble())) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.count,
  //           limit:
  //               cbLimit!.maxTrnCountToBenefPerDay?.removePrefixSpecialChars() ??
  //                   '',
  //           message: cbLimit!.maxTrnCountToBenefPerDayBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<<<<<<<<<<<<< Per Txn Amount Limit >>>>>>>>>>>>>>>>
  //     if (cbLimit!.perTrnAmtLimitStatus == LimitStatus.active) {
  //       if (_checkLimitViolation(cbLimit!.perTrnAmtLimit, amount)) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.amount,
  //           limit: cbLimit!.perTrnAmtLimit?.removePrefixSpecialChars() ?? '',
  //           message: cbLimit!.perTrnAmtLimitBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<<<<<<<<<<<<<<|| Daily Amount Limit ||>>>>>>>>>>>>>>>>
  //     if (cbLimit!.perDayTrnAmtLimitStatus == LimitStatus.active) {
  //       final txnsToday = unfailedTransactions.where((txn) {
  //         final date = txn.transactionDate;

  //         return date != null &&
  //             date.isAfter(startOfToday) &&
  //             date.isBefore(startOfTomorrow) &&
  //             txn.netAmount != null;
  //       });

  //       final totalNetAmount = txnsToday
  //           .map((txn) => txn.netAmount!)
  //           .fold<double>(0.0, (sum, amount) => sum + amount);

  //       if (_checkLimitViolation(
  //           cbLimit!.perDayTrnAmtLimit, totalNetAmount + amount)) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.amount,
  //           limit: cbLimit!.perDayTrnAmtLimit?.removePrefixSpecialChars() ?? '',
  //           message: cbLimit!.perDayTrnAmtLimitBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<<<<<<<<<<<<<<|| Monthly Amount Limit ||>>>>>>>>>>>>>>>>
  //     if (cbLimit!.trnAmtLmtMonthlyStatus == LimitStatus.active) {
  //       final now = DateTime.now();
  //       final currentMonthTransactions = unfailedTransactions.where((txn) {
  //         final date = txn.transactionDate;
  //         return date != null &&
  //             date.year == now.year &&
  //             date.month == now.month &&
  //             txn.netAmount != null;
  //       });
  //       final totalNetAmount = currentMonthTransactions
  //           .map((txn) => txn.netAmount!)
  //           .fold<double>(0.0, (sum, amount) => sum + amount);

  //       if (_checkLimitViolation(
  //           cbLimit!.trnAmtLmtMonthly, totalNetAmount + amount)) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.amount,
  //           limit: cbLimit!.trnAmtLmtMonthly?.removePrefixSpecialChars() ?? '',
  //           message: cbLimit!.trnAmtLmtMonthlyBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<<<<<<<<<<< Yearly Amount Limit >>>>>>>>>>>>>>
  //     if (cbLimit!.trnAmtLmtYearlyStatus == LimitStatus.active) {
  //       final now = DateTime.now();
  //       final currentYearTransactions = unfailedTransactions.where((txn) {
  //         final date = txn.transactionDate;
  //         return date != null && date.year == now.year && txn.netAmount != null;
  //       });
  //       final totalNetAmount = currentYearTransactions
  //           .map((txn) => txn.netAmount!)
  //           .fold<double>(0.0, (sum, amount) => sum + amount);

  //       if (_checkLimitViolation(
  //           cbLimit!.trnAmtLmtYearly, totalNetAmount + amount)) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.amount,
  //           limit: cbLimit!.trnAmtLmtYearly?.removePrefixSpecialChars() ?? '',
  //           message: cbLimit!.trnAmtLmtYearlyBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<< Transactions to the Beneficiary Monthly Amt Limit >>>>>
  //     if (cbLimit!.trnAmtToBenfPerMonthStatus == LimitStatus.active) {
  //       final currentMonthTxnsToBenef = unfailedTransactions.where((txn) {
  //         final date = txn.transactionDate;
  //         return txn.bneficiaryId?.isNotEmpty == true &&
  //             txn.bneficiaryId == selectedBeneficiary.coreBeneficiaryUid &&
  //             date != null &&
  //             date.year == now.year &&
  //             date.month == now.month &&
  //             txn.netAmount != null;
  //       });
  //       final totalNetAmountToBenef = currentMonthTxnsToBenef
  //           .map((txn) => txn.netAmount!)
  //           .fold<double>(0.0, (sum, amount) => sum + amount);

  //       if (_checkLimitViolation(
  //           cbLimit!.trnAmtToBenfPerMonth, totalNetAmountToBenef + amount)) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.amount,
  //           limit:
  //               cbLimit!.trnAmtToBenfPerMonth?.removePrefixSpecialChars() ?? '',
  //           message: cbLimit!.trnAmtToBenfPerMonthBlockMessage ?? '',
  //         );
  //       }
  //     }

  //     // <<<<<< Transaction limit to beneficiary in cooling period >>>>>>
  //     if (cbLimit!.benefCoolingPeriodInMinsStatus == LimitStatus.inactive ||
  //         cbLimit!.benefCoolingPeriodAmtStatus == LimitStatus.inactive ||
  //         selectedBeneficiary.createdOn == null ||
  //         cbLimit!.benefCoolingPeriodInMins == null) {
  //       return CBLimitCheckResult(isLimitExceeded: false);
  //     }

  //     final coolingPeriod = double.tryParse(
  //         cbLimit!.benefCoolingPeriodInMins!.removePrefixSpecialChars());
  //     if (coolingPeriod == null) {
  //       return CBLimitCheckResult(isLimitExceeded: false);
  //     }

  //     final minutesPassed =
  //         now.difference(selectedBeneficiary.createdOn!).inMinutes;

  //     if (_checkLimitViolation(
  //         cbLimit!.benefCoolingPeriodInMins, minutesPassed.toDouble())) {
  //       // -------- if Still in cooling period, check amount limit --------
  //       final txnsToBenef = unfailedTransactions.where((txn) {
  //         return txn.bneficiaryId?.isNotEmpty == true &&
  //             txn.bneficiaryId == selectedBeneficiary.coreBeneficiaryUid &&
  //             txn.netAmount != null;
  //       });
  //       final totalNetAmountToBenefInCoolingPeriod = txnsToBenef
  //           .map((txn) => txn.netAmount!)
  //           .fold<double>(0.0, (sum, amount) => sum + amount);

  //       if (_checkLimitViolation(cbLimit!.benefCoolingPeriodAmt,
  //           totalNetAmountToBenefInCoolingPeriod + amount)) {
  //         return CBLimitCheckResult(
  //           isLimitExceeded: true,
  //           limitType: CBLimitType.amount,
  //           limit: cbLimit!.benefCoolingPeriodAmt?.removePrefixSpecialChars() ??
  //               '',
  //           message: cbLimit!.benefCoolingPeriodAmtBlockMessage ?? '',
  //         );
  //       }
  //     }
  //   }
  //   return CBLimitCheckResult(isLimitExceeded: false);
  // }

  // bool _checkLimitViolation(String? limitStr, double value) {
  //   if (limitStr == null) return false;

  //   final cleanedStr = limitStr.trim();

  //   // Extract operator and limit value
  //   if (cleanedStr.startsWith('>=')) {
  //     final limit =
  //         double.tryParse(cleanedStr.substring(2).trim()) ?? double.infinity;
  //     return value >= limit;
  //   } else if (cleanedStr.startsWith('<=')) {
  //     final limit = double.tryParse(cleanedStr.substring(2).trim()) ?? 0;
  //     return value <= limit;
  //   } else if (cleanedStr.startsWith('>')) {
  //     final limit =
  //         double.tryParse(cleanedStr.substring(1).trim()) ?? double.infinity;
  //     return value > limit;
  //   } else if (cleanedStr.startsWith('<')) {
  //     final limit = double.tryParse(cleanedStr.substring(1).trim()) ?? 0;
  //     return value < limit;
  //   } else if (cleanedStr.startsWith('==') || cleanedStr.startsWith('=')) {
  //     final operatorLength = cleanedStr.startsWith('==') ? 2 : 1;
  //     final limit =
  //         double.tryParse(cleanedStr.substring(operatorLength).trim()) ?? -1;
  //     return value == limit;
  //   }

  //   // If no operator, treat as >=
  //   final limit = double.tryParse(cleanedStr.removePrefixSpecialChars()) ??
  //       double.infinity;
  //   return value >= limit;
  // }

  // CBLimitCheckResult checkBenefCreationLimitExeeded() {
  //   if (cbLimit != null && cbLimit!.maxBenefLimitStatus == LimitStatus.active) {
  //     final activeBeneficiaries = Get.put(BeneficiaryController())
  //         .benefs
  //         .where((b) => b.active == 'A')
  //         .toList();
  //     final int totalBeneficiaries = activeBeneficiaries.length;

  //     int maxBeneficiaries = int.tryParse(
  //             cbLimit!.maxBenefLimit?.removePrefixSpecialChars() ??
  //                 '9999999999') ??
  //         9999999999;

  //     if (totalBeneficiaries >= maxBeneficiaries) {
  //       return CBLimitCheckResult(
  //         isLimitExceeded: true,
  //         limit: cbLimit!.maxBenefLimit?.removePrefixSpecialChars() ?? '',
  //         message: cbLimit!.maxBenefLimitBlockMessage ?? '',
  //       );
  //     }
  //   }
  //   return CBLimitCheckResult(isLimitExceeded: false);
  // }

  Future<void> getRateOnAlert(bool isRem, {bool isFirst = false}) async {
    if (!isFirst) {
      oneRemRate = '-';
      oneForRate = '-';
      update(["rate-text-field"]);
    }
    RateCalculatorFz? g = await ApiService().guestRate(
        amount: '1',
        currency: isRem
            ? remittanceAttributes.toCurrency?.Code
            : forexAttributes.toCurrency?.Code,
        type: 'L');
    if (g != null) {
      if (isRem) {
        remittanceAttributes.remAmount.text = g.fcyAmount.toString();
        oneRemRate = g.fcyAmount.toString();
      } else {
        forexAttributes.forAmount.text = g.fcyAmount.toString();
        oneForRate = g.fcyAmount.toString();
      }
    }
    update(["rate-text-field"]);
  }

  Future<void> initFirebase() async {
    try {
      FirebaseMessaging messaging = FirebaseMessaging.instance;
      await messaging.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      if (Platform.isAndroid) {
        flutterLocalNotificationsPlugin.initialize(
          InitializationSettings(
            android: AndroidInitializationSettings({
                  Flavor.casmex: 'icon_noti',
                  Flavor.lmpay: 'icon_noti',
                  Flavor.cityexchangeuae: 'icon_noti',
                  Flavor.lakhoos: 'icon_noti',
                }[F.appFlavor] ??
                'icon_noti'),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  String? token;

  Future<void> getToken() async {
    try {
      final fetchedToken = await FirebaseMessaging.instance.getToken();
      if (fetchedToken == null) {
        if (kDebugMode) logger.w('FCM token fetch returned null.');
        return;
      }
      token = fetchedToken;
      if (kDebugMode) {
        logger.i('FCM Token: $token');
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        logger.e('Error fetching FCM token: $e',
            error: e, stackTrace: stackTrace);
      }
    }
  }

  void checkForUpdate() {
    if (AppConfigs.env == Environment.prod &&
        Box3.settings.ForceUpdate == true) {
      if (Platform.isAndroid) {
        _checkForUpdateAndroid();
      } else {
        _checkForUpdateIOS();
      }
    } else if (AppConfigs.env != Environment.prod) {
      final apiVersion = Box3.settings.appVersion.trim(); // latest app version
      final envVersion = AppEnvironments.appVersion.trim(); // current version

      if (apiVersion.isNotEmpty &&
          envVersion.isNotEmpty &&
          _isNewerVersion(apiVersion, envVersion)) {
        _showOptionalUpdateDialog(
          'Update Available',
          'A newer app version is available. Please update to the latest version when convenient.',
        );
      }
    }
  }

  /* Function used to compare version strings and determine if the API version is newer than the environment version.
   only if not a production environment, as production will be forced update */
  bool _isNewerVersion(String apiVersion, String envVersion) {
    List<int> parseVersion(String version) => version
        .split(RegExp(r'[^0-9]+'))
        .where((segment) => segment.isNotEmpty)
        .map(int.parse)
        .toList();

    final apiParts = parseVersion(apiVersion);
    final envParts = parseVersion(envVersion);
    final maxLength = max(apiParts.length, envParts.length);

    for (var index = 0; index < maxLength; index++) {
      final apiPart = index < apiParts.length ? apiParts[index] : 0;
      final envPart = index < envParts.length ? envParts[index] : 0;
      if (apiPart > envPart) return true;
      if (apiPart < envPart) return false;
    }

    return false;
  }

  void _showOptionalUpdateDialog(String title, String content) {
    if (Get.overlayContext == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showOptionalUpdateDialog(title, content);
      });
      return;
    }

    Get.dialog(
      PopScope(
        canPop: false,
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  )
                ],
                color: isDark ? const Color(0xff000000) : AppConfigs.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Text(title,
                      style: TS.f20.copyWith(
                          color: isDark ? AppConfigs.w : AppConfigs.bf0)),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: TS.f14.copyWith(
                          color: isDark ? AppConfigs.g8f : AppConfigs.g4),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: roundButton('Ok', onTap: () {
                      if (Get.isDialogOpen == true) {
                        Get.back();
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: isDark ? AppConfigs.w.withValues(alpha: 0.3) : null,
    );
  }

  Future<void> _checkForUpdateAndroid() async {
    try {
      final info = await InAppUpdate.checkForUpdate();
      debugPrint('Play update availability: ${info.updateAvailability}');

      if (info.updateAvailability ==
          UpdateAvailability.developerTriggeredUpdateInProgress) {
        await InAppUpdate.performImmediateUpdate();
        return;
      }

      if (info.updateAvailability == UpdateAvailability.updateAvailable) {
        await InAppUpdate.performImmediateUpdate();
      }
    } on PlatformException catch (e) {
      debugPrint('Play In-App Update not available: [${e.code}] ${e.message}');
    } catch (e) {
      debugPrint('Play In-App Update error: $e');
    }
    _checkForUpdateIOS();
  }

  Future<void> _checkForUpdateIOS() async {
    try {
      final pkgInfo = await PackageInfo.fromPlatform();
      final checker = NewVersionChecker(
        iOSId: pkgInfo.packageName,
        androidId: pkgInfo.packageName,
      );
      final status = await checker.getVersionStatus();
      if (status != null && status.canUpdate) {
        showUpdateDialog(
          'Update Available',
          'A new version is available with important improvements. Please update to continue using the app.',
          storeLink: status.appStoreLink,
        );
      }
    } catch (e) {
      debugPrint('App Store update check error: $e');
    }
  }

  void showUpdateDialog(String title, String content, {String? storeLink}) {
    if (Get.overlayContext == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showUpdateDialog(title, content, storeLink: storeLink);
      });
      return;
    }

    Get.dialog(
      PopScope(
        canPop: false,
        child: Container(
          alignment: Alignment.center,
          child: Material(
            color: Colors.transparent,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x29000000),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  )
                ],
                color: isDark ? const Color(0xff000000) : AppConfigs.w,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  Text(title,
                      style: TS.f20.copyWith(
                          color: isDark ? AppConfigs.w : AppConfigs.g4)),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      content,
                      textAlign: TextAlign.center,
                      style: TS.f16.copyWith(
                          color: isDark ? AppConfigs.g8f : AppConfigs.g77),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                    child: roundButton('Update Now', onTap: () async {
                      if (Platform.isAndroid) {
                        final pkgInfo = await PackageInfo.fromPlatform();
                        OpenStore.instance.open(
                          androidAppBundleId: pkgInfo.packageName,
                        );
                      } else if (storeLink != null) {
                        launchUrl(
                          Uri.parse(storeLink),
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: isDark ? AppConfigs.w.withValues(alpha: 0.3) : null,
    );
  }

  KeyboardActionsConfig keyboardConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: isDark ? Colors.grey.shade700 : null,
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: ltc.mpinNode,
            toolbarButtons: [
              (node) {
                return GestureDetector(
                  onTap: () {
                    node.unfocus();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.5),
                    child: Text(
                      "Done".tr,
                      style: TS.f18.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : null),
                    ),
                  ),
                );
              }
            ],
          ),
        ]);
  }

  /// uae pass
  final uaePassHandler = UAEPassLoginHandler();
  var uaePassHandlerData = <String, dynamic>{};
  UaePassProfileFz? uaePassProfileFz;
  String? uaePassAuthToken;

  Future<void> signWithUAEPassDash() async {
    Get.find<AccountController>().retryLoading = false;
    update();
    if (!Get.isRegistered<TransferController>()) {
      Get.put(TransferController(transferType: TransferType.all));
    }
    if (Get.isDialogOpen == true) {
      Get.back();
    }

    setLoading(bool status) {
      if (kDebugMode) {
        print("Loading: $status");
      }
    }

    uaePassHandlerData =
        await uaePassHandler.signUpUAEPass(isDark, setLoading: setLoading);
    uaePassProfileFz = uaePassHandlerData["data"];
    uaePassAuthToken = uaePassHandlerData["uaePassAuthToken"] ?? '';

    if (uaePassProfileFz != null) {
      if (uaePassProfileFz?.userType == 'SOP1' ||
          uaePassProfileFz?.userType == 'SOP2') {
        loginLoader = false;
        update();
        Get.back();
        await Get.dialog(kycPendingAlert(isDark,
            'You are not eligible to access this service. Your account is either not upgraded or you have a visitor account. Please contact Sharaf Exchange LLC to access the services.',
            title: 'Unverified account'.tr, image: SvgIcons.deviceVerify));
      } else {
        await Box3.saveKYCBVData(uaePassProfileFz);
        if (uaePassProfileFz != null &&
            uaePassProfileFz!.idn != null &&
            uaePassProfileFz!.uuid != null) {
          List<FetchUAEPassDoc>? data =
              await ApiService().getUserDocumentDetails(
                  token: uaePassAuthToken ?? '',
                  emiratesID: uaePassProfileFz!.idn!,
                  documentType: uaePassProfileFz?.nationalityEN == 'ARE'
                      ? 'Passport'
                      : gccCountries.contains(uaePassProfileFz?.nationalityEN)
                          ? ""
                          : 'ResidenceVisa',
                  uuid: uaePassProfileFz!.uuid!);
          if (data != null && data.isNotEmpty == true) {
            Box3.fetchUAEPassDoc = data[0];
          }
        }
      }
    }
  }

  List<String> gccCountries = ["BHR", "KWT", "OMN", "QAT", "SAU"];

  bool isYesNoLoader = false;

  DateTime now = DateTime.now();

  bool validateForexBooking() {
    if (fBA!.amount.text.isEmpty) {
      fBA!.amountError = 'required'.tr;
      update();
      return false;
    } else if (fBA!.compareDate(fBA!.forexDateCtrls, checkEmpty: true)) {
      fBA!.forexDateError = 'required'.tr;
      update();
      return false;
    } else if (fBA!.compareDate(fBA!.forexDateCtrls,
        firstDate: DateTime(1900),
        lastDate: DateTime(now.year, now.month, now.day - 1))) {
      fBA!.forexDateError = 'invalid date'.tr;
      update();
      return false;
    } else if (fBA!.remarks.text.isEmpty) {
      fBA!.remarkError = 'required'.tr;
      update();
      return false;
    } else if (fBA!.acceptTAndC == false) {
      fBA!.tAndCError = 'required'.tr;
      update();
      return false;
    } else {
      fBA!.forexDateError = '';
      fBA!.amountError = '';
      fBA!.tAndCError = '';
      fBA!.remarkError = '';
      update();
      return true;
    }
  }

  // TransactionDetailsBV? trackRemittanceData;
  TrackTxnResult? trackRemResult;
  TransactionDetailsFz? trackRemittanceData;
  EnquiryFz? enquiryData;
  bool trackLoader = false;
  TextEditingController refSearchController = TextEditingController();
  String refErrorText = '';

  Future<void> trackRemittanceByRef(String refNo) async {
    trackLoader = true;
    update();
    final results = await Future.wait([
      ApiService().trackByRefNo(referenceNo: refNo),
      ApiService().getEnquiry(txnRefNo: refNo),
    ]);
    trackRemResult = results[0] as TrackTxnResult?;
    trackRemittanceData = trackRemResult?.data;
    enquiryData = (results[1] as EnquiryDataFz?)?.enquiryList.isNotEmpty == true
        ? (results[1] as EnquiryDataFz?)!.enquiryList.first
        : null;

    trackLoader = false;
    update();
  }

  void clearTrackData() {
    refSearchController.clear();
    refErrorText = '';
    trackLoader = false;
    trackRemittanceData = null;
    trackRemResult = null;
    // update();
  }

  String? _lastOtpId;
  String? _lastCustomerCode;
  String? _lastIdNo;
  String? _lastStepOrderId;

  /// forget
  Future forgetMpin(
      {required String? stepOrderId,
      required Map<String, dynamic> data}) async {
    var bodyData = {
      "Token": Box3.appKeyToken,
      "StepOrderId": stepOrderId,
      "EnvironmentCode": "1",
      "Data": data
    };
    ForgotPassword? response = await ApiService().forgotMPIN(bodyData);
    if (response != null) {
      // String? statusCode1 = response.data?.messageDetails;
      String? statusCode = response.data?.messageCode;
      String? customerCode = response.data?.customerCode;
      String? idNo = response.data?.idNo;
      String? messageHeader = response.customMessageDetails?.messageHeader;
      String? messageDescription =
          response.customMessageDetails?.messageDescription;
      logger.i(statusCode);
      switch (statusCode) {
        case "632":
          buttonLoading = false;
          update();
          errorAlert(
              title: messageHeader ?? "Failed".tr,
              content:
                  messageDescription ?? response.data?.messageDetails ?? "");
          break;
        case "603":
          // case for user blocked after multiple invalid attempts
          buttonLoading = false;
          update();
          await errorAlert(
            title: messageHeader,
            content: messageDescription ?? response.data?.messageDetails ?? "",
            function: () => Get.offAllNamed(
                (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.nid),
          );

          break;
        case "404":
          buttonLoading = false;
          update();
          errorAlert(
              title: messageHeader ?? "Failed".tr,
              content:
                  messageDescription ?? response.data?.messageDetails ?? "");
          break;
        case "SC-STEP1":
          // step 2 validate OTP
          buttonLoading = false;
          loading = false;
          update();
          startTimer1();
          isResend = false;
          update();
          String? otpID = "";
          String? stepOrderIds = "";
          // Get new or reuse old OTP details
          otpID = response.data?.notificationArray?.isNotEmpty == true
              ? response.data?.notificationArray?.first.otpId
              : _lastOtpId;

          stepOrderIds = response.data?.stepOrderId ?? _lastStepOrderId;
          String? customerCode =
              response.data?.customerCode ?? _lastCustomerCode;
          String? idNo = response.data?.idNo ?? _lastIdNo;

          _lastOtpId = otpID;
          _lastCustomerCode = customerCode;
          _lastIdNo = idNo;
          _lastStepOrderId = stepOrderIds;

          fptc.otp.clear();
          if (Get.isDialogOpen == true || Get.isBottomSheetOpen == true) {
            Get.back();
          }
          final details = response.customMessageDetails;

          final customErrorMsg = details?.messageDescription.isNotEmpty == true
              ? details!.messageDescription
              : details?.messageHeader ?? '';

          errorText = response.statusCode == 'RMA-INVALIDDETAILS' &&
                  customErrorMsg.isNotEmpty
              ? customErrorMsg
              : '';
          await validateOTPForgot(
              controller: fptc.otp,
              errorText: errorText,
              validationValue: OtpType.CREATE_FORGOT_MPIN_OTP,
              customText:
                  '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading} ${Box3.status == AppStatus.loggedIn ? maskMobile(Box3.customerDetailsFZ?.data?.mobileNo ?? '') : ''}',
              onValidate: () async {
                if (fptc.otp.text.isEmpty) {
                  errorText = 'otp_required'.tr;
                  update(['OTP_POPUP']);
                } else if (fptc.otp.text.length < 5) {
                  errorText = '${'Enter'.tr}${5} digit OTP';
                  update(['OTP_POPUP']);
                } else {
                  loading = true;
                  update(['OTP_POPUP']);
                  data['CustomerCode'] = customerCode;
                  data['IdNo'] = idNo;
                  data['Otp'] = fptc.otp.text;
                  data['OtpId'] = otpID;
                  await forgetMpin(
                      stepOrderId: stepOrderIds ?? '1', data: data);
                  // if (Get.isDialogOpen == true) {
                  //   Get.back();
                  // }
                  loading = false;
                  update(['OTP_POPUP']);
                }
              },
              onResend: (newOtpId) async{
                if (newOtpId != null && newOtpId.isNotEmpty) {
                  _lastOtpId = newOtpId;
                  otpID = newOtpId;
                  errorText = '';
                  update(['OTP_POPUP']);
                }
              },
              onChanged: (v) {
                if (errorText.isNotEmpty) {
                  errorText = '';
                  update(['OTP_POPUP']);
                }
              }, currentUI: Box3.primaryUI);
          // Get.toNamed(AppRoutes.validateOTP, arguments: {"stepOrderId": stepOrderId, "idNumber": Box3.customerDetailsFZ!.data!.idNo, "customerCode": customerCode});
          buttonLoading = false;
          break;

        case "SC-STEP2":
          // :::::::::::::: Changes By Vijay ::::::::::::::::::::::
          stepOrderID = response.data?.stepOrderId ?? '2';

          if (pageRouting == FormType.changeUserName) {
            bool status = await forgetMpin(
              stepOrderId: stepOrderID,
              data: {
                "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
                "IdNo": Box3.customerDetailsFZ?.data?.idNo,
                "Mobile": Box3.customerDetailsFZ?.data?.mobileNo,
                "CredentialType": "USERNAME",
              },
            );

            if (status == true) {
              Get.focusScope?.unfocus();
              Get.dialog(successAlert(isDark,
                  content: messageDescription ?? 'Email sent to customer'.tr));
              await Future.delayed(const Duration(milliseconds: 3000));
              buttonLoading = false;
              Get.offAllNamed(AppRoutes.login);
              buttonLoading = false;
              update();
              if (Get.isDialogOpen == true) Get.back();
              return true; // Add this
            } else {
              return false; // Add fallback
            }
          } else if (pageRouting == FormType.forgotMpin) {
            buttonLoading = false;
            update();
            if (Get.isDialogOpen == true) Get.back();
            forgotMpinForm.formClear(forgotMpinFormBV!.formFieldItem);
            Get.toNamed(AppRoutes.changeMPIN);
            return true; // Consider adding
          } else if (pageRouting == FormType.forgotPassword) {
            buttonLoading = false;
            update();
            if (Get.isDialogOpen == true) Get.back();
            forgotPasswordForm.formClear(forgotPasswordFormFZ!.formFieldItem);
            Get.toNamed(AppRoutes.changePassword);
            return true; // Consider adding
          } else {
            buttonLoading = false;
            update();
            if (Get.isDialogOpen == true) Get.back();
            forgotMpinForm.formClear(forgotMpinFormBV!.formFieldItem);
            Get.toNamed(AppRoutes.changeMPIN);
            return true; // Consider adding
          }
        case "SC-FINISH":
          if (Get.isDialogOpen == true) Get.back();
          buttonLoading = false;
          Get.offAllNamed(AppRoutes.login);
          errorAlert(title: messageHeader, content: messageDescription ?? "");
          return true;
      }
    }
  }

  Future createAlert(int alert) async {
    buttonLoading = true;
    update();
    try {
      var data = await ApiService().createRemAlert(alert);
      bool status =
          data['StatusCode'] == "RMA-SUCC" || data['StatusCode'] == "SC-SUCC";
      if (status) {
        alert == 1
            ? forexAttributes.forAmount.clear()
            : remittanceAttributes.remAmount.clear();
        showSuccessAlert(
          title: data['CustomMessageDetails']['MessageHeader'],
          content: data['CustomMessageDetails']['MessageDescription'],
          function: () => Get.back(),
        );
      } else {
        errorAlert(
          content: data['CustomMessageDetails']?['MessageDescription'] ??
              data['StatusMessage'],
        );
      }
    } finally {
      buttonLoading = false;
      update();
    }
  }

  void logoutAlert({
    required String title,
    required String description,
    required String yes,
    required String no,
  }) {
    Get.dialog(
        yesOrNoAlert(
            title: title.tr,
            body: description.tr,
            yesText: yes.tr,
            noText: no.tr,
            hideIcon: true,
            onTap: () async {
              Get.offAllNamed((Box3.settings.preLogin)
                  ? AppRoutes.preLogin
                  : AppRoutes.login);
            }),
        barrierColor: Get.find<AccountController>().isDark
            ? AppConfigs.w.withOpacity(0.2)
            : null);
  }

  /// forgot MPIN
  KeyboardActionsConfig keyboardConfigForgotMPINPASSWORD(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: fptc.newPwdNode,
          ),
          KeyboardActionsItem(
            focusNode: fptc.confPwdNode,
          ),
        ]);
  }

// bool uaePassRetryLoading = false;

  // late AppLinks _appLinks;
  // StreamSubscription<Uri>? _linkSubscription;
  //
  // Future<void> initDeepLinks() async {
  //   _appLinks = AppLinks();
  //
  //   // Handle links
  //   _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
  //     debugPrint('onAppLink: $uri');
  //     openAppLink(uri);
  //   });
  // }

  // String deepLinkScheme1 = "${AppConfigs.DEEPLINK_SCHEME_1}://failure";
  // String deepLinkScheme2 = "${AppConfigs.DEEPLINK_SCHEME_2}://failure";

  // void openAppLink(Uri uri) async {
  //   final uriStr = uri.toString().toLowerCase();
  //   final signUpCtrl = Get.find<SignUpController>();
  //
  //   if (uriStr == "${AppConfigs.DEEPLINK_SCHEME_2}://failure") {
  //     final uuid = signUpCtrl.uaePassProfileFz?.uuid;
  //     final idn = signUpCtrl.uaePassProfileFz?.idn;
  //
  //     if (uuid != null && idn != null) {
  //       _resetLoadingStates();
  //
  //       final uaePassData =
  //           await ApiService().fetchUAEPassDocUUIDEID(uuID: uuid, eID: idn);
  //       final authType = uaePassData?.first.reqAuthorized ?? '';
  //
  //       if (authType.isNotEmpty && Get.isDialogOpen != true) {
  //         final args = _buildUaePassArgs(authType, signUpCtrl);
  //         Get.back();
  //         update();
  //         Get.toNamed(AppRoutes.notificationNotExpiredRetryRoutes,
  //             arguments: args);
  //       }
  //     }
  //   } else if (uriStr == "${AppConfigs.DEEPLINK_SCHEME_1}://failure") {
  //     if (Get.isDialogOpen != true) {
  //       Get.back();
  //       _resetLoadingStates();
  //
  //       await Get.dialog(
  //         kycPendingAlert(isDark, 'User cancelled the login'.tr,
  //             title: 'Error'.tr, image: SvgIcons.deviceVerify),
  //       );
  //     }
  //   }
  // }
  //
  // void _resetLoadingStates() {
  //   final signUpCtrl = Get.find<SignUpController>();
  //   loading = false;
  //   retryLoading = false;
  //   uaeLButtonLoading = false;
  //   signUpCtrl.loading = false;
  //   signUpCtrl.uaePassLoading = false;
  //   update();
  // }
  //
  // Map<String, dynamic> _buildUaePassArgs(
  //     String authType, SignUpController ctrl) {
  //   final profile = ctrl.uaePassProfileFz;
  //   final nationalityEN = profile?.nationalityEN ?? '';
  //
  //   final documentType = nationalityEN == 'ARE'
  //       ? 'Passport'
  //       : gccCountries.contains(nationalityEN)
  //           ? ''
  //           : 'ResidenceVisa';
  //
  //   return {
  //     "msg": authType.toLowerCase().contains('n')
  //         ? '${'You have rejected the data sharing request on UAE PASS. Please retry'.tr} '
  //         : '${'There was an error while fetching your documents from UAE PASS. Please retry'.tr} ',
  //     "token": ctrl.uaePassAuthToken ?? '',
  //     "emiratesID": profile?.idn ?? '',
  //     "documentType": documentType,
  //     "uuid": profile?.uuid ?? '',
  //     "isFrom": "deeplink",
  //     "kycBV": uaePassProfileFz,
  //   };
  // }

  // late AppLinks _appLinks;
  // StreamSubscription<Uri>? _linkSubscription;
  //
  // Future<void> initDeepLinks() async {
  //   _appLinks = AppLinks();
  //
  //   _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
  //     debugPrint('onAppLink: $uri');
  //     openAppLink(uri);
  //   });
  // }
  //
  // void openAppLink(Uri uri) async {
  //   final uriStr = uri.toString().toLowerCase();
  //
  //   if (uriStr.contains("${AppConfigs.DEEPLINK_SCHEME_2}://failure")) {
  //     await handleSharafExchangeDocFailure();
  //   } else if (uriStr.contains("${AppConfigs.DEEPLINK_SCHEME_3}://failure")) {
  //     await handleSharafExchangeDashFailure();
  //   } else if (uriStr.contains("${AppConfigs.DEEPLINK_SCHEME_1}://failure")) {
  //     await handleSharafExchangeGenericFailure();
  //   }
  // }
  //
  // Future<void> handleSharafExchangeDocFailure() async {
  //   final signUpController = Get.find<SignUpController>();
  //
  //   if (signUpController.uaePassProfileFz?.uuid != null &&
  //       signUpController.uaePassProfileFz?.idn != null) {
  //     loading = false;
  //     retryLoading = false;
  //     uaeLButtonLoading = false;
  //
  //     signUpController.loading = false;
  //     signUpController.uaePassLoading = false;
  //     update();
  //
  //     Future.delayed(const Duration(seconds: 6), () async {
  //       final uaePassData = await ApiService().fetchUAEPassDocUUIDEID(
  //         uuID: signUpController.uaePassProfileFz?.uuid ?? '',
  //         eID: signUpController.uaePassProfileFz?.idn ?? '',
  //       );
  //
  //       final authType = uaePassData?[0].reqAuthorized ?? '';
  //       if (authType.isNotEmpty) {
  //         if (authType == 'N') {
  //           debugPrint("${AppConfigs.DEEPLINK_SCHEME_2}://failure" + " - Rejected by user");
  //           if (Get.isDialogOpen != true) {
  //             Get.toNamed(AppRoutes.notificationNotExpiredRetryRoutes,
  //                 arguments: {
  //                   "msg":
  //                   '${'You have rejected the data sharing request on UAE PASS. Please retry'.tr} ',
  //                   "token": signUpController.uaePassAuthToken ?? '',
  //                   "emiratesID": signUpController.uaePassProfileFz?.idn ?? '',
  //                   "documentType":
  //                   getDocumentType(signUpController.uaePassProfileFz?.nationalityEN),
  //                   "uuid": signUpController.uaePassProfileFz?.uuid ?? '',
  //                   "isFrom": "deeplink",
  //                   "kycBV": uaePassProfileFz
  //                 });
  //           }
  //         } else {
  //           debugPrint(
  //               "${AppConfigs.DEEPLINK_SCHEME_2}://failure" + " - Error while fetching doc");
  //           if (Get.isDialogOpen != true) {
  //             Get.toNamed(AppRoutes.notificationNotExpiredRetryRoutes,
  //                 arguments: {
  //                   "msg":
  //                   '${'There was an error while fetching your documents from UAE PASS. Please retry'.tr} ',
  //                   "token": signUpController.uaePassAuthToken ?? '',
  //                   "emiratesID": signUpController.uaePassProfileFz?.idn ?? '',
  //                   "documentType":
  //                   getDocumentType(signUpController.uaePassProfileFz?.nationalityEN),
  //                   "uuid": signUpController.uaePassProfileFz?.uuid ?? '',
  //                   "isFrom": "deeplink",
  //                   "kycBV": uaePassProfileFz
  //                 });
  //           }
  //         }
  //       }
  //     });
  //   }
  // }
  //
  // Future<void> handleSharafExchangeDashFailure() async {
  //   final signUpController = Get.find<SignUpController>();
  //
  //   if (signUpController.uaePassProfileFz?.uuid != null &&
  //       signUpController.uaePassProfileFz?.idn != null) {
  //     loading = false;
  //     retryLoading = false;
  //     uaeLButtonLoading = false;
  //
  //     signUpController.loading = false;
  //     signUpController.uaePassLoading = false;
  //     update();
  //
  //     Future.delayed(const Duration(seconds: 6), () async {
  //       final uaePassData = await ApiService().fetchUAEPassDocUUIDEID(
  //         uuID: signUpController.uaePassProfileFz?.uuid ?? '',
  //         eID: signUpController.uaePassProfileFz?.idn ?? '',
  //       );
  //
  //       final authType = uaePassData?[0].reqAuthorized ?? '';
  //       if (authType.isNotEmpty) {
  //         if (authType == 'N') {
  //           debugPrint("${AppConfigs.DEEPLINK_SCHEME_3}://failure" + " - Rejected by user");
  //           if (Get.isDialogOpen != true) {
  //             Get.toNamed(AppRoutes.visualizationRetryRoutesUAEPASS,
  //                 arguments: {
  //                   "msg":
  //                   '${'You have rejected the data sharing request on UAE PASS. Please retry'.tr} ',
  //                   "type": 'P',
  //                   "isFrom": 'Dash',
  //                 });
  //           }
  //         } else {
  //           debugPrint(
  //               "${AppConfigs.DEEPLINK_SCHEME_3}://failure" " - Error while fetching doc");
  //           if (Get.isDialogOpen != true) {
  //             Get.toNamed(AppRoutes.visualizationRetryRoutesUAEPASS,
  //                 arguments: {
  //                   "msg":
  //                   '${'There was an error while fetching your documents from UAE PASS. Please retry'.tr} ',
  //                   "type": 'P',
  //                   "isFrom": 'Dash',
  //                 });
  //           }
  //         }
  //       }
  //     });
  //   }
  // }
  //
  // Future<void> handleSharafExchangeGenericFailure() async {
  //   if (Get.isDialogOpen != true) {
  //     final signUpController = Get.find<SignUpController>();
  //
  //     Get.back();
  //     loading = false;
  //     uaeLButtonLoading = false;
  //     signUpController.loading = false;
  //
  //     update();
  //
  //     await Get.dialog(
  //       kycPendingAlert(
  //         isDark,
  //         'User cancelled the login'.tr,
  //         title: 'Error'.tr,
  //         image: SvgIcons.deviceVerify,
  //       ),
  //     );
  //   }
  // }
  //
  // String getDocumentType(String? nationalityEN) {
  //   if (nationalityEN == 'ARE') return 'Passport';
  //   if (gccCountries.contains(nationalityEN)) return '';
  //   return 'ResidenceVisa';
  // }
  //
  // @override
  // void dispose() {
  //   _linkSubscription?.cancel();
  //   super.dispose();
  // }

  late AppLinks _appLinks;
  StreamSubscription<Uri>? _linkSubscription;

  Future<void> initDeepLinks() async {
    _appLinks = AppLinks();

    _linkSubscription = _appLinks.uriLinkStream.listen((uri) {
      debugPrint('onAppLink: $uri');
      openAppLink(uri);
    });
  }

  void openAppLink(Uri uri) {
    final uriStr = uri.toString().toLowerCase();

    if (uriStr.contains("${AppConfigs.DEEPLINK_SCHEME_2}://failure")) {
      _handleFailure(FailureType.doc);
    } else if (uriStr.contains("${AppConfigs.DEEPLINK_SCHEME_3}://failure")) {
      _handleFailure(FailureType.dash);
    } else if (uriStr.contains("${AppConfigs.DEEPLINK_SCHEME_1}://failure")) {
      _handleFailure(FailureType.generic);
    }
  }

  Future<void> _handleFailure(FailureType type) async {
    final signUpController = Get.find<SignUpController>();

    if (type == FailureType.generic) {
      if (Get.isDialogOpen != true) {
        Get.back();
        _resetLoadingStates(signUpController);
        update();
        await Get.dialog(
          kycPendingAlert(
            isDark,
            'User cancelled the login'.tr,
            title: 'Error'.tr,
            image: SvgIcons.deviceVerify,
          ),
        );
      }
      return;
    }

    if (signUpController.uaePassProfileFz?.uuid == null ||
        signUpController.uaePassProfileFz?.idn == null) {
      return;
    }

    _resetLoadingStates(signUpController);
    update();

    await Future.delayed(const Duration(seconds: 6));
    final profile = signUpController.uaePassProfileFz;

    if (profile == null || profile.uuid == null || profile.idn == null) {
      return;
    }

    final data = await ApiService().fetchUAEPassDocUUIDEID(
      uuID: profile.uuid!,
      eID: profile.idn!,
    );

    final authType = data?[0].reqAuthorized ?? '';
    if (authType.isEmpty) return;

    final rejected = authType == 'N';
    debugPrint(
        "${_schemeFromType(type)}://failure - ${rejected ? 'Rejected by user' : 'Error while fetching doc'}");

    if (Get.isDialogOpen != true) {
      _navigateToFailureScreen(type, rejected, signUpController);
    }
  }

  void _navigateToFailureScreen(
      FailureType type, bool isRejected, SignUpController controller) {
    final String message = isRejected
        ? 'You have rejected the data sharing request on UAE PASS. Please retry'
            .tr
        : 'There was an error while fetching your documents from UAE PASS. Please retry'
            .tr;

    switch (type) {
      case FailureType.doc:
        Get.toNamed(AppRoutes.notificationNotExpiredRetryRoutes, arguments: {
          "msg": message,
          "token": controller.uaePassAuthToken ?? '',
          "emiratesID": controller.uaePassProfileFz?.idn ?? '',
          "documentType":
              getDocumentType(controller.uaePassProfileFz?.nationalityEN),
          "uuid": controller.uaePassProfileFz?.uuid ?? '',
          "isFrom": "deeplink",
          "kycBV": uaePassProfileFz
        });
        break;

      case FailureType.dash:
        Get.toNamed(AppRoutes.visualizationRetryRoutesUAEPASS, arguments: {
          "msg": message,
          "type": 'P',
          "isFrom": 'Dash',
        });
        break;

      default:
        break;
    }
  }

  void _resetLoadingStates(SignUpController controller) {
    loading = false;
    retryLoading = false;
    uaeLButtonLoading = false;
    controller.loading = false;
    controller.uaePassLoading = false;
  }

  String _schemeFromType(FailureType type) {
    switch (type) {
      case FailureType.doc:
        return AppConfigs.DEEPLINK_SCHEME_2;
      case FailureType.dash:
        return AppConfigs.DEEPLINK_SCHEME_3;
      default:
        return AppConfigs.DEEPLINK_SCHEME_1;
    }
  }

  String getDocumentType(String? nationalityEN) {
    if (nationalityEN == 'ARE') return 'Passport';
    if (gccCountries.contains(nationalityEN)) return '';
    return 'ResidenceVisa';
  }

  @override
  void dispose() {
    _linkSubscription?.cancel();
    super.dispose();
  }
}

enum FailureType {
  doc,
  dash,
  generic,
}
