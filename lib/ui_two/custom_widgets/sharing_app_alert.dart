import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/exports/ui_two_custom_widgets.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

class SharingAppAlert extends StatelessWidget {
  final String? title;
  final String? body;
  final List<String>? appName;

  const SharingAppAlert(
      {super.key, required this.title, this.body, this.appName});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: GetBuilder<AccountController>(builder: (accountController) {
        return BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 3,
            sigmaY: 3,
          ),
          child: Container(
            alignment: Alignment.center,
            child: Material(
              color: Colors.transparent,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: accountController.isDark
                        ? AppConfigs.g14
                        : AppConfigs.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: AppConfigs.primaryColor)),
                        child: Icon(
                          Icons.screen_share_outlined,
                          size: 40,
                          color: AppConfigs.primaryColor,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      title ?? "",
                      style: TS.f22.copyWith(
                          color: accountController.isDark ? AppConfigs.w : null,
                          fontWeight: FontWeight.w800),
                      textAlign: TextAlign.center,
                    ),
                    if (body != null) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      Text(body ?? "",
                          style: TS.f14.copyWith(
                              color: accountController.isDark
                                  ? AppConfigs.g85
                                  : null),
                          textAlign: TextAlign.justify)
                    ],
                    if (appName != null && appName!.isNotEmpty) ...[
                      // const SizedBox(height: 15,),
                      // Text("Uninstalled These Apps",style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.g85:null,fontWeight: FontWeight.w700),),
                      const SizedBox(
                        height: 10,
                      ),
                      ...List.generate(
                          appName!.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(bottom: 5.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.circle,
                                      size: 10,
                                      color: AppConfigs.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Expanded(
                                        child: Text(
                                      appName![index],
                                      style: TS.f14.copyWith(
                                          color: accountController.isDark
                                              ? AppConfigs.g85
                                              : null),
                                    )),
                                  ],
                                ),
                              ))
                    ],
                    const SizedBox(
                      height: 20,
                    ),
                    RowColumnButton(
                      isRow: Box3.settings.EnableSwipeButton == true
                          ? false
                          : true,
                      children: [
                        roundButton("Close App", onTap: () {
                          SystemNavigator.pop();
                        }, noMar: true, borderOnly: true),
                        roundButton("Continue", onTap: () {
                          Get.back();
                        }, noMar: true)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
