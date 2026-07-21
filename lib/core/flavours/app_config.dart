import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mobiremit/others/app_environments.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../flavors.dart';
import '../exports/ui_one_pages.dart';
import 'constants.dart';

class AppConfigs {
  static String appVersion = "Version ${AppEnvironments.appVersion}";
  static String buildNumber = AppEnvironments.appBuildNumber;
  static DateTime buildDate = DateTime.parse(AppEnvironments.buildDate);
  static String appKey = AppEnvironments.appKey;
  static String appBranchCode = AppEnvironments.appBranchCode;
  static String selectedDemoFlavorName = "";

  static String installedAppVersion = "";
  static Future<void> initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    installedAppVersion = info.version;
  }

  static bool offlineData = kDebugMode && false,
      formRules = true,
      accountTesting = false,
      enablePaymentKey = true,
      fetchNewConfig = true;
  static int templateIndex = 1;

  static bool isEncryptionEnabled = false;

  /// uae pass related details
  static String DEEPLINK_SCHEME_1 = AppEnvironments.deeplinkScheme1;

  static String DEEPLINK_SCHEME_2 = AppEnvironments.deeplinkScheme2;

  static String DEEPLINK_SCHEME_3 = AppEnvironments.deeplinkScheme3;

  static String uaePassClientId = AppEnvironments.uaePassClientId;
  static String uaePassClientSecret = AppEnvironments.uaePassClientSecret;
  static String uaePassRedirectURL = AppEnvironments.uaePassRedirectURL;
  static String uaePassScope = AppEnvironments.uaePassScope;
  static String uaePassUrlScheme = AppEnvironments.uaePassUrlScheme;
  static String uaePassState = AppEnvironments.uaePassState;
  static bool uaeIsProduction =
      AppEnvironments.uaePassIsProduction.toLowerCase() == 'true';

  static String uaePassBasic =
      "Basic ${base64Encode(utf8.encode("$uaePassClientId:$uaePassClientSecret"))}";

  static KYCType docType = {
    Flavor.casmex: KYCType.EMIRATES_ID,
    Flavor.lmpay: KYCType.QATAR_ID,
    Flavor.cityexchangeuae: KYCType.EMIRATES_ID,
    Flavor.cityexchange: KYCType.QATAR_ID,
    Flavor.lakhoos: KYCType.EMIRATES_ID,
    Flavor.globalexchange: KYCType.QATAR_ID,
    Flavor.kabayanremit: KYCType.QATAR_ID,
    Flavor.alzamanexchange: KYCType.QATAR_ID,
  }[F.appFlavor]!;

  static const Map<Flavor, Environment> flavorEnvironments = {
    Flavor.casmex: Environment.demo,
    Flavor.lmpay: Environment.uat,
    Flavor.cityexchangeuae: Environment.uat,
    Flavor.cityexchange: Environment.uat,
    Flavor.lakhoos: Environment.uat,
    Flavor.globalexchange: Environment.uat,
    Flavor.kabayanremit: Environment.uat,
    Flavor.alzamanexchange: Environment.dev,
  };

  static Environment env = flavorEnvironments[F.appFlavor]!;

  static String uaePass = AppEnvironments.uaePass;

  static String ipAddressURL = 'https://api.ipify.org';
  static String userUrl = AppEnvironments.baseUrl;
  static const String onBoardingFlow = 'work_flow_0';
  static List<List<Color>> themes = [
    [
      const Color(0xFF04ADE8).withOpacity(0.5),
      const Color(0xFF04ADE8),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xFF181818),
      const Color(0xFFEB1C24),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xFF04ADE8),
      const Color(0xFF23459F),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xFF23459F),
      const Color(0xFFFF7700),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xFF181818),
      const Color(0xFF7532FE),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xFF064E58),
      const Color(0xFF148E9F),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xFF000000),
      const Color(0xFFffd503),
      const Color(0xFF000000),
    ],
    [
      const Color(0xff42002D),
      const Color(0xFFC29B5D),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xff002B5D),
      const Color(0xffFF8110),
      const Color(0xFFFFFFFF),
    ],
    [
      const Color(0xffEC1F28),
      const Color(0xff2E3192),
      const Color(0xFFFFFFFF),
    ],
  ];
  static const Color w = Colors.white,
      a9 = Color(0xffa9a9a9),
      b000f14 = Color(0xff000F14),
      b01222d = Color(0xFF01222d),
      b141313 = Color(0xff141313),
      b = Colors.black,
      bf0 = Color(0xFF000000),
      b0 = Color(0xFFB0B0B0),
      b14 = Color(0xFF000f14),
      g0D = Color(0xFF0D0D0D),
      g14 = Color(0xFF141414),
      g21 = Color(0xFF212121),
      g4 = Color(0xff444444),
      g42 = Color(0xFF424242),
      g43 = Color(0xFF434343),
      g70 = Color(0xFF707070),
      g75 = Color(0xFF757575),
      g77 = Color(0xff777777),
      g84 = Color(0xff808184),
      g85 = Color(0xFF858585),
      g8f = Color(0xFF8F8F8F),
      gb0 = Color(0xffB0B0B0),
      gb5 = Color(0xFFB5B5B5),
      gd1 = Color(0xffD1D1D1),
      gd7 = Color(0xffD7D7D7),
      gdc = Color(0xffDCDCDC),
      gf1 = Color(0xffF1F1F1),
      geb = Color(0xFFEBEBEB),
      lg = Color(0xffCAF690),
      dg = Color(0xff568D0E),
      g4e = Color(0xff41FF4E),
      lr = Color(0xffFEC0C0),
      // dr = Color(0xffA70909),
      der = Color(0xFFF92222),
      derb = Color(0xFF5f2a2a),
      errorFillDark = Color(0xFF5F2A2A),
      errorBorderDark = Color(0xffa20202),
      rg = Color(0xFF7ca40c),
      y = Color(0xFFFFFDB9),
      t = Color(0x00000000),
      abbg = Color(0xFFF6F7FB),
      lp = Color(0xFFFFCACA),
      textField = Color(0xFFEFF6FF),
      ya2 = Color(0xFFFFE6A2),
      bg1 = Color(0xFFF4EFE4),
      bg2 = Color(0xFFf2f6ff);

  static const Color bg = Color(0xFFFFF5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surface2 = Color(0xFFFFF8F8);
  static const Color surface3 = Color(0xFFFFECEC);

  static const Color accent = Color(0xFFCC1F26);
  static const Color accentLt = Color(0xFFFDE8E9);
  static const Color accentDk = Color(0xFF8B0000);
  // Status / semantic
  static const Color teal = Color(0xFF00B894);
  static const Color tealLt = Color(0xFFDCFBF3);
  static const Color gold = Color(0xFFD4A017);
  static const Color goldLt = Color(0xFFFDF4DC);
  static const Color goldDk = Color(0xFFA07810);
  static const Color danger = Color(0xFFB01419);
  static const Color dangerLt = Color(0xFFFFD6D7);
  static const Color purple = Color(0xFF7C3AED);
  static const Color purpleLt = Color(0xFFF0EBFF);
  static const Color warn = Color(0xFFF59E0B);
  static const Color warnLt = Color(0xFFFFFBEB);

  // Text
  static const Color text = Color(0xFF1A0304);
  static const Color text2 = Color(0xFF5C1A1E);
  static const Color muted = Color(0xFFB87075);
  static const Color muted2 = Color(0xff8298bb);

  // Borders
  static const Color border = Color(0xFFF5D5D6);
  static const Color border2 = Color(0xFFE8B8BA);

  // Radii
  static const double r = 18;
  static const double rSm = 12;
  static const double rXs = 8;

  static Color bodybg(bool isdark) => isdark ? AppConfigs.b : AppConfigs.w;

  static Color contentTextWhite(bool isdark) =>
      isdark ? AppConfigs.w : AppConfigs.b;

  static Color contentTextWhite2(bool isdark) =>
      isdark ? AppConfigs.gb5 : AppConfigs.b;

  static Color buttonTextColor = themes[{
    Flavor.casmex: 2,
    Flavor.lmpay: 2,
    Flavor.cityexchangeuae: 2,
    Flavor.cityexchange: 2,
    Flavor.lakhoos: 2,
    Flavor.globalexchange: 2,
    Flavor.kabayanremit: 2,
    Flavor.alzamanexchange: 2,
  }[F.appFlavor]!][2];

  static Color get primaryColor {
    final hex = Box3.settings.themePrimary;
    if (hex == null || hex.isEmpty) return Colors.deepPurple;

    try {
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return Colors.deepPurple;
    }
  }

  static Color get accentColor {
    final hex = Box3.settings.themeSecondary;
    if (hex == null || hex.isEmpty) return Colors.deepPurple;

    try {
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return Colors.deepPurple;
    }
  }

  static Color get highlightColor {
    final hex = Box3.settings.highlitedColor;
    if (hex == null || hex.isEmpty) return Color(0xFFFCD116);

    try {
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return Color(0xFFFCD116);
    }
  }

  static Color get swipeYesColor {
    final hex = Box3.settings.highlitedColor;
    if (hex == null || hex.isEmpty) return Colors.deepPurple;

    try {
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return Colors.deepPurple;
    }
  }

  static Color get accentThemeColor {
    final hex = Box3.settings.themeSecondary;
    if (hex == null || hex.isEmpty) return Colors.deepPurple;

    try {
      return Color(int.parse(hex, radix: 16));
    } catch (e) {
      return Colors.deepPurple;
    }
  }

  static ThemeData get themeData => ThemeData(
        textSelectionTheme: TextSelectionThemeData(cursorColor: primaryColor),
        primaryColor: primaryColor,
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: primaryColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.solid,
              color: primaryColor,
            ),
          ),
        ),
        scaffoldBackgroundColor:
            SchedulerBinding.instance.platformDispatcher.platformBrightness ==
                    Brightness.light
                ? Colors.white
                : Colors.black,
      );

  static LinearGradient get linearGradientUiSix => LinearGradient(
    colors: [
      // Color(0xFFEAF0FF), // Soft blue-indigo top
      // Color(0xFFFFF8F6),
      // Warm light-pink bottom
      Colors.white,
      Colors.white
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.45],
  );
  static List<Color> sideMenuColors = [
    Colors.green,
    Colors.amber,
    Colors.red,
    Colors.blue,
    Colors.deepOrange,
    Colors.deepPurple
  ];

  static Widget sendMoney({Key? key}) => AppRoutes.getPage(AppRoutes.sendMoney);

  static String aesIV = "bsxnWolsAyO7kCfWuyrnqg=="; //AppEnvironments.aesIV;
  static String aesKEY =
      "AXe8YwuIn1zxt3FPWTZFlAa14EHdPAdN9FaZ9RQWihc="; // AppEnvironments.aesKey;
}

/// Centralised text styles. Plus Jakarta Sans is already declared in pubspec.yaml.
class AzText {
  AzText._();

  static const String fontFamily = 'PlusJakartaSans';

  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28,
    fontWeight: FontWeight.w800,
    color: AppConfigs.text,
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 21,
    fontWeight: FontWeight.w800,
    color: AppConfigs.text,
  );

  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppConfigs.text,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppConfigs.text2,
    height: 1.6,
  );

  static const TextStyle bodyBold = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppConfigs.text,
  );

  static const TextStyle muted = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppConfigs.muted,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11,
    fontWeight: FontWeight.w700,
    color: AppConfigs.muted,
    letterSpacing: 0.5,
  );

  static const TextStyle ctaText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    letterSpacing: 0.2,
  );

  static const TextStyle chipText = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppConfigs.text,
  );
}
