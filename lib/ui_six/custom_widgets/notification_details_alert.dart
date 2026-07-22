import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/notification/in_app_notification/in_app_notifications_fz.dart';

import '../../core/exports/controllers.dart';
import '../../core/flavours/constants.dart';

Widget notificationDetailsAlert({NotificationFz? notification}) {
  return GetBuilder<DataController>(builder: (_) {
    return Container(
      alignment: Alignment.center,
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        padding: const EdgeInsets.fromLTRB(17, 12, 17, 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            boxShadow: const [BoxShadow(color: Color(0x29000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
            color: Get.find<AccountController>().isDark ? AppConfigs.g21 : AppConfigs.w),
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text('Notification'.tr,
                        style:
                            TS.f16.copyWith(color: Get.find<AccountController>().isDark ? AppConfigs.w : AppConfigs.g4, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start),
                  ),
                  Container(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Get.back(),
                      child: SvgPicture.asset(
                        ImagePath.close,
                        height: 20,
                        width: 20,
                        colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              // if (notifications?.subject.isNotEmpty == true)
              //   Text(
              //     notifications?.subject ?? '',
              //     style: TS.f16.copyWith(
              //         color: Get.find<AccountController>().isDark
              //             ? AppConfigs.w
              //             : AppConfigs.g4,
              //         fontWeight: FontWeight.w700),
              //     textAlign: TextAlign.start,
              //   ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Html(
                  data: notification?.messageContent.trim() ?? '',
                  style: {
                    "body": Style(
                      fontSize: FontSize(14.0),
                      color: Get.find<AccountController>().isDark ? AppConfigs.w : AppConfigs.g4,
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.start,
                    ),
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(child: Container()),
                  notification?.createdOn != null && notification!.createdOn.isNotEmpty
                      ? Text(
                          Get.find<DataController>().formattedDateTime(dateTime: notification.createdOn),
                          style: TS.f10
                              .copyWith(color: Get.find<AccountController>().isDark ? AppConfigs.w : AppConfigs.g4, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  });
}
