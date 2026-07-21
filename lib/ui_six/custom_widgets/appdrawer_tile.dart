import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget appDrawerTile(
    {required String image, required String title, required double top, double? height, required bool enable, void Function()? onTap,Color? color}) {
  return !enable
      ? const SizedBox()
      : GetBuilder<AccountController>(builder: (accountController) {
          return GestureDetector(
            onTap: onTap,
            child: Container(
              // color: accountController.isDark ? AppConfigs.g14 : Colors.transparent,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border:Border.all(color: AppConfigs.primaryColor.withOpacity(0.3)),
                color: accountController.isDark?AppConfigs.w.withOpacity(0.1):AppConfigs.w
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color!=null?color.withOpacity(0.2):Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        image,
                        height: height ?? 30,
                        fit: BoxFit.contain,
                        errorBuilder: (c,t,a)=>Icon(Icons.error),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: TS.f18B.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                        ),
                        Text("$title section",style: TS.f12.copyWith(color: AppConfigs.g8f),)
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios_outlined,size: 10,color: AppConfigs.primaryColor.withOpacity(0.7),)
                ],
              ),
            ),
          );
        });
}
