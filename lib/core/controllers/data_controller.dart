import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:mobiremit/models/notification/in_app_notification/in_app_notifications_fz.dart';

import '../../models/advertiesments/advertiesment_fz.dart';
import '../../models/beneficiary/beneficiary_fz.dart';
import '../../models/customer_details/customer_data_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../../models/news/news_fz.dart';
import '../../models/rate_calculator/rate_calculator_fz.dart';
import '../../models/transaction_details/transaction_details_fz.dart';
import '../../network/api_service_new.dart';
import '../exports/controllers.dart';
import '../flavours/constants.dart';
import '../models/formatter.dart';

class DataController extends GetxController {
  bool beforeLogin;

  DataController({this.beforeLogin = false});

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  bool dataRetrieved = false, transactionAndBeneficiaryRetrieved = false;
  List<TransactionDetailsFz> transactions = [];
  List<BeneficiaryFz> beneficiaries = [];
  List<MasterResponseFZ> countries = [],
      nationalities = [],
      ids = [],
      professions = [],
      currencies = [],
      employers = [],
      emirates = [],
      masterReferral = [];
  List<MasterResponseFZ> serviceProviders = [];

  List<AdvertisementList> promotions = [];

  AdvertisementList? get fixedPromotion => promotions.firstWhereOrNull(
        (element) => element.displayFormat == 'F',
      );

  List<NewsFZ> newsList = [];
  RxBool isNewsExpanded = false.obs;
  Set<String> loadingNewsContent = {};

  var notificationCount = 0;
  bool notificationLoading = false;
  List<NotificationFz> notifications = [];

  CustomerDataFZ? customerDataFZ = Box3.customerDetailsFZ;

  File? customerImage, idFront, idBack;

  Future<void> clear() async {
    transactions.clear();
    beneficiaries.clear();
    transactionAndBeneficiaryRetrieved = false;
  }

  void toggleNewsExpanded() {
    isNewsExpanded.value = !isNewsExpanded.value;
    update(['news', 'Dashboard_news']);
  }

  int pageNumber = 1;
  int pageSize = 10;
  TransactionFz? lastFetchData;

  Future<void> getTransactions(
      {required DateTime startDate, required DateTime endDate}) async {
    String ss = DateFormatter.newFormat(startDate, 'dd/MMM/yyyy');
    String ee = DateFormatter.newFormat(endDate, 'dd/MMM/yyyy');
    pageNumber = 1;
    TransactionFz? transData = await ApiService().transactions(
        startDate: ss,
        endDate: ee,
        enablePagination: false,
        pageSize: pageSize,
        pageNumber: pageNumber);
    pageNumber = pageNumber + 1;
    if (transData != null && transData.data.isNotEmpty) {
      transactions = List.from(transData.data);
      //transaction sort by recent done
      transactions
          .sort((a, b) => b.transactionDate!.compareTo(a.transactionDate!));
    }
    update();
  }

  RxBool pageLoader = false.obs;

  Future<void> getTransactionsPages({
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    final String ss = DateFormatter.newFormat(startDate, 'dd/MMM/yyyy');
    final String ee = DateFormatter.newFormat(endDate, 'dd/MMM/yyyy');

    if (pageLoader.value) return;
    pageLoader.value = true;

    try {
      if (lastFetchData == null || pageNumber <= lastFetchData!.totalPages) {
        final transData = await ApiService().transactions(
          startDate: ss,
          endDate: ee,
          pageSize: pageSize,
          pageNumber: pageNumber,
          enablePagination: true,
        );

        if (transData != null && transData.data.isNotEmpty) {
          lastFetchData = transData;
          final existingIds =
              transactions.map((e) => e.transactionReference).toSet();
          final newItems = transData.data
              .where((e) => !existingIds.contains(e.transactionReference))
              .toList();

          transactions.addAll(newItems);
          transactions.sort(
            (a, b) => b.transactionDate!.compareTo(a.transactionDate!),
          );
          pageNumber++;
        }
      }
    } catch (e, st) {
      debugPrint('Error in getTransactionsPages: $e\n$st');
    } finally {
      pageLoader.value = false;
      update();
    }
  }

  Future<void> getBeneficiaries() async {
    beneficiaries.clear();
    var data = await ApiService().beneficiaries();

    beneficiaries = data;

    // show latest beneficiary on top
    if (beneficiaries.isNotEmpty) {
      beneficiaries.sort((a, b) => b.createdOn!.compareTo(a.createdOn!));
    }

    update();
  }

  Future<void> getNotifications() async {
    notificationLoading = true;
    update();
    notifications = await ApiService().notifications();
    if (notifications.isNotEmpty) {
      notifications.sort((a, b) {
        final aDate = DateTime.tryParse(a.createdOn) ?? DateTime(0);
        final bDate = DateTime.tryParse(b.createdOn) ?? DateTime(0);
        return bDate.compareTo(aDate);
      });
    }
    notificationCount = 0;
    for (var e in notifications) {
      if (e.status == "N") {
        notificationCount = notificationCount + 1;
      }
    }

    notificationLoading = false;
    update();
  }

  Future<void> getPromotions() async {
    promotions = await ApiService().promotions(advertisementCode: "");

    for (int i = 0; i < promotions.length; i++) {
      final ad =
          await ApiService().promotions(advertisementCode: promotions[i].code);
      if (ad.isNotEmpty) {
        promotions[i] = ad.first;
        update(['Dashboard_Advertisement', 'Advertisement']);
      }
    }
  }

  // Check if we're currently loading this news item's content
  bool isLoadingNewsContent(String code) {
    return loadingNewsContent.contains(code);
  }

  Future<void> getNews({String newsCode = ""}) async {
    List<NewsFZ> updatedNewsList = await ApiService().news(newsCode: newsCode);
    if (newsCode.isEmpty) {
      newsList = updatedNewsList;

      fetchAllNewsContent();
    } else {
      int newsIdx = newsList.indexWhere((news) => news.code == newsCode);
      if (newsIdx != -1 && updatedNewsList.isNotEmpty) {
        newsList[newsIdx] = updatedNewsList.first;
        update(['news', 'Dashboard_news']);
      }
    }
  }

  Future<void> fetchAllNewsContent() async {
    for (var newsItem in newsList) {
      // Only fetch if content is empty and not already being loaded
      if ((newsItem.newsContent == null || newsItem.newsContent!.isEmpty) &&
          !loadingNewsContent.contains(newsItem.code)) {
        try {
          loadingNewsContent.add(newsItem.code!);

          await getNews(newsCode: newsItem.code!);

          loadingNewsContent.remove(newsItem.code);
          update(['news', 'Dashboard_news']);
        } catch (e) {
          logger.e("Error fetching news content: $e");
          loadingNewsContent.remove(newsItem.code);
          update(['news', 'Dashboard_news']);
        }
      }
    }
  }

  Future<void> getCountries() async {
    countries = await ApiService()
        .getCatalogue(typeData: {"Type": "COUNTRY"}, type: 'COUNTRY');
    countries.sort((a, b) => a.Desc.compareTo(b.Desc));
  }

  Future<void> getNationalities() async => nationalities = await ApiService()
      .getCatalogue(typeData: {"Type": "NATIONALITY"}, type: 'NATIONALITY');

  Future<void> getIDs() async => ids = await ApiService()
      .getCatalogue(typeData: {"Type": "IDTYPE"}, type: 'IDTYPE');

  Future<void> getProfessions() async => professions = await ApiService()
      .getCatalogue(typeData: {"Type": "PROFESSION"}, type: 'PROFESSION');

  Future<void> getEmployers() async => employers =
      AppConfigs.env == Environment.dev
          ? await ApiService()
              .getCatalogue(typeData: {"Type": "EMPLOYER"}, type: 'EMPLOYER')
          : [];

  Future<void> getCurrencies() async => currencies = await ApiService()
      .getCatalogue(typeData: {"Type": "CURRENCY"}, type: 'CURRENCY');

  Future<void> oneUnitRate({String? amount}) async {
    if (!Get.isRegistered<MainController>()) {
      Get.put(MainController());
    }

    Get.find<MainController>().rateLoading.value = true;
    // update(['Rate-Card']);

    RateCalculatorFz? g = await ApiService().guestRate(
      amount: '1.00',
      currency: Get.find<AccountController>().toCur?.Code,
      type: 'L',
    );
    // GuestRateResponseBV1? gResp;
    if (g?.fcyAmount != null) {
      Get.find<MainController>().oneUnitValue.value = g!.fcyAmount!.toString();
      // ..update(['Rate-Card']);
    }
    try {
      Get.find<MainController>().fromAmtCtrl.text = amount ?? '1.00';
      // ..update(['Rate-Card']);
      await Get.find<MainController>().updateToCurrency(
          s: Get.find<MainController>().fromAmtCtrl.text, type: 'L');
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    Get.find<MainController>().rateLoading.value = false;
    // update(['Rate-Card']);
  }

  Future<void> getData(Type T, {bool forceUpdateTxnsAndBenefs = false}) async {
    if (T == TransactionController) {
      await getTransactions(
          startDate: DateTime.now().subtract(
              Duration(days: AppConfigs.env != Environment.prod ? 60 : 180)),
          endDate: DateTime.now());
    } else if (T == BeneficiaryController) {
      if (countries.isEmpty) {
        await getCountries();
      }
      await getBeneficiaries();
    } else if (!transactionAndBeneficiaryRetrieved ||
        forceUpdateTxnsAndBenefs) {
      await Future.wait([
        getTransactions(
          startDate: DateTime.now().subtract(
            Duration(days: AppConfigs.env != Environment.prod ? 60 : 180),
          ),
          endDate: DateTime.now(),
        ),
        getBeneficiaries()
      ]);
    }

    switch (T) {
      case const (TransferController):
        if (Get.isRegistered<TransferController>()) {
          TransferController t = Get.find<TransferController>();

          t
            ..transactions = transactions
                .where((transaction) => t.transferType == TransferType.bank
                    ? (transaction.serviceType != 'C' &&
                        transaction.serviceType != 'W')
                    : t.transferType == TransferType.cash
                        ? (transaction.serviceType != 'B' &&
                            transaction.serviceType != 'W')
                        : t.transferType == TransferType.wallet
                            ? (transaction.serviceType != 'C' &&
                                transaction.serviceType != 'B')
                            : true)
                .toList()
            ..getRecentTransaction();
          restoreBeneficiaries();

          t
            ..listLoading = false
            ..loading = false
            ..serviceProviders = serviceProviders;
          update();
        }
        break;
      case const (TransactionController):
        if (Get.isRegistered<TransactionController>()) {
          Get.find<TransactionController>()
            ..transactions = transactions
            ..loading = false
            ..update();

          late TransferController tfcntrl;
          if (Get.isRegistered<TransferController>()) {
            tfcntrl = Get.find<TransferController>();
          } else {
            tfcntrl =
                Get.put(TransferController(transferType: TransferType.all));
          }
          tfcntrl
            ..transactions = transactions
            ..getRecentTransaction()
            ..update();
        }
        break;
      case const (BeneficiaryController):
        if (Get.isRegistered<BeneficiaryController>()) {
          Get.find<BeneficiaryController>()
            ..benefs = beneficiaries
            ..loading = false
            ..update();
        }
        if (Get.isRegistered<TransferController>()) {
          restoreBeneficiaries();
          Get.find<TransferController>().update();
        }
        break;
    }
    if (!transactionAndBeneficiaryRetrieved) {
      transactionAndBeneficiaryRetrieved = true;
      update();
    }
  }

  void restoreBeneficiaries() {
    TransferController t;
    if (Get.isRegistered<TransferController>()) {
      t = Get.find<TransferController>();
    } else {
      t = Get.put(TransferController(transferType: TransferType.all));
    }

    t
      ..benefs = beneficiaries
          .where(
            (b) =>
                // (b.serviceType?.Code == 'C' ||
                //         b.serviceType?.Code == 'W')
                //     ? (b.active == 'A')
                //     :
                b.active == 'A' &&
                (Get.find<TransferController>().transferType ==
                        TransferType.cash
                    ? (b.serviceType?.Code == 'C')
                    : Get.find<TransferController>().transferType ==
                            TransferType.wallet
                        ? (b.serviceType?.Code == 'W')
                        : Get.find<TransferController>().transferType ==
                                TransferType.bank
                            ? b.serviceType?.Code == 'B'
                            : true),
          )
          .toList()
      ..filteredBenefs = t.benefs
      ..favBenefs = t.benefs
          .where(
            (b) => (b.active == 'A' && b.fav == 'Y'),
          )
          .toList()
      ..filteredFavBenefs = t.benefs
          .where(
            (b) =>
                // (b.serviceType?.Code == 'C' ||
                //         b.serviceType?.Code == 'W')
                //     ? (b.active == 'A' && b.fav == 'Y')
                //     :
                (b.active == 'A' && b.fav == 'Y') &&
                (Get.find<TransferController>().transferType ==
                        TransferType.cash
                    ? b.serviceType?.Code == 'C'
                    : Get.find<TransferController>().transferType ==
                            TransferType.wallet
                        ? b.serviceType?.Code == 'W'
                        : Get.find<TransferController>().transferType ==
                                TransferType.bank
                            ? b.serviceType?.Code == 'B'
                            : true),
          )
          .toList();
  }

  Future<void> getCustomData(
      {required Type T,
      required DateTime startDate,
      required DateTime endDate}) async {
    if (T == TransactionController) {
      await getTransactions(startDate: startDate, endDate: endDate);
    }
    switch (T) {
      case const (TransferController):
        if (Get.isRegistered<TransferController>()) {
          TransferController t = Get.find<TransferController>();
          Get.find<TransferController>()
            ..transactions = transactions
                .where((transaction) => t.transferType == TransferType.bank
                    ? transaction.serviceType == 'B'
                    : t.transferType == TransferType.cash
                        ? transaction.serviceType == 'C'
                        : t.transferType == TransferType.wallet
                            ? transaction.serviceType == 'W'
                            : true)
                .toList()
            ..benefs = beneficiaries
                .where(
                  (b) => (b.serviceType?.Code == 'C' ||
                          b.serviceType?.Code == 'W')
                      ? (b.active == 'A' && b.isCorrespondentActive == 'Y')
                      : b.active == 'A' &&
                          (Get.find<TransferController>().transferType ==
                                  TransferType.cash
                              ? (b.serviceType?.Code == 'C')
                              : Get.find<TransferController>().transferType ==
                                      TransferType.wallet
                                  ? (b.serviceType?.Code == 'W')
                                  : Get.find<TransferController>()
                                              .transferType ==
                                          TransferType.bank
                                      ? b.serviceType?.Code == 'B'
                                      : true),
                )
                .toList()
            ..filteredBenefs = t.benefs
            ..favBenefs = t.benefs
                .where(
                  (b) =>
                      (b.serviceType?.Code == 'C' || b.serviceType?.Code == 'W')
                          ? (b.active == 'A' &&
                              b.isCorrespondentActive == 'Y' &&
                              b.fav == 'Y')
                          : (b.active == 'A' && b.fav == 'Y'),
                )
                .toList()
            ..filteredFavBenefs = t.benefs
                .where(
                  (b) => (b.serviceType?.Code == 'C' ||
                          b.serviceType?.Code == 'W')
                      ? (b.active == 'A' &&
                          b.isCorrespondentActive == 'Y' &&
                          b.fav == 'Y')
                      : (b.active == 'A' && b.fav == 'Y') &&
                          (Get.find<TransferController>().transferType ==
                                  TransferType.cash
                              ? b.serviceType?.Code == 'C'
                              : Get.find<TransferController>().transferType ==
                                      TransferType.wallet
                                  ? b.serviceType?.Code == 'W'
                                  : Get.find<TransferController>()
                                              .transferType ==
                                          TransferType.bank
                                      ? b.serviceType?.Code == 'B'
                                      : true),
                )
                .toList()
            ..listLoading = false
            ..loading = false
            ..serviceProviders = serviceProviders;
        }
        break;
      case const (TransactionController):
        if (Get.isRegistered<TransactionController>()) {
          Get.find<TransactionController>()
            ..transactions = transactions
            ..loading = false;
        }
        break;
    }
  }

  Future<void> getAllData() async {
    Get.find<AccountController>()
      ..loading = true
      ..update();

    await Future.wait(
      beforeLogin
          ? [
              getCurrencies(),
              getPromotions(),
              getNews(),
              getNotifications(),
              getNationalities()
            ]
          : [
              getCurrencies(),
              getPromotions(),
              getNews(),
              getNotifications(),
              getNationalities()
            ],
    );
    dataRetrieved = true;
    update();
    if (!Get.isRegistered<MainController>()) {
      Get.put(MainController(), permanent: true);
    }
    // await oneUnitRate();

    Get.find<AccountController>()
      ..currencies = currencies
      ..remittanceAttributes.fromCurrency =
          currencies.firstWhereOrNull((c) => c.Code == APIConstants.currency)
      ..remittanceAttributes.toCurrency = currencies.firstOrNull
      ..forexAttributes.fromCurrency =
          currencies.firstWhereOrNull((c) => c.Code == APIConstants.currency)
      ..forexAttributes.toCurrency = currencies.firstOrNull
      ..loading = false
      ..update();
  }

  Future<void> getSignUpParameters() async {
    if (countries.isEmpty || nationalities.isEmpty || ids.isEmpty) {}

    Get.find<SignUpController>()
      ..countries = countries
      ..nationalities = nationalities
      // ..masterReferral = masterReferral
      ..ids = ids
      ..professions = professions
      ..emirates = emirates
      ..signUpAttributes.id = null;
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) => Get.find<SignUpController>().update(),
    );
  }

  @override
  void onInit() async {
    await getAllData();
    analytics.setAnalyticsCollectionEnabled(true);
    super.onInit();
  }

  String formattedDateTime({required String dateTime}) {
    var myDate = DateTime.parse(dateTime);
    var myDateFormat = DateFormat('dd-MMM-yyyy hh:mm aaa');
    return myDateFormat.format(myDate);
  }
}
