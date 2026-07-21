import 'dart:async';
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/flavours/constants.dart';

import 'core/controllers/inactivity_controller.dart';
import 'core/controllers/network_controller.dart';
import 'core/exports/controllers.dart';
import 'core/notification_helper.dart';
import 'firebase_options_casmex.dart' as casmex;
import 'firebase_options_global_exchange_qatar.dart' as ge;
import 'firebase_options_lmpay.dart' as lm;
import 'firebase_options_city_exchange.dart' as ce;
import 'flavors.dart';
import 'others/ssl_overrides.dart';
import 'startup/app_screen.dart';
import 'package:flutter_driver/driver_extension.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.high,
);

Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
  NotificationHelper.showBgNotification(message, flutterLocalNotificationsPlugin);
}

Future<void> main() async {
  HttpOverrides.global = SSLOverrides();
  // enableFlutterDriverExtension();
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseOptions? firebaseOptions = {
    Flavor.casmex: casmex.DefaultFirebaseOptions.currentPlatform,
    Flavor.lmpay: lm.DefaultFirebaseOptions.currentPlatform,
    Flavor.lakhoos: lm.DefaultFirebaseOptions.currentPlatform,
    Flavor.cityexchangeuae: lm.DefaultFirebaseOptions.currentPlatform,
    Flavor.globalexchange: ge.DefaultFirebaseOptions.currentPlatform,
    Flavor.kabayanremit: ce.DefaultFirebaseOptions.currentPlatform,
    Flavor.cityexchange: ce.DefaultFirebaseOptions.currentPlatform,
    // Flavor.aljadeed: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.aljazeeraexchangeqatar: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.alsaddexchange: lm.DefaultFirebaseOptions.currentPlatform,
    Flavor.alzamanexchange: ge.DefaultFirebaseOptions.currentPlatform,
    // Flavor.dohaexchange: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.easternexchange: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.hamdanexchange: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.kiecoexchange: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.omanexchange: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.royalgrowth: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.sharafexchange: lm.DefaultFirebaseOptions.currentPlatform,
    // Flavor.unimonioman: lm.DefaultFirebaseOptions.currentPlatform,
  }[F.appFlavor];

  String appName = {
        Flavor.casmex: "casmex-53899",
        Flavor.lmpay: 'lm-user-app',
        Flavor.cityexchangeuae: 'lm-user-app',
        Flavor.cityexchange: 'city-exchange-b0ae0',
        Flavor.lakhoos: 'casmex-53899',
        Flavor.globalexchange: 'lm-user-app',
        Flavor.alzamanexchange: 'lm-user-app',
        Flavor.kabayanremit: 'city-exchange-b0ae0'
      }[F.appFlavor] ??
      "casmex-53899";

  /// Set Environment from file assets/FLAVOR_NAME/.env
  final fileName = "assets/env/${F.name}/.env.${AppConfigs.env.name}";
  await dotenv.load(fileName: fileName);

  /// Set Firebase notification setup
  await Firebase.initializeApp(options: firebaseOptions, name: appName);

  // await Firebase.initializeApp(
  //   options: lm.DefaultFirebaseOptions.currentPlatform,
  // );

  FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
  if (GetPlatform.isMobile) {
    await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
    FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
  }
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put(NetworkController());
  Get.put(InactivityController());
  runApp(const App());
}
//
// import 'dart:io';
//
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:get/get.dart';
//
// import 'core/controllers/inactivity_controller.dart';
// import 'core/controllers/network_controller.dart';
// import 'core/flavours/constants.dart';
// import 'core/notification_helper.dart';
// import 'firebase_options_global_exchange_qatar.dart' as ge;
// import 'firebase_options_lmpay.dart' as lm;
// import 'flavors.dart';
// import 'others/ssl_overrides.dart';
// import 'startup/app_screen.dart';
//
// /// 🔔 Notifications
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
//
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel',
//   'High Importance Notifications',
//   importance: Importance.high,
// );
//
// Future<void> _firebaseBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   NotificationHelper.showBgNotification(
//     message,
//     flutterLocalNotificationsPlugin,
//   );
// }
//
// /// ===============================================================
// /// 🚀 APP ENTRY POINT
// /// ===============================================================
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   /// ✅ MUST BE SET FIRST
//   F.appFlavor = Flavor.lmpay;
//
//   await _bootstrap();
// }
//
// /// ===============================================================
// /// 🔥 BOOTSTRAP
// /// ===============================================================
// Future<void> _bootstrap() async {
//   HttpOverrides.global = SSLOverrides();
//
//   /// 🔹 Firebase options per flavor (🔥 FIXED)
//   final firebaseOptionsMap = <Flavor, FirebaseOptions>{
//     Flavor.casmex: lm.DefaultFirebaseOptions.currentPlatform,
//     Flavor.lmpay: lm.DefaultFirebaseOptions.currentPlatform,
//     Flavor.lakhoos: lm.DefaultFirebaseOptions.currentPlatform,
//     Flavor.cityexchangeuae: lm.DefaultFirebaseOptions.currentPlatform,
//     Flavor.cityexchange: lm.DefaultFirebaseOptions.currentPlatform,
//
//     /// ✅ ADD THIS (VERY IMPORTANT)
//     Flavor.globalexchange: ge.DefaultFirebaseOptions.currentPlatform,
//     Flavor.kabayanremit: ge.DefaultFirebaseOptions.currentPlatform,
//   };
//
//   final firebaseOptions = firebaseOptionsMap[F.appFlavor];
//   if (firebaseOptions == null) {
//     throw FlutterError(
//       '❌ FirebaseOptions not configured for flavor: ${F.appFlavor}',
//     );
//   }
//
//   /// 🔹 Firebase app name per flavor (🔥 FIXED)
//   final appNameMap = <Flavor, String>{
//     Flavor.casmex: 'casmex-53899',
//     Flavor.lmpay: 'lm-user-app',
//     Flavor.lakhoos: 'lm-user-app',
//     Flavor.cityexchangeuae: 'lm-user-app',
//     Flavor.cityexchange: 'lm-user-app',
//
//     /// ✅ ADD THIS
//     Flavor.globalexchange: 'lm-user-app',
//     Flavor.kabayanremit: 'city-exchange-b0ae0',
//   };
//
//   final appName = appNameMap[F.appFlavor]!;
//
//   /// 🔹 Load ENV
//   final envFile = 'assets/env/${F.name}/.env.${AppConfigs.env.name}';
//   await dotenv.load(fileName: envFile);
//
//   /// 🔹 Firebase init
//   await Firebase.initializeApp(name: appName, options: firebaseOptions);
//
//   await FirebaseAnalytics.instance.setAnalyticsCollectionEnabled(true);
//
//   /// 🔹 Notifications
//   if (GetPlatform.isMobile) {
//     await NotificationHelper.initialize(flutterLocalNotificationsPlugin);
//     FirebaseMessaging.onBackgroundMessage(_firebaseBackgroundHandler);
//   }
//
//   /// 🔹 Orientation
//   await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//
//   /// 🔹 Controllers
//   Get.put(NetworkController(), permanent: true);
//   Get.put(InactivityController(), permanent: true);
//
//   /// 🚀 Launch app
//   runApp(const App());
// }
