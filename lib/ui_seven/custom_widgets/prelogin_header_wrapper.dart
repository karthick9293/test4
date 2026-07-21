import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/flavours/constants.dart';

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
          child: SvgPicture.asset(
            ImagePath.globalHeaderBg,
            fit: BoxFit.fitHeight,
          ),
        ),
        child,
      ],
    );
  }
}
