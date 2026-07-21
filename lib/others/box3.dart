import 'dart:convert';
import 'dart:io';

import '../flavors.dart';

import 'package:appcheck/appcheck.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_safety_info/vpn_check.dart';
import 'package:device_safety_info/vpn_state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:flutter_windowmanager_plus/flutter_windowmanager_plus.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mobiremit/core/exports/controllers.dart';
import 'package:mobiremit/models/beneficiary/beneficiary_fz.dart';
import 'package:mobiremit/models/currency_symbol/currency_symbol_fz.dart';
import 'package:mobiremit/models/custom_message/custom_message_details_fz.dart';
import 'package:mobiremit/models/masters/master_response_fz.dart';
import 'package:mobiremit/models/notification/events/events_fz.dart';
import 'package:mobiremit/models/notification/modules/modules_fz.dart';
import 'package:mobiremit/static_data/cms_data.dart';
import 'package:path_provider/path_provider.dart';

import '../core/flavours/constants.dart';
import '../models/application_settings/settings_fz.dart';
import '../models/cms/cms_fz.dart';
import '../models/company_settings/company_data_fz.dart';
import '../models/customer_details/customer_data_fz.dart';
import '../models/form_rules/form_rules_response_fz.dart';
import '../models/uae_pass/fetch_uae_pass_doc.dart';
import '../models/uae_pass/uae_pass_profile_fz.dart';
import '../network/api_service_new.dart';
import '../ui_one/custom_widgets/session_timeout.dart';
import '../ui_one/custom_widgets/sharing_app_alert.dart';
import 'data_encryption.dart';

class Box3 {
  static SettingsFZ? _settings;
  static Cms? _cms;
  static List<CmsList> cmsList = [];
  static List<CmsList> cacheCmsList = [];
  static CustomerDataFZ? customerDetailsFZ;

  static String? appKeyToken;
  static String? environmentCode;
  static String? clientCode;
  static String? appIPAddress;

  static bool? isBiometricEnabled;
  static CompanyDataFZ? companyDataFZ;

  static late final GetStorage data;
  static late final GetStorage langBox;
  static late final GetStorage auth1;

  static late KYCStatus kycStatus;
  static bool idExpired = false;
  static CustomMessageDetailsFZ? idExpiryMessage;

  static DateTime? savedOn;

  static FetchUAEPassDoc? fetchUAEPassDoc;

  static bool get configFailed => _settings == null;

  static RxBool isInternet = true.obs;

  static bool isVpn = false;
  static VPNCheck vpnCheck = VPNCheck();
  static bool initLoaded = false;
  static bool isFormRuleNameShow=true;
  static bool initialized = false;
  static List<CurrencySymbol>? currencySymbol = [];

  static Future<void> ensureInitialized() async {
    if (!initialized) {
      await Box3.init();
      initialized = true;
    }
  }

  static Future<void> init() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();

    String containerSuffix = '';
    if (F.appFlavor == Flavor.casmex && AppConfigs.env == Environment.demo) {
      if (AppConfigs.selectedDemoFlavorName.isNotEmpty) {
        containerSuffix = '_${AppConfigs.selectedDemoFlavorName}';
      }
    }

    auth1 = GetStorage('auth$containerSuffix', appDirectory.path);
    data = GetStorage('data$containerSuffix', appDirectory.path);
    langBox = GetStorage('lang$containerSuffix', appDirectory.path);

    await Future.wait(
        [auth1.initStorage, data.initStorage, langBox.initStorage]);

    var myUserData = auth1.read(Keys.userData);
    var myUserInfo = auth1.read(Keys.userInfo);
    String? s = myUserData != null
        ? DataEncryption.readEncryptBox(myUserData ?? '')
        : null;
    String? t = myUserInfo != null
        ? DataEncryption.readEncryptBox(myUserInfo ?? '')
        : null;
    try {
      customerDetailsFZ =
          t != null ? CustomerDataFZ.fromJson(jsonDecode(t)) : null;
      if (kDebugMode) {
        print("CustomerDATA::");
      }
      if (kDebugMode) {
        print(customerDetailsFZ?.toJson());
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    s = auth1.read(Keys.kycStatus);
    kycStatus = KYCStatus.values
        .firstWhere((e) => e.toString() == s, orElse: () => KYCStatus.complete);

    monitorInternetConnection();
    await getAppTheme();
    await getIPAddress();
    await getAppLanguage();
    await getAppStatus();
    await loadCmsCache();
    await saveConfig();
    await checkVPN();
    disableScreenshot();
    await getCompanyDetails();
    getCurrencySymbols();

    var deviceIdData = data.read(Keys.deviceId);
    if (deviceIdData == null) {
      String? id;
      id = await FlutterUdid.consistentUdid;
      await data.write(Keys.deviceId, id);
      ApiService.deviceId = id;
    } else {
      ApiService.deviceId = deviceId ?? '';
    }
    getDeviceId();

    if (data.read(Keys.savedOn) != null) {
      String? myData = data.read(Keys.savedOn);
      savedOn = DateTime.tryParse(myData ?? '');
    } else {
      savedOn = null;
    }
    initLoaded = true;
    try {
      isBiometricEnabled = auth1.read(Keys.biometric) ?? false;
    } catch (e) {
      isBiometricEnabled = false;
    }
  }

  static void monitorInternetConnection() {
    Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      // Get the most recent result from the list
      final result =
          results.isNotEmpty ? results.first : ConnectivityResult.none;

      if (result == ConnectivityResult.none) {
        isInternet.value = false;
        if (Get.isDialogOpen != true) {
          Get.defaultDialog(
            title: "No Internet",
            middleText: "Please check your internet connection.",
            // barrierDismissible: false,
          );
        }
      } else {
        isInternet.value = true;
        if (Get.isDialogOpen == true) {
          Get.back(); // close the dialog when internet comes back
        }
      }
    });
  }

  static Future<bool> checkVPN() async {
    if (Box3.settings.requiredVPNDetection == true) {
      bool isVpnConnected = await VPNCheck.isVPNActive();

      if (isVpnConnected) {
        isVpn = true;
        await sessionTimeOut(
            title: 'VPN or Proxy detected',
            message:
                'Oops! You seem to be using VPN/Proxy, Please disable it to access Mobile App');
      } else {
        isVpn = false;
      }

      vpnCheck.vpnState.listen((state) async {
        if (state == VPNState.connectedState && !isVpn) {
          isVpn = true;
          await sessionTimeOut(
              title: 'VPN or Proxy detected',
              message:
                  'Oops! You seem to be using VPN/Proxy, Please disable it to access Mobile App');
        } else if (state != VPNState.connectedState && isVpn) {
          isVpn = false;
        }
      });
    } else {
      isVpn = false;
      if (Get.isDialogOpen == true) {
        Get.back();
      }
    }

    // Check screen sharing if enabled
    if (Box3.settings.enableScreenMirrorDetection == true) {
      await checkScreenSharingApp();
    }

    return isVpn;
  }

  /// taking screenshots & screen recording disable
  static Future<bool> disableScreenshot({bool disable = true}) async {
    if (disable == true && Box3.settings.enableScreenMirrorDetection == true) {
      if (Platform.isAndroid) {
        await FlutterWindowManagerPlus.addFlags(
            FlutterWindowManagerPlus.FLAG_SECURE);
      } else {
        ///TODO: Screenshot security prevent
      }
    } else {
      if (Platform.isAndroid) {
        await FlutterWindowManagerPlus.clearFlags(
            FlutterWindowManagerPlus.FLAG_SECURE);
      } else {
        ///TODO: Screenshot security prevent
      }
    }
    return true;
  }

  static Future<void> checkScreenSharingApp() async {
    List<String> appNames = [];
    for (AppPackage element in screenSharingApps) {
      bool res = false;
      try {
        if (Platform.isAndroid) {
          res = await AppCheck().isAppInstalled(element.packageName);
        } else if (Platform.isIOS) {
          AppInfo? appInfo = await AppCheck().checkAvailability(element.appID);
          if (appInfo != null) {
            res = true;
          }
        }
      } catch (e) {
        res = false;
      }
      if (res == true) {
        appNames.add(element.appName);
      }
    }
    if (appNames.isNotEmpty) {
      if (Get.isDialogOpen!) Get.back();
      await Get.dialog(
        SharingAppAlert(
          appName: appNames,
          title: "Screen Sharing App Detected",
          body:
              "It looks like you've installed a screen-sharing app on your mobile device. For your security and privacy, we strongly recommend uninstalling any screen-sharing apps before continuing to use our app.\n\nPlease uninstall these apps and try again. Thank you for your understanding and cooperation.",
        ),
        barrierDismissible: false,
      );
    }
  }

  static String? deviceId;

  static Future<void> getDeviceId() async {
    var myData = data.read(Keys.deviceId);
    deviceId = myData;
    ApiService.deviceId = deviceId!;

    if (kDebugMode) {
      print("Device id: $deviceId");
    }
  }

  static MasterResponseFZ? lang;

  static Future<void> getAppLanguage() async {
    if (langBox.read(Keys.locale) != null) {
      var myAppLang = langBox.read(Keys.locale);

      lang =
          myAppLang != null ? MasterResponseFZ.fromJson(myAppLang ?? '') : null;
    } else {
      lang = null;
    }
  }

  static Future<void> getLang() async {
    if (langBox.read(Keys.locale) != null) {
      var myData = langBox.read(Keys.locale);
      lang = MasterResponseFZ.fromJson(myData);
    } else {
      lang = null;
    }
  }

  static Future<void> setLang(MasterResponseFZ l) async {
    await langBox.write(Keys.locale, l.toJson());
    getLang();
  }

  static String? myAppStatus;

  static Future<void> getAppStatus() async {
    myAppStatus = data.read(Keys.appState);
  }

  static AppStatus get status =>
      AppStatus.values.firstWhere((e) => e.toString() == myAppStatus,
          orElse: () => AppStatus.firstLaunch);

  static Future<void> setStatus(AppStatus a) async {
    myAppStatus = a.toString();
    await data.write(Keys.appState, a.toString());
  }

  static Future<void> setTheme(ThemeType t) async {
    theme = t;
    await data.write(Keys.theme, t.toString());

    updateStatusBarStyle(t == ThemeType.dark);
  }

  static Future<String?> getIPAddress() async {
    var myData = await ApiService().getPublicIpAddress();
    appIPAddress = myData;
    return appIPAddress;
  }

  static Future<void> getCurrencySymbols() async {
    var myData = await ApiService().getCurrencySymbols();
    if (myData != null) {
      currencySymbol = myData.currencySymbols;
    }
  }

  static Future<void> saveConfig({bool loadSetting = true}) async {
    final cachedConfig = data.read(Keys.newConfig);
    if (cachedConfig != null) {
      _settings = SettingsFZ.fromJson(cachedConfig);
      debugPrint('Loaded config from cache');
    }

    Map<String, dynamic> tokenRequestBody = {
      "AppKey": AppConfigs.appKey,
      "UserCode": "RMA",
      "BranchCode": AppConfigs.appBranchCode,
      "IPAddress": appIPAddress,
    };
    final myData =
        await ApiService().generateToken(tokenRequestBody: tokenRequestBody);
    if (myData?.statusCode == 'CC-SUCC') {
      appKeyToken = myData?.tokenData?.Token;
      saveClientCode(myData?.tokenData?.clientCode);
      var enCode = myData?.tokenData?.environmentCode != null &&
              myData?.tokenData?.environmentCode != ""
          ? myData?.tokenData?.environmentCode
          : "1";
      saveEnvironmentCode(enCode);
    }

    if (loadSetting) {
      final latestSettings = await ApiService().getSettingsNew();
      if (latestSettings != null) {
        _settings = latestSettings;
        await data.write(Keys.newConfig, _settings!.toJson());
        await data.write(Keys.savedOn, DateTime.now().toString());
        savedOn = DateTime.now();
        debugPrint('Config updated from API');
      } else {
        debugPrint('API settings null, keeping cache');
      }
    }
  }

  static Future loadCmsCache() async {
    if (await data.read(Keys.cms) != null) {
      var dd = await data.read(Keys.cms);
      _cms = Cms.fromJson(jsonDecode(dd));
      sortCMS(_cms?.cmsList ?? []);
    } else if (await data.read(Keys.cmsEn) != null) {
      var dd = await data.read(Keys.cmsEn);
      _cms = Cms.fromJson(jsonDecode(dd));
      sortCMS(_cms?.cmsList ?? []);
    } else {
      var dd = LocalData.cmsData;
      List<CmsList> cms = dd.map((e) => CmsList.fromJson(e)).toList();
      sortCMS(cms);
    }
  }

  static Future loadCms() async {
    loadCmsCache();
    _cms = await ApiService().getCMS();
    if (_cms != null) {
      await data.write(Keys.cms, jsonEncode(_cms?.toJson()));
      sortCMS(_cms?.cmsList ?? []);
      var lng = Box3.lang?.Code ?? "EN";
      if (lng == "EN") {
        await data.write(Keys.cmsEn, jsonEncode(_cms?.toJson()));
        cacheCmsList = _cms?.cmsList ?? [];
      }
    } else if (await data.read(Keys.cms) != null) {
      loadCmsCache();
    }
  }

  static Future<List<CmsList>> pageCms({String? page}) async {
    Cms? cms = await ApiService().getCMS(code: page);
    return cms?.cmsList ?? [];
  }

  static void sortCMS(List<CmsList> cms) {
    cmsList = cms;
  }

  static WebUri getWebViewBaseUrl(String apiBaseUrl) {
    final uri = Uri.parse(apiBaseUrl);
    return WebUri(Uri(
      scheme: uri.scheme,
      host: uri.host,
      port: uri.hasPort ? uri.port : null,
    ).toString());
  }

  static SettingsFZ get settings => _settings ?? SettingsFZ();

  static String get countryCode => _settings?.COUNTRYDIALINGCODE ?? '';

  static AppUI get primaryUI => _settings?.primaryUI ?? AppUI.defaultUI;

  static ThemeType theme = ThemeType.light;

  static Future<void> getAppTheme() async {
    var myData = await data.read(Keys.theme);
    theme = ThemeType.values.firstWhere((e) => e.toString() == myData,
        orElse: () => ThemeType.light);

    bool isDarkMode = false;

    if (theme == ThemeType.dark) {
      Get.changeTheme(ThemeData.dark());
      isDarkMode = true;
    } else if (theme == ThemeType.system) {
      if (Get.isPlatformDarkMode) {
        Get.changeTheme(ThemeData.dark());
      } else {
        Get.changeTheme(ThemeData.light());
      }
      isDarkMode = Get.isPlatformDarkMode;
    } else {
      Get.changeTheme(ThemeData.light());
      isDarkMode = false;
    }

    updateStatusBarStyle(isDarkMode);
  }

  static void updateStatusBarStyle(bool isDarkMode) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            isDarkMode ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDarkMode ? Brightness.dark : Brightness.light,
      ),
    );
  }

  static Future<void> setBiometric(bool b) async {
    await auth1.write(Keys.biometric, b);
    isBiometricEnabled = auth1.read(Keys.biometric) ?? false;
  }

  static Future<void> setKYCStatus(KYCStatus k) async {
    await auth1.write(Keys.kycStatus, k.toString());
  }

  static Future<void> saveUserInfo(dynamic u) async {
    if (u != null) {
      var newData = DataEncryption.writeEncryptBox(
          Uint8List.fromList(jsonEncode(u).codeUnits));
      await auth1.write(Keys.userInfo, newData);

      customerDetailsFZ = CustomerDataFZ.fromJson(u);
      if (Get.isRegistered<AccountController>()) {
        Get.find<AccountController>()
          ..syncIdImagesFromCustomerData()
          ..getEKYCData();
      } else {
        Get.put(AccountController())
          ..syncIdImagesFromCustomerData()
          ..getEKYCData();
      }
    }
  }

  static Future<void> refreshUserInfo(dynamic u) async {
    if (u != null) {
      var newData = DataEncryption.writeEncryptBox(
          Uint8List.fromList(jsonEncode(u).codeUnits));
      await auth1.write(Keys.userInfo, newData);
      customerDetailsFZ = CustomerDataFZ.fromJson(u);
      if (Get.isRegistered<AccountController>()) {
        Get.find<AccountController>().syncIdImagesFromCustomerData();
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.find<AccountController>().update();
      });
    }
  }

  static Future<void> saveAppToken(String? u) async {
    if (u != null) {
      await data.write(Keys.appToken, u);
      appKeyToken = u;
    }
  }

  static Future<void> saveEnvironmentCode(String? u) async {
    if (u != null) {
      await data.write(Keys.environmentCode, u);
      environmentCode = u;
    }
  }

  static Future<void> saveClientCode(String? u) async {
    if (u != null) {
      await data.write(Keys.clientCode, u);
      clientCode = u;
    }
  }

  /// uaepass profile bv par
  static UaePassProfileFz? uaePassProfileFz;

  static Future<void> saveKYCBVData(UaePassProfileFz? uaePassProfileFz) async {
    if (uaePassProfileFz != null) {
      var newData = DataEncryption.writeEncryptBox(
          Uint8List.fromList(uaePassProfileFz.toJson().toString().codeUnits));
      await auth1.write(Keys.kycBV, newData);
      uaePassProfileFz = uaePassProfileFz;
    }
  }

  /// form rules
  static FormRulesData? nIDFormBV,
      credFormBV,
      formBV,
      idVerificationFormBV,
      addBeneficiaryFormBV,
      sendMoneyFormBV,
      forgotMpinFormBV,
      changeMpinFormBV,
      myProfileFormBV,
      resetMPINFormFZ,
      resetPasswordFormFZ,
      profileUpdateFormFZ,
      forgotUsernameFormFZ,
      forgotPasswordFormFZ,
      changePasswordFormFZ;

  /// NID form rules
  static Future<void> getNIDForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.preLoginFormRules);
    nIDFormBV = resp?.formRulesData;

    if (nIDFormBV != null) {
      await data.write(Keys.nidForm, nIDFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.preLoginFormRules);
    } else if (data.read(Keys.nidForm) != null) {
      nIDFormBV = FormRulesData.fromJson(data.read(Keys.nidForm));
    }
  }

  /// identity verification form rules
  static Future<void> getIdentityVerificationForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.identityVerificationFormRules);
    idVerificationFormBV = resp?.formRulesData;

    if (idVerificationFormBV != null) {
      await data.write(
          Keys.identityVerificationForm, idVerificationFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.identityVerificationFormRules);
    } else if (data.read(Keys.identityVerificationForm) != null) {
      idVerificationFormBV =
          FormRulesData.fromJson(data.read(Keys.identityVerificationForm));
    }
  }

  /// Set Cred form rules
  static Future<void> getCredForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.signupCredentialFormRules);
    credFormBV = resp?.formRulesData;

    if (credFormBV != null) {
      await data.write(Keys.setCredForm, credFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.signupCredentialFormRules);
    } else if (data.read(Keys.setCredForm) != null) {
      credFormBV = FormRulesData.fromJson(data.read(Keys.setCredForm));
    }
  }

  /// Add Customer form rules
  static Future<void> getSignUpForm() async {
    var resp =
        await ApiService().getFormRuleNew(formName: FormNames.signUpFormRule);
    formBV = resp!.formRulesData;

    if (formBV != null) {
      await data.write(Keys.addCustomerForm, formBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.signUpFormRule);
    } else if (data.read(Keys.addCustomerForm) != null) {
      formBV = FormRulesData.fromJson(data.read(Keys.addCustomerForm));
    }
  }

  /// UAEPASS Add Customer form rules
  static Future<void> getUAEPassSignUpForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.signUpUAEPASSFormRules);
    formBV = resp!.formRulesData;

    if (formBV != null) {
      await data.write(Keys.addCustomerForm, formBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.signUpUAEPASSFormRules);
    } else if (data.read(Keys.addCustomerForm) != null) {
      formBV = FormRulesData.fromJson(data.read(Keys.addCustomerForm));
    }
  }

  /// Add Beneficiary form rules
  static Future<void> getAddBeneficiaryForm({String? criteriaMap}) async {
    var resp = await ApiService().getFormRuleNew(
        formName: FormNames.beneficiaryCreationFormRules,
        criteriaMap: criteriaMap);
    addBeneficiaryFormBV = resp?.formRulesData;

    if (addBeneficiaryFormBV != null) {
      await data.write(Keys.addBeneficiaryForm, addBeneficiaryFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.beneficiaryCreationFormRules);
    } else if (data.read(Keys.addBeneficiaryForm) != null) {
      try {
        addBeneficiaryFormBV =
            FormRulesData.fromJson(data.read(Keys.addBeneficiaryForm));
      } catch (e) {
        addBeneficiaryFormBV = null;
      }
    }
  }

  /// Add Beneficiary form rules
  static Future<void> getSendMoneyForm({String? criteriaMap}) async {
    BeneficiaryFz? sBenef = Get.find<TransferController>().selectedBeneficiary;
    var resp = await ApiService().getFormRuleNew(
        formName: FormNames.sendMoneyFormRules,
        moduleName: "43",
        criteriaMap: criteriaMap ??
            "Correspondent Country = ${sBenef?.serviceCountry?.Code ?? 'Any'};Correspondent Currency = ${sBenef?.serviceCurrency?.Code ?? 'Any'};Correspondent Service Category = ${sBenef?.serviceType?.Code ?? 'Any'}");
    sendMoneyFormBV = resp?.formRulesData;

    if (sendMoneyFormBV != null) {
      // await data.write(Keys.sendMoneyForm, sendMoneyFormBV!.toJson());
      // await data.write(Keys.savedOn, DateTime.now().toString());
      // savedOn = DateTime.now();
      debugPrint(FormNames.sendMoneyFormRules);
    } else {
      sendMoneyFormBV = null;
    }
    // else if (data.read(Keys.sendMoneyForm) != null) {
    // try {
    //   sendMoneyFormBV = FormRulesData.fromJson(data.read(Keys.sendMoneyForm));
    // } catch (e) {
    //   sendMoneyFormBV = null;
    // }
    // }
  }

  static Future<void> getMyProfileForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.profileDetailsFormRules);
    myProfileFormBV = resp!.formRulesData;

    if (myProfileFormBV != null) {
      await data.write(Keys.myProfileForm, myProfileFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.profileDetailsFormRules);
    } else if (data.read(Keys.myProfileForm) != null) {
      try {
        myProfileFormBV = FormRulesData.fromJson(data.read(Keys.myProfileForm));
      } catch (e) {
        myProfileFormBV = null;
      }
    }
  }

  /// Add Beneficiary form rules
  static Future<void> getResetMPINForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.resetMPINFormRules);
    resetMPINFormFZ = resp!.formRulesData;

    if (resetMPINFormFZ != null) {
      await data.write(Keys.changeMPINFormFZ, resetMPINFormFZ!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.resetMPINFormRules);
    } else if (data.read(Keys.changeMPINFormFZ) != null) {
      try {
        resetMPINFormFZ =
            FormRulesData.fromJson(data.read(Keys.changeMPINFormFZ));
      } catch (e) {
        resetMPINFormFZ = null;
      }
    }
  }

  /// Add Beneficiary form rules
  static Future<void> getResetPasswordForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.resetPasswordFormRules);
    resetPasswordFormFZ = resp!.formRulesData;

    if (resetPasswordFormFZ != null) {
      await data.write(
          Keys.changePasswordFormFZ, resetPasswordFormFZ!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.resetPasswordFormRules);
    } else if (data.read(Keys.changePasswordFormFZ) != null) {
      try {
        resetPasswordFormFZ =
            FormRulesData.fromJson(data.read(Keys.changePasswordFormFZ));
      } catch (e) {
        resetPasswordFormFZ = null;
      }
    }
  }

  // Forgot MPIN Form Rule
  static Future<void> getForgotMpinForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.forgotMPINFormRules);
    forgotMpinFormBV = resp?.formRulesData;

    if (forgotMpinFormBV != null) {
      await data.write(Keys.forgotMPINForm, forgotMpinFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
      debugPrint(FormNames.forgotMPINFormRules);
    } else if (data.read(Keys.forgotMPINForm) != null) {
      forgotMpinFormBV = FormRulesData.fromJson(data.read(Keys.forgotMPINForm));
    }
  }

  // Forgot UserName Form Rule
  static Future<void> getForgotUserNameForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.forgotUsernameFormRules);
    forgotMpinFormBV = resp!.formRulesData;

    if (forgotMpinFormBV != null) {
      await data.write(Keys.forgotMPINForm, forgotMpinFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
    } else if (data.read(Keys.forgotMPINForm) != null) {
      forgotMpinFormBV = FormRulesData.fromJson(data.read(Keys.forgotMPINForm));
    }
  }

  // Change MPIN Form Rule
  static Future<void> getChangeMpinForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.changeMPINFormRules);
    changeMpinFormBV = resp!.formRulesData;

    if (changeMpinFormBV != null) {
      await data.write(Keys.changeMPINForm, changeMpinFormBV!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
    } else if (data.read(Keys.changeMPINForm) != null) {
      changeMpinFormBV = FormRulesData.fromJson(data.read(Keys.changeMPINForm));
    }
  }

  // Change MPIN Form Rule
  static Future<void> getProfileUpdateForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.updateProfileFormRules);
    profileUpdateFormFZ = resp!.formRulesData;

    if (profileUpdateFormFZ != null) {
      await data.write(Keys.profileUpdateForm, profileUpdateFormFZ!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
    } else if (data.read(Keys.profileUpdateForm) != null) {
      profileUpdateFormFZ =
          FormRulesData.fromJson(data.read(Keys.profileUpdateForm));
    }
  }

  // Forgot Password Form Rule
  static Future<void> getForgotPasswordForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.forgotPasswordFormRules);
    forgotPasswordFormFZ = resp!.formRulesData;

    if (forgotPasswordFormFZ != null) {
      await data.write(
          Keys.forgotPasswordFormFZ, forgotPasswordFormFZ!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
    } else if (data.read(Keys.forgotPasswordFormFZ) != null) {
      forgotPasswordFormFZ =
          FormRulesData.fromJson(data.read(Keys.forgotPasswordFormFZ));
    }
  }

  // Change Password Form Rule
  static Future<void> getChangePasswordForm() async {
    var resp = await ApiService()
        .getFormRuleNew(formName: FormNames.changePasswordFormRules);
    changePasswordFormFZ = resp!.formRulesData;

    if (changePasswordFormFZ != null) {
      await data.write(
          Keys.changePasswordFormFZ, changePasswordFormFZ!.toJson());
      await data.write(Keys.savedOn, DateTime.now().toString());
      savedOn = DateTime.now();
    } else if (data.read(Keys.changePasswordFormFZ) != null) {
      changePasswordFormFZ =
          FormRulesData.fromJson(data.read(Keys.changePasswordFormFZ));
    }
  }

  /// Alert module
  static List<ModuleList> moduleList = [];

  static Future<void> getAlertModule() async {
    moduleList = await ApiService().getNotificationModules();
  }

  /// Alert module Event Type
  static List<EventType> eventTypeList = [];

  static Future<void> getAlertModuleEventType() async {
    eventTypeList = await ApiService().getNotificationEvent();
  }

  static Future<void> getCompanyDetails() async {
    final localJson = data.read(Keys.companyDetails);
    if (localJson != null) {
      companyDataFZ = CompanyDataFZ.fromJson(localJson);
    }
    try {
      var resp = await ApiService().getCompanySettings();
      if (resp != null) {
        /// compare JSON strings to detect changes
        final String newJson = jsonEncode(resp.toJson());
        final String? existingJson =
            localJson != null ? jsonEncode(localJson) : null;
        if (existingJson != newJson) {
          /// update only if changed
          companyDataFZ = resp;
          await data.write(Keys.companyDetails, companyDataFZ!.toJson());
          debugPrint('company details updated.');
        } else {
          debugPrint('company details same.');
        }
      }
    } catch (e) {
      debugPrint('failed to fetch company settings: $e');
      if (companyDataFZ == null && localJson != null) {
        companyDataFZ = CompanyDataFZ.fromJson(localJson);
      }
    }
  }

  static String get companyLogo {
    bool isDarkMode = theme == ThemeType.dark ||
        (theme == ThemeType.system && Get.isPlatformDarkMode);

    Fields logoField = isDarkMode
        ? Fields.AppMainLogo_MainLogoDark
        : Fields.AppMainLogo_MainLogo;

    return (cms(logoField).image != null && cms(logoField).image!.isNotEmpty)
        ? cms(logoField).image ?? ''
        : Box3.companyDataFZ?.companySettings?.companyLogo ?? '';
  }
}
