import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/flavours/constants.dart';
import '../../models/masters/master_response_fz.dart';
import '../../models/service_provider/service_provider_fz.dart';

Widget titleTile(String title, bool isDark) {
  return Container(
    height: 36,
    decoration: BoxDecoration(color: AppConfigs.primaryColor.withOpacity(0.1)),
    padding: const EdgeInsets.only(left: 30),
    alignment: Alignment.centerLeft,
    child: Text(title,
        style: TS.f14.copyWith(color: isDark ? AppConfigs.w : const Color(0xff2d2d2d), fontWeight: FontWeight.w700), textAlign: TextAlign.start),
  );
}

Widget titleText1(String title, bool isDark) {
  return Container(
    padding: const EdgeInsets.only(left: 20, top: 10),
    alignment: Alignment.centerLeft,
    child: Text(title,
        style: TS.f16.copyWith(color: isDark ? AppConfigs.w : const Color(0xff2d2d2d), fontWeight: FontWeight.w600), textAlign: TextAlign.start),
  );
}

Widget contentTile(
    {required void Function(MasterResponseFZ) onTap,
    required MasterResponseFZ data,
    bool showCode = true,
    required bool isDark,
    List<MasterResponseFZ>? selected,
    bool isBankBranches = false,
    bool includeCheckbox = false}) {
  return Container(
    margin: EdgeInsets.fromLTRB(30, isBankBranches ? 2 : 12, 30, isBankBranches ? 2 : 12),
    // height:!isBankBranches ? 40 : null,
    child: GestureDetector(
      onTap: () {
        onTap(data);
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.Desc,
                    style: TS.f14.copyWith(color: isDark ? AppConfigs.w : AppConfigs.g4, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.start,
                  ),
                  if (isBankBranches)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${data.BranchAddress1}, ${data.BranchAddress2}, ${data.BranchAddress3}',
                          style: TS.f12.copyWith(color: isDark ? AppConfigs.g8f : AppConfigs.g4, fontWeight: FontWeight.w600),
                          textAlign: TextAlign.start,
                        ),
                        if (data.branchBicDetails.isNotEmpty)
                          Text(
                            '${data.branchBicDetails[0].BicTypeDescription}: ${data.branchBicDetails[0].BicTypeValue}',
                            style: TS.f12.copyWith(color: isDark ? AppConfigs.gb0 : AppConfigs.g4, fontWeight: FontWeight.w600),
                            textAlign: TextAlign.start,
                          ),
                        Divider(),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: includeCheckbox,
            child: selected?.contains(data) == true
                ? SvgPicture.asset(ImagePath.check)
                : Container(
                    height: 20,
                    width: 20,
                    margin: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      border: Border.all(color: AppConfigs.g77),
                    ),
                  ),
          )
        ],
      ),
    ),
  );
}

Widget contentTile2(
    {required void Function(ServiceProvider) onTap,
    required ServiceProvider data,
    bool showCode = true,
    required bool isDark,
    List<ServiceProvider>? selected,
    bool includeCheckbox = false}) {
  return Container(
    margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
    height: 40,
    child: GestureDetector(
      onTap: () {
        onTap(data);
      },
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.centerLeft,
              color: Colors.transparent,
              child: Text(
                data.provider ?? "",
                style: TS.f14.copyWith(color: isDark ? AppConfigs.g8f : AppConfigs.g4, fontWeight: FontWeight.w600),
                textAlign: TextAlign.start,
              ),
            ),
          ),
          Visibility(
              visible: includeCheckbox,
              child: selected?.contains(data) == true
                  ? SvgPicture.asset(ImagePath.check)
                  : Container(
                      height: 20,
                      width: 20,
                      margin: const EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: AppConfigs.g77),
                      ),
                    ))
        ],
      ),
    ),
  );
}
