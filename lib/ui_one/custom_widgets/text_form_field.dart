import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';
import '../../core/models/formatter.dart';
import '../../models/application_settings/settings_fz.dart';

Widget textFormField(
    {String? hintText,
    String? labelText,
    TextEditingController? controller,
    Widget? trailing,
    Widget? suffix,
    Widget? prefixIcon,
    double? top,
    double? left,
    double? right,
    double? bottom,
    double borderRadius = 5,
    bool noPad = false,
    bool disableBorder = false,
    double cHeight = 40,
    String errorText = '',
    TextInputType? keyboardType,
    void Function(String)? onChanged,
    String? Function(String?)? validator,
    void Function()? onEditingComplete,
    FocusNode? focusNode,
    void Function()? onTap,
    TextStyle? style,
    FocusNode? nextNode,
    int? maxLength,
    bool showCounter = true,
    int? maxLines,
    void Function(bool)? onFocusChange,
    TextAlign textAlign = TextAlign.start,
    List<TextInputFormatter>? inputFormatters,
    bool autofocus = false,
    String? prefixText,
    Color? filledColor,
    List<BoxShadow>? boxShadow,
    Key? key,
    TextInputAction? textInputAction,
    bool? enabled,
    bool obscure = false,
    String? obscuringCharacter,
    EdgeInsetsGeometry? contentPadding,
    TextCapitalization tC = TextCapitalization.none}) {
  // borderRadius = Box3.primaryTheme == AppTheme.theme1 ? 10 : borderRadius;
  cHeight = Box3.primaryUI == AppUI.uiOne ? 50 : cHeight;
  return GetBuilder<AccountController>(builder: (accountController) {
    if (inputFormatters != null && inputFormatters?.isNotEmpty == true) {
      inputFormatters!.add(CaseFormatting());
      inputFormatters!.add(emptySpaceFilter);
    } else {
      inputFormatters = [CaseFormatting(), emptySpaceFilter];
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      key: key,
      children: [
        if (Box3.primaryUI == AppUI.uiOne && labelText != null)
          Padding(
            padding: noPad ? EdgeInsets.zero : EdgeInsets.fromLTRB(left ?? S.p, 0, right ?? S.p, 0),
            child: Text(
              labelText ?? '',
              style: TS.f16.copyWith(
                  color: accountController.isDark
                      ? (errorText.isEmpty ? AppConfigs.g8f : AppConfigs.errorBorderDark)
                      : (errorText.isNotEmpty ? AppConfigs.der : AppConfigs.g77)),
            ),
          ),
        Container(
          height: cHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            color: filledColor ?? (accountController.isDark ? (errorText.isNotEmpty ? AppConfigs.errorFillDark : AppConfigs.g21) : filledColor),
            boxShadow: boxShadow,
          ),
          margin: noPad
              ? EdgeInsets.zero
              : EdgeInsets.fromLTRB(left ?? S.p, Box3.primaryUI == AppUI.defaultUI ? top ?? 10 : 5, right ?? S.p, bottom ?? 0),
          child: KeyboardActions(
            config: buildKeyboardConfig(focusNode),
            disableScroll: true,
            child: Row(
              children: [
                Expanded(
                  child: Focus(
                    onFocusChange: onFocusChange,
                    autofocus: autofocus,
                    child: TextFormField(
                      textCapitalization: tC,
                      onTap: onTap,
                      enabled: enabled,
                      controller: controller,
                      onChanged: onChanged,
                      focusNode: focusNode,
                      keyboardType: keyboardType,
                      maxLines: maxLines ?? (cHeight > 50 ? 30 : 1),
                      textAlign: textAlign,
                      textInputAction: textInputAction,
                      scrollPadding: const EdgeInsets.only(bottom: 150),
                      onEditingComplete: onEditingComplete ??
                          () {
                            FocusManager.instance.primaryFocus?.unfocus();
                            Get.focusScope?.unfocus();
                            if (nextNode != null) {
                              nextNode.requestFocus();
                            }
                          },
                      style: style ?? TS.f16.copyWith(color: accountController.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                      inputFormatters: inputFormatters,
                      decoration: InputDecoration(
                        counterText: '',
                        suffix: suffix,
                        suffixIcon: trailing,
                        prefixText: prefixText,
                        prefixStyle: TS.f16.copyWith(color: accountController.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                        prefixIcon: prefixIcon,
                        focusedBorder: disableBorder
                            ? InputBorder.none
                            : OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                                borderSide: BorderSide(
                                    color: errorText.isNotEmpty
                                        ? (accountController.isDark ? AppConfigs.errorBorderDark : AppConfigs.der)
                                        : AppConfigs.primaryColor)),
                        disabledBorder: disableBorder
                            ? InputBorder.none
                            : OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                                borderSide: BorderSide(
                                    color: errorText.isNotEmpty
                                        ? (accountController.isDark ? AppConfigs.errorBorderDark : AppConfigs.der)
                                        : accountController.isDark
                                            ? AppConfigs.g21
                                            : AppConfigs.gd7)),
                        enabledBorder: disableBorder
                            ? InputBorder.none
                            : OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
                                borderSide: BorderSide(
                                    color: errorText.isNotEmpty ? AppConfigs.der : (accountController.isDark ? AppConfigs.g21 : AppConfigs.gd7))),
                        contentPadding: contentPadding ?? EdgeInsets.fromLTRB(15, disableBorder ? 10 : 0, 15, disableBorder ? 13 : 20),
                        hintText: hintText,
                        labelText: Box3.primaryUI != AppUI.defaultUI ? null : labelText,
                        labelStyle: TS.f16.copyWith(
                            color: accountController.isDark
                                ? (errorText.isEmpty ? AppConfigs.g8f : AppConfigs.errorBorderDark)
                                : (errorText.isNotEmpty ? AppConfigs.der : AppConfigs.g77)),
                        hintStyle: TS.f16.copyWith(
                          color: accountController.isDark
                              ? (errorText.isEmpty ? AppConfigs.g8f : AppConfigs.errorBorderDark)
                              : (errorText.isNotEmpty ? AppConfigs.der : AppConfigs.g77),
                        ),
                      ),
                      obscureText: obscure,
                      maxLength: maxLength,
                      maxLengthEnforcement: maxLength != null ? MaxLengthEnforcement.enforced : null,
                      obscuringCharacter: obscuringCharacter ?? '●',
                      validator: validator,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        maxLength == null || !showCounter
            ? const SizedBox()
            : ValueListenableBuilder<TextEditingValue>(
                valueListenable: controller ?? TextEditingController(),
                builder: (context, value, child) {
                  return Container(
                    margin: EdgeInsets.only(right: S.p, top: 3, left: S.p),
                    alignment: Alignment.centerRight,
                    child: Text(
                      '${controller?.text.length}/$maxLength',
                      style: TS.f12.copyWith(color: accountController.isDark ? AppConfigs.gd7 : AppConfigs.g4),
                      textAlign: TextAlign.start,
                    ),
                  );
                },
              ),
        errorText.isEmpty || errorText.contains("don't show")
            ? const SizedBox()
            : Container(
                margin: EdgeInsets.only(right: S.p, top: 3, left: S.p),
                alignment: Alignment.centerRight,
                child:
                    Text(errorText, style: TS.f12.copyWith(color: const Color(0xfff92222), fontWeight: FontWeight.w600), textAlign: TextAlign.start),
              )
      ],
    );
  });
}

Widget errorText(String text, {Alignment alignment = Alignment.centerRight, double marginTop = 3, double marginBottom = 0}) {
  return Visibility(
    visible: text.isNotEmpty,
    child: Container(
      margin: EdgeInsets.only(right: S.p, top: 3, left: S.p, bottom: marginBottom),
      alignment: alignment,
      child: Text(text, style: TS.f12.copyWith(color: AppConfigs.der, fontWeight: FontWeight.w600), textAlign: TextAlign.start),
    ),
  );
}

// Widget textFormField(
//     {String? hintText,
//     String? labelText,
//     TextEditingController? controller,
//     Widget? trailing,
//     double? top,
//     double? left,
//     double? right,
//     double? bottom,
//     bool noPad = false,
//     double cHeight = 40,
//     String errorText = '',
//     void Function(String)? onChanged,
//     String? Function(String?)? validator,
//     void Function()? onEditingComplete,
//     FocusNode? focusNode,
//     bool? obscure}) {
//   return Column(
//     children: [
//       Container(
//         margin: noPad
//             ? EdgeInsets.zero
//             : EdgeInsets.fromLTRB(
//                 left ?? S.p, top ?? 10, right ?? S.p, bottom ?? 0),
//         decoration: BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(5)),
//           border: Border.all(
//               color: errorText.isNotEmpty
//                   ? ConstColors.errorRed
//                   : ConstColors.greyd7),
//         ),
//         height: cHeight,
//         child: Row(
//           children: [
//             Expanded(
//               child: TextFormField(
//                 controller: controller,
//                 onChanged: onChanged,
//                 focusNode: focusNode,
//                 maxLines: cHeight > 50 ? 30 : 1,
//                 onEditingComplete: onEditingComplete,
//                 decoration: InputDecoration(
//                     border: InputBorder.none,
//                     contentPadding: EdgeInsets.only(
//                         left: 10,
//                         top: cHeight > 50 ? 0 : 0,
//                         bottom: 10,
//                         right: 10),
//                     hintText: hintText,
//                     labelText: labelText,
//                     labelStyle: TextStyles.font14,
//                     hintStyle: TextStyles.font14),
//                 obscureText: obscure ?? false,
//                 validator: validator,
//               ),
//             ),
//             trailing ?? const SizedBox()
//           ],
//         ),
//       ),
//       errorText.isEmpty
//           ? const SizedBox()
//           : Container(
//               margin: EdgeInsets.only(right: S.p, top: 3, left: S.p),
//               alignment: Alignment.centerRight,
//               child: Text(errorText,
//                   style: TextStyles.font10.copyWith(
//                       color: const Color(0xffa20202),
//                       fontWeight: FontWeight.w600),
//                   textAlign: TextAlign.start),
//             )
//     ],
//   );
// }
