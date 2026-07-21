import 'package:flutter/material.dart';
import 'package:mobiremit/models/advertiesments/advertiesment_fz.dart';
import 'package:mobiremit/network/api_service_new.dart';

import '../../core/exports/ui_seven_custom_widgets.dart';
import '../../core/flavours/app_config.dart';
import '../../others/box3.dart';

class AdvertisementBanner extends StatelessWidget {
  const AdvertisementBanner({super.key, required this.advertisement});

  final AdvertisementList advertisement;

  @override
  Widget build(BuildContext context) {
    if (advertisement.fileContent.isEmpty) {
      return Container(
        height: 210,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppConfigs.primaryColor.withAlpha(10),
            borderRadius: BorderRadius.circular(20)),
        child: Opacity(
          opacity: 0.2,
          child: Base64Image(
            image: Box3.companyLogo,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return GestureDetector(
        onTap: () async {
          debugPrint(advertisement.redirectUrl);
          if (advertisement.redirectUrl != "") {
            await ApiService().openUrl(advertisement.redirectUrl);
          }
        },
        child: Container(
          height: 210,
          width: double.infinity,
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Base64Image(
              image: advertisement.fileContent,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );
    }
  }
}
