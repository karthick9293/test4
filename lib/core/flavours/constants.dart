import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:logger/logger.dart';
import 'package:mobiremit/core/controllers/main_controller.dart';
import 'package:mobiremit/core/exports/ui_six_pages.dart';
import 'package:mobiremit/models/cms/cms_fz.dart';
import 'package:mobiremit/models/currency_symbol/currency_symbol_fz.dart';
import 'package:mobiremit/others/app_environments.dart';
import 'package:pinput/pinput.dart';

import '../../flavors.dart';
import '../../models/application_settings/settings_fz.dart';
import '../../ui_one/screens/home/dashboard/dashboard_appbar.dart' as u1;
import '../../ui_three/screens/home/dashboard/dashboard_appbar.dart';
import '../../ui_two/screens/home/dashboard/dashboard_appbar.dart';
import '../../ui_five/screens/home/dashboard/dashboard_appbar.dart' as u5;
import '../../ui_common/base64_to_image.dart';
import 'constants.dart';

export '../../others/box3.dart';
export '../../others/enums.dart';
export 'app_config.dart';
export 'image_paths.dart';

Logger logger = Logger(printer: PrettyPrinter());

int pwdMaxLength = 15;

class ConstColors {
  static Color appBarBackground = AppConfigs.abbg;

  // static const Color  = Color(0xff05a6dd);
  static const Color dashboardappBarBackground = Color(0xffeeeeef);
  static Color primary = AppConfigs.primaryColor;
  static Color buttonTextColor = AppConfigs.buttonTextColor;

  static const Color unselectGrey = Color(0xff5e6368);
  static const Color grey4 = AppConfigs.g4;
  static const Color grey70 = Color(0xff707070);
  static const Color greyb0 = Color(0xffb0b0b0);
  static const Color greyd7 = Color(0xFFD7D7D7);
  static const Color greya9 = Color(0xFFA9A9A9);
  static const Color selectedLanguageColor = Color(0x2902A5E3);
  static const Color darkBlue = Color(0xff085595);
  static const Color progressRed = Color(0xffc11010);
  static const Color red109 = Color(0xffa70909);
  static const Color toggleActiveGreen = Color(0xff7db709);
}

final defaultPinTheme = PinTheme(
  width: 70,
  height: 50,
  textStyle: const TextStyle(
      fontSize: 16, color: Color(0xff444444), fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(
      color: const Color(0xffd9d7d7),
    ),
    borderRadius: BorderRadius.circular(5),
  ),
);

RegExp dateReg = RegExp(
    r'^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]|(?:Jan|Mar|May|Jul|Aug|Oct|Dec)))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2]|(?:Jan|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec))\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)(?:0?2|(?:Feb))\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9]|(?:Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep))|(?:1[0-2]|(?:Oct|Nov|Dec)))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$');

var iOSDeviceList = [
  'iPhone SE (2nd generation)',
  'iPhone SE (1st generation)',
  'iPhone SE',
  'iPhone 8 Plus',
  'iPhone 8',
  'iPhone 7 Plus',
  'iPhone 7',
  'iPhone 6s Plus',
  'iPhone 6s',
  'iPhone 6',
  'iPhone 6 Plus',
  'iPhone 5s',
  'iPhone 5c',
  'iPhone 5',
];

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(
    color: const Color(0xffd9d7d7),
  ),
  borderRadius: BorderRadius.circular(5),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: const Color(0xfffffefe),
  ),
);

String formatDateString(String inputDate) {
  try {
    DateFormat inputFormat = DateFormat('dd/MMM/yyyy');
    DateTime date = inputFormat.parseStrict(inputDate);

    DateFormat outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(date);
  } catch (e) {
    return inputDate;
  }
}

String obscureText(String text, {int visibleChars = 4}) {
  if (text.length <= visibleChars) return text;

  String visiblePart =
      text.substring((text.length - visibleChars), text.length);
  String obscuredPart = '*' * (text.length - visibleChars);
  return '$obscuredPart$visiblePart';
}

bool isValidDate(String input) {
  if (input.isEmpty) return false;

  // Handle both DD/MM/YYYY and DD/MMM/YYYY formats
  final numericDateRegex = RegExp(r'^(\d{1,2})/(\d{1,2})/(\d{4})$');
  final textDateRegex = RegExp(r'^(\d{1,2})/([A-Za-z]{3})/(\d{4})$');

  final monthMap = {
    'jan': 1,
    'feb': 2,
    'mar': 3,
    'apr': 4,
    'may': 5,
    'jun': 6,
    'jul': 7,
    'aug': 8,
    'sep': 9,
    'oct': 10,
    'nov': 11,
    'dec': 12
  };

  RegExpMatch? match;
  int? day, month, year;

  // Try numeric format first (DD/MM/YYYY)
  match = numericDateRegex.firstMatch(input);
  if (match != null) {
    day = int.tryParse(match.group(1)!);
    month = int.tryParse(match.group(2)!);
    year = int.tryParse(match.group(3)!);
  } else {
    // Try text format (DD/MMM/YYYY)
    match = textDateRegex.firstMatch(input);
    if (match != null) {
      day = int.tryParse(match.group(1)!);
      month = monthMap[match.group(2)!.toLowerCase()];
      year = int.tryParse(match.group(3)!);
    }
  }

  log('match: $match, input: $input');

  if (match == null) return false;
  log('match not null');

  if (day == null || month == null || year == null) return false;
  log('day: $day, month: $month, year: $year');

  try {
    final date = DateTime(year, month, day);
    log('Created date: ${date.day}/${date.month}/${date.year}');
    log('Validation result: ${(date.day == day && date.month == month && date.year == year)}');
    return date.day == day && date.month == month && date.year == year;
  } catch (e) {
    log('error parsing date: $e');
    return false;
  }
}

extension Parse on String {
  Duration parseDuration() {
    int hours = 0;
    int minutes = 0;
    int micros;
    List<String> parts = split(':');
    if (parts.isNotEmpty) {
      if (parts.length > 2) {
        hours = int.parse(parts[parts.length - 3]);
      }
      if (parts.length > 1) {
        minutes = int.parse(parts[parts.length - 2]);
      }
      micros =
          (double.tryParse(parts[parts.length - 1]) ?? 0 * 1000000).round();
      return Duration(hours: hours, minutes: minutes, microseconds: micros);
    } else {
      return const Duration();
    }
  }
}

TextInputFormatter decimalFormatter({int length = 3}) =>
    TextInputFormatter.withFunction((oldValue, newValue) {
      try {
        final text = newValue.text;
        if ((text.contains('.')
                ? (text.substring(text.indexOf('.') + 1).length <= length)
                : true) &&
            double.tryParse(text) != null) {
          return newValue;
        } else {
          return newValue.text.isEmpty ? newValue : oldValue;
        }
      } catch (e) {
        return oldValue;
      }
    });

TextInputFormatter emptySpaceFilter =
    TextInputFormatter.withFunction((oldValue, newValue) {
  try {
    // final text = newValue.text;
    if (newValue.text.trim().isEmpty) {
      return const TextEditingValue(text: '');
    } else {
      return newValue;
    }
  } catch (e) {
    return oldValue;
  }
});
TextInputFormatter zeroFilter =
    TextInputFormatter.withFunction((oldValue, newValue) {
  try {
    if (newValue.text.isNotEmpty && newValue.text[0] == '0') {
      String s = newValue.text;
      while (s.isNotEmpty && s[0] == '0') {
        s = s.length > 1 ? s.substring(1) : '';
      }
      return TextEditingValue(text: s);
    } else {
      return newValue;
    }
  } catch (e) {
    return oldValue;
  }
});

TextInputFormatter regexFormatter(String regx) =>
    TextInputFormatter.withFunction((oldValue, newValue) {
      try {
        final text = newValue.text;
        RegExp regexp = RegExp(regx);
        if (regexp.hasMatch(text)) {
          return newValue;
        } else {
          return newValue.text.isEmpty ? newValue : oldValue;
        }
      } catch (e) {
        return oldValue;
      }
    });

TextInputFormatter intLimit(int limit) =>
    TextInputFormatter.withFunction((oldValue, newValue) {
      try {
        final text = newValue.text;
        if (int.tryParse(text) != null && int.parse(text) <= limit) {
          return newValue;
        } else {
          return newValue.text.isEmpty ? newValue : oldValue;
        }
      } catch (e) {
        return oldValue;
      }
    });

Map<String, TextInputType> textInputType = {
  'text': TextInputType.text,
  'url': TextInputType.url
};

KeyboardActionsConfig buildKeyboardConfig(FocusNode? focusNode) {
  var mainCtrl = Get.isRegistered<MainController>()
      ? Get.find<MainController>()
      : Get.put(MainController());
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
    nextFocus: true,
    keyboardBarColor: mainCtrl.isDark ? Colors.grey.shade700 : null,
    actions: [
      KeyboardActionsItem(
        focusNode: focusNode ?? FocusNode(),
        // displayArrows: false,
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () {
                node.unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.5),
                child: Text(
                  "Done",
                  style: TS.f18.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Get.find<MainController>().isDark
                          ? Colors.white
                          : null),
                ),
              ),
            );
          }
        ],
      ),
    ],
  );
}

class BeneficiaryTasks {
  static const String disable = 'DISABLE';
  static const String enable = 'ENABLE';
  static const String archive = 'ARCHIVE';
  static const String unarchive = 'UNARCHIVE';
  static const String favourite = 'FAVOURITE';
  static const String unfavourite = 'UNFAVOURITE';
}

class Keys {
  static const String appState = 'app_state';
  static const String benef = 'benef';
  static const String biometric = 'biometric';
  static const String newConfig = 'new_config';
  static const String savedOn = 'saved_on';
  static const String deviceId = 'device_id';
  static const String disable = 'disable';
  static const String kycStatus = 'kyc_status';
  static const String signedUpData = 'sign_up_data';
  static const String locale = 'locale';
  static const String profile = 'profile';
  static const String theme = 'theme';
  static const String userData = 'user_data';
  static const String uaePassData = 'uaePassData';
  static const String promo = 'promo';
  static const String kycBV = 'kycBV';

  /// new details
  static const String userInfo = 'userInfo';
  static const String appToken = 'appToken';
  static const String environmentCode = 'environmentCode';
  static const String clientCode = 'clientCode';
  static const String appSession = 'appSession';

  /// form rules
  static const String nidForm = 'nidForm';
  static const String identityVerificationForm = 'identityVerificationForm';
  static const String setCredForm = 'setCredForm';
  static const String addCustomerForm = 'addCustomerForm';
  static const String addBeneficiaryForm = 'addBeneficiaryForm';
  static const String sendMoneyForm = 'sendMoneyForm';
  static const String cms = 'cms';
  static const String cmsAr = 'cms_ar';
  static const String cmsEn = 'cms_en';
  static const String alertModule = 'alertModule';
  static const String alertModuleEvent = 'alertModuleEvent';
  static const String myProfileForm = 'myProfileForm';
  static const String forgotMPINForm = 'forgotMPINForm';
  static const String changeMPINForm = 'changeMPINForm';
  static const String changeMPINFormFZ = 'changeMPINFormFZ';
  static const String changePasswordFormFZ = 'changePasswordFormFZ';
  static const String profileUpdateForm = 'profileUpdateForm';
  static const String forgotPasswordFormFZ = 'forgotPasswordFormFZ';
  static const String forgotUsernameFormFZ = 'forgotUsernameFormFZ';

  static const String companyDetails = 'companyDetails';
}

class FieldType {
  static const String text = 'text';
  static const String username = 'username';
  static const String password = 'password';
  static const String number = 'number';
  static const String dropDownSingle = 'dropdownsingle';
  static const String dropDownMulti = 'dropdownmulti';
  static const String date = 'date';
  static const String time = 'time';
  static const String dateTime = 'datetime';
  static const String radio = 'radio';
  static const String checkBox = 'checkbox';
  static const String label = 'label';
  static const String fileUpload = 'fileupload';
  static const String file = 'file';
}

class APIConstants {
  static String env = {
    Environment.clientQc: 'ClientQC',
    Environment.dev: 'Dev',
    Environment.qc: 'QC',
    Environment.prod: 'Prod',
    Environment.sandbox: 'Sandbox',
    Environment.uat: 'Sandbox',
    Environment.demo: 'Demo'
  }[AppConfigs.env]!;

  static const countryCode = 'IN';
  static String currency = {
    Flavor.casmex: 'QAR',
    Flavor.lmpay: 'AED',
    Flavor.cityexchangeuae: 'AED',
    Flavor.cityexchange: 'QAR',
    Flavor.lakhoos: 'AED',
    Flavor.globalexchange: 'QAR',
    Flavor.kabayanremit: 'PH',
    Flavor.alzamanexchange: 'QAR',
  }[F.appFlavor]!;

  static String get clientName => AppEnvironments.appName ?? "Casmex";
}

class AuthMode {
  static const String mPin = 'MPIN';
  static const String mPinWithBiometric = 'MPINWithBiometric';
  static const String otpPhone = 'OTP';
  static const String otpEmail = 'otpEmail';
  static const String otpBoth = 'otpBoth';
  static const String password = 'password';
}

class S {
  static double p = 20;
  static double h = Box3.primaryUI == AppUI.uiOne ? 45 : Box3.primaryUI == AppUI.uiSix ? 50 :40;
}

class TS {
  static TextStyle f = TextStyle(
      color: AppConfigs.g4,
      fontWeight: FontWeight.w600,
      fontFamily: Box3.primaryUI == AppUI.uiOne ? "NunitoSans" : Box3.primaryUI == AppUI.uiSix ? "PlusJakartaSans" : "SegoeUI",
      fontStyle: FontStyle.normal,
      fontSize: 14.0);
  static TextStyle f8 = f.copyWith(fontSize: 8.0);
  static TextStyle f10 = f.copyWith(fontSize: 10.0);
  static TextStyle f12 = f.copyWith(fontSize: 12.0);
  static TextStyle f13 = f.copyWith(fontSize: 12.0);
  static TextStyle f14 = f.copyWith(fontSize: 14.0);
  static TextStyle f16 = f.copyWith(fontSize: 16.0);
  static TextStyle f18 = f.copyWith(fontSize: 18.0);
  static TextStyle f18B =
      f.copyWith(fontSize: 18.0, fontWeight: FontWeight.w700);
  static TextStyle f20 = f.copyWith(fontSize: 20.0);
  static TextStyle f22 = f.copyWith(fontSize: 22.0);
  static TextStyle f22B = f.copyWith(
      fontSize: 22.0, fontWeight: FontWeight.bold, color: AppConfigs.b);
  static TextStyle f26B = f.copyWith(
      fontSize: 26.0, fontWeight: FontWeight.w700, color: AppConfigs.b);
  static TextStyle f24 = f.copyWith(fontSize: 24.0);
  static TextStyle f28 = f.copyWith(fontSize: 28.0);
  static TextStyle f28B = f.copyWith(
      fontSize: 28.0, fontWeight: FontWeight.w700, color: AppConfigs.b);
}

List<String> currencies = [
  'AED',
  'BDT',
  'CAD',
  'EGP',
  'INR',
  'LKR',
  'NPR',
  'OMR',
  'PHP',
  'PKR',
  'QAR',
  'USD',
  'IDR'
];

List<String> currencyCountry = [
  'United Arab Emirates',
  'Bangladesh',
  'Canada',
  'Egypt',
  'India',
  'Sri Lanka',
  'Nepal',
  'Oman',
  'Philippines',
  'Pakistan',
  'Qatar',
  'United States',
  'Indonesia'
];

Map<String, String> currencySymbol = {
  'AED': 'د.إ',
  'BDT': '৳',
  'CAD': '\$',
  'EGP': 'E£',
  'EUR': '€',
  'GBP': '£',
  'GHS': 'GH₵',
  'INR': '₹',
  'LKR': 'Rs',
  'NPR': 'रु',
  'OMR': 'ر.ع.',
  'PHP': '₱',
  'PKR': 'Rs',
  'QAR': 'ر.ق',
  'USD': '\$',
  'IDR': 'RD',
  'ARS': '\$'
};

String currencyFlag(currencyCode) {
  String currency = currencyCode.toString().toLowerCase();
  return "assets/images/flags/$currency.png";
}

class DevLog {
  static const _teal = '\x1B[36m';

  static void i(String message) {
    print('$_teal[INFO]$_teal $message');
  }
}

class TextStyles {
  static TextStyle title = GoogleFonts.openSans(
      color: const Color(0xff141414),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 20.0);
  static TextStyle font8 = GoogleFonts.openSans(
      color: const Color(0xff889703),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 8.0);
  static TextStyle font10 = GoogleFonts.openSans(
      color: const Color(0xff726f6f),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 10.0);
  static TextStyle font11 = GoogleFonts.openSans(
      color: AppConfigs.g4,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 11.0);
  static TextStyle font12 = GoogleFonts.openSans(
      color: const Color(0xff0e0e0e),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 12.0);
  static TextStyle font14 = GoogleFonts.openSans(
      color: const Color(0xffd1d1d1),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 14.0);
  static TextStyle font15 = GoogleFonts.openSans(
      color: const Color(0xffd1d1d1),
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
      fontSize: 15.0);
  static TextStyle font16 = GoogleFonts.openSans(
      color: const Color(0xff0e0e0e),
      fontWeight: FontWeight.w500,
      fontStyle: FontStyle.normal,
      fontSize: 16.0);
  static TextStyle font18 = GoogleFonts.openSans(
      color: const Color(0xff444444),
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal,
      fontSize: 18.0);
  static TextStyle font20 = GoogleFonts.openSans(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 20.0);
  static TextStyle font22 = GoogleFonts.openSans(
      color: const Color(0xff444444),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 22.0);
  static TextStyle font24 = GoogleFonts.openSans(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 24.0);
  static TextStyle font28 = GoogleFonts.openSans(
    color: AppConfigs.primaryColor,
    fontSize: 28,
    fontWeight: FontWeight.w600,
  );
  static TextStyle font32 = const TextStyle(
      color: Color(0xff444444),
      fontWeight: FontWeight.w600,
      fontStyle: FontStyle.normal,
      fontSize: 32.0);
}

class InputFormatter {
  static List<TextInputFormatter> firstNameFormatterWithoutSpace = [
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
  ];

  static List<TextInputFormatter> firstNameFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z ]"))
  ];

  static List<TextInputFormatter> nameFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]"))
  ];

  static List<TextInputFormatter> numberTextFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[A-Z0-9]+"))
  ];

  static List<TextInputFormatter> phoneNumber = [
    FilteringTextInputFormatter.digitsOnly
  ];

  static List<TextInputFormatter> specialCharTextFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[0-9a-zA-Z ]"))
  ];
}

class TextFieldValidator {}

//TODO: Add here Remote & Screen sharing app lists
/// Add here iOS AppID
List<AppPackage> screenSharingApps = [
  AppPackage(
    appName: "Team Viewer",
    packageName: "com.teamviewer.teamviewer.market.mobile",
    appID: "teamviewer://",
  ),
  AppPackage(
    appName: "AnyDesk Remote Desktop",
    packageName: "com.anydesk.anydeskandroid",
    appID: "anydesk://",
  ),
  AppPackage(
    appName: "Microsoft Remote Desktop",
    packageName: "com.microsoft.rdc.androidx",
    appID: "msrdc://",
  ),
  AppPackage(
    appName: "Chrome Remote Desktop",
    packageName: "com.google.chromeremotedesktop",
    appID: "chromeremotedesktop://",
  ),
  AppPackage(
    appName: "VNC Viewer",
    packageName: "com.realvnc.viewer.android",
    appID: "vncviewer://",
  ),
  AppPackage(
    appName: "LogMeIn",
    packageName: "com.logmein.rescuemobile",
    appID: "logmein://",
  ),
  AppPackage(
    appName: "Parallels Client",
    packageName: "com.parallels.client",
    appID: "parallels://",
  ),
];

class AppPackage {
  final String appName;
  final String packageName;
  final String appID;

  AppPackage(
      {this.appName = "", required this.packageName, required this.appID});
}

// CmsList cms(Fields key) {
//   CmsList result;
//   try {
//     result = Box3.cmsList
//         .where((e) => e.parameterName?.trim() == key.name)
//         .toList()
//         .first;
//     //return Box3.cmsList[page]?[key.name] ?? CmsList().copyWith(textHeading: key.name,description: key.name);
//   } catch (e) {
//     result = CmsList();
//   }
//   if (result.textHeading == null) {
//     try {
//       result = Box3.cacheCmsList
//           .where((e) => e.parameterName?.trim() == key.name)
//           .toList()
//           .first;
//     } catch (e) {
//       result = CmsList().copyWith(textHeading: key.name, description: key.name);
//     }

//     if (result.textHeading!.isEmpty) {
//       result = result.copyWith(textHeading: key.name, description: key.name);
//     }
//   }
//   return result;
// }

CmsList cms(Fields key) {
  CmsList result = Box3.cmsList.firstWhere(
    (e) => e.parameterName?.trim() == key.name,
    orElse: () => CmsList(),
  );

  if ((result.textHeading ?? '').isEmpty) {
    result = Box3.cacheCmsList.firstWhere(
      (e) => e.parameterName?.trim() == key.name,
      orElse: () => CmsList(),
    );

    if ((result.textHeading ?? '').isEmpty) {
      result = result.copyWith(
        textHeading: key.name,
        description: key.name,
      );
    }
  }

  return result;
}

CmsList pageCms(Fields key, List<CmsList> cmsList) {
  CmsList result;
  try {
    result = cmsList
        .where((e) => e.parameterName?.trim() == key.name)
        .toList()
        .first;
    //return Box3.cmsList[page]?[key.name] ?? CmsList().copyWith(textHeading: key.name,description: key.name);
  } catch (e) {
    result = CmsList().copyWith(textHeading: key.name, description: key.name);
  }
  if (result.textHeading!.isEmpty) {
    result = result.copyWith(textHeading: key.name);
  }
  return result;
}

String getShortName(String name) {
  String shortName = '';
  for (String e in (name.replaceAll('  ', ' ').split(' '))) {
    if (e.isNotEmpty) {
      shortName = shortName + e[0].toUpperCase();
    }
  }
  return shortName.length > 2 ? shortName.substring(0, 2) : shortName;
}

/// getServiceType
String getServiceType(val) {
  switch (val) {
    case "B":
      return "Bank Transfer";
    case "C":
      return "Cash Pickup";
    case "W":
      return "Wallet Transfer";
    case "A":
      return "Account Transfer";
    default:
      return val.toString();
  }
}

String getServiceTypeIcon(serviceCategoryCode) {
  switch (serviceCategoryCode) {
    case 'C':
      return ImagePath.cashPickup;
    case 'B':
      return ImagePath.bankTransferIcon;
    case 'W':
      return ImagePath.wallet;
    default:
      return ImagePath.cashPickup;
  }
}

Color getServiceTypeColor(String serviceType) {
  if (serviceType.isEmpty) return const Color(0xFF4e89ee);

  switch (serviceType) {
    case "B":
      // return AppConfigs.primaryColor;
      return const Color(0xFF4e89ee);
    case "C":
      return const Color(0xFF4e89ee);
      // return const Color(0xffe74a3b);
    case "W":
      return const Color(0xFF4e89ee);
      // return const Color(0xFFe58507);

    default:
      return const Color(0xFF4e89ee);
  }
}

/// Get currency symbol

String getCurrencySymbol(String currencyCode) {
  if (Box3.settings.requiredCurrencySymbol != true) {
    return currencyCode;
  }

  CurrencySymbol? cur = Box3.currencySymbol
      ?.where((e) => e.currencyCode == currencyCode)
      .firstOrNull;

  if (cur != null) {
    if (cur.base64String != null) {
      return cur.currencyImage ?? currencySymbol[currencyCode] ?? currencyCode;
    } else {
      return cur.currencyCode ?? currencySymbol[currencyCode] ?? currencyCode;
    }
  } else {
    return currencySymbol[currencyCode] ?? currencyCode;
  }
}

Widget currencySymbolImage(String currencyCode,
    {FontWeight? fontWeight,
    Color? color,
    double? fontSize,
    TextStyle? textStyle,
    double? currencyWidth,
    double? currencyHeight}) {
  if (Box3.settings.requiredCurrencySymbol == false) {
    return Text(currencyCode,
        maxLines: 1,
        textAlign: TextAlign.end,
        style: textStyle ??
            TextStyle(
                fontSize: fontSize ?? 10,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: color),
        overflow: TextOverflow.clip);
  }
  if (currencyCode != "AED" &&
      currencyCode != "OMR" &&
      Box3.settings.requiredCurrencySymbol == true) {
    return Text(getCurrencySymbol(currencyCode),
        maxLines: 1,
        textAlign: TextAlign.end,
        style: textStyle ??
            TextStyle(
                fontSize: fontSize ?? 10,
                fontWeight: fontWeight ?? FontWeight.normal,
                color: color),
        overflow: TextOverflow.clip);
  }
  var base64Image = Box3.companyDataFZ?.companySettings?.primaryBaseCurrency;
  var cur = Box3.currencySymbol
      ?.where((e) => e.currencyCode == currencyCode)
      .firstOrNull;

  if (cur != null && cur.base64String != null) {
    base64Image = cur.base64String;
  }

  if (base64Image != null) {
    double? effectiveHeight = currencyHeight;
    double? effectiveWidth = currencyWidth;
    if (currencyCode == "OMR") {
      if (effectiveHeight != null) effectiveHeight += 5;
      if (effectiveWidth != null) effectiveWidth += 5;
    }
    return Base64Image(
      image: base64Image,
      height: effectiveHeight,
      width: effectiveWidth,
      fit: BoxFit.fitHeight,
      colorFilter:
          color != null ? ColorFilter.mode(color, BlendMode.srcIn) : null,
    );
  }

  if (cur != null && cur.currencyImage != null) {
    return Text(cur.currencyImage.toString(),
        maxLines: 1,
        textAlign: TextAlign.end,
        style: textStyle ??
            TextStyle(
              fontSize: fontSize ?? 10,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: color,
            ),
        overflow: TextOverflow.clip);
  }

  return Text(currencyCode.toString(),
      maxLines: 1,
      textAlign: TextAlign.end,
      style: textStyle ??
          TextStyle(
              fontSize: fontSize ?? 10,
              fontWeight: fontWeight ?? FontWeight.normal,
              color: color),
      overflow: TextOverflow.clip);
}

String maskMobile(String mobile) {
  if (mobile.length < 4) return mobile;
  String last4 = mobile.substring(mobile.length - 4);
  return '******$last4';
}

class FormNames {
  static String signupCredentialFormRules = "Signup Credential_Form Rules";
  static String signUpFormRule = "Sign Up_Form Rules";
  static String preLoginFormRules = "Pre-Login_Form Rules";
  static String identityVerificationFormRules =
      "Identity Verification_Form Rules";
  static String signUpUAEPASSFormRules = "Sign Up_UAEPASS_Form Rules";
  static String beneficiaryCreationFormRules =
      "Beneficiary Creation_Form Rules";
  static String sendMoneyFormRules = "Send_Money_Form Rules";
  static String profileDetailsFormRules = "ProfileDetails_Form Rules";
  static String resetMPINFormRules = "Reset MPIN_Form Rules";
  static String resetPasswordFormRules = "Reset Password_Form Rules";
  static String forgotMPINFormRules = "Forgot MPIN_Form Rules";
  static String forgotUsernameFormRules = "Forgot Username_Form Rules";
  static String changeMPINFormRules = "Change MPIN_Form Rules";
  static String updateProfileFormRules = "Update Profile_Form Rules";
  static String forgotPasswordFormRules = "Forgot Password_Form Rules";
  static String changePasswordFormRules = "Change Password_Form Rules";
  static String paymentMethodsMobiRemitFormRules =
      "Payment Methods Mobi Remit_Form Rules";
}

class PageName {
  static String selectLanguage = "SelectLanguage";
  static String introduction = "Introduction";
  static String preLogin = "PreLogin";
  static String login = "Login";
  static String loginWithMPIN = "LoginWithMPIN";
  static String forgotMPIN = "ForgotMPIN";
  static String forgotPassword = "ForgotPassword";
  static String forgotUserName = "ForgotUserName";
  static String popUp = "PopUp";
  static String dashboard = "Dashboard";
  static String sendMoney = "SendMoney";
  static String additionalTransactionDetail = "AdditionalTransactionDetail";
  static String filter = "Filter";
  static String confirmPaymentDetail = "ConfirmPaymentDetail";
  static String myTransaction = "MyTransaction";
  static String transactionComplaint = "TransactionComplaint";
  static String sendTransactionEnquiry = "SendTransactionEnquiry";
  static String myBeneficiary = "MyBeneficiary";
  static String faq = "FAQ";
  static String sideMenu = "SideMenu";
  static String quickAccessIcons = "QuickAccessIcons";
  static String utility = "Utility";
  static String validateCustomer = "ValidateCustomer";
  static String forexRates = "ForexRates";
  static String currencyRates = "CurrencyRates";
  static String contactUs = "ContactUs";
  static String aboutUs = "AboutUs";
  static String branchLocator = "BranchLocator";
  static String logoutAlert = "LogoutAlert";
  static String myProfile = "MyProfile";
  static String updateProfile = "UpdateProfile";
  static String forexBooking = "ForexBooking";
}

class UserIdentification {
  static String forgotPassword = "FORGOTPASSWORD";
  static String forgotUserName = "FORGOTUSERNAME";
  static String forgotMpin = "FORGOTMPIN";
  static String addCustomer = "ADDCUSTOMER";
  static String addBeneficiary = "ADDBENEFICIARY";
  static String transaction = "TRANSACTIONN";
}

class Base64ImageCache {
  static final Map<String, Uint8List> _cache = {};

  static Uint8List getImage(String base64String) {
    if (_cache.containsKey(base64String)) {
      return _cache[base64String]!;
    }

    final decoded = base64Decode(base64String.split(',').last);
    _cache[base64String] = decoded;
    return decoded;
  }
}

PreferredSizeWidget dashBoardAppbar() {
  return Box3.primaryUI == AppUI.uiTwo
      ? dashBoardAppbarUITwo()
      : Box3.primaryUI == AppUI.uiThree
          ? dashBoardAppbarUIThree()
          : Box3.primaryUI == AppUI.uiSix
            ? dashBoardAppbarUISix()
              : Box3.primaryUI == AppUI.uiFive
              ? u5.dashBoardAppbarDefault()
              : u1.dashBoardAppbarDefault();
}
