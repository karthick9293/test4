import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../../core/controllers/beneficiary_conroller.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/exports/ui_six_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';

class ArchivedBeneficiariespage extends StatelessWidget {
  const ArchivedBeneficiariespage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BeneficiaryController>(builder: (beneficiaryController) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Row(
              children: [
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    for (BeneficiaryFz b in beneficiaryController.markedBeneficiary) {
                      int i = beneficiaryController.benefs.indexOf(b);
                      beneficiaryController.benefs[i] = b.copyWith(archive: '');
                    }
                    beneficiaryController
                      ..archivedBenefs = beneficiaryController.benefs.where((e) => e.archive == 'A').toList()
                      ..isSelecting = false
                      ..markedBeneficiary.clear()
                      ..update();
                  },
                  child: Row(
                    children: [
                      Text('Unarchive_Beneficiary'.tr,
                          style: TS.f12.copyWith(
                              color: beneficiaryController.isDark
                                  ? (beneficiaryController.markedBeneficiary.isNotEmpty ? AppConfigs.w : AppConfigs.g8f)
                                  : (beneficiaryController.markedBeneficiary.isEmpty ? AppConfigs.g4 : AppConfigs.primaryColor),
                              decoration: TextDecoration.underline,
                              decorationColor: beneficiaryController.isDark
                                  ? (beneficiaryController.markedBeneficiary.isNotEmpty ? AppConfigs.w : AppConfigs.g8f)
                                  : (beneficiaryController.markedBeneficiary.isEmpty ? AppConfigs.g4 : AppConfigs.primaryColor))),
                      const SizedBox(width: 6),
                      SvgPicture.asset(
                        SvgIcons.archive,
                        colorFilter: ColorFilter.mode(
                            beneficiaryController.isDark
                                ? (beneficiaryController.markedBeneficiary.isNotEmpty ? AppConfigs.w : AppConfigs.g8f)
                                : (beneficiaryController.markedBeneficiary.isEmpty ? AppConfigs.g4 : AppConfigs.primaryColor),
                            BlendMode.srcIn),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          textFormField(
              hintText: 'search'.tr,
              controller: beneficiaryController.archiveSearchController,
              trailing: Container(
                width: 40,
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  ImagePath.search,
                  height: 20,
                  width: 20,
                  colorFilter: ColorFilter.mode(beneficiaryController.isDark ? AppConfigs.w : AppConfigs.g4, BlendMode.srcIn),
                ),
              ),
              onChanged: (v) => beneficiaryController
                ..archivedBenefs =
                    beneficiaryController.benefs.where((b) => b.firstName!.toLowerCase().contains(v.toLowerCase()) && b.archive == 'A').toList()
                ..update(),
              top: 5,
              bottom: 20),
          Expanded(
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: beneficiaryController.archivedBenefs.length,
              itemBuilder: (c, i) => beneficiaryTile2(b: beneficiaryController.archivedBenefs[i], index: i, isArchive: true),
            ),
          )
        ],
      );
    });
  }
}
