import 'dart:async';

import 'package:get/get.dart';

import '../editing_controllers.dart/attributes.dart';
import '../exports/controllers.dart';

class TimerContoller extends GetxController {
  DialogOtpAuthAuthAttributes dialogOtpAuthAttributes = DialogOtpAuthAuthAttributes();
  bool isDark = Get.find<AccountController>().isDark;

  // bool isResendLimit = false;
  bool isResend = false;
  bool sending = false;
  bool buttonLoading = false;
  String otpMessage = '';

  String errorText = '';

  int timeToResend = 60;
  Timer? otpTimer;

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
          update();
        } else {
          timeToResend--;
          update();
        }
      },
    );
  }

  void stopTimer1() {
    if (otpTimer != null) {
      otpTimer?.cancel();
    }
  }
}
