import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/flavours/constants.dart';

class StatusTiles {
  static Widget deactiveTile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.stop_circle_fill,color: const Color(0xffff4905),size: 15,),
        SizedBox(width: 2.5,),
        Text('Inactive'.tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor))
      ],
    );
  }

  static Widget successTile({String? text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.check_mark_circled_solid,color: const Color(0xff4BAC40),size: 15,),
        SizedBox(width: 2.5,),
        Text(text ?? 'success'.tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor))
      ],
    );
  }

  static Widget failTile({String? text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.close,color: Colors.red,size: 15,),
        SizedBox(width: 2.5,),
        Text(text ?? 'failed'.tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor))
      ],
    );
  }

  static Widget pendingForApprovalTile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.clock_fill,color: const Color(0xffff6600),size: 15,),
        SizedBox(width: 2.5,),
        Text("Pending_for_Approval".tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor))
      ],
    );
  }

  static Widget waitingForApprovalTile(String? text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.clock_fill,color: const Color.fromARGB(255, 193, 80, 4),size: 15,),
        SizedBox(width: 2.5,),
        Text(text ?? 'Waiting_for_approval'.tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor))
      ],
    );
  }

  static Widget underProcessingTile(String? text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.clock_fill,color: const Color(0xFFF59E0B),size: 15,),
        SizedBox(width: 2.5,),
        Text(text ?? 'under_processing'.tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor))
      ],
    );
  }

  static Widget activeTile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(CupertinoIcons.check_mark_circled_solid,color: const Color(0xff4BAC40),size: 15,),
        SizedBox(width: 2.5,),
        Text("active".tr, style: TS.f14.copyWith(color: AppConfigs.primaryColor))
      ],
    );
  }
}
