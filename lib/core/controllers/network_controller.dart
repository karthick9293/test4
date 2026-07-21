// import 'dart:async';
// import 'package:mobiremit/others/app_config.dart';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
//
// class NetworkController extends GetxController {
//   final isConnected = false.obs;
//   late StreamSubscription<List<ConnectivityResult>> _subscription;
//
//   @override
//   void onInit() {
//     super.onInit();
//     _subscription =
//         Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
//   }
//
//   @override
//   void onClose() {
//     _subscription.cancel();
//     super.onClose();
//   }
//
//   Future<bool> hasInternetAccess() async {
//     try {
//       final response = await http
//           .head(Uri.parse('https://www.google.com'))
//           .timeout(const Duration(seconds: 3));
//       return response.statusCode == 200;
//     } catch (_) {
//       return false;
//     }
//   }
//
//   bool _initialCheckDone = false;
//
//   void _updateConnectionStatus(List<ConnectivityResult> resultList) async {
//     final hasNetwork = resultList.any((r) => r != ConnectivityResult.none);
//     final hasInternet = hasNetwork ? await hasInternetAccess() : false;
//
//     final previous = isConnected.value;
//     isConnected.value = hasInternet;
//
//     if (!_initialCheckDone) {
//       _initialCheckDone = true;
//
//       /// Show snack bar only if no internet at launch
//       if (!hasInternet && !Get.isSnackbarOpen) {
//         showConnectionSnackBar(false);
//       }
//       return;
//     }
//
//     if (previous != hasInternet && !Get.isSnackbarOpen) {
//       showConnectionSnackBar(hasInternet);
//       update();
//
//       /// Needed only if using GetBuilder
//     }
//   }
//
//   showConnectionSnackBar(bool hasConnection) {
//     final bgColor =
//         hasConnection ? AppConfigs.primaryColor : AppConfigs.errorBorderDark;
//     final text = hasConnection
//         ? 'You are back online try again via reopening the app.'
//         : 'Please check your connection and try again via reopening the app.';
//
//     Get.snackbar(
//       '', '',
//       snackPosition: SnackPosition.BOTTOM,
//       snackStyle: SnackStyle.GROUNDED,
//       backgroundColor: Colors.transparent,
//       padding: EdgeInsets.zero,
//       margin: EdgeInsets.zero,
//       duration: const Duration(seconds: 3),
//       titleText: Builder(
//         builder: (context) {
//           final width = MediaQuery.of(context).size.width;
//           return Container(
//             width: width,
//             height: 50,
//             color: bgColor,
//             padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
//             alignment: Alignment.center,
//             child: Text(
//               text,
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontSize: 12,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           );
//         },
//       ),
//       messageText: const SizedBox.shrink(), // Remove extra row
//     );
//   }
// }
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mobiremit/others/box3.dart';

import '../flavours/app_config.dart';

class NetworkController extends GetxController {
  final isConnected = false.obs;
  final ipAddress = ''.obs;

  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  bool _initialCheckDone = false;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }

  Future<bool> hasInternetAccess() async {
    try {
      final response = await http.head(Uri.parse('https://www.google.com')).timeout(const Duration(seconds: 3));
      return response.statusCode == 200;
    } catch (_) {
      return false;
    }
  }

  void _updateConnectionStatus(List<ConnectivityResult> resultList) async {
    final hasNetwork = resultList.any((r) => r != ConnectivityResult.none);
    final hasInternet = hasNetwork ? await hasInternetAccess() : false;

    final previous = isConnected.value;
    isConnected.value = hasInternet;

    // Fetch and update IP if internet is available
    if (hasInternet) {
      final newIp = await Box3.getIPAddress();
      if (newIp != null && newIp != ipAddress.value) {
        ipAddress.value = newIp;
        debugPrint('📡 New IP after network change: $newIp');
      }
    } else {
      ipAddress.value = '';
    }
    if (!_initialCheckDone) {
      _initialCheckDone = true;
      if (!hasInternet && !Get.isSnackbarOpen) {
        showConnectionSnackBar(false);
      }
      return;
    }

    if (previous != hasInternet && !Get.isSnackbarOpen) {
      showConnectionSnackBar(hasInternet);
      update(); // For GetBuilder if used
    }
  }

  void showConnectionSnackBar(bool hasConnection) {
    final bgColor = hasConnection ? AppConfigs.dg : AppConfigs.errorBorderDark;
    final text = hasConnection ? 'You are back online. Please retry your action.' : 'No internet connection. Please check your network.';

    Get.snackbar(
      '',
      '',
      snackPosition: SnackPosition.BOTTOM,
      snackStyle: SnackStyle.GROUNDED,
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      margin: EdgeInsets.zero,
      duration: const Duration(seconds: 3),
      titleText: Builder(
        builder: (context) {
          final width = MediaQuery.of(context).size.width;
          return Container(
            width: width,
            height: 50,
            color: bgColor,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
      messageText: const SizedBox.shrink(),
    );
  }

  /// Example IP fetching method (you can replace it with your backend call)
  Future<String?> getPublicIpAddress() async {
    try {
      final response = await http.get(Uri.parse('https://api.ipify.org')).timeout(
            const Duration(seconds: 5),
          );
      if (response.statusCode == 200) {
        return response.body.trim();
      }
    } catch (_) {
      // ignore or log
    }
    return null;
  }
}
