import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../core/exports/controllers.dart';
import '../../core/flavours/constants.dart';

Widget roundButton(String text,
    {Function()? onTap,
    Widget? child,
    bool borderOnly = false,
    bool noMar = false,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    Color? borderColor,
    Color? fillColor,
    Color? textColor,
    TextDecoration? textDecoration,
    Color? color,
    double fontSize = 16,
    bool isCancelButton = false,
    bool isLoading = false,
    Key? key}) {
  return Box3.settings.EnableSwipeButton == true
      ? Container(
          height: 55,
          margin: noMar ? EdgeInsets.zero : EdgeInsets.fromLTRB(left ?? S.p, top ?? 0, right ?? S.p, bottom ?? S.p),
          width: width,
          key: key,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200), border: Border.all(color: isCancelButton ? AppConfigs.primaryColor : Colors.transparent)),
          child: SwipeButton.expand(
            thumb: isLoading
                ? SizedBox()
                : Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 55,
                      height: 55,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        color: isCancelButton ? AppConfigs.primaryColor : AppConfigs.w,
                        shape: BoxShape.circle,
                      ),
                      child: WidgetAnimator(
                        atRestEffect: WidgetRestingEffects.wave(),
                        child: Icon(
                          Icons.double_arrow_rounded,
                          color: isCancelButton ? AppConfigs.w : AppConfigs.primaryColor,
                        ),
                      ),
                    ),
                  ),
            activeThumbColor: isLoading ? Colors.transparent : AppConfigs.swipeYesColor,
            activeTrackColor: isLoading
                ? AppConfigs.primaryColor.withOpacity(0.4)
                : isCancelButton
                    ? AppConfigs.w
                    : AppConfigs.primaryColor,
            inactiveTrackColor: AppConfigs.swipeYesColor,
            onSwipeEnd: isLoading ? null : onTap ?? Get.back,
            child: isLoading
                ? loaderIcon(width: 45)
                : Padding(
                    padding: EdgeInsets.only(left: text.length >= 9 ? 25.0 : 0),
                    child: child ??
                        Text(
                          text,
                          style: TS.f16.copyWith(
                              color: textColor ?? (isCancelButton ? AppConfigs.primaryColor : AppConfigs.w),
                              fontSize: fontSize,
                              decoration: textDecoration),
                        ),
                  ),
          ),
        )
      : GestureDetector(
          key: key,
          onTap: isLoading ? null : onTap ?? Get.back,
          child: Container(
            margin: noMar ? EdgeInsets.zero : EdgeInsets.fromLTRB(left ?? S.p, top ?? 0, right ?? S.p, bottom ?? S.p),
            height: height ?? S.h,
            width: width,
            decoration: BoxDecoration(
              color: isLoading
                  ? AppConfigs.primaryColor.withOpacity(0.4)
                  : fillColor ?? (borderOnly ? Colors.transparent : (color ?? ConstColors.primary)),
              borderRadius: BorderRadius.all(Radius.circular(height != null ? (height / 2) : 28)),
              border: Border.all(
                color: isLoading ? AppConfigs.primaryColor.withOpacity(0) : borderColor ?? ConstColors.primary,
              ),
            ),
            alignment: Alignment.center,
            child: isLoading
                ? loaderIcon()
                : child ??
                    Text(
                      text,
                      style: TS.f16.copyWith(
                          color: textColor ?? (borderOnly == true ? ConstColors.primary : ConstColors.buttonTextColor),
                          fontSize: fontSize,
                          decoration: textDecoration),
                    ),
          ),
        );
}

Widget loaderIcon({double width = 35}) => SizedBox(
      height: width,
      width: width,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Platform.isIOS
            ? CupertinoActivityIndicator(
                color: AppConfigs.primaryColor,
              )
            : CircularProgressIndicator(
                strokeWidth: 2,
                color: AppConfigs.primaryColor,
              ),
      ),
    );

Widget roundButtonCancel(String text,
    {Function()? onTap,
    bool borderOnly = false,
    bool noMar = false,
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? width,
    double? height,
    Color? borderColor,
    Color? fillColor,
    Color? textColor,
    TextDecoration? textDecoration,
    Color? color,
    double fontSize = 16,
    Key? key}) {
  return Box3.settings.EnableSwipeButton == true
      ? Container(
          margin: noMar ? EdgeInsets.zero : EdgeInsets.fromLTRB(left ?? S.p, top ?? 0, right ?? S.p, bottom ?? S.p),
          width: width,
          key: key,
          alignment: Alignment.center,
          child: SwipeButton.expand(
            thumb: Container(
              margin: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                color: AppConfigs.w,
                shape: BoxShape.circle,
              ),
              child: WidgetAnimator(
                atRestEffect: WidgetRestingEffects.wave(),
                child: Icon(
                  Icons.double_arrow_rounded,
                  color: AppConfigs.primaryColor,
                ),
              ),
            ),
            activeThumbColor: AppConfigs.swipeYesColor,
            activeTrackColor: AppConfigs.swipeYesColor,
            inactiveTrackColor: AppConfigs.swipeYesColor,
            onSwipeEnd: onTap ?? Get.back,
            child: Text(
              text,
              style: TS.f16.copyWith(
                  color: textColor ?? (borderOnly == true ? ConstColors.primary : ConstColors.buttonTextColor),
                  fontSize: fontSize,
                  decoration: textDecoration),
            ),
          ),
        )
      : GestureDetector(
          key: key,
          onTap: onTap ?? Get.back,
          child: Container(
            margin: noMar ? EdgeInsets.zero : EdgeInsets.fromLTRB(left ?? S.p, top ?? 0, right ?? S.p, bottom ?? S.p),
            height: height ?? S.h,
            width: width,
            decoration: BoxDecoration(
                color: fillColor ?? (borderOnly ? Colors.transparent : (color ?? ConstColors.primary)),
                borderRadius: BorderRadius.all(Radius.circular(height != null ? (height / 2) : 28)),
                border: Border.all(color: borderColor ?? ConstColors.primary, width: 2)),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TS.f16.copyWith(
                  color: textColor ?? (borderOnly == true ? ConstColors.primary : ConstColors.buttonTextColor),
                  fontSize: fontSize,
                  decoration: textDecoration),
            ),
          ),
        );
}

class UAEButton extends StatelessWidget {
  final void Function()? onTap;
  final double left, top, right, bottom;
  final String text;
  final bool isLoading;

  const UAEButton(this.text, {super.key, this.onTap, this.left = 0, this.top = 0, this.right = 0, this.bottom = 0, this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      return Visibility(
        visible: (Box3.settings.processEkycAs).split(',').contains('UAEPASS'),
        child: Padding(
          padding: EdgeInsets.fromLTRB(left, top, right, bottom),
          child: GestureDetector(
            onTap: isLoading ? null : onTap,
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: isLoading ? AppConfigs.primaryColor.withOpacity(0.4) : AppConfigs.g70),
                color: isLoading
                    ? AppConfigs.primaryColor.withOpacity(0.4)
                    : accountController.isDark
                        ? AppConfigs.primaryColor
                        : AppConfigs.w,
              ),
              child: isLoading
                  ? loaderIcon()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(SvgIcons.uaeSvg),
                        Text(
                          text,
                          style: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.b),
                        )
                      ],
                    ),
            ),
          ),
        ),
      );
    });
  }
}

class HyperLinkButton extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  final EdgeInsetsGeometry? padding;

  const HyperLinkButton(this.text, {super.key, this.onTap, this.padding});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
        child: Text(
          text,
          style: TS.f14.copyWith(
              color: AppConfigs.primaryColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
              decorationColor: AppConfigs.primaryColor,
              decorationThickness: 2),
        ),
      ),
    );
  }
}
