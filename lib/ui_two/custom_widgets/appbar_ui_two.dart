import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/main_controller.dart';
import 'package:mobiremit/core/flavours/constants.dart';

class AppbarUiTwo extends StatelessWidget {
  const AppbarUiTwo({
    super.key,
    required this.title,
    this.actions,
    this.onTap,
    this.isBackButton = true,
  });

  final String title;
  final bool? isBackButton;
  final void Function()? onTap;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      centerTitle: true,
      leading: isBackButton == false
          ? SizedBox()
          : InkWell(
              onTap: onTap ?? () => Get.find<MainController>().pop(),
              child: Icon(CupertinoIcons.arrow_left),
            ),
      title: Text(
        title,
        style: TS.f26B.copyWith(color: Get.find<MainController>().isDark?AppConfigs.gd1:null),
      ),
      actions: actions,
    );
  }
}

class Appbar2 extends StatelessWidget {
  const Appbar2({
    super.key,
    required this.title,
    this.actions,
    this.onTap,
    this.isBackButton = true,
  });

  final String title;
  final bool? isBackButton;
  final void Function()? onTap;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: Row(
          children: [
            isBackButton == false
                ? SizedBox()
                : InkWell(
                    onTap: onTap ?? () => Get.back(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(CupertinoIcons.arrow_left),
                    ),
                  ),
            Expanded(
                child: Text(
              title,
              style: TS.f26B,
              textAlign: TextAlign.center,
            )),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: actions ?? [],
            )
          ],
        ),
      ),
    );
  }
}
