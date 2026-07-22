import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppEnvironments {
  /// _______________________________________ANDROID BUILDS_________________________________________________///
  /// Get App
  static String get appName =>
      dotenv.get('APP_NAME', fallback: "APP_NAME KEY NOT FOUND");

  static String get appKey =>
      dotenv.get('APP_KEY', fallback: "APP_KEY KEY NOT FOUND");

  static String get appBranchCode =>
      dotenv.get('APP_BRANCH_CODE', fallback: "APP_BRANCH_CODE KEY NOT FOUND");

  static String get appVersion =>
      dotenv.get('APP_VERSION', fallback: "APP_VERSION KEY NOT FOUND");

  static String get appBuildNumber =>
      dotenv.get('BUILD_NUMBER', fallback: "BUILD_NUMBER KEY NOT FOUND");

  static String get buildDate =>
      dotenv.get('BUILD_DATE', fallback: "BUILD_DATE KEY NOT FOUND");

  static String get deeplinkScheme1 => dotenv.get('DEEPLINK_SCHEME_1',
      fallback: "DEEPLINK_SCHEME_1 KEY NOT FOUND");

  static String get deeplinkScheme2 => dotenv.get('DEEPLINK_SCHEME_2',
      fallback: "DEEPLINK_SCHEME_2 KEY NOT FOUND");

  static String get deeplinkScheme3 => dotenv.get('DEEPLINK_SCHEME_3',
      fallback: "DEEPLINK_SCHEME_3 KEY NOT FOUND");

  /// _______________________________________UAE PASS____________________________________________///
  /// Get UAE PASS
  static String get uaePass =>
      dotenv.get('UAE_PASS', fallback: "UAE_PASS KEY NOT FOUND");

  static String get uaePassClientId => dotenv.get('UAE_PASS_ClientId',
      fallback: "UAE_PASS_ClientId KEY NOT FOUND");

  static String get uaePassClientSecret => dotenv.get('UAE_PASS_ClientSecret',
      fallback: "UAE_PASS_ClientSecret KEY NOT FOUND");

  static String get uaePassRedirectURL => dotenv.get('UAE_PASS_RedirectURL',
      fallback: "UAE_PASS_RedirectURL KEY NOT FOUND");

  static String get uaePassScope =>
      dotenv.get('UAE_PASS_Scope', fallback: "UAE_PASS_Scope KEY NOT FOUND");

  static String get uaePassUrlScheme => dotenv.get('UAE_PASS_UrlScheme',
      fallback: "UAE_PASS_UrlScheme KEY NOT FOUND");

  static String get uaePassState =>
      dotenv.get('UAE_PASS_State', fallback: "UAE_PASS_State KEY NOT FOUND");

  static String get uaePassIsProduction => dotenv.get('UAE_PASS_IsProduction',
      fallback: "UAE_PASS_IsProduction KEY NOT FOUND");

  /// _______________________________________BASE URLS___________________________________________///
  ///Get Base URL
  static String get baseUrl =>
      dotenv.get('BASE_URL', fallback: "BASE_URL KEY NOT FOUND");

  /// _______________________________________AES_________________________________________________///
  /// Get AES IV/KEY
  static String get aesIV =>
      dotenv.get('AES_IV', fallback: "AES_IV KEY NOT FOUND");

  static String get aesKey =>
      dotenv.get('AES_KEY', fallback: "AES_KEY KEY NOT FOUND");

  /// _______________________________________FIREBASE____________________________________________///
  // Get Firebase Android
  static String get firebaseAndroidAppKey =>
      dotenv.get('FIREBASE_API_KEY_ANDROID',
          fallback: "FIREBASE_API_KEY_ANDROID KEY NOT FOUND");

  static String get firebaseAndroidAppId =>
      dotenv.get('FIREBASE_APP_ID_ANDROID',
          fallback: "FIREBASE_APP_ID_ANDROID KEY NOT FOUND");

  static String get firebaseAndroidClientId =>
      dotenv.get('FIREBASE_ANDROID_CLIENT_ID',
          fallback: "FIREBASE_ANDROID_CLIENT_ID KEY NOT FOUND");

  // Get Firebase IOS
  static String get firebaseIosAppKey => dotenv.get('FIREBASE_API_KEY_IOS',
      fallback: "FIREBASE_API_KEY_IOS KEY NOT FOUND");

  static String get firebaseIosAppId => dotenv.get('FIREBASE_APP_ID_IOS',
      fallback: "FIREBASE_APP_ID_IOS KEY NOT FOUND");

  static String get firebaseIosBundleId => dotenv.get('FIREBASE_IOS_BUNDLE_ID',
      fallback: "FIREBASE_IOS_BUNDLE_ID KEY NOT FOUND");

  static String get firebaseIosClientId => dotenv.get('FIREBASE_IOS_CLIENT_ID',
      fallback: "FIREBASE_IOS_CLIENT_ID KEY NOT FOUND");

  // Get Firebase Windows/Web
  static String get firebaseWindowsAppKey =>
      dotenv.get('FIREBASE_API_KEY_WINDOWS',
          fallback: "FIREBASE_API_KEY_WINDOWS KEY NOT FOUND");

  static String get firebaseWindowsAppId =>
      dotenv.get('FIREBASE_APP_ID_WINDOWS',
          fallback: "FIREBASE_APP_ID_WINDOWS KEY NOT FOUND");

  static String get firebaseWindowsClientId =>
      dotenv.get('FIREBASE_ANDROID_CLIENT_ID',
          fallback: "FIREBASE_ANDROID_CLIENT_ID KEY NOT FOUND");

  // Get Firebase MacOs
  static String get firebaseMacosAppKey => dotenv.get('FIREBASE_API_KEY_MACOS',
      fallback: "FIREBASE_API_KEY_MACOS KEY NOT FOUND");

  static String get firebaseMacosAppId => dotenv.get('FIREBASE_APP_ID_MACOS',
      fallback: "FIREBASE_APP_ID_MACOS KEY NOT FOUND");

  static String get firebaseMacosClientId =>
      dotenv.get('FIREBASE_ANDROID_CLIENT_ID',
          fallback: "FIREBASE_ANDROID_CLIENT_ID KEY NOT FOUND");

  // Get Firebase Default
  static String get firebaseMessagingSenderId =>
      dotenv.get('FIREBASE_MESSAGING_SENDER_ID',
          fallback: "FIREBASE_MESSAGING_SENDER_ID KEY NOT FOUND");

  static String get firebaseProjectId => dotenv.get('FIREBASE_PROJECT_ID',
      fallback: "FIREBASE_PROJECT_ID KEY NOT FOUND");

  static String get firebaseDatabaseUrl => dotenv.get('FIREBASE_DATABASE_URL',
      fallback: "FIREBASE_DATABASE_URL KEY NOT FOUND");

  static String get firebaseStorageBucket =>
      dotenv.get('FIREBASE_STORAGE_BUCKET',
          fallback: "FIREBASE_STORAGE_BUCKET KEY NOT FOUND");

  static String get firebaseAuthDomain => dotenv.get('FIREBASE_AUTH_DOMAIN',
      fallback: "FIREBASE_AUTH_DOMAIN KEY NOT FOUND");

  static String get firebaseMeasurementId =>
      dotenv.get('FIREBASE_MEASUREMENT_ID',
          fallback: "FIREBASE_MEASUREMENT_ID KEY NOT FOUND");
}
