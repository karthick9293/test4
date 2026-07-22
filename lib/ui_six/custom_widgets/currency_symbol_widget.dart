import 'package:flutter/material.dart';

import '../../core/flavours/constants.dart';

class CurrencySymbolWithAmount extends StatelessWidget {
  final String currencyCode;
  final String amount;
  final String? label;
  final Color? color;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final MainAxisSize? mainAxisSize;
  final double? currencyHeight;
  final double? currencyWidth;
  final bool? showCurrency;

  const CurrencySymbolWithAmount(
      {super.key,
      required this.currencyCode,
      required this.amount,
      this.color,
      this.textStyle,
      this.textAlign,
      this.mainAxisAlignment,
      this.currencyHeight,
      this.currencyWidth,
      this.crossAxisAlignment,
      this.mainAxisSize, this.label,this.showCurrency});

  @override
  Widget build(BuildContext context) {
    return showCurrency==false?Text(
      amount,
      style: textStyle,
      textAlign: textAlign ?? TextAlign.end,
    ):Box3.settings.requiredCurrencySymbol == true && currencyCode.isNotEmpty
        ? Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
            mainAxisSize: mainAxisSize ?? MainAxisSize.min,
            crossAxisAlignment: crossAxisAlignment ?? CrossAxisAlignment.center,
            children: [
              if(label!=null)...[
                Text(
                  label??'',
                  style: textStyle,
                ),
                SizedBox(width: 1.5),
              ],
              currencySymbolImage(
                currencyCode,
                color: color,
                textStyle: textStyle,
                currencyWidth: currencyWidth ?? 10,
                currencyHeight: currencyHeight,
              ),
              SizedBox(width: 1.5),
              Text(
                amount,
                style: textStyle,
              ),
            ],
          )
        : Text(
            '$amount $currencyCode',
            style: textStyle,
            textAlign: textAlign ?? TextAlign.end,
          );
  }
}
