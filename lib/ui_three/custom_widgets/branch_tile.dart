import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/flavours/constants.dart';
import '../../models/contact_us/contact_us_fz.dart';

Widget branchTile(BranchDetail b, isDark) {
  return GestureDetector(
    onTap: () async {
      Uri url = Uri.parse('https://www.google.com/maps/search/?api=1&query=${b.latitude},${b.longitude}');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw '${'Could_not_launch'.tr}$url';
      }
    },
    child: Container(
        margin: const EdgeInsets.only(left: 34, right: 34, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: const Color(0xffe1e1e1), width: 1),
            color: isDark ? AppConfigs.g21 : AppConfigs.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(left: 14, top: 11.5),
                child: SvgPicture.asset(ImagePath.chatBank, colorFilter: isDark ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn) : null)),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(
                  top: 8,
                  bottom: 11,
                  left: 11,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      b.branchName ?? "",
                      style: TS.f14.copyWith(
                        color: isDark ? AppConfigs.w : AppConfigs.g4,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      b.branchAddress ?? "",
                      style: TS.f12.copyWith(
                        color: isDark ? AppConfigs.g8f : AppConfigs.g77,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      b.landmark ?? "",
                      style: TS.f12.copyWith(
                        color: isDark ? AppConfigs.g8f : AppConfigs.g77,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      b.phone ?? "",
                      style: TS.f12.copyWith(
                        color: isDark ? AppConfigs.g8f : AppConfigs.g77,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    Text(
                      b.zoneName ?? "",
                      style: TS.f12.copyWith(
                        color: isDark ? AppConfigs.g8f : AppConfigs.g77,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 9.5, top: 9.5),
                child: Container(
                    height: 18,
                    width: 18,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: isDark ? AppConfigs.w : const Color(0xff1fae09),
                    ),
                    child:
                        SvgPicture.asset(ImagePath.arrowNext, colorFilter: isDark ? const ColorFilter.mode(AppConfigs.g21, BlendMode.srcIn) : null)))
          ],
        )),
  );
}
