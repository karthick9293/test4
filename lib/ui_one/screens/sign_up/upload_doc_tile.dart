import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/controllers/kyc_controller.dart';
import '../../../core/flavours/constants.dart';

Widget docTile(
  bool isDark, {
  bool? isFront,
  KYCType? type,
  String? path,
  String? base64Image,
  Uint8List? bytes,
  String? size,
  bool error = false,
  void Function()? onTap,
  required String side,
  void Function()? delete,
  bool noExpand = false,
}) {
  onTap ??= () => Get.find<KycController>().openDocSheet(type: type, isFront: isFront);

  if (Get.isRegistered<KycController>() != true) {
    Get.put(KycController());
  }
  Widget body = GestureDetector(
    onTap: onTap,
    child: Container(
      height: 98,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        color: isDark ? AppConfigs.g21 : const Color(0xfff0efef),
      ),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
          radius: const Radius.circular(8.0),
          strokeWidth: 1,
          color: error ? Colors.red : Color(0xffd9d7d7),
        ),
        child: Container(
          height: 98,
          decoration: BoxDecoration(
              color: isDark ? AppConfigs.g21 : const Color(0xfff0efef),
              image: path != null
                  ? DecorationImage(
                      image: FileImage(File(path)),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter)
                  : bytes != null
                      ? DecorationImage(
                          image: MemoryImage(bytes),
                          fit: BoxFit.cover,
                          alignment: Alignment.bottomCenter)
                      : base64Image != null && base64Image.isNotEmpty
                          ? DecorationImage(
                              image: MemoryImage(base64Decode(base64Image)),
                              fit: BoxFit.cover,
                              alignment: Alignment.bottomCenter)
                          : null),
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: path == null && (base64Image == null || base64Image.isEmpty) && bytes == null
                ? GestureDetector(
                    onTap: onTap,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(side,
                            style: TextStyles.font10
                                .copyWith(fontWeight: FontWeight.w600, color: isDark ? AppConfigs.g8f : const Color(0xff726f6f).withOpacity(0.26)),
                            textAlign: TextAlign.center),
                        const SizedBox(
                          width: 6,
                        ),
                        SvgPicture.asset(
                          ImagePath.upload,
                          colorFilter: ColorFilter.mode(isDark ? AppConfigs.g8f : AppConfigs.g4, BlendMode.srcIn),
                          height: 20,
                          width: 20,
                        )
                      ],
                    ),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: onTap,
                            child: SvgPicture.asset(
                              ImagePath.edit,
                              height: 20,
                              width: 20,
                              colorFilter: const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn),
                            ),
                          ),
                          const SizedBox(
                            width: 6.5,
                          ),
                          GestureDetector(
                            onTap: delete,
                            child: SvgPicture.asset(
                              ImagePath.delete,
                              height: 20,
                              width: 20,
                              colorFilter: const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn),
                            ),
                          )
                        ],
                      ),
                      Text(size ?? '',
                          style: TextStyles.font16.copyWith(
                            color: AppConfigs.w,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center)
                    ],
                  ),
          ),
        ),
      ),
    ),
  );

  return noExpand ? body : Expanded(child: body);
}
