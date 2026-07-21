import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobiremit/models/transaction_details/transaction_details_fz.dart';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../../flavors.dart';
import '../color_constant.dart';
import '../flavours/constants.dart';
import '../models/formatter.dart';

class PdfTemplate3 {
  TransactionDetailsFz transactionDetailsFz;
  String email;
  String mobile;
  String? serviceProvider;

  PdfTemplate3(this.transactionDetailsFz,
      {required this.email,
      required this.mobile,
      required this.serviceProvider});

  final Map<String, pw.MemoryImage> _currencyImageCache = {};
  bool _imagesLoaded = false;
  pw.Font? _pdfFont;

  // Call this BEFORE printReceiptInPDF()
  Future<void> initialize() async {
    if (_imagesLoaded && _pdfFont != null) return;

    if (Box3.settings.requiredCurrencySymbol == true &&
        Box3.currencySymbol != null) {
      //  compute to decode in isolate
      _currencyImageCache
          .addAll(await compute(_decodeCurrencyImages, Box3.currencySymbol!));
    }

    if (_pdfFont == null) {
      try {
        final fontData = await rootBundle
            .load('assets/fonts/nunito-sans/NunitoSans-Regular.ttf');
        _pdfFont = pw.Font.ttf(fontData);
      } catch (e) {
        debugPrint('Error loading PDF font: $e');
      }
    }

    _imagesLoaded = true;
  }

  static Map<String, pw.MemoryImage> _decodeCurrencyImages(
      List<dynamic> currencies) {
    final Map<String, pw.MemoryImage> cache = {};

    for (var cur in currencies) {
      if (cur.currencyCode != null && cur.base64String != null) {
        try {
          final String rawBase64 = cur.base64String!;
          final Uint8List imageBytes = base64Decode(rawBase64.split(',').last);

          // Skip caching SVG images as pw.MemoryImage since Svg requires pw.SvgImage
          if (rawBase64.contains('svg') ||
              utf8.decode(imageBytes, allowMalformed: true).contains('<svg')) {
            continue;
          }

          cache[cur.currencyCode!] = pw.MemoryImage(imageBytes);
        } catch (e) {
          debugPrint(
              'Error decoding currency image for ${cur.currencyCode}: $e');
        }
      }
    }

    return cache;
  }

  @visibleForTesting
  pw.Widget newRowForKeyValue(
      {String? key,
      String? value,
      required PdfColor keyColor,
      required PdfColor valueColor,
      pw.FontWeight? keyFWeight,
      pw.FontWeight? valueFWeight,
      double? fontSize,
      pw.Widget? currencySymbol}) {
    if (key == "Date and Time of Transaction") {
      logger.i(value);
    }
    return (serviceProvider != null && key == 'Service Provider'
            ? value != null
            : true)
        ? pw.Container(
            height: 15,
            width: double.infinity,
            child: pw.Row(children: [
              pw.Expanded(
                child: pw.Text("$key : ",
                    textAlign: pw.TextAlign.start,
                    maxLines: 1,
                    style: pw.TextStyle(
                      fontSize: fontSize ?? 10,
                      color: keyColor,
                      fontWeight: keyFWeight ?? pw.FontWeight.normal,
                    ),
                    overflow: pw.TextOverflow.clip),
              ),
              pw.Expanded(
                  child: pw.Row(
                      mainAxisSize: pw.MainAxisSize.min,
                      mainAxisAlignment: pw.MainAxisAlignment.end,
                      children: [
                    if (currencySymbol != null) currencySymbol,
                    pw.SizedBox(width: 2.5),
                    pw.Text(value.toString(),
                        maxLines: 1,
                        textAlign: pw.TextAlign.end,
                        style: pw.TextStyle(
                          fontSize: fontSize ?? 10,
                          color: valueColor,
                          fontWeight: valueFWeight ?? pw.FontWeight.normal,
                        ),
                        overflow: pw.TextOverflow.clip),
                  ])),
            ]),
          )
        : pw.Container();
  }

  @visibleForTesting
  pw.Widget newRowWithAmount(
      {String? key,
      String? amount,
      String? currencyCode,
      required PdfColor keyColor,
      required PdfColor valueColor,
      pw.FontWeight? keyFWeight,
      pw.FontWeight? valueFWeight,
      double? fontSize}) {
    return (serviceProvider != null && key == 'Service Provider'
            ? amount != null
            : true)
        ? pw.Container(
            height: 15,
            width: double.infinity,
            child: pw.Row(children: [
              pw.Expanded(
                child: pw.Text("$key : ",
                    textAlign: pw.TextAlign.start,
                    maxLines: 1,
                    style: pw.TextStyle(
                      fontSize: fontSize ?? 10,
                      color: keyColor,
                      fontWeight: keyFWeight ?? pw.FontWeight.normal,
                    ),
                    overflow: pw.TextOverflow.clip),
              ),
              pw.Expanded(
                  child: pwCurrencySymbolWithAmount(
                      currencyCode: currencyCode!,
                      amount: amount!,
                      valueColor: valueColor,
                      valueFWeight: valueFWeight)),
            ]),
          )
        : pw.Container();
  }

  @visibleForTesting
  pw.Widget rateHeading({
    String? key,
    String? value1,
    String? value2,
    required PdfColor keyColor,
    required PdfColor valueColor,
    pw.FontWeight? keyFWeight,
    pw.FontWeight? valueFWeight,
    double? fontSize,
    String? currencySymbol1,
    String? currencySymbol2,
  }) {
    return pw.Container(
      height: 15,
      width: double.infinity,
      child: pw.Row(children: [
        pw.Expanded(
          child: pw.Text("$key : ",
              textAlign: pw.TextAlign.start,
              maxLines: 1,
              style: pw.TextStyle(
                fontSize: fontSize ?? 10,
                color: keyColor,
                fontWeight: keyFWeight ?? pw.FontWeight.normal,
              ),
              overflow: pw.TextOverflow.clip),
        ),
        pw.Expanded(
            child: pw.Row(
                mainAxisSize: pw.MainAxisSize.min,
                mainAxisAlignment: pw.MainAxisAlignment.end,
                children: [
              pwCurrencySymbolWithAmount(
                  amount: value1!,
                  currencyCode: currencySymbol1!,
                  valueFWeight: valueFWeight,
                  valueColor: valueColor),
              pw.Text(" = ",
                  style: pw.TextStyle(
                    fontSize: fontSize ?? 10,
                    color: valueColor,
                    fontWeight: valueFWeight ?? pw.FontWeight.normal,
                  ),
                  overflow: pw.TextOverflow.clip),
              pwCurrencySymbolWithAmount(
                  amount: value2!,
                  currencyCode: currencySymbol2!,
                  valueFWeight: valueFWeight,
                  valueColor: valueColor),
            ])),
      ]),
    );
  }

  @visibleForTesting
  pw.Widget pwCurrencySymbol(
    String currencyCode, {
    pw.PdfColor? valueColor,
    pw.FontWeight? valueFWeight,
    double? fontSize,
  }) {
    if (Box3.settings.requiredCurrencySymbol == false) {
      return _buildTextSymbol(currencyCode, valueColor, valueFWeight, fontSize);
    }

    // Use cached image if available (standard raster images like PNG/JPG)
    if (_currencyImageCache.containsKey(currencyCode)) {
      return pw.SizedBox(
          width: 9,
          height: 7,
          child: pw.Image(_currencyImageCache[currencyCode]!,
              fit: pw.BoxFit.fitHeight));
    }

    var cur = Box3.currencySymbol
        ?.where((e) => e.currencyCode == currencyCode)
        .firstOrNull;

    // Check if the currency image base64 is an SVG and render it as SvgImage
    if (cur != null && cur.base64String != null) {
      try {
        final String rawBase64 = cur.base64String!;
        final Uint8List imageBytes = base64Decode(rawBase64.split(',').last);
        if (rawBase64.contains('svg') ||
            utf8.decode(imageBytes, allowMalformed: true).contains('<svg')) {
          final String svgString = utf8.decode(imageBytes);
          if (svgString.contains('<text') || svgString.contains('<tspan')) {
            debugPrint(
                'Skipping SVG currency symbol with embedded text to avoid Unicode/font rendering issues.');
            return _buildTextSymbol(cur.currencyImage ?? currencyCode,
                valueColor, valueFWeight, fontSize);
          }
          try {
            return pw.SizedBox(
              width: 9,
              height: 7,
              child: pw.SvgImage(svg: svgString, fit: pw.BoxFit.fitHeight),
            );
          } catch (svgError) {
            debugPrint(
                'Error rendering SVG currency symbol for $currencyCode: $svgError');
            return _buildTextSymbol(cur.currencyImage ?? currencyCode,
                valueColor, valueFWeight, fontSize);
          }
        }
      } catch (e) {
        debugPrint('Error rendering SVG currency symbol for $currencyCode: $e');
      }
    }

    // Fallback to text symbol
    if (cur != null && cur.currencyImage != null) {
      return _buildTextSymbol(
          cur.currencyImage!, valueColor, valueFWeight, fontSize);
    }

    return _buildTextSymbol(currencyCode, valueColor, valueFWeight, fontSize);
  }

  @visibleForTesting
  pw.Widget pwCurrencySymbolWithAmount({
    required String currencyCode,
    required String amount,
    pw.PdfColor? valueColor,
    pw.FontWeight? valueFWeight,
    double? fontSize,
  }) {
    return Box3.settings.requiredCurrencySymbol == false
        ? pw.Text('$amount $currencyCode',
            maxLines: 1,
            textAlign: pw.TextAlign.end,
            style: pw.TextStyle(
              fontSize: fontSize ?? 10,
              color: valueColor,
              fontWeight: valueFWeight ?? pw.FontWeight.normal,
            ),
            overflow: pw.TextOverflow.clip)
        : pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.end,
            mainAxisSize: pw.MainAxisSize.min,
            children: [
                pwCurrencySymbol(currencyCode,
                    valueColor: valueColor, valueFWeight: valueFWeight),
                pw.SizedBox(width: 2.5),
                pw.Text(amount,
                    maxLines: 1,
                    textAlign: pw.TextAlign.end,
                    style: pw.TextStyle(
                      fontSize: fontSize ?? 10,
                      color: valueColor,
                      fontWeight: valueFWeight ?? pw.FontWeight.normal,
                    ),
                    overflow: pw.TextOverflow.clip)
              ]);
  }

  pw.Widget _buildTextSymbol(String text, pw.PdfColor? valueColor,
      pw.FontWeight? valueFWeight, double? fontSize) {
    return pw.Text(text,
        maxLines: 1,
        textAlign: pw.TextAlign.end,
        style: pw.TextStyle(
          fontSize: fontSize ?? 10,
          color: valueColor,
          fontWeight: valueFWeight ?? pw.FontWeight.normal,
        ),
        overflow: pw.TextOverflow.clip);
  }

  // @visibleForTesting
  // pw.Widget pwCurrencySymbol(
  //   String currencyCode, {
  //   required PdfColor valueColor,
  //   pw.FontWeight? valueFWeight,
  //   double? fontSize,
  // }) {
  //   if (Box3.settings.requiredCurrencySymbol == true) {
  //     var base64Image =
  //         Box3.companyDataFZ?.companySettings?.primaryBaseCurrency;
  //     var cur = Box3.currencySymbol
  //         ?.where((e) => e.currencyCode == currencyCode)
  //         .first;
  //     if (cur != null) {
  //       if (cur.base64String != null) {
  //         base64Image = cur.base64String;
  //         final Uint8List imageBytes =
  //             base64Decode(base64Image!.split(',').last);
  //         final image = pw.MemoryImage(imageBytes);
  //         return pw.SizedBox(
  //             width: 9,
  //             height: 7,
  //             child: pw.Image(
  //               image,
  //               fit: pw.BoxFit.fitHeight,
  //             ));
  //       } else {
  //         return pw.Text(cur.currencyImage.toString(),
  //             maxLines: 1,
  //             textAlign: pw.TextAlign.end,
  //             style: pw.TextStyle(
  //               fontSize: fontSize ?? 10,
  //               color: valueColor,
  //               fontWeight: valueFWeight ?? pw.FontWeight.normal,
  //             ),
  //             overflow: pw.TextOverflow.clip);
  //       }
  //     } else {
  //       return pw.Text(currencyCode.toString(),
  //           maxLines: 1,
  //           textAlign: pw.TextAlign.end,
  //           style: pw.TextStyle(
  //             fontSize: fontSize ?? 10,
  //             color: valueColor,
  //             fontWeight: valueFWeight ?? pw.FontWeight.normal,
  //           ),
  //           overflow: pw.TextOverflow.clip);
  //     }
  //   }
  //   return pw.Text(currencyCode.toString(),
  //       maxLines: 1,
  //       textAlign: pw.TextAlign.end,
  //       style: pw.TextStyle(
  //         fontSize: fontSize ?? 10,
  //         color: valueColor,
  //         fontWeight: valueFWeight ?? pw.FontWeight.normal,
  //       ),
  //       overflow: pw.TextOverflow.clip);
  // }

  @visibleForTesting
  pw.Widget newRowForKeyValue2({
    String? key,
    String? value,
    required PdfColor keyColor,
    required PdfColor valueColor,
    pw.FontWeight? keyFWeight,
    pw.FontWeight? valueFWeight,
    double? fontSize,
  }) {
    if (key == "Date and Time of Transaction") {
      logger.i(value);
    }
    return pw.Container(
      width: double.infinity,
      child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Expanded(
          child: pw.Text("$key : ",
              textAlign: pw.TextAlign.start,
              style: pw.TextStyle(
                fontSize: fontSize ?? 10,
                color: keyColor,
                fontWeight: keyFWeight ?? pw.FontWeight.normal,
              ),
              overflow: pw.TextOverflow.clip),
        ),
        pw.SizedBox(width: 5),
        pw.Expanded(
          child: pw.Text(value.toString(),
              textAlign: pw.TextAlign.end,
              style: pw.TextStyle(
                fontSize: fontSize ?? 10,
                color: valueColor,
                fontWeight: valueFWeight ?? pw.FontWeight.normal,
              ),
              overflow: pw.TextOverflow.clip),
        ),
      ]),
    );
  }

  @visibleForTesting
  pw.Widget newRowForKeyValueCenter(
      {String? key,
      String? value,
      String? textColorKey,
      String? textColorValue}) {
    return pw.Container(
      height: 20,
      width: double.infinity,
      child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text("$key : ",
                textAlign: pw.TextAlign.start,
                maxLines: 1,
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColor.fromHex("FFFFFF"),
                  fontWeight: pw.FontWeight.bold,
                ),
                overflow: pw.TextOverflow.clip),
            pw.Text(value.toString(),
                maxLines: 1,
                textAlign: pw.TextAlign.end,
                style: pw.TextStyle(
                  fontSize: 10,
                  color: PdfColor.fromHex("FFFFFF"),
                  fontWeight: pw.FontWeight.bold,
                ),
                overflow: pw.TextOverflow.clip),
          ]),
    );
  }

  @visibleForTesting
  Future<Widget> getBoldText(String data, {Color color = Colors.black}) async {
    return Text(
      data,
      textAlign: TextAlign.end,
      style: TextStyle(
        fontSize: 13,
        color: color,
      ),
    );
  }

  Future<pw.MemoryImage> getHeaderPath(String path) async {
    return pw.MemoryImage(
      (await rootBundle.load(path)).buffer.asUint8List(),
    );
  }

  Future<pw.Document> printReceiptInPDF() async {
    await initialize();

    PdfColor textColor = PdfColor(
      BlackAndRed.textColorBlack.r,
      BlackAndRed.textColorBlack.g,
      BlackAndRed.textColorBlack.b,
      BlackAndRed.textColorBlack.a,
    );
    PdfColor primaryColor = PdfColor(
      AppConfigs.primaryColor.r,
      AppConfigs.primaryColor.g,
      AppConfigs.primaryColor.b,
      AppConfigs.primaryColor.a,
    );

    Map<int, String> months = {
      1: 'Jan',
      2: 'Feb',
      3: 'March',
      4: 'April',
      5: 'May',
      6: 'June',
      7: 'July',
      8: 'Aug',
      9: 'Sept',
      10: 'Oct',
      11: 'Nov',
      12: 'Dec'
    };

    pw.Widget buildLogo(String? logoStr,
        {double? width, double? height, pw.BoxFit fit = pw.BoxFit.contain}) {
      if (logoStr == null || logoStr.isEmpty) return pw.SizedBox();
      try {
        final String base64Str = logoStr.split(',').last;
        final Uint8List bytes = base64Decode(base64Str);

        // Detect if it's an SVG
        if (logoStr.contains('svg') ||
            utf8.decode(bytes, allowMalformed: true).contains('<svg')) {
          final String svgString = utf8.decode(bytes);
          if (svgString.contains('<text') || svgString.contains('<tspan')) {
            debugPrint(
                'Skipping SVG logo with text content to avoid PDF font rendering issues.');
            return pw.SizedBox();
          }
          try {
            return pw.SizedBox(
              width: width,
              height: height,
              child: pw.SvgImage(svg: svgString, fit: fit),
            );
          } catch (svgError) {
            debugPrint(
                'Error rendering SVG logo (Unicode/font issue): $svgError');
            debugPrint('Skipping logo due to rendering error');
            return pw.SizedBox();
          }
        }

        // Standard Raster Image (PNG/JPG)
        return pw.SizedBox(
          width: width,
          height: height,
          child: pw.Image(pw.MemoryImage(bytes), fit: fit),
        );
      } catch (e) {
        debugPrint('Error building logo: $e');
        return pw.SizedBox();
      }
    }

    var baseCurrency = Box3.companyDataFZ!.companySettings!.primaryBaseCurrency;
    var fromCurrency = transactionDetailsFz.fromCurrencyCode ??
        Box3.companyDataFZ!.companySettings!.crossCurrency;

    bool isPrimary =
        (cms(Fields.AppMainLogo_ReceiptHeaderLogoPrimary).image != null &&
            cms(Fields.AppMainLogo_ReceiptHeaderLogoPrimary).image!.isNotEmpty);
    bool isSecondary =
        (cms(Fields.AppMainLogo_ReceiptHeaderLogoSecondary).image != null &&
            cms(Fields.AppMainLogo_ReceiptHeaderLogoSecondary)
                .image!
                .isNotEmpty);

    final String? primaryLogoStr = isPrimary
        ? cms(Fields.AppMainLogo_ReceiptHeaderLogoPrimary).image
        : Box3.companyDataFZ?.companySettings?.companyLogo;

    final String? secondaryLogoStr = isSecondary
        ? cms(Fields.AppMainLogo_ReceiptHeaderLogoSecondary).image
        : Box3.companyDataFZ?.companySettings?.companyLogo;

    final String? mainLogoStr =
        (cms(Fields.AppMainLogo_MainLogo).image != null &&
                cms(Fields.AppMainLogo_MainLogo).image!.isNotEmpty)
            ? cms(Fields.AppMainLogo_MainLogo).image
            : Box3.companyDataFZ?.companySettings?.companyLogo;

    final pw.Font baseFont = _pdfFont ?? pw.Font.helvetica();
    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: baseFont,
        bold: baseFont,
        italic: baseFont,
        boldItalic: baseFont,
      ),
    );

    pw.Alignment getImageAlign() {
      String? align = (Box3.settings.receiptHeaderAlignment).toLowerCase();
      if (align == "center") {
        return pw.Alignment.center;
      } else if (align == "left") {
        return pw.Alignment.centerLeft;
      } else if (align == "right") {
        return pw.Alignment.centerRight;
      }
      return pw.Alignment.center;
    }

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return pw.Container(
              width: double.infinity,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.center,
                mainAxisAlignment: pw.MainAxisAlignment.start,
                children: [
                  F.appFlavor == Flavor.lmpay
                      ? pw.Row(children: [
                          if (isPrimary)
                            buildLogo(primaryLogoStr,
                                width: 100.0,
                                height: 100.0,
                                fit: pw.BoxFit.fitWidth),
                          if (isSecondary)
                            buildLogo(secondaryLogoStr,
                                width: 100.0,
                                height: 100.0,
                                fit: pw.BoxFit.fitWidth),
                          if (isPrimary == false && isSecondary == false)
                            buildLogo(mainLogoStr,
                                width: 100.0,
                                height: 100.0,
                                fit: pw.BoxFit.fitWidth),
                          pw.SizedBox(width: 10),
                          pw.Expanded(
                            child: pw.Column(
                              children: [
                                pw.Text(
                                  "Electronic Tax Invoice",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                    fontSize: 14,
                                    fontWeight: pw.FontWeight.bold,
                                  ),
                                ),
                                pw.SizedBox(height: 5),
                                pw.Text(
                                  "${Box3.companyDataFZ?.companySettings?.blockNumber}, ${Box3.companyDataFZ?.companySettings?.buildingNumber}, ${Box3.companyDataFZ?.companySettings?.streetName}, ${Box3.companyDataFZ?.companySettings?.country}",
                                  textAlign: pw.TextAlign.center,
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                                pw.Text(
                                  "Phone | ${Box3.companyDataFZ?.companySettings?.phoneNumber} Email | ${Box3.companyDataFZ?.companySettings?.emailId}",
                                  textAlign: pw.TextAlign.center,
                                  style: const pw.TextStyle(fontSize: 8),
                                ),
                              ],
                            ),
                          ),
                          pw.SizedBox(width: 10),
                          pw.Expanded(
                            child: pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                newRowForKeyValue2(
                                    key: "Date & Time",
                                    value:
                                        "${transactionDetailsFz.transactionDate}",
                                    fontSize: 8,
                                    keyColor: textColor,
                                    valueColor: textColor),
                                newRowForKeyValue2(
                                    key: "TRN",
                                    value:
                                        "${transactionDetailsFz.paymentRefNo}",
                                    fontSize: 8,
                                    keyColor: textColor,
                                    valueColor: textColor),
                                newRowForKeyValue2(
                                    key: "Ref no",
                                    value:
                                        "${transactionDetailsFz.transactionReference}",
                                    fontSize: 8,
                                    keyColor: textColor,
                                    valueColor: textColor),
                                // newRowForKeyValue2(
                                //     key: "Mobile Transaction No.",
                                //     value:
                                //         "${transactionDetailsFz.transactionReference}",
                                //     fontSize: 8,
                                //     keyColor: textColor,
                                //     valueColor: textColor),
                                newRowForKeyValue2(
                                    key: "PRODUCT",
                                    value: "OUTWARD REMITTANCE",
                                    fontSize: 8,
                                    keyColor: textColor,
                                    valueColor: textColor,
                                    keyFWeight: pw.FontWeight.bold,
                                    valueFWeight: pw.FontWeight.bold),
                                if (transactionDetailsFz.serviceType != "B")
                                  newRowForKeyValue2(
                                      key: "Service Provider",
                                      value: serviceProvider,
                                      fontSize: 8,
                                      keyColor: textColor,
                                      valueColor: textColor),
                                newRowForKeyValue2(
                                    key: "Status",
                                    value:
                                        "${transactionDetailsFz.transactionStatus}",
                                    fontSize: 8,
                                    keyColor: textColor,
                                    valueColor: textColor),
                                if (transactionDetailsFz.paymentRefNo != null &&
                                    transactionDetailsFz
                                        .paymentRefNo!.isNotEmpty)
                                  newRowForKeyValue2(
                                      key: "Sender Reference",
                                      value:
                                          "${transactionDetailsFz.paymentRefNo}",
                                      fontSize: 8,
                                      keyColor: textColor,
                                      valueColor: textColor),
                              ],
                            ),
                          )
                        ])
                      : pw.Container(
                          width: double.infinity,
                          height: 60.0,
                          child: pw.Align(
                            alignment: getImageAlign(),
                            child: buildLogo(
                                isPrimary
                                    ? primaryLogoStr
                                    : isSecondary
                                        ? secondaryLogoStr
                                        : mainLogoStr,
                                fit: pw.BoxFit.fitHeight),
                          ),
                        ),
                  F.appFlavor == Flavor.lmpay
                      ? pw.SizedBox()
                      : pw.Container(
                          padding: const pw.EdgeInsets.all(5),
                          width: double.infinity,
                          constraints: const pw.BoxConstraints(
                              maxWidth: double.infinity,
                              minWidth: double.infinity),
                          color: primaryColor,
                          child: pw.Center(
                            child: pw.Column(
                              mainAxisAlignment: pw.MainAxisAlignment.center,
                              children: [
                                pw.Text(
                                  "Thanks for using ${APIConstants.clientName} Mobile App.",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                    fontSize: 11,
                                    color: PdfColor.fromHex("FFFFFF"),
                                    fontWeight: pw.FontWeight.normal,
                                  ),
                                ),
                                pw.SizedBox(height: 2),
                                pw.Text(
                                  "Your transaction has been successfully processed.",
                                  textAlign: pw.TextAlign.center,
                                  style: pw.TextStyle(
                                    fontSize: 13,
                                    color: PdfColor.fromHex("FFFFFF"),
                                    fontWeight: pw.FontWeight.normal,
                                  ),
                                ),
                                // pw.SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(6),
                    decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(color: PdfColor.fromHex("cccecf"))),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "CUSTOMER DETAILS",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                              fontSize: 11,
                              color: textColor,
                              fontWeight: pw.FontWeight.bold,
                            ),
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Remitter",
                            value: [
                              transactionDetailsFz.custFirstName?.trim(),
                              transactionDetailsFz.custMiddleName?.trim(),
                              transactionDetailsFz.custLastName?.trim()
                            ]
                                .where(
                                    (name) => name != null && name.isNotEmpty)
                                .join(' '),
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Customer Code",
                            value: transactionDetailsFz.customerCode ?? '',
                          ),
                          // (transactionDetailsFz.idType != null &&
                          //         transactionDetailsFz.idType?.isNotEmpty ==
                          //             true)
                          //     ? newRowForKeyValue(
                          //         keyColor: textColor,
                          //         valueColor: textColor,
                          //         key: "ID Type",
                          //         value: transactionDetailsFz.idType ?? '',
                          //       )
                          //     : pw.SizedBox(),
                          (transactionDetailsFz.idDescription != null &&
                                  transactionDetailsFz
                                          .idDescription?.isNotEmpty ==
                                      true)
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "ID Description",
                                  value:
                                      transactionDetailsFz.idDescription ?? '',
                                )
                              : pw.SizedBox(),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "ID Number",
                            value: Box3.customerDetailsFZ?.data?.idNo ?? '',
                          ),
                          (transactionDetailsFz.idIssuePlace != null &&
                                  transactionDetailsFz
                                          .idIssuePlace?.isNotEmpty ==
                                      true)
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Id Issue Place",
                                  value:
                                      transactionDetailsFz.idIssuePlace ?? '',
                                )
                              : pw.SizedBox(),
                          newRowForKeyValue(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Id Issue Date",
                              value: transactionDetailsFz.idIssueDate == null
                                  ? ""
                                  : "${transactionDetailsFz.idIssueDate?.day} ${months[transactionDetailsFz.idIssueDate?.month]} ${transactionDetailsFz.idIssueDate?.year}"),
                          newRowForKeyValue(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Id Expiry Date",
                              value: transactionDetailsFz.idExpiry == null
                                  ? ""
                                  : "${transactionDetailsFz.idExpiry?.day} ${months[transactionDetailsFz.idExpiry?.month]} ${transactionDetailsFz.idExpiry?.year}"),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Mobile Number",
                            value: "+" '${transactionDetailsFz.phone}',
                          ),
                          (transactionDetailsFz.address != null &&
                                  transactionDetailsFz.address?.isNotEmpty ==
                                      true)
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Address",
                                  value: transactionDetailsFz.address ?? '',
                                )
                              : pw.SizedBox(),
                          (transactionDetailsFz.birthCountry != null &&
                                  transactionDetailsFz
                                          .birthCountry?.isNotEmpty ==
                                      true)
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Country Of Birth",
                                  value:
                                      transactionDetailsFz.birthCountry ?? '',
                                )
                              : pw.SizedBox(),
                          (transactionDetailsFz.customerNationality != null &&
                                  transactionDetailsFz
                                          .customerNationality?.isNotEmpty ==
                                      true)
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Nationality",
                                  value: transactionDetailsFz
                                          .customerNationality ??
                                      '',
                                )
                              : pw.SizedBox(),
                        ]),
                  ),
                  pw.SizedBox(height: 6.0),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(6),
                    decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(color: PdfColor.fromHex("cccecf"))),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "BENEFICIARY DETAILS",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                              fontSize: 13,
                              color: textColor,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Beneficiary Name",
                            value: transactionDetailsFz.beneficiaryName,
                          ),
                          transactionDetailsFz.accountNumber?.isNotEmpty == true
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Account Number",
                                  value:
                                      transactionDetailsFz.accountNumber ?? '',
                                )
                              : pw.Container(),
                          transactionDetailsFz.bankName?.isNotEmpty == true &&
                                  transactionDetailsFz.serviceType !=
                                      "CASH PICK UP"
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Bank",
                                  value: transactionDetailsFz.bankName ?? '',
                                )
                              : pw.Container(),
                          // transactionDetailsFz.branchName?.isNotEmpty == true && transactionDetailsFz.serviceType != "CASH PICK UP"
                          //     ? newRowForKeyValue(
                          //         keyColor: textColor,
                          //         valueColor: textColor,
                          //         key: "Branch",
                          //         value: transactionDetailsFz.branchName ?? '',
                          //       )
                          //     : pw.Container(),
                          transactionDetailsFz.serviceType == "C" &&
                                  transactionDetailsFz.bankName?.isNotEmpty ==
                                      true
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Agent",
                                  value: transactionDetailsFz.bankName ?? '',
                                )
                              : pw.Container(),
                          transactionDetailsFz.serviceType == "C" &&
                                  transactionDetailsFz.branchName?.isNotEmpty ==
                                      true
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Location",
                                  value: transactionDetailsFz.branchName ?? '',
                                )
                              : pw.Container(),
                          if (transactionDetailsFz.serviceType == "B" &&
                              transactionDetailsFz.branchName!.isNotEmpty)
                            newRowForKeyValue(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Branch Name",
                              value: transactionDetailsFz.branchName ?? '',
                            ),
                          (transactionDetailsFz.serviceType == "C" &&
                                  transactionDetailsFz.pinNumber != null &&
                                  transactionDetailsFz.pinNumber?.isNotEmpty ==
                                      true)
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Pin Number",
                                  value: transactionDetailsFz.pinNumber ?? '',
                                )
                              : pw.Container(),
                          transactionDetailsFz.serviceType == "C"
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Service Provider",
                                  value: serviceProvider,
                                )
                              : pw.Container(),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Receiving Country",
                            value:
                                transactionDetailsFz.destinationCountry ?? '',
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 6.0),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(6),
                    decoration: pw.BoxDecoration(
                        border:
                            pw.Border.all(color: PdfColor.fromHex("cccecf"))),
                    child: pw.Column(
                        mainAxisAlignment: pw.MainAxisAlignment.start,
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text(
                            "TRANSACTION DETAILS",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                              fontSize: 13,
                              color: textColor,
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Reference Number",
                            value:
                                transactionDetailsFz.transactionReference ?? '',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Transfer Type",
                            value: getServiceType(
                                transactionDetailsFz.serviceType),
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Payment Method",
                            value: transactionDetailsFz.payModeDesc ?? '',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Purpose of Sending Money",
                            value: transactionDetailsFz.purpose ?? '',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Source Of Income",
                            value: transactionDetailsFz.source ?? '',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Date and Time of Transaction",
                            value: DateFormatter.newFormat(
                                transactionDetailsFz.transactionDate?.toLocal(),
                                'dd/MM/yyyy hh:mm a'),
                          ),
                          newRowWithAmount(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Send Amount",
                              amount:
                                  '${(transactionDetailsFz.paymentAmount ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ',
                              currencyCode: baseCurrency),
                          newRowWithAmount(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Fees",
                              amount:
                                  '${(double.tryParse(transactionDetailsFz.charge ?? '0') ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ',
                              currencyCode: baseCurrency),
                          newRowWithAmount(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Other Charges",
                            amount:
                                '${0.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ',
                            currencyCode: baseCurrency,
                          ),
                          Box3.settings.enableVat == true
                              ? newRowWithAmount(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "VAT",
                                  amount:
                                      '${(transactionDetailsFz.customerVatin ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ',
                                  currencyCode: baseCurrency,
                                )
                              : pw.SizedBox(),
                          newRowWithAmount(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Net Pay Amount",
                              amount:
                                  '${(transactionDetailsFz.netAmount ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ',
                              currencyCode: baseCurrency),
                          newRowWithAmount(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Receiver Gets",
                              amount:
                                  '${double.parse(transactionDetailsFz.receivedAmount ?? '0').toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} ',
                              currencyCode: fromCurrency),
                          rateHeading(
                              keyColor: textColor,
                              valueColor: textColor,
                              key: "Rate",
                              value1: 1.toStringWithOptionalFixed(
                                  Box3.settings.currencyDecimalLength),
                              currencySymbol1: Box3.companyDataFZ!
                                  .companySettings!.primaryBaseCurrency,
                              value2: transactionDetailsFz.divisionRate
                                      ?.toStringWithOptionalFixed(Box3
                                          .settings.currencyDecimalLength) ??
                                  '-',
                              currencySymbol2:
                                  transactionDetailsFz.fromCurrencyCode!),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Status",
                            value: transactionDetailsFz.transactionStatus ?? '',
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 6.0),
                  F.appFlavor == Flavor.lmpay
                      ? pw.Container(
                          padding: const pw.EdgeInsets.only(
                              left: 6, right: 6, top: 6, bottom: 3),
                          alignment: pw.Alignment.center,
                          child: pw.Text(
                            """NOTE: This is a confirmation of the transfer request. However, it is neither a confirmation for processing the transfer by LM Exchange nor a proof of payment of the transferred amount. Your money transfer will be complete, once we have received the payment and the transaction is verified. You may also log in to the LMPAY mobile APP to check the transaction status or to contact our customer support.""",
                            textAlign: pw.TextAlign.start,
                            style: pw.TextStyle(
                              fontSize: 9,
                              color: PdfColor.fromHex("000000"),
                              fontWeight: pw.FontWeight.normal,
                            ),
                          ),
                        )
                      : pw.Container(
                          width: double.infinity,
                          constraints: const pw.BoxConstraints(
                              maxWidth: double.infinity,
                              minWidth: double.infinity),
                          color: primaryColor,
                          child: pw.Center(
                            child: pw.Column(
                                mainAxisAlignment: pw.MainAxisAlignment.center,
                                children: [
                                  pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        left: 6, right: 6, top: 6, bottom: 3),
                                    child: pw.Text(
                                      """This receipt is as confirmation of your transfer request. Please note that it does not confirm the processing of your transfer or serve as a proof of payment. We will initiate the transfer upon receipt of your payment. You can monitor your transactions using the "My Transactions" button on the Home Page. If you have any concerns or queries, feel free to reach out to us using the channels provided on the "Contact Us" page.""",
                                      textAlign: pw.TextAlign.start,
                                      style: pw.TextStyle(
                                        fontSize: 9,
                                        color: PdfColor.fromHex("FFFFFF"),
                                        fontWeight: pw.FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                  pw.Container(
                                      height: 0.4,
                                      color: PdfColor.fromHex("FFFFFF")),
                                  pw.Container(
                                    padding: const pw.EdgeInsets.only(
                                        left: 6, right: 6, top: 3, bottom: 6),
                                    child: pw.Row(children: [
                                      mobile.isNotEmpty
                                          ? pw.Text(
                                              mobile,
                                              textAlign: pw.TextAlign.center,
                                              style: pw.TextStyle(
                                                fontSize: 9,
                                                color:
                                                    PdfColor.fromHex("FFFFFF"),
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                              ),
                                            )
                                          : pw.Container(),
                                      pw.Spacer(),
                                      email.isNotEmpty
                                          ? pw.Text(
                                              "Email: $email",
                                              textAlign: pw.TextAlign.center,
                                              style: pw.TextStyle(
                                                fontSize: 9,
                                                color:
                                                    PdfColor.fromHex("FFFFFF"),
                                                fontWeight:
                                                    pw.FontWeight.normal,
                                              ),
                                            )
                                          : pw.Container(),
                                    ]),
                                  ),
                                ]),
                          ),
                        ),
                ],
              ),
            );
          }),
    );

    return pdf;
  }
}
