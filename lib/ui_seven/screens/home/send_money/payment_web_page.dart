import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';
import '../../../../network/api_service_new.dart';

class PaymentWebPage extends StatefulWidget {
  final String htmlData;
  final String pageTitle;
  final WebUri? baseUrl;

  const PaymentWebPage({
    super.key,
    required this.htmlData,
    this.pageTitle = 'Q Pay',
    this.baseUrl,
  });

  @override
  State<PaymentWebPage> createState() => _PaymentWebPageState();
}

class _PaymentWebPageState extends State<PaymentWebPage> {
  InAppWebViewController? webViewController;
  bool isLoading = true;
  bool isRedirectProcessing = false;

  final TransferController _transferController = Get.find<TransferController>();

  @override
  void dispose() {
    webViewController?.dispose();
    super.dispose();
  }

  void closePage() {
    Get.back(result: 'canceled');
  }

  Future<void> safeClearSslPreferences(
      InAppWebViewController controller) async {
    if (kIsWeb) return;
    if (!Platform.isAndroid) return;

    try {
      await controller.clearSslPreferences();
      debugPrint('SSL preferences cleared (Android)');
    } on UnimplementedError catch (_) {
      debugPrint('clearSslPreferences() not implemented on this platform');
    } catch (e, st) {
      debugPrint('Error while clearing SSL preferences: $e\n$st');
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) => closePage(),
      child: Scaffold(
        backgroundColor: AppConfigs.bodybg(_transferController.isDark),
        appBar: appBar0(widget.pageTitle, onTap2: () => closePage()),
        body: SafeArea(
          child: Stack(
            children: [
              InAppWebView(
                initialSettings: InAppWebViewSettings(
                  javaScriptEnabled: true,
                  domStorageEnabled: true,
                  mediaPlaybackRequiresUserGesture: false,
                  useHybridComposition: true,
                  allowsInlineMediaPlayback: true,
                ),
                onWebViewCreated: (controller) async {
                  webViewController = controller;
                  await safeClearSslPreferences(controller);

                  await controller.loadData(
                    data: widget.htmlData,
                    mimeType: 'text/html',
                    encoding: 'utf-8',
                    baseUrl: widget.baseUrl,
                  );
                },
                onProgressChanged: (controller, progress) {
                  if (progress == 100 && isLoading) {
                    setState(() => isLoading = false);
                  } else if (progress < 100 && !isLoading) {
                    setState(() => isLoading = true);
                  }
                },
                onReceivedServerTrustAuthRequest:
                    (controller, challenge) async {
                  return ServerTrustAuthResponse(
                    action: ServerTrustAuthResponseAction.PROCEED,
                  );
                },
                onReceivedError: (controller, request, error) {
                  debugPrint("Web error: ${error.description}");
                  if (isLoading) setState(() => isLoading = false);
                },
                onUpdateVisitedHistory:
                    (controller, url, androidIsReload) async {
                  final uri = url;
                  if (uri != null) {
                    debugPrint("onUpdateVisitedHistory: URL -> $uri");
                    if (uri.path.contains('/fz-api/') &&
                        uri.queryParameters.containsKey('id')) {
                      debugPrint("onUpdateVisitedHistory: handling redirect.");
                      handlePaymentRedirect(uri);
                    }
                  }
                },
              ),
              GetBuilder<TransferController>(
                builder: (controller) {
                  return Visibility(
                    visible: isLoading || isRedirectProcessing,
                    child: Container(
                      color: AppConfigs.w.withOpacity(0.3),
                      child: loader(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> handlePaymentRedirect(Uri uri) async {
    if (isRedirectProcessing) return;
    setState(() => isRedirectProcessing = true);

    try {
      final String? idString = uri.queryParameters['id'];
      final int? id = int.tryParse(idString ?? '');

      if (id == 1) {
        if (AppConfigs.fetchNewConfig
            ? Box3.settings.amlForTransaction
            : Box3.settings.amlForTransaction) {
          if (await ApiService()
              .validateMandatory(BankAttributes.referenceNumber)) {
            TransactionDetailsFz? td =
                await ApiService().transactionDetailsByRefNo(
              referenceNo: BankAttributes.referenceNumber,
            );
            if (td != null && await ApiService().validateAML(td)) {
              Get.back();
              _transferController.getSuccessData(
                paymentStatus: 'Successful',
                transactionStatus: 'Under Processing',
                title: 'Transaction Processing!',
                isStatus: true,
              );
            }
          } else {
            Get.back();
            _transferController.getSuccessData(
              paymentStatus: 'Successful',
              transactionStatus: 'Under Processing',
              title: 'Transaction Processing!',
              isStatus: true,
            );
          }
        } else {
          Get.back();
          _transferController.getSuccessData(
            paymentStatus: 'Successful',
            transactionStatus: 'Under Processing',
            title: 'Transaction Processing!',
            isStatus: true,
          );
        }
      } else if (id == 2 || id == 3) {
        String? message =
            uri.queryParameters['sStatusMessage']?.replaceAll('%20', ' ');
        String? heading = uri.queryParameters['sStatusType'];

        Get.back();
        await _transferController.getFailedData(
          paymentStatus: 'Payment Failed!',
          webViewController: webViewController!,
          url: widget.htmlData,
          heading: heading,
          message: message,
        );
      } else {
        Get.back();
        await _transferController.getFailedData(
          paymentStatus: 'Payment Failed!',
          webViewController: webViewController!,
          url: widget.htmlData,
          heading: 'Unexpected Status',
          message: 'An unexpected payment status was received.',
        );
      }
    } catch (e, st) {
      if (kDebugMode) print('Error handling redirect: $e\n$st');
    } finally {
      setState(() => isRedirectProcessing = false);
    }
  }
}
