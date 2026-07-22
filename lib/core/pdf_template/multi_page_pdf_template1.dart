import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/customer_details/customer_data_fz.dart';
import 'package:pdf/pdf.dart' as pw;
import 'package:pdf/widgets.dart' as pw;

import '../../flavors.dart';
import '../../models/transaction_details/transaction_details_fz.dart';
import '../flavours/constants.dart';

class MultiPagePdfTemplate1 {
  List<TransactionDetailsFz> transactions;

  final Map<String, pw.MemoryImage> _currencyImageCache = {};
  bool _imagesLoaded = false;
  pw.Font? _pdfFont;

  MultiPagePdfTemplate1(this.transactions);

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

  // Call this BEFORE printReceiptInPDF()
  Future<void> initialize() async {
    if (_imagesLoaded) return;

    if (Box3.settings.requiredCurrencySymbol == true &&
        Box3.currencySymbol != null) {
      //  compute to decode in isolate
      _currencyImageCache
          .addAll(await compute(_decodeCurrencyImages, Box3.currencySymbol!));
    }

    if (_pdfFont == null) {
      try {
        final fontData =
            await rootBundle.load('assets/fonts/nunito-sans/NunitoSans-Regular.ttf');
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
          debugPrint('Error decoding currency image for ${cur.currencyCode}: $e');
        }
      }
    }

    return cache;
  }

  @visibleForTesting
  pw.Widget newRowForKeyValue({
    String? key,
    String? value,
    pw.PdfColor? keyColor,
    pw.PdfColor? valueColor,
    pw.FontWeight? keyFWeight,
    pw.FontWeight? valueFWeight,
    double? fontSize,
  }) {
    if (key == "Date and Time of Transaction") {
      logger.i(value);
    }
    return pw.Container(
      width: double.infinity,
      margin: pw.EdgeInsets.only(bottom: 2.5),
      child: pw.Row(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        pw.Expanded(
          flex: 1,
          child: pw.Text("$key : ",
              textAlign: pw.TextAlign.start,
              style: pw.TextStyle(
                fontSize: fontSize ?? 10,
                color: keyColor ?? pw.PdfColor.fromHex('777777'),
                fontWeight: keyFWeight ?? pw.FontWeight.normal,
              ),
              overflow: pw.TextOverflow.clip),
        ),
        pw.SizedBox(width: 5),
        pw.Expanded(
          flex: 2,
          child: pw.Text(value.toString(),
              textAlign: pw.TextAlign.start,
              style: pw.TextStyle(
                fontSize: fontSize ?? 10,
                color: valueColor ?? pw.PdfColor.fromHex('444444'),
                fontWeight: valueFWeight ?? pw.FontWeight.normal,
              ),
              overflow: pw.TextOverflow.clip),
        ),
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
            return _buildTextSymbol(cur.currencyImage ?? currencyCode, valueColor,
                valueFWeight, fontSize);
          }
          try {
            return pw.SizedBox(
              width: 9,
              height: 7,
              child: pw.SvgImage(svg: svgString, fit: pw.BoxFit.fitHeight),
            );
          } catch (svgError) {
            // SVG rendering failed - likely due to Unicode characters or unsupported fonts
            // Fall back to text representation (same as Base64Image widget error handling)
            debugPrint('Error rendering SVG currency symbol for $currencyCode (Unicode/font issue): $svgError');
            return _buildTextSymbol(cur.currencyImage ?? currencyCode, valueColor,
                valueFWeight, fontSize);
          }
        }
      } catch (e) {
        debugPrint('Error decoding currency image for $currencyCode: $e');
      }
    }

    // Fallback to text symbol
    if (cur != null && cur.currencyImage != null) {
      return _buildTextSymbol(
          cur.currencyImage!, valueColor, valueFWeight, fontSize);
    }

    return _buildTextSymbol(currencyCode, valueColor, valueFWeight, fontSize);
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
            mainAxisAlignment: pw.MainAxisAlignment.center,
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
            ],
          );
  }

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

  pw.Container transactionTileHeader() {
    return pw.Container(
      height: 35,
      padding: const pw.EdgeInsets.only(left: 5, right: 5),
      decoration: pw.BoxDecoration(
          border: pw.Border.all(color: pw.PdfColor.fromHex("000000"))),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Expanded(
            child: pw.Text(
              'Beneficiary Name',
              maxLines: 1,
              style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.start,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              'Send_Amount'.tr,
              maxLines: 1,
              style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              'Receiver_Gets'.tr,
              maxLines: 1,
              style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              'Reference Number',
              maxLines: 1,
              style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              'Status',
              maxLines: 1,
              style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              'Date',
              maxLines: 1,
              style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold),
              textAlign: pw.TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget userDetails() {
    CustomerDataFZ customer = Box3.customerDetailsFZ!;
    return pw.Padding(
      padding: const pw.EdgeInsets.all(10),
      child:
          pw.Column(crossAxisAlignment: pw.CrossAxisAlignment.start, children: [
        newRowForKeyValue(
            key: 'Name',
            value: [
              customer.data?.firstName.trim(),
              customer.data?.middleName?.trim(),
              customer.data?.lastName?.trim(),
            ].where((name) => name != null && name.isNotEmpty).join(' ')),
        newRowForKeyValue(key: 'Email ID', value: '${customer.data?.email}'),
        newRowForKeyValue(
            key: Box3.settings.primaryDocIDName,
            value: '${customer.data?.idNo}'),
        newRowForKeyValue(
            key: 'Nationality', value: customer.data!.nationality ?? ''),
      ]),
    );
  }

  pw.Container transactionTile(TransactionDetailsFz transaction) {
    return pw.Container(
      constraints: pw.BoxConstraints(minHeight: 35, maxHeight: 70),
      padding: const pw.EdgeInsets.only(left: 5, right: 5),
      decoration: pw.BoxDecoration(
          border: pw.Border.all(color: pw.PdfColor.fromHex("000000"))),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Expanded(
            child: pw.Text(
              transaction.beneficiaryName ?? '',
              maxLines: 2,
              style: const pw.TextStyle(fontSize: 10),
              textAlign: pw.TextAlign.start,
            ),
          ),
          pw.Expanded(
            child: pwCurrencySymbolWithAmount(
              amount: '${transaction.receivedAmount}',
              currencyCode:
                  Box3.companyDataFZ!.companySettings!.primaryBaseCurrency,
            ),
          ),
          pw.Expanded(
              child: pwCurrencySymbolWithAmount(
            amount: '${transaction.paymentAmount}',
            currencyCode: transaction.fromCurrencyCode!,
          )),
          pw.Expanded(
            child: pw.Text(
              transaction.transactionReference ?? '',
              style: const pw.TextStyle(fontSize: 10),
              maxLines: 1,
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              transaction.transactionStatus ?? '',
              style: const pw.TextStyle(fontSize: 10),
              maxLines: 2,
              textAlign: pw.TextAlign.center,
            ),
          ),
          pw.Expanded(
            child: pw.Text(
              style: const pw.TextStyle(fontSize: 10),
              '${transaction.transactionDate?.day} ${months[transaction.transactionDate?.month]} ${transaction.transactionDate?.year}',
              maxLines: 1,
              textAlign: pw.TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }

  Future<pw.Document> printReceiptInPDF() async {
    await initialize();

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
            debugPrint('Error rendering SVG logo (Unicode/font issue): $svgError');
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

    List<pw.Widget> widgets = [];
    F.appFlavor == Flavor.lmpay
        ? widgets.add(
            pw.Row(
              children: [
                if (isPrimary)
                  buildLogo(primaryLogoStr,
                      width: isSecondary ? 60.0 : 100.0,
                      height: isSecondary ? 60.0 : 100.0,
                      fit: pw.BoxFit.fitWidth),
                if (isSecondary)
                  buildLogo(secondaryLogoStr,
                      width: isPrimary ? 60.0 : 100.0,
                      height: isPrimary ? 60.0 : 100.0,
                      fit: pw.BoxFit.fitWidth),
                if (isPrimary == false && isSecondary == false)
                  buildLogo(mainLogoStr,
                      width: 100.0, height: 100.0, fit: pw.BoxFit.fitWidth),
                pw.SizedBox(width: 10),
                pw.Expanded(
                    child: pw.Column(children: [
                  pw.Text(
                    "All Electronic Transactions",
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
                ])),
                pw.SizedBox(width: 10),
                pw.Expanded(
                  child: userDetails(),
                )
              ],
            ),
          )
        : widgets.add(
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.stretch,
              mainAxisSize: pw.MainAxisSize.min,
              children: [
                pw.Container(
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
                pw.SizedBox(height: 10),
                userDetails()
              ],
            ),
          );
    // widgets.add(userDetails());
    widgets.add(transactionTileHeader());

    for (var t in transactions) {
      widgets.add(transactionTile(t));
    }

    pdf.addPage(pw.MultiPage(
        margin: const pw.EdgeInsets.all(10),
        pageFormat: pw.PdfPageFormat.a4,
        build: (context) => widgets));

    return pdf;
  }
}
