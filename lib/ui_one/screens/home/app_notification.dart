import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:mobiremit/network/api_service_new.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/flavours/constants.dart';

class AppNotificationPage extends StatelessWidget {
  final bool isPrelogin;

  const AppNotificationPage({super.key, this.isPrelogin = false});

  @override
  Widget build(BuildContext context) {
    ScrollController notnScrollContrl = ScrollController();
    Get.find<DataController>().getNotifications();
    bool isDark = Get.isRegistered<MainController>()
        ? Get.find<MainController>().isDark
        : false;
    return Scaffold(
      backgroundColor: AppConfigs.bodybg(isDark),
      appBar: isPrelogin
          ? appBar0(cms(Fields.Notification_PageHeading).textHeading!,
              onTap2: Get.back)
          : null,
      body: GetBuilder<DataController>(
        builder: (dataController) {
          return dataController.notificationLoading
              ? Center(child: loader())
              : dataController.notifications.isEmpty
                  ? Center(
                      child: Text(
                        "You have no Notifications.".tr,
                        style: TS.f18.copyWith(color: AppConfigs.accentColor),
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(height: 5),
                        Expanded(
                          child: Scrollbar(
                            controller: notnScrollContrl,
                            thumbVisibility: true,
                            interactive: true,
                            child: ListView.builder(
                              controller: notnScrollContrl,
                              physics: const ClampingScrollPhysics(),
                              itemCount: dataController.notifications.length,
                              itemBuilder: (c, i) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (dataController.notifications[i].status ==
                                        'N') {
                                      if (await ApiService()
                                          .setNotificationStatus(
                                              notification: dataController
                                                  .notifications[i])) {
                                        dataController.notifications[i] =
                                            dataController.notifications[i]
                                                .copyWith(status: 'R');
                                        dataController.update();
                                      }
                                    }

                                    await Get.dialog(notificationDetailsAlert(
                                        notification:
                                            dataController.notifications[i]));
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    // height: 106,
                                    padding: const EdgeInsets.only(
                                        left: 15, top: 10, right: 15, bottom: 10),
                                    margin: const EdgeInsets.only(
                                        left: 30, right: 30, top: 5, bottom: 5),
                                    decoration: dataController
                                                .notifications[i].status ==
                                            'R'
                                        ? BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(12)),
                                            border: Border.all(
                                                color: AppConfigs.gb5, width: 1),
                                            color: AppConfigs.bodybg(isDark),
                                          )
                                        : BoxDecoration(
                                            borderRadius: const BorderRadius.all(
                                                Radius.circular(12)),
                                            border: Border.all(
                                                color: AppConfigs.primaryColor,
                                                width: 2.5),
                                            color: AppConfigs.bodybg(isDark),
                                          ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        if (dataController
                                            .notifications[i].subject.isNotEmpty)
                                          Text(
                                            dataController
                                                .notifications[i].subject,
                                            style: TS.f16.copyWith(
                                                color:
                                                    AppConfigs.contentTextWhite(
                                                        isDark),
                                                fontWeight: FontWeight.w700),
                                            textAlign: TextAlign.start,
                                          ),
                                        Html(
                                          data: dataController
                                              .notifications[i].messageContent
                                              .trim(),
                                          style: {
                                            "body": Style(
                                              fontSize: FontSize(14.0),
                                              color: AppConfigs.contentTextWhite2(
                                                  isDark),
                                              fontWeight: FontWeight.w600,
                                              textAlign: TextAlign.start,
                                            ),
                                          },
                                        ),
                                        Row(
                                          children: [
                                            Expanded(child: Container()),
                                            dataController.notifications[i]
                                                    .createdOn.isNotEmpty
                                                ? Text(
                                                    Get.find<DataController>()
                                                        .formattedDateTime(
                                                            dateTime:
                                                                dataController
                                                                    .notifications[
                                                                        i]
                                                                    .createdOn),
                                                    style: TS.f10.copyWith(
                                                        color: AppConfigs
                                                            .contentTextWhite2(
                                                                isDark),
                                                        fontWeight:
                                                            FontWeight.w600),
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  )
                                                : const SizedBox(),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 5)
                      ],
                    );
        },
      ),
    );
  }
}
