import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/controllers/inactivity_controller.dart';
import '../core/exports/controllers.dart';

class InactivityWrapper extends StatelessWidget {
  final Widget child;

  const InactivityWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final inactivityController = Get.put(InactivityController());
    return Obx(() {
      final isLoggedIn = Get.find<InactivityController>().loginSession.value;
      return Listener(
        onPointerDown: (_) {
          if (isLoggedIn) {
            inactivityController.onUserInteraction();
          }
        },
        behavior: HitTestBehavior.translucent,
        child: child,
      );
    });
  }
}
