import 'dart:math';

import 'package:mobiremit/core/flavours/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class CaptchaController extends GetxController {
  TextEditingController captchaController = TextEditingController();
  static const _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890bxjbq6';
  final Random _rnd = Random();
  bool captchaShow = true;
  FlutterTts tts = FlutterTts();
  String randomCode = '';
  String captchaErrorText = '';
  Color cone = Colors.blueAccent;
  Color ctwo = Colors.redAccent;
  Color? captchaColor;
  List<Color> colors = [
    AppConfigs.primaryColor,
    AppConfigs.accentColor,
    Colors.green
  ];

  void setCaptchaShowValue(bool val) {
    captchaShow = val;
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) => update(),
    );
  }

  String getRandomCodeGenerator(int length) => String.fromCharCodes(
        Iterable.generate(
          length,
          (_) => _chars.codeUnitAt(
            _rnd.nextInt(_chars.length),
          ),
        ),
      );

  void getRandomCode() {
    randomCode = getRandomCodeGenerator(5);
    clear();
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) => update(),
    );
  }

  void setRandomColor() {
    Random random = Random();
    int cindex = random.nextInt(colors.length);
    Color tempcol = colors[cindex];
    captchaColor = tempcol;
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) => update(),
    );
  }

  bool validateCaptcha() {
    if (!captchaShow) {
      captchaErrorText = "";
      update();
      return true;
    }
    if (captchaController.text.isEmpty) {
      captchaErrorText = "Captcha code required";
    } else if (captchaController.text != randomCode) {
      captchaErrorText = "Invalid Captcha";
    } else {
      captchaErrorText = "";
    }
    update();
    return captchaErrorText.isEmpty;
  }

  void clear() {
    captchaController.clear();
    captchaErrorText = "";
  }
}
