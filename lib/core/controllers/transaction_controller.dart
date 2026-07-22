import 'dart:convert';
import 'dart:io';

import 'package:filesaverplus/filesaverplus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/network/api_service_new.dart';
import 'package:path_provider/path_provider.dart';

import '../../models/reg_device/register_device_fz.dart';
import '../../models/transaction_details/transaction_details_fz.dart';
import '../../models/transaction_query_type/query_type_fz.dart';
import '../../ui_one/custom_widgets/download_statement_dialog.dart';
import '../../ui_one/custom_widgets/error_alert.dart';
import '../../ui_one/custom_widgets/success_alert.dart';
import '../../ui_one/screens/home/my_transactions/transaction_filter_ui.dart';
import '../flavours/constants.dart';
import '../pdf_template/multi_page_pdf_template1.dart';
import 'account_controller.dart';
import 'data_controller.dart';
import 'main_controller.dart';

class TransactionController extends GetxController {
  bool isDark = Get.find<AccountController>().isDark,
      isCustomDate = false,
      loading = !Get.find<DataController>()
          .transactionAndBeneficiaryRetrieved; //Todo:Check the loading should have not in RHS

  String type = 'download'.tr, searchingString = '';
  int statementIndex = 0;
  RxBool downloadingStatement = false.obs;
  List<String> status = [];
  String name = '';
  List<bool> paymentInstrument = [];
  DateTime? startDate, endDate;
  List<TransactionDetailsFz> transactions = [];
  List<QueryTypeFz> queryTypes = [];

  bool get noRecordFound => !transactions
      .map((t) => checkVisibility(transactions.indexOf(t)))
      .contains(true);

  void pop() => Get.find<MainController>().pop();

  Future<void> getData({bool refresh = false}) async {
    if (refresh) {
      loading = true;
      update();
      await Get.find<DataController>().getData(TransactionController);
      loading = false;
      update();
    } else if (loading) {
      name = '';
      await Get.find<DataController>().getData(TransactionController);
      update();
      if (Get.find<AccountController>().contactUs == null) {
        Get.find<AccountController>().getContactUs();
      }

      update();
    }
  }

  Future<void> getDataPageWise() async {
    var start = DateTime.now().subtract(
        Duration(days: AppConfigs.env != Environment.prod ? 60 : 180));
    var end = DateTime.now();
    if (startDate != null && endDate != null) {
      await Get.find<DataController>()
          .getTransactionsPages(startDate: startDate!, endDate: endDate!);
    } else {
      await Get.find<DataController>()
          .getTransactionsPages(startDate: start, endDate: end);
    }
    update();
  }

  Future<void> getQueryTypes() async {
    queryTypes = await ApiService().getQueryTypes();
    update();
  }

  String? agentStatus;
  bool agentLoading = false;

  Future<void> getApiTransactionStatus(String traRefNo) async {
    agentLoading = true;
    Get.find<AccountController>().update();
    agentStatus = await ApiService().getApiTransactionStatus(traRefNo);
    agentLoading = false;
    Get.find<AccountController>().update();
  }

  void showFilter() {
    update();
    Get.bottomSheet(transactionFilterUI(),
        barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null);
  }

  bool checkVisibility(int i) {
    String temp = (Box3.settings.currenciesForBeneficiaries).trim();
    List<String> currencies =
        temp.isNotEmpty ? temp.toLowerCase().split(',') : [];
    TransactionDetailsFz t = transactions[i];
    return (name.isNotEmpty
            ? (t.beneficiaryName ?? '')
                    .toLowerCase()
                    .contains(name.toLowerCase()) ||
                (t.transactionReference ?? '')
                    .toLowerCase()
                    .contains(name.toLowerCase())
            : true) &&
        (status.isNotEmpty && t.transactionStatus != null
            ? (status.contains('Processing') &&
                    t.transactionStatus!
                        .toLowerCase()
                        .contains('processing')) ||
                (status.contains('Success') &&
                    t.transactionStatus!.toLowerCase().contains('success')) ||
                (status.contains('Failed') &&
                    t.transactionStatus!.toLowerCase().contains('failed')) ||
                (status.contains('Cancelled') &&
                    t.transactionStatus!.toLowerCase().contains('cancelled'))
            : true) &&
        (paymentInstrument.isNotEmpty
            ? ((paymentInstrument.contains(true) && t.serviceType == 'C') ||
                (paymentInstrument.contains(true) && t.serviceType == 'W') ||
                (paymentInstrument.contains(false) && t.serviceType == 'B'))
            : true) &&
        (startDate != null && t.transactionDate != null
            ? t.transactionDate!.toLocal().isAfter(startDate!)
            : true) &&
        (endDate != null && t.transactionDate != null
            ? t.transactionDate!.toLocal().isBefore(endDate!)
            : true) &&
        (currencies.isNotEmpty == true && t.fromCurrencyCode != null
            ? currencies.contains(t.fromCurrencyCode!.toLowerCase())
            : true);
  }

  void downloadStatement() => Get.dialog(downloadStatementDialog(),
      barrierColor: isDark ? AppConfigs.w.withOpacity(0.2) : null);

  @override
  void onInit() {
    transactions = Get.find<DataController>().transactions.toList();
    super.onInit();
  }

  bool complaintStatus = false;
  bool isError = false;

  bool transactionCancelStatus = false;

  Future<void> sendStatement(String base64, String fileName) async {
    RegisterDeviceFZ? r =
        await ApiService().sendStatementOnMail(base64, fileName);
    if (r?.statusCode == "RMA-SUCC") {
      showSuccessAlert(
          title: r?.customMessageDetails?.messageHeader,
          content: r?.customMessageDetails?.messageDescription,
          function: () {
            Get.back();
          });
    }
  }

  Future<void> generateStatement(int? formatIndex) async {
    try {
      if (statementIndex == 0) {
        if (formatIndex == 0) {
          var pdfTemplate = MultiPagePdfTemplate1(transactions
              .where((t) =>
                  (name.isNotEmpty
                      ? (t.beneficiaryName ?? '')
                              .toLowerCase()
                              .contains(name.toLowerCase()) ||
                          (t.transactionReference ?? '')
                              .toLowerCase()
                              .contains(name.toLowerCase())
                      : true) &&
                  (status.isNotEmpty
                      ? (status.contains('Processing') && t.transactionStatus!.toLowerCase().contains('processing')) ||
                          (status.contains('Success') &&
                              t.transactionStatus!
                                  .toLowerCase()
                                  .contains('success')) ||
                          (status.contains('Failed') &&
                              t.transactionStatus!
                                  .toLowerCase()
                                  .contains('failed')) ||
                          (status.contains('Cancelled') &&
                              t.transactionStatus!
                                  .toLowerCase()
                                  .contains('cancelled'))
                      : true) &&
                  (paymentInstrument.isNotEmpty
                      ? (paymentInstrument.contains(true) && t.serviceType == 'C' ||
                          paymentInstrument.contains(true) && t.serviceType == 'W' ||
                          paymentInstrument.contains(false) && t.serviceType == 'B')
                      : true) &&
                  (startDate != null && t.transactionDate != null ? t.transactionDate!.isAfter(startDate!) : true) &&
                  (endDate != null && t.transactionDate != null ? t.transactionDate!.isBefore(endDate!) : true))
              .toList());
          var printingPdf = await pdfTemplate.printReceiptInPDF();
          var resultData = await printingPdf.save();
          var resultName =
              "TransactionStatement${DateTime.now().second.toString() + DateTime.now().minute.toString() + DateTime.now().hour.toString() + DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString()}.pdf";
          await FileSaverPlus().saveFile(
            resultData,
            resultName,
            "appliation/pdf",
          );
          showSuccessAlert(function: () {
            Get.back();
          });
        }
      } else {
        if (formatIndex == 0) {
          var pdfTemplate = MultiPagePdfTemplate1(transactions
              .where((t) =>
                  (name.isNotEmpty
                      ? (t.beneficiaryName ?? '')
                              .toLowerCase()
                              .contains(name.toLowerCase()) ||
                          (t.transactionReference ?? '')
                              .toLowerCase()
                              .contains(name.toLowerCase())
                      : true) &&
                  (status.isNotEmpty
                      ? (status.contains('pending') && (t.transactionStatus!.toLowerCase().contains('pending') || t.transactionStatus!.toLowerCase().contains('requested')) ||
                          status.contains('Success') &&
                              t.transactionStatus!
                                  .toLowerCase()
                                  .contains('success') ||
                          status.contains('Rejected') &&
                              t.transactionStatus!
                                  .toLowerCase()
                                  .contains('rejected'))
                      : true) &&
                  (paymentInstrument.isNotEmpty
                      ? (paymentInstrument.contains(true) && t.serviceType == 'C' ||
                          paymentInstrument.contains(true) &&
                              t.serviceType == 'W' ||
                          paymentInstrument.contains(false) && t.serviceType == 'B')
                      : true) &&
                  (startDate != null && t.transactionDate != null ? t.transactionDate!.isAfter(startDate!) : true) &&
                  (endDate != null && t.transactionDate != null ? t.transactionDate!.isBefore(endDate!) : true))
              .toList());
          var printingPdf = await pdfTemplate.printReceiptInPDF();
          var resultData = await printingPdf.save();
          var resultName =
              "TransactionStatement${DateTime.now().second.toString() + DateTime.now().minute.toString() + DateTime.now().hour.toString() + DateTime.now().day.toString() + DateTime.now().month.toString() + DateTime.now().year.toString()}.pdf";
          Directory d = await getTemporaryDirectory();
          File f = await File('${d.path}/$resultName').writeAsBytes(resultData);
          List<int> fileBytes = await f.readAsBytes();
          await sendStatement(base64Encode(fileBytes), resultName);
        }
      }
    } catch (e, st) {
      debugPrint("Error while generating statement: $e\n$st");
      errorAlert(content: "Something went wrong. Please try again.");
    } finally {
      downloadingStatement.value = false;
    }
  }
}
