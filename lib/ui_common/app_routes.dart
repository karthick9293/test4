import 'package:get/get.dart';
import 'package:mobiremit/models/application_settings/settings_fz.dart';
import 'package:mobiremit/startup/splash_screen.dart';
import 'package:mobiremit/ui_four/page_routes.dart';
import 'package:mobiremit/ui_one/page_routes.dart';
import 'package:mobiremit/ui_three/page_routes.dart';
import 'package:mobiremit/ui_two/page_routes.dart';

import '../core/editing_controllers.dart/attributes.dart';
import '../core/exports/controllers.dart';
import '../core/flavours/constants.dart';
import '../ui_five/page_routes.dart';
import '../ui_seven/page_routes.dart';
import '../ui_six/page_routes.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String adminSettings = '/home/admin_settings';
  static const String accountType = '/login/sign_up/account_type';
  static const String customerDetails = '/login/sign_up/customer_details';
  static const String dashboard = '/home/dashboard';
  static const String editProfile = '/home/app_drawer/edit_profile';
  static const String eSignature = '/login/signup/e_signature';
  static const String faceRecognition = '/login/signup/face_recognition';
  static const String forgotPassword = '/login/forgot_password';
  static const String changePassword = '/login/change_password';
  static const String forgotPassword3 = '/login/forgot_password_page_content3';
  static const String forgotMPIN = '/login/forgot_MPIN';
  static const String changeMPIN = '/login/chnage_MPIN';
  static const String forgotUsername = '/login/forgot_username';
  static const String resetCredentials = '/login/reset_credentials';
  static const String intro = '/intro';
  static const String login = '/login/login';
  static const String loginMPIN = '/login/login_MPIN';
  static const String main = '/home/main';
  static const String nid = '/sign_up/nid';
  static const String preLogin = '/home/preLogin';
  static const String resetMpin = '/login/reset_mpin';
  static const String selectLanguage = '/select_language';
  static const String setCredentials = '/signup/set_credentials';
  static const String securitySettings = '/login/sign_up/security_settings';
  static const String signUp = '/login/sign_up/sign_up';
  static const String selfie = '/login/sign_up/selfie';
  static const String uploadDocuments = '/login/sign_up/upload/documents';
  static const String videoKyc = '/login/signup/video_kyc';
  static const String settings = '/login/home/settings';
  static const String identityVerification =
      '/login/sign_up/identityVerification';

  static const String loadingRoutes = '/loadingRoutes';
  static const String docShareRetryRoutes = '/docRetryRoutes';
  static const String visualizationRetryRoutes = '/visualizationRetryRoutes';
  static const String notificationNotExpiredRetryRoutes =
      '/notificationNotExpiredRetryRoutes';

  static const String docShareRetryRoutesUAEPASS =
      '/docShareRetryRoutesUAEPASS';
  static const String visualizationRetryRoutesUAEPASS =
      '/visualizationRetryRoutesUAEPASS';
  static const String notificationNotExpiredRetryRoutesUAEPASS =
      '/notificationNotExpiredRetryRoutesUAEPASS';

  static const String beforeLoginCredentials =
      '/signup/before_login_set_credentials';
  static const String afterLoginCredentials =
      '/signup/after_login_set_credentials';
  static const String validateOTP = '/signup/after_login_set_credentials';

  static const String myBeneficiary = '/home/my_beneficiary';
  static const String archivedBeneficiary = '/home/archived_beneficiary';
  static const String myTransaction = '/home/my_transaction';
  static const String sendMoney = '/home/send_money';
  static const String confirmPaymentDetails = '/home/confirm_payment_details';
  static const String paymentMode = '/home/payment_mode';
  static const String forexRates = '/home/forex_rates_page';
  static const String myProfile = '/home/my_profile_page';
  static const String contactUs = '/home/contact_us_page';
  static const String aboutUs = '/home/about_us_page';
  static const String termConditions = '/home/terms_conditions_page';
  static const String privacyPolicy = '/home/privacy_policy_page';
  static const String resetPassword = '/home/reset_password_page';
  static const String fingerPrint = '/home/finger_print_page';
  static const String locations = '/home/locations_page';
  static const String createAlert = '/home/createAlert_page';

  static const String currencyRates = '/forex/currency_rates_page';
  static const String addBeneficiaryFormRules = '/home/addBeneficiaryFormRules';

  static List<GetPage<dynamic>> get pages => [
        GetPage(
            name: AppRoutes.accountType,
            page: () => getPage(AppRoutes.accountType),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.dashboard,
            page: () => getPage(AppRoutes.dashboard),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.eSignature,
            page: () => getPage(AppRoutes.eSignature),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.faceRecognition,
            page: () => getPage(AppRoutes.faceRecognition),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.forgotPassword,
            page: () => getPage(AppRoutes.forgotPassword),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.forgotMPIN,
            page: () => getPage(AppRoutes.forgotMPIN),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.changeMPIN,
            page: () => getPage(AppRoutes.changeMPIN),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.changePassword,
            page: () => getPage(AppRoutes.changePassword),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.forgotUsername,
            page: () => getPage(AppRoutes.forgotUsername),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.resetCredentials,
            page: () => getPage(AppRoutes.resetCredentials),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.intro,
            page: () => getPage(AppRoutes.intro),
            transition: Transition.noTransition),
        GetPage(
          name: AppRoutes.login,
          page: () => Box3.settings.LOGINAUTHENTICATIONSECONDARY == 'MPIN'
              ? getPage(AppRoutes.loginMPIN)
              : getPage(AppRoutes.login),
          binding: BindingsBuilder(() {
            if (!Get.isRegistered<AuthController>()) {
              Get.put(AuthController(), permanent: true);
            }
            if (!Get.isRegistered<AccountController>()) {
              Get.put(AccountController(), permanent: true);
            }
          }),
          transition: Transition.noTransition,
        ),
        GetPage(
            name: AppRoutes.main,
            page: () => getPage(AppRoutes.main),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.splashScreen,
            page: () => SplashScreen(),
            transition: Transition.noTransition),

        GetPage(
          name: AppRoutes.preLogin,
          page: () => getPage(AppRoutes.preLogin),
          transition: Transition.noTransition,
          binding: BindingsBuilder(() {
            Get.put(MainController(), permanent: true);
            Get.put(DataController(), permanent: true);
          }),
        ),
        GetPage(
            name: AppRoutes.resetMpin,
            page: () => getPage(AppRoutes.resetMpin),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.selectLanguage,
            page: () => getPage(AppRoutes.selectLanguage),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.securitySettings,
            page: () => getPage(AppRoutes.securitySettings),
            transition: Transition.noTransition),
        GetPage(
          name: AppRoutes.signUp,
          page: () => getPage(AppRoutes.signUp),
          transition: Transition.noTransition,
          binding: BindingsBuilder(() async {
            await Get.put(SignUpController(), permanent: true)
                .getSignUpForm(nIDLogin: true);
          }),
        ),
        GetPage(
          name: AppRoutes.setCredentials,
          page: () => getPage(AppRoutes.setCredentials),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: AppRoutes.selfie,
          page: () => getPage(AppRoutes.selfie),
          transition: Transition.noTransition,
        ),
        GetPage(
          name: AppRoutes.uploadDocuments,
          page: () => getPage(AppRoutes.uploadDocuments),
          transition: Transition.noTransition,
          binding: BindingsBuilder(() {
            Get.put(KycController());
          }),
        ),
        GetPage(
            name: AppRoutes.identityVerification,
            page: () => getPage(AppRoutes.identityVerification),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.videoKyc,
            page: () => getPage(AppRoutes.videoKyc),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.settings,
            page: () => getPage(AppRoutes.settings),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.loadingRoutes,
            page: () => getPage(AppRoutes.loadingRoutes),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.docShareRetryRoutes,
            page: () => getPage(AppRoutes.docShareRetryRoutes),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.visualizationRetryRoutes,
            page: () => getPage(AppRoutes.visualizationRetryRoutes),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.notificationNotExpiredRetryRoutes,
            page: () => getPage(AppRoutes.notificationNotExpiredRetryRoutes),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.docShareRetryRoutesUAEPASS,
            page: () => getPage(AppRoutes.docShareRetryRoutesUAEPASS),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.visualizationRetryRoutesUAEPASS,
            page: () => getPage(AppRoutes.visualizationRetryRoutesUAEPASS),
            transition: Transition.noTransition),

        GetPage(
            name: AppRoutes.notificationNotExpiredRetryRoutesUAEPASS,
            page: () =>
                getPage(AppRoutes.notificationNotExpiredRetryRoutesUAEPASS),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.myBeneficiary,
            page: () => getPage(AppRoutes.myBeneficiary),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.archivedBeneficiary,
            page: () => getPage(AppRoutes.archivedBeneficiary),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.myTransaction,
            page: () => getPage(AppRoutes.myTransaction),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.sendMoney,
            page: () => getPage(AppRoutes.sendMoney),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.confirmPaymentDetails,
            page: () => getPage(AppRoutes.confirmPaymentDetails),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.myProfile,
            page: () => getPage(AppRoutes.myProfile),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.createAlert,
            page: () => getPage(AppRoutes.createAlert),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.contactUs,
            page: () => getPage(AppRoutes.contactUs),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.aboutUs,
            page: () => getPage(AppRoutes.aboutUs),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.termConditions,
            page: () => getPage(AppRoutes.termConditions),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.resetPassword,
            page: () => getPage(AppRoutes.resetPassword),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.fingerPrint,
            page: () => getPage(AppRoutes.fingerPrint),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.locations,
            page: () => getPage(AppRoutes.locations),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.privacyPolicy,
            page: () => getPage(AppRoutes.privacyPolicy),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.forexRates,
            page: () => getPage(AppRoutes.forexRates),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.currencyRates,
            page: () => getPage(AppRoutes.currencyRates),
            transition: Transition.noTransition),
        GetPage(
            name: AppRoutes.addBeneficiaryFormRules,
            page: () => getPage(AppRoutes.addBeneficiaryFormRules),
            transition: Transition.noTransition),

        /// form rules related implementation
        GetPage(
          name: AppRoutes.nid,
          page: () => getPage(AppRoutes.nid),
          transition: Transition.noTransition,
          binding: BindingsBuilder(() {
            Get.put(SignUpController(), permanent: true).signUpAttributes =
                SignUpAttributes();
            if (AppConfigs.formRules) {
              Get.find<SignUpController>().getIdentityVerificationForm();
            } else {
              Get.find<SignUpController>();
            }
            if (Box3.status != AppStatus.loggedIn) {
              Get.find<DataController>().getSignUpParameters();
            }
          }),
        ),
      ];

  static dynamic getPage(String route) {
    AppUI theme = Box3.primaryUI;
    switch (theme) {
      case AppUI.uiOne:
        return defaultRoutes[route];
      case AppUI.uiTwo:
        return uiTwoRoutes[route];
      case AppUI.uiThree:
        return uiThreeRoutes[route];
      case AppUI.uiFour:
        return uiFourRoutes[route];
      case AppUI.uiFive:
        return uiFiveRoutes[route];
      case AppUI.uiSix:
        return uiSixRoutes[route];
      case AppUI.uiSeven:
        return uiSevenRoutes[route];
      case AppUI.defaultUI:
        return defaultRoutes[route];
    }
  }
}
