import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobiremit/models/beneficiary/beneficiary_fz.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/models/formatter.dart';

Widget moreBeneficiaryDetails(BeneficiaryFz b) {
  return GetBuilder<AccountController>(builder: (ac) {
    // TextStyle h = TS.f12.copyWith(
    //         color: _.isDark ? AppConfigs.g8f : AppConfigs.g77,
    //         fontWeight: FontWeight.w600),
    //     t = TS.f12.copyWith(
    //         fontSize: 11,
    //         color: _.isDark ? AppConfigs.g8f : AppConfigs.g4,
    //         fontWeight: FontWeight.w700);
    return Container(
      color: ac.isDark ? Colors.grey.shade900 : const Color(0xffeeeeee).withOpacity(0.36),
      padding: const EdgeInsets.fromLTRB(30, 14, 20, 14),
      child: StaggeredGrid.count(
        crossAxisCount: 5,
        children: [
          StaggeredGridTile.fit(crossAxisCellCount: 3, child: rowDetails('currency'.tr, b.serviceCurrency?.Desc ?? "")),
          StaggeredGridTile.fit(crossAxisCellCount: 3, child: rowDetails('email_address'.tr, (b.email?.isNotEmpty ?? false) ? b.email! : '-')),
          StaggeredGridTile.fit(
              crossAxisCellCount: 2,
              child: rowDetails(
                'mob'.tr,
                b.phone?.isNotEmpty == true ? b.phone! : '-',
              )),
          if (b.dateOfBirth != null && b.dateOfBirth!.isNotEmpty)
            StaggeredGridTile.fit(
                crossAxisCellCount: 2, child: rowDetails('DOB', DateFormatter.ddmmmmyyyy(DateFormat("dd/MMM/yyyy").parse(b.dateOfBirth ?? "")))),
          StaggeredGridTile.fit(
            crossAxisCellCount: (b.nationality?.Code.isNotEmpty ?? false) ? 3 : 5,
            child: rowDetails(
              'Nationality_'.tr,
              (b.nationality?.Desc.isNotEmpty ?? false) ? b.nationality!.Desc : '-',
            ),
          ),
          b.gender!.Code.isNotEmpty
              ? StaggeredGridTile.fit(
                  crossAxisCellCount: 2,
                  child: rowDetails(
                      'Gender_'.tr,
                      b.gender?.Code == 'M'
                          ? 'male'.tr
                          : b.gender?.Code == 'F'
                              ? 'female'.tr
                              : b.gender?.Code == 'O'
                                  ? 'Other'.tr
                                  : b.gender?.Code ?? ''),
                )
              : const SizedBox(),
        ],
      ),
    );
  });
}

Widget rowDetails(String data1, String data2) {
  return GetBuilder<AccountController>(builder: (accountController) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data1,
          style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g77, fontWeight: FontWeight.w600),
        ),
        const Text(" : "),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.7),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                data2,
                style: TS.f12.copyWith(fontSize: 11, color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g4, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        )
      ],
    );
  });
}
