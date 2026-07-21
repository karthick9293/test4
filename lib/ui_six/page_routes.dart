import '../core/exports/ui_six_pages.dart';

dynamic uiSixRoutes = {
  AppRoutes.splashScreen: const SplashScreen(),
  AppRoutes.selectLanguage: const SelectLanguage(
    firstLaunch: true,
  ),
  AppRoutes.intro: IntroPage(),
  AppRoutes.preLogin: const PreLogin(),
  AppRoutes.nid: const NIDFormRulesPage(),
  AppRoutes.uploadDocuments: const UploadDocumentPage(),
  AppRoutes.selfie: const UploadSelfiePage(),
  AppRoutes.videoKyc: const UploadVideoKYCPage(),
  AppRoutes.login: LoginPage(),
  AppRoutes.loginMPIN: LoginMPIN(),
  AppRoutes.accountType: AccountTypePage(),
  AppRoutes.dashboard: DashboardPageUiSix(),
  AppRoutes.eSignature: ESignaturePage(),
  AppRoutes.faceRecognition: FaceRecognitionPage(),
  AppRoutes.forgotMPIN: ForgotMpinFormRule(),
  AppRoutes.changeMPIN: ChangeMpinFormRule(),
  AppRoutes.changePassword: ChangePasswordFormRule(),
  AppRoutes.forgotUsername: ForgotUsernameFormRule(),
  AppRoutes.resetCredentials: ResetCredentials(),
  AppRoutes.main: MainPage(),
  AppRoutes.resetMpin: ResetMpinPage(),
  AppRoutes.securitySettings: SecuritySettingsPage(),
  AppRoutes.signUp: SignUpFormRulesPage(),
  AppRoutes.setCredentials: SetCredentialsFormRulesPage(),
  AppRoutes.identityVerification: IdentityVerificationFormRulesPage(),
  AppRoutes.settings: SettingsPage(),
  AppRoutes.loadingRoutes: LoadingPage(),
  AppRoutes.docShareRetryRoutes: DocShareRetry(),
  AppRoutes.visualizationRetryRoutes: RetryVisualization(),
  AppRoutes.notificationNotExpiredRetryRoutes: NotificationNotExpiredRetry(),
  AppRoutes.visualizationRetryRoutesUAEPASS:
      DocShareRetryVisualizationUaepass(),
  AppRoutes.notificationNotExpiredRetryRoutesUAEPASS:
      NotificationNotExpiredRetryUaepass(),
  AppRoutes.myBeneficiary: MyBeneficiaryPage(),
  AppRoutes.archivedBeneficiary: ArchivedBeneficiariespage(),
  AppRoutes.sendMoney: SendMoneyPage1(),
  AppRoutes.confirmPaymentDetails: ConfirmDetailsPage(),
  AppRoutes.paymentMode: PaymentModeScreen(),
  AppRoutes.myProfile: AppDrawerPage(),
  AppRoutes.addBeneficiaryFormRules: AddBeneficiaryFormRules(),
  AppRoutes.currencyRates: CurrencyRatesPage(),
  AppRoutes.forexRates: ForexRatesPage(),
};


// import '../core/exports/controllers.dart';
// import '../core/exports/ui_six_custom_widgets.dart';
// import '../core/exports/ui_six_pages.dart';
// import '../core/exports/ui_two_custom_widgets.dart';
// import '../ui_six/app_routes.dart';