import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobiremit/core/controllers/captcha_controller.dart';
import 'package:mobiremit/core/exports/ui_six_custom_widgets.dart';
import 'package:mobiremit/core/flavours/app_config.dart';
import 'package:mobiremit/core/flavours/constants.dart';

class CaptchaCode extends StatefulWidget {
  final bool? show;

  const CaptchaCode({super.key, this.show = true});

  @override
  State<CaptchaCode> createState() => _CaptchaCodeState();
}

class _CaptchaCodeState extends State<CaptchaCode> {
  CaptchaController captchaController = Get.put(CaptchaController());

  @override
  void initState() {
    super.initState();
    captchaController.setRandomColor();
    captchaController.getRandomCode();
  }

  @override
  Widget build(BuildContext context) {
    captchaController.setCaptchaShowValue(widget.show ?? true);
    return GetBuilder<CaptchaController>(builder: (captchaCtrl) {
      return captchaCtrl.captchaShow != true
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: BoxDecoration(color: AppConfigs.primaryColor.withAlpha(10), borderRadius: BorderRadius.circular(0)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 40,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppConfigs.accentColor.withAlpha(40),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              captchaCtrl.randomCode,
                              style: GoogleFonts.vt323(
                                fontWeight: FontWeight.w800,
                                fontSize: 30,
                                letterSpacing: 8,
                                color: captchaCtrl.captchaColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                            onTap: () {
                              captchaCtrl.setRandomColor();
                              captchaCtrl.getRandomCode();
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: AppConfigs.primaryColor.withAlpha(500), borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.refresh,
                                color: Colors.white,
                                size: 17,
                              ),
                            )),
                        SizedBox(
                          width: 7,
                        ),
                        GestureDetector(
                            onTap: () {
                              captchaCtrl.tts.speak(captchaCtrl.randomCode);
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(color: AppConfigs.primaryColor.withAlpha(500), borderRadius: BorderRadius.circular(5)),
                              child: Icon(
                                Icons.volume_up,
                                color: Colors.white,
                                size: 17,
                              ),
                            )),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [],
                        )
                      ],
                    ),
                    // Text(
                    //   'Type <CAPTCHA> in the box below',
                    //   style: TS.f12,
                    // ),
                    textFormField(
                      left: 0,
                      right: 0,
                      controller: captchaCtrl.captchaController,
                      hintText: "Captcha",
                      errorText: captchaCtrl.captchaErrorText,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          captchaCtrl.captchaErrorText = '';
                          captchaCtrl.update();
                        }
                        if (kDebugMode) {
                          print(captchaCtrl.captchaController.text);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
    });
  }
}
