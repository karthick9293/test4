import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/flavours/constants.dart';
import '../custom_widgets/loader.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(builder: (signUpController) {
      return NavigatorPopHandler(
        onPop: () async {
          signUpController.logoutAlert(
            title: 'Alert',
            description: 'Are you sure you want to close the application?',
            yes: 'Yes',
            no: 'No',
          );
          return Future.value(false); // Prevents the pop until the action is handled
        },
        child: Scaffold(
          backgroundColor: AppConfigs.bodybg(signUpController.isDark),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 20),
                    child: Text(
                      "Please hold while we process your request.\nThank you for your patience.",
                      style: TS.f14.copyWith(
                        color: signUpController.isDark ? AppConfigs.w : AppConfigs.g4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  loader(top: 15, bottom: 15),

                  // const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
