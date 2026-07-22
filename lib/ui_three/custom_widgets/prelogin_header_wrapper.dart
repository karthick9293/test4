import 'package:flutter/material.dart';
import '../../core/flavours/constants.dart';
import 'package:mobiremit/ui_common/base64_to_image.dart';

class PreloginHeaderWrapper extends StatelessWidget {
  final Widget child;
  final bool isPrelogin;

  const PreloginHeaderWrapper({
    super.key,
    required this.child,
    this.isPrelogin = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!isPrelogin) {
      return child;
    }
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          height: 140,
          width: double.infinity,
          child: cms(Fields.Dashboard_HeaderBgImage).image != ""
              ? Base64Image(
                  image: cms(Fields.Dashboard_HeaderBgImage).image ?? "",
                  fit: BoxFit.fitHeight,
                  errorWidget: SizedBox(),
                )
              : SizedBox(),
        ),
        child,
      ],
    );
  }
}
