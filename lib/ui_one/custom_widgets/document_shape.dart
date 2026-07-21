import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/flavours/constants.dart';

Widget documentShape({
  bool isUpload = false,
  bool isEdit = false,
  String imagePath = '',
  String descrition = '',
  Function()? onTapUpload,
  Function()? onTapEdit,
}) {
  return Container(
    height: 98,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xfff0efef),
    ),
    child: DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: const Radius.circular(5),
        color: const Color(0xffd9d7d7),
        strokeWidth: 1,
      ),
      child: Container(
        width: 171,
        height: 98,
        color: const Color(0xfff0efef),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            alignment: Alignment.center,
            fit: StackFit.loose,
            children: [
              Visibility(
                visible: isEdit,
                child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: SvgPicture.asset(
                      imagePath,
                      height: 171,
                      width: 98,
                    )
// color: Colors.blue,
                    ),
              ),
              Visibility(
                visible: isUpload,
                child: Positioned(
                  top: 32,
                  bottom: 32,
                  child: GestureDetector(
                    onTap: onTapUpload,
                    child: Column(
                      children: [
                        Opacity(
                          opacity: 0.25999999046325684,
                          child: Text(descrition,
                              style: TextStyles.font10.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        SvgPicture.asset(
                          ImagePath.upload,
                          height: 16,
                          width: 16,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: isEdit,
                child: Positioned(
                  top: 32,
                  bottom: 32,
                  child: GestureDetector(
                    onTap: onTapEdit,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          ImagePath.edit,
                          height: 12,
                          width: 12,
                          colorFilter: const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn),
                        ),
                        const SizedBox(
                          width: 6.5,
                        ),
                        SvgPicture.asset(
                          ImagePath.delete,
                          height: 12,
                          width: 12,
                          colorFilter: const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
