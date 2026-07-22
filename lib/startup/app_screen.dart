import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/startup/inactivity_wrapper.dart';

import '../core/app_translations.dart';
import '../core/controllers/inactivity_controller.dart';
import '../core/exports/controllers.dart';
import '../core/flavours/constants.dart';
import '../core/flavours/app_routes.dart';
import 'splash_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  void initFirebasePermissions() {
    try {
      FirebaseMessaging.instance
          .requestPermission(alert: true, badge: true, sound: true);
      if (Platform.isIOS) {
        FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
          alert: true,
          badge: true,
          sound: true,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // initFirebasePermissions();

    final app = _buildApp();

    return Stack(
      alignment: Alignment.topRight,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus &&
                currentFocus.focusedChild != null) {
              FocusManager.instance.primaryFocus?.unfocus();
            }
          },
          child: _ReactiveWrapper(app: app),
        ),
        Obx(() {
          return Visibility(
              visible: !Box3.isInternet.value,
              child: Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: Colors.red.withAlpha(240),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.signal_wifi_connected_no_internet_4_outlined,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "No Internet Connection",
                          style: TS.f14.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        }),
        Visibility(
          visible: AppConfigs.env != Environment.prod,
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(top: 50, left: 45),
              child: RotatedBox(
                quarterTurns: 3,
                child: Banner(
                  message: AppConfigs.env.toStr,
                  location: BannerLocation.bottomStart,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildApp() {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: AppTranslations(),
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: APIConstants.clientName,
      getPages: AppRoutes.pages,
      themeMode: ThemeMode.system,
      theme: AppConfigs.themeData,
      home: const SplashScreen(),
      builder: (context, child) {
        final mqd = MediaQuery.of(context);
        final scale1 =
            mqd.textScaler.clamp(maxScaleFactor: 0.9, minScaleFactor: 0.8);
        return MediaQuery(
          data: mqd.copyWith(textScaler: scale1),
          child: child!,
        );
      },
    );
  }
}

class _ReactiveWrapper extends StatelessWidget {
  final Widget app;

  const _ReactiveWrapper({required this.app});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (!Get.isRegistered<InactivityController>()) {
        return app;
      }
      final controller = Get.find<InactivityController>();
      final isLoggedIn = controller.loginSession.value;
      return isLoggedIn ? InactivityWrapper(child: app) : app;
    });
  }
}
