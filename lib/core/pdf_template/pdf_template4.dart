import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobiremit/models/transaction_details/transaction_details_fz.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

import '../color_constant.dart';
import '../flavours/constants.dart';
import '../models/formatter.dart';

class PdfTemplate4 {
  TransactionDetailsFz transactionDetailsFz;
  String email;
  String mobile;
  String? serviceProvider;
  pw.Font? _pdfFont;

  PdfTemplate4(this.transactionDetailsFz,
      {required this.email,
      required this.mobile,
      required this.serviceProvider});

  @visibleForTesting
  pw.Widget newRowForKeyValue({
    String? key,
    String? value,
    required PdfColor keyColor,
    required PdfColor valueColor,
    String? keyFWeight,
    String? valueFWeight,
  }) {
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
                      fontSize: 10,
                      color: keyColor,
                      fontWeight: pw.FontWeight.normal,
                    ),
                    overflow: pw.TextOverflow.clip),
              ),
              pw.Expanded(
                child: pw.Text(value.toString(),
                    maxLines: 1,
                    textAlign: pw.TextAlign.end,
                    style: pw.TextStyle(
                      fontSize: 10,
                      color: valueColor,
                      fontWeight: pw.FontWeight.normal,
                    ),
                    overflow: pw.TextOverflow.clip),
              ),
            ]),
          )
        : pw.Container();
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

  Future<void> _loadPdfFont() async {
    if (_pdfFont != null) return;
    try {
      final fontData =
          await rootBundle.load('assets/fonts/nunito-sans/NunitoSans-Regular.ttf');
      _pdfFont = pw.Font.ttf(fontData);
    } catch (e) {
      debugPrint('Error loading PDF font: $e');
    }
  }

  Future<pw.Document> printReceiptInPDF() async {
    await _loadPdfFont();
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

    PdfColor textColor = PdfColor(
      BlackAndRed.textColorBlack.r,
      BlackAndRed.textColorBlack.g,
      BlackAndRed.textColorBlack.b,
      BlackAndRed.textColorBlack.a,
    );
    PdfColor accentColor = PdfColor(
      AppConfigs.accentColor.r,
      AppConfigs.accentColor.g,
      AppConfigs.accentColor.b,
      AppConfigs.accentColor.a,
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

    final String? logoStr = Box3.companyDataFZ?.companySettings?.companyLogo;

    final pw.Font baseFont = _pdfFont ?? pw.Font.helvetica();
    final pdf = pw.Document(
      theme: pw.ThemeData.withFont(
        base: baseFont,
        bold: baseFont,
        italic: baseFont,
        boldItalic: baseFont,
      ),
    );
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
                  pw.Container(
                    width: double.infinity,
                    height: 60.0,
                    child: buildLogo(logoStr, fit: pw.BoxFit.fill),
                  ),
                  pw.Container(
                    padding: const pw.EdgeInsets.all(5),
                    width: double.infinity,
                    constraints: const pw.BoxConstraints(
                        maxWidth: double.infinity, minWidth: double.infinity),
                    color: accentColor,
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
                          (transactionDetailsFz.idType != null &&
                                  transactionDetailsFz.idType?.isNotEmpty ==
                                      true)
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "ID Type",
                                  value: transactionDetailsFz.idType ?? '',
                                )
                              : pw.SizedBox(),
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
                          transactionDetailsFz.branchName?.isNotEmpty == true &&
                                  transactionDetailsFz.serviceType !=
                                      "CASH PICK UP"
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Branch",
                                  value: transactionDetailsFz.branchName ?? '',
                                )
                              : pw.Container(),
                          transactionDetailsFz.serviceType == "CASH PICK UP" &&
                                  transactionDetailsFz.bankName?.isNotEmpty ==
                                      true
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Agent",
                                  value: transactionDetailsFz.bankName ?? '',
                                )
                              : pw.Container(),
                          transactionDetailsFz.serviceType == "CASH PICK UP" &&
                                  transactionDetailsFz.branchName?.isNotEmpty ==
                                      true
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Location",
                                  value: transactionDetailsFz.branchName ?? '',
                                )
                              : pw.Container(),
                          transactionDetailsFz.serviceType == "CASH PICK UP"
                              ? pw.Container()
                              : newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "Branch Code",
                                  value: transactionDetailsFz.branchCode ?? '',
                                ),
                          (transactionDetailsFz.serviceType == "CASH PICK UP" &&
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
                          transactionDetailsFz.serviceType == "CASH PICK UP"
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
                            value: transactionDetailsFz.serviceType ?? '',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Payment Method",
                            value: transactionDetailsFz.payMode ?? '',
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
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Send Amount",
                            value: '${transactionDetailsFz.paymentAmount} '
                                '${getCurrencySymbol(Box3.companyDataFZ!.companySettings!.primaryBaseCurrency)}',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Fees",
                            value:
                                '${(double.tryParse(transactionDetailsFz.charge ?? '0') ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} '
                                '${getCurrencySymbol(Box3.companyDataFZ!.companySettings!.primaryBaseCurrency)}',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Other Charges",
                            value:
                                '${0.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} '
                                '${getCurrencySymbol(Box3.companyDataFZ!.companySettings!.primaryBaseCurrency)}',
                          ),
                          Box3.settings.enableVat == true
                              ? newRowForKeyValue(
                                  keyColor: textColor,
                                  valueColor: textColor,
                                  key: "VAT",
                                  value:
                                      '${(transactionDetailsFz.taxAmount ?? 0).toStringWithOptionalFixed(Box3.settings.currencyDecimalLength)} '
                                      '${getCurrencySymbol(Box3.companyDataFZ!.companySettings!.primaryBaseCurrency)}',
                                )
                              : pw.SizedBox(),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Net Pay Amount",
                            value: '${transactionDetailsFz.netAmount} '
                                '${getCurrencySymbol(Box3.companyDataFZ!.companySettings!.primaryBaseCurrency)}',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Receiver Gets",
                            value:
                                '${transactionDetailsFz.receivedAmount.toString()} '
                                '${transactionDetailsFz.fromCurrencyCode}',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Rate",
                            value:
                                '1${getCurrencySymbol(Box3.companyDataFZ!.companySettings!.primaryBaseCurrency)} = ${transactionDetailsFz.divisionRate?.toString() ?? '-'} ${transactionDetailsFz.fromCurrencyCode}',
                          ),
                          newRowForKeyValue(
                            keyColor: textColor,
                            valueColor: textColor,
                            key: "Status",
                            value: transactionDetailsFz.transactionStatus ?? '',
                          ),
                        ]),
                  ),
                  pw.SizedBox(height: 6.0),
                  pw.Container(
                    width: double.infinity,
                    constraints: const pw.BoxConstraints(
                        maxWidth: double.infinity, minWidth: double.infinity),
                    color: accentColor,
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
                                height: 0.4, color: PdfColor.fromHex("FFFFFF")),
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
                                          color: PdfColor.fromHex("FFFFFF"),
                                          fontWeight: pw.FontWeight.normal,
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
                                          color: PdfColor.fromHex("FFFFFF"),
                                          fontWeight: pw.FontWeight.normal,
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
