import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_three_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../models/masters/master_response_fz.dart';

void sourceBottomSheet(
    {required String type,
    required String searchHint,
    required List<MasterResponseFZ> sources,
    required void Function(MasterResponseFZ) onTap,
    List<MasterResponseFZ>? selected,
    bool includeCheckbox = false}) {
  List<MasterResponseFZ> filteredSources = sources;
  Widget titleTile(String title, bool isDark) {
    return Container(
      height: 36,
      decoration:
          BoxDecoration(color: const Color(0xff05465b).withOpacity(0.05)),
      padding: const EdgeInsets.only(left: 30, right: 30),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyles.font14.copyWith(
                  color: isDark ? AppConfigs.w : const Color(0xff2d2d2d),
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.start),
          GestureDetector(
            onTap: Get.back,
            child: Text('Close'.tr,
                style: TextStyles.font14.copyWith(
                    color: isDark ? AppConfigs.w : const Color(0xff2d2d2d),
                    fontWeight: FontWeight.w700),
                textAlign: TextAlign.start),
          ),
        ],
      ),
    );
  }

  Widget contentTile(
      {required MasterResponseFZ sourceBV,
      bool showCode = true,
      required bool isDark}) {
    return Container(
      margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      height: 40,
      child: GestureDetector(
        onTap: () {
          onTap(sourceBV);
          if (selected != null) {
            List<MasterResponseFZ> temp =
                filteredSources.where((s) => selected.contains(s)).toList();
            filteredSources.removeWhere((s) => selected.contains(s));
            filteredSources.sort((a, b) => a.Desc.compareTo(b.Desc));
            filteredSources.insertAll(0, temp);
            Get.find<SignUpController>().update();
          }
        },
        child: Row(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                color: Colors.transparent,
                child: Text(sourceBV.Desc,
                    style: TextStyles.font14.copyWith(
                        color: isDark ? AppConfigs.g8f : AppConfigs.g4,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start),
              ),
            ),
            Visibility(
                visible: includeCheckbox,
                child: selected?.contains(sourceBV) == true
                    ? SvgPicture.asset(ImagePath.check)
                    : Container(
                        height: 20,
                        width: 20,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: AppConfigs.g77),
                        ),
                      ))
          ],
        ),
      ),
    );
  }

  Get.bottomSheet(GetBuilder<SignUpController>(builder: (signUpController) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: const [
            BoxShadow(
                color: Color(0x2e000000),
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0)
          ],
          color: signUpController.isDark ? AppConfigs.b : AppConfigs.w),
      child: Column(
        children: [
          const SizedBox(height: 20),
          titleTile('${'Select'.tr} $type', signUpController.isDark),
          textFormField(
              hintText: searchHint.tr,
              onChanged: (s) {
                if (s.isNotEmpty) {
                  filteredSources = sources
                      .where((c) =>
                          c.Desc.toLowerCase().contains(s.toLowerCase()) ||
                          selected?.contains(c) == true)
                      .toList();
                  signUpController.update();
                } else {
                  filteredSources = sources;
                  if (selected != null) {
                    List<MasterResponseFZ> temp = filteredSources
                        .where((s) => selected.contains(s))
                        .toList();
                    filteredSources.removeWhere((s) => selected.contains(s));
                    filteredSources.insertAll(0, temp);
                  }
                  signUpController.update();
                }
              }),
          Expanded(
              child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  itemCount: filteredSources.length,
                  itemBuilder: (c, i) => contentTile(
                      sourceBV: filteredSources[i],
                      isDark: signUpController.isDark)))
        ],
      ),
    );
  }));
}
