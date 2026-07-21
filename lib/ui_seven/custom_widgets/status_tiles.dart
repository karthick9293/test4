import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/flavours/constants.dart';

class StatusTiles {
  static Widget deactiveTile() {
    return Container(
      width: 53,
      height: 14,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7)), color: Color(0xffff4905)),
      alignment: Alignment.center,
      child: Text(
        'Inactive'.tr,
        style: TS.f8.copyWith(color: AppConfigs.w),
      ),
    );
  }

  static Widget successTile({String? text}) {
    return Container(
      // width: 53,
      height: 14,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xff889703).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(
        text ?? 'success'.tr,
        style: TextStyles.font8,
      ),
    );
  }

  static Widget failTile({String? text}) {
    return Container(
      // width: 53,
      height: 14,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xfff9141c).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(
        text ?? 'failed'.tr,
        style: TextStyles.font8.copyWith(color: Colors.red),
      ),
    );
  }

  static Widget pendingForApprovalTile() {
    return Container(
      width: 98,
      height: 14,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xffef7205).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text("Pending_for_Approval".tr, style: TS.f8.copyWith(color: const Color(0xffff6600))),
    );
  }

  static Widget waitingForApprovalTile(String? text) {
    return Container(
      // width: 98,
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 14,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xffFF9110).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(text ?? 'Waiting_for_approval'.tr, style: TS.f8.copyWith(color: const Color.fromARGB(255, 193, 80, 4))),
    );
  }

  static Widget underProcessingTile(String? text) {
    return Container(
      // width: 98,
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 14,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xffFFBC10).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(text ?? 'under_processing'.tr, style: TS.f8.copyWith(color: const Color.fromARGB(255, 183, 126, 4))),
    );
  }

  static Widget activeTile() {
    return Container(
      width: 53,
      height: 14,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xff95a509).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(
        "active".tr,
        style: TS.f8.copyWith(color: const Color(0xff889703)),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class StatusUiOne {
  static Widget deactiveTile() {
    return Container(
      width: 53,
      height: 14,
      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7)), color: Color(0xffff4905)),
      alignment: Alignment.center,
      child: Text(
        'Inactive'.tr,
        style: TS.f8.copyWith(color: AppConfigs.w),
      ),
    );
  }

  static Widget successTile({String? text}) {
    return Container(
      // width: 53,
      height: 14,
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xff889703).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(
        text ?? 'success'.tr,
        style: TextStyles.font8,
      ),
    );
  }

  static Widget failTile({String? text}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2.5),
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(50)), color: const Color(0xfff9141c).withOpacity(0.25)),
          alignment: Alignment.center,
          child: Icon(
            Icons.close,
            size: 14,
            color: Colors.red,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text ?? 'failed'.tr,
          style: TextStyles.font14.copyWith(color: Colors.red, fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  static Widget pendingForApprovalTile() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2.5),
          decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(50)), color: const Color(0xffff6600).withOpacity(0.25)),
          alignment: Alignment.center,
          child: Icon(Icons.watch_later_outlined, size: 14, color: const Color(0xffff6600)),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          "Pending_for_Approval".tr,
          style: TextStyles.font14.copyWith(color: const Color(0xffff6600), fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  static Widget waitingForApprovalTile(String? text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2.5),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(50)), color: const Color.fromARGB(255, 193, 80, 4).withOpacity(0.25)),
          alignment: Alignment.center,
          child: Icon(Icons.watch_later_outlined, size: 14, color: const Color.fromARGB(255, 193, 80, 4)),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          text ?? 'Waiting_for_approval'.tr,
          style: TextStyles.font14.copyWith(color: const Color.fromARGB(255, 193, 80, 4), fontWeight: FontWeight.w600),
        )
      ],
    );
  }

  static Widget underProcessingTile(String? text) {
    return Container(
      // width: 98,
      padding: const EdgeInsets.only(left: 10, right: 10),
      height: 14,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xffFFBC10).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(text ?? 'under_processing'.tr, style: TS.f8.copyWith(color: const Color.fromARGB(255, 183, 126, 4))),
    );
  }

  static Widget activeTile() {
    return Container(
      width: 53,
      height: 14,
      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(7)), color: const Color(0xff95a509).withOpacity(0.25)),
      alignment: Alignment.center,
      child: Text(
        "active".tr,
        style: TS.f8.copyWith(color: const Color(0xff889703)),
        textAlign: TextAlign.center,
      ),
    );
  }
}
