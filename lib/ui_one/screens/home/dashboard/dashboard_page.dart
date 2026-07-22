import 'package:mobiremit/ui_one/shimmers/news_content_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:marquee/marquee.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_one_custom_widgets.dart';
import '../../../../core/exports/ui_one_pages.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../core/flavours/constants.dart';
import '../app_drawer/prelogin/pre_login_ratecard.dart';
import '../benefciary/beneficiary_tile3.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoutes.getPage(AppRoutes.dashboard);
  }
}

class DashboardPageDefault extends StatelessWidget {
  const DashboardPageDefault({super.key});

  @override
  Widget build(BuildContext context) {
    void scrollToBottom(ScrollController mainScrollController) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mainScrollController.hasClients) {
          Future.delayed(
            Duration(milliseconds: 100),
            () {
              mainScrollController.animateTo(
                mainScrollController.position.maxScrollExtent,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
          );
        }
      });
    }

    final companyLogo = Base64Image(
      image: Box3.companyLogo,
      // fit: BoxFit.cover,
    );

    return GetBuilder<MainController>(builder: (mainController) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        final destination =
            Get.find<AccountController>().consumePostLoginDestination();
        if (destination == null) return;

        if (destination == 'send_money') {
          if (Get.isRegistered<TransferController>()) {
            Get.find<TransferController>().reset(t: TransferType.all);
          } else {
            Get.put(TransferController(transferType: TransferType.all),
                permanent: true);
          }
          Get.find<TransferController>().toAmtCur =
              Get.find<AccountController>().toCur?.Code;
          mainController.push(
            AppConfigs.sendMoney(key: UniqueKey()),
            AppBars.sendMoney,
          );
          return;
        }

        if (destination == 'my_transactions') {
          if (Get.isRegistered<TransactionController>()) {
            Get.delete<TransactionController>();
          }
          Get.put(TransactionController()).loading = true;
          mainController.push(
            const MyTransactionsPage(),
            AppBars.myTransaction,
          );
          await Get.find<DataController>().getData(BeneficiaryController);
          return;
        }

        if (destination == 'my_beneficiary') {
          final dataController = Get.find<DataController>();
          if (Get.isRegistered<BeneficiaryController>()) {
            Get.delete<BeneficiaryController>();
          }
          if (Get.isRegistered<AddBeneficiaryController>()) {
            Get.delete<AddBeneficiaryController>();
          }
          Get.put(BeneficiaryController()).loading = true;
          Get.put(AddBeneficiaryController());
          mainController.push(
            AppRoutes.getPage(AppRoutes.myBeneficiary),
            AppBars.myBeneficiary,
          );
          await dataController.getData(BeneficiaryController);
        }
      });

      List<Widget> tiles = [];
      String featureString = Box3.settings.enableUTILITY;
      List<String> utilityTypes = [];
      if (featureString.isNotEmpty == true) {
        String featureData = featureString.toLowerCase();
        utilityTypes = featureData.split(",");

        final Map<String, Widget> utilityMap = {
          "mobile": dashtile2(SvgIcons.recharge, 'Mobile'.tr,
              page: const PayBillPage()),
          "dth": dashtile2(SvgIcons.dth, 'DTH'.tr,
              page: const PayBillPage(), b: BillType.dth),
          "wifi": dashtile2(SvgIcons.wifi, 'WiFi'.tr,
              page: const PayBillPage(), b: BillType.wifi),
          "gas": dashtile2(SvgIcons.gas, 'Gas'.tr,
              page: const PayBillPage(), b: BillType.gas),
          "electricity": dashtile2(SvgIcons.electricity, 'Electricity'.tr,
              page: const PayBillPage(), b: BillType.elec),
          "rent": dashtile2(SvgIcons.rent, 'Rent'.tr, page: const PayBillPage()),
          "education": dashtile2(SvgIcons.education, 'Education'.tr,
              page: const PayBillPage()),
          "credit card": dashtile2(SvgIcons.creditCard, 'Credit_card'.tr,
              page: const PayBillPage()),
          "water":
              dashtile2(SvgIcons.water, 'Water'.tr, page: const PayBillPage()),
        };

        for (var type in utilityTypes) {
          final trimmedType = type.trim();
          if (utilityMap.containsKey(trimmedType)) {
            tiles.add(utilityMap[trimmedType]!);
          }
        }
      }
      Column tileColumn(int i) {
        return Column(
          children: [
            tiles.length > i ? tiles[i] : const SizedBox(),
            const SizedBox(height: 18),
            tiles.length > i + 4 ? tiles[i + 4] : const SizedBox(),
          ],
        );
      }

      return Scaffold(
        backgroundColor: mainController.isDark ? Colors.black : Colors.white,
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Expanded(
                    child:
                        // mainController.loading
                        //     ? loader()
                        //     : mainController.benefs.isNotEmpty
                        //         ? ListView.builder(
                        //             physics: const ClampingScrollPhysics(),
                        //             itemCount: mainController.benefs.length,
                        //             itemBuilder: (c, i) => beneficiaryTile3(
                        //                 b: mainController.benefs[i],
                        //                 index: Get.find<DataController>()
                        //                     .beneficiaries
                        //                     .indexOf(mainController.benefs[i]),
                        //                 moveToTransaction: true))
                        //         :
                        KeyboardActions(
                      // isDialog: widget.isDialog,
                      config:
                          Get.find<MainController>().keyboardConfig(context),
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        controller: mainController.scrollController,
                        children: [
                          Center(
                            child: Stack(
                              children: [
                                Container(
                                  height: 295,
                                  // padding: const EdgeInsets.only(top: 32),
                                  padding: const EdgeInsets.only(top: 6),
                                  decoration: BoxDecoration(
                                      color: AppConfigs.primaryColor
                                          .withOpacity(0.2),
                                      borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(5))),
                                  child: Column(
                                    children: [
                                      Container(
                                        color: Colors.transparent,
                                        child: dashProfileTile(
                                          onTap: () => mainController.push(
                                              const MyProfilePage(),
                                              AppBars.myProfile),
                                          isDark: mainController.isDark,
                                          image: Get.find<DataController>()
                                              .customerImage,
                                          c1: const Color(0xFF141414),
                                          c2: AppConfigs.g4,
                                        ),
                                      ),

                                      // Row(
                                      //   children: [
                                      //     const Spacer(),
                                      //     HyperLinkButton(
                                      //       'Track Remittance'.tr,
                                      //       padding: const EdgeInsets.only(right: 15),
                                      //       onTap: () async {
                                      //         if (Get.isRegistered<TransactionController>()) {
                                      //           Get.delete<TransactionController>();
                                      //         }
                                      //         Get.put(TransactionController()).loading = true;
                                      //         mainController.push(
                                      //            TrackTransactionsPage(),
                                      //           AppBars.trackTransaction,
                                      //         );
                                      //         await Get.find<DataController>().getData(BeneficiaryController);
                                      //       },
                                      //     ),
                                      //   ],
                                      // ),
                                      // Container(
                                      //   margin: EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 0),
                                      //   child:
                                      // ),
                                      // const SizedBox(height: 35),
                                      // const SizedBox(height: 12),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            dashtile2(
                                              SvgIcons.sendMoney,
                                              cms(Fields
                                                      .QuickAccess_SendMoneyIconAndText)
                                                  .textHeading!
                                                  .split(' ')
                                                  .join('\n'),
                                              onTap: () {
                                                late final SignUpController
                                                    signupController;
                                                if (Get.isRegistered<
                                                    SignUpController>()) {
                                                  signupController = Get.find<
                                                      SignUpController>();
                                                } else {
                                                  signupController = Get.put(
                                                      SignUpController());
                                                }
                                                if (Box3.idExpired) {
                                                  signupController
                                                      .showIDExpiredAlert();
                                                } else if (Box3.fetchUAEPassDoc
                                                            ?.visualizationExpiry
                                                            ?.toLocal() !=
                                                        null &&
                                                    Box3.fetchUAEPassDoc
                                                            ?.reqAuthorized ==
                                                        'I') {
                                                  AccountController a =
                                                      Get.find<
                                                          AccountController>();
                                                  if (a.contactUs == null) {
                                                    a.getContactUs();
                                                  }
                                                  if (!Get.isRegistered<
                                                      KycController>()) {
                                                    Get.put(KycController());
                                                  }
                                                  var expDate = Box3
                                                      .fetchUAEPassDoc
                                                      ?.visualizationExpiry
                                                      ?.toLocal();
                                                  int expiryDays = (DateTime(
                                                              expDate!.year,
                                                              expDate.month,
                                                              expDate.day,
                                                              expDate.hour,
                                                              expDate.minute)
                                                          .toLocal())
                                                      .difference(DateTime(
                                                              DateTime.now()
                                                                  .year,
                                                              DateTime.now()
                                                                  .month,
                                                              DateTime.now()
                                                                  .day,
                                                              DateTime.now()
                                                                  .hour,
                                                              DateTime.now()
                                                                  .minute)
                                                          .toLocal())
                                                      .inHours;

                                                  Get.put(AccountController());

                                                  if (expiryDays <= 0) {
                                                    if (Get.currentRoute !=
                                                        AppRoutes
                                                            .visualizationRetryRoutes) {
                                                      Get.to(
                                                          const RetryVisualization(),
                                                          arguments: {
                                                            "msg":
                                                                'There was an error while fetching your documents from UAE PASS. Please retry'
                                                                    .tr,
                                                            "type": 'P',
                                                            "isFrom": 'Dash'
                                                          });
                                                    }
                                                  } else {
                                                    Get.dialog(updateProfileBody(
                                                        msg:
                                                            'Your request/application is under process. We will get back to you within 24 hours'
                                                                .tr,
                                                        type: 'P'));
                                                  }
                                                } else if ((Box3.fetchUAEPassDoc
                                                            ?.visualizationExpiry ==
                                                        null) &&
                                                    Box3.fetchUAEPassDoc
                                                            ?.reqAuthorized ==
                                                        'N') {
                                                  AccountController a =
                                                      Get.find<
                                                          AccountController>();
                                                  if (a.contactUs == null) {
                                                    a.getContactUs();
                                                  }
                                                  if (!Get.isRegistered<
                                                      KycController>()) {
                                                    Get.put(KycController());
                                                  }

                                                  Get.put(AccountController());

                                                  if (Get.currentRoute !=
                                                      AppRoutes
                                                          .visualizationRetryRoutes) {
                                                    Get.to(
                                                        const RetryVisualization(),
                                                        arguments: {
                                                          "msg":
                                                              'There was an error while fetching your documents from UAE PASS. Please retry'
                                                                  .tr,
                                                          "type": 'P',
                                                          "isFrom": 'Dash'
                                                        });
                                                  }
                                                } else {
                                                  if (Get.isRegistered<
                                                      TransferController>()) {
                                                    Get.find<
                                                            TransferController>()
                                                        .reset(
                                                            t: TransferType
                                                                .all);
                                                  } else {
                                                    Get.put(
                                                        TransferController(
                                                            transferType:
                                                                TransferType
                                                                    .all),
                                                        permanent: true);
                                                  }
                                                  Get.find<TransferController>()
                                                      .toAmtCur = Get.find<
                                                          AccountController>()
                                                      .toCur
                                                      ?.Code;
                                                  mainController.push(
                                                      AppConfigs.sendMoney(
                                                        key: UniqueKey(),
                                                      ),
                                                      AppBars.sendMoney);
                                                }
                                              },
                                            ),
                                            dashtile2(
                                                SvgIcons.myTransaction,
                                                cms(Fields
                                                        .QuickAccess_MyTransactionsIconAndText)
                                                    .textHeading!
                                                    .split(' ')
                                                    .join('\n'),
                                                onTap: () async {
                                              late final SignUpController
                                                  signupController;
                                              if (Get.isRegistered<
                                                  SignUpController>()) {
                                                signupController = Get.find<
                                                    SignUpController>();
                                              } else {
                                                signupController =
                                                    Get.put(SignUpController());
                                              }
                                              if (Box3.idExpired) {
                                                signupController
                                                    .showIDExpiredAlert();
                                              } else if ((Box3.fetchUAEPassDoc
                                                          ?.visualizationExpiry ==
                                                      null) &&
                                                  Box3.fetchUAEPassDoc
                                                          ?.reqAuthorized ==
                                                      'N') {
                                                AccountController a = Get.find<
                                                    AccountController>();
                                                if (a.contactUs == null) {
                                                  a.getContactUs();
                                                }
                                                if (!Get.isRegistered<
                                                    KycController>()) {
                                                  Get.put(KycController());
                                                }

                                                Get.put(AccountController());

                                                if (Get.currentRoute !=
                                                    AppRoutes
                                                        .visualizationRetryRoutes) {
                                                  Get.to(
                                                      const RetryVisualization(),
                                                      arguments: {
                                                        "msg":
                                                            'There was an error while fetching your documents from UAE PASS. Please retry'
                                                                .tr,
                                                        "type": 'P',
                                                        "isFrom": 'Dash'
                                                      });
                                                }
                                              } else {
                                                if (Get.isRegistered<
                                                    TransactionController>()) {
                                                  Get.delete<
                                                      TransactionController>();
                                                }
                                                Get.put(TransactionController())
                                                    .loading = true;
                                                mainController.push(
                                                  const MyTransactionsPage(),
                                                  AppBars.myTransaction,
                                                );
                                                await Get.find<DataController>()
                                                    .getData(
                                                        BeneficiaryController);
                                              }
                                            }),
                                            dashtile2(
                                                SvgIcons.myBeneficiary,
                                                cms(Fields
                                                        .QuickAccess_MyBeneficiaryIconAndText)
                                                    .textHeading!
                                                    .split(' ')
                                                    .join('\n'),
                                                onTap: () async {
                                              late final SignUpController
                                                  signupController;
                                              if (Get.isRegistered<
                                                  SignUpController>()) {
                                                signupController = Get.find<
                                                    SignUpController>();
                                              } else {
                                                signupController =
                                                    Get.put(SignUpController());
                                              }
                                              if (Box3.idExpired) {
                                                signupController
                                                    .showIDExpiredAlert();
                                              } else if (Box3.fetchUAEPassDoc
                                                          ?.visualizationExpiry
                                                          ?.toLocal() !=
                                                      null &&
                                                  Box3.fetchUAEPassDoc
                                                          ?.reqAuthorized ==
                                                      'I') {
                                                AccountController a = Get.find<
                                                    AccountController>();
                                                if (a.contactUs == null) {
                                                  a.getContactUs();
                                                }
                                                if (!Get.isRegistered<
                                                    KycController>()) {
                                                  Get.put(KycController());
                                                }
                                                Get.put(AccountController());

                                                var expDate = Box3
                                                    .fetchUAEPassDoc
                                                    ?.visualizationExpiry
                                                    ?.toLocal();
                                                int expiryDays = (DateTime(
                                                            expDate!.year,
                                                            expDate.month,
                                                            expDate.day,
                                                            expDate.hour,
                                                            expDate.minute)
                                                        .toLocal())
                                                    .difference(DateTime(
                                                            DateTime.now().year,
                                                            DateTime.now()
                                                                .month,
                                                            DateTime.now().day,
                                                            DateTime.now().hour,
                                                            DateTime.now()
                                                                .minute)
                                                        .toLocal())
                                                    .inMinutes;

                                                Get.put(AccountController());

                                                if (expiryDays <= 0) {
                                                  if (Get.currentRoute !=
                                                      AppRoutes
                                                          .visualizationRetryRoutes) {
                                                    Get.to(
                                                        const RetryVisualization(),
                                                        arguments: {
                                                          "msg":
                                                              'There was an error while fetching your documents from UAE PASS. Please retry'
                                                                  .tr,
                                                          "type": 'P',
                                                          "isFrom": 'Dash'
                                                        });
                                                  }
                                                } else {
                                                  Get.dialog(updateProfileBody(
                                                      msg:
                                                          'Your request/application is under process. We will get back to you within 24 hours'
                                                              .tr,
                                                      type: 'P'));
                                                }
                                              } else if ((Box3.fetchUAEPassDoc
                                                          ?.visualizationExpiry ==
                                                      null) &&
                                                  Box3.fetchUAEPassDoc
                                                          ?.reqAuthorized ==
                                                      'N') {
                                                AccountController a = Get.find<
                                                    AccountController>();
                                                if (a.contactUs == null) {
                                                  a.getContactUs();
                                                }
                                                if (!Get.isRegistered<
                                                    KycController>()) {
                                                  Get.put(KycController());
                                                }

                                                Get.put(AccountController());

                                                if (Get.currentRoute !=
                                                    AppRoutes
                                                        .visualizationRetryRoutes) {
                                                  Get.to(
                                                      const RetryVisualization(),
                                                      arguments: {
                                                        "msg":
                                                            'There was an error while fetching your documents from UAE PASS. Please retry'
                                                                .tr,
                                                        "type": 'P',
                                                        "isFrom": 'Dash'
                                                      });
                                                }
                                              } else {
                                                DataController d =
                                                    Get.find<DataController>();
                                                if (Get.isRegistered<
                                                    BeneficiaryController>()) {
                                                  Get.delete<
                                                      BeneficiaryController>();
                                                }
                                                if (Get.isRegistered<
                                                    AddBeneficiaryController>()) {
                                                  Get.delete<
                                                      AddBeneficiaryController>();
                                                }
                                                Get.put(BeneficiaryController())
                                                    .loading = true;
                                                Get.put(
                                                    AddBeneficiaryController());
                                                mainController.push(
                                                  AppRoutes.getPage(
                                                      AppRoutes.myBeneficiary),
                                                  AppBars.myBeneficiary,
                                                );
                                                await d.getData(
                                                    BeneficiaryController);
                                              }
                                            }),
                                            dashtile2(
                                              SvgIcons.forexRate,
                                              cms(Fields
                                                      .QuickAccess_ForexRatesIconAndText)
                                                  .textHeading!
                                                  .split(' ')
                                                  .join('\n'),
                                              onTap: () {
                                                mainController.push(
                                                    const ForexRatesPage(),
                                                    AppBars.forexRates);
                                              },
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                preLoginRateCard(
                                    top: 182, height: 238, myContext: context),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Visibility(
                            visible: tiles.isNotEmpty,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          cms(Fields
                                                  .Dashboard_utilitiesHeaderText)
                                              .textHeading!,
                                          style: TS.f18.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: mainController.isDark
                                                ? AppConfigs.primaryColor
                                                : AppConfigs.g4,
                                          )),
                                      Visibility(
                                        visible: tiles.length == 9,
                                        child: GestureDetector(
                                          onTap: () {
                                            // Get.put(BillPayController());
                                            // mainController.push(
                                            //     const BillRechargeMorePage(),
                                            //     AppBars.billRechargeMore);
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                border: Border(
                                                    bottom: BorderSide(
                                                        color: AppConfigs
                                                            .primaryColor))),
                                            child: Text(
                                              'view_more'.tr,
                                              style: TextStyles.font12.copyWith(
                                                  color: mainController.isDark
                                                      ? AppConfigs.w
                                                      : AppConfigs.primaryColor,
                                                  decorationThickness: 5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  // Text(
                                  //     cms(Fields.Utility_HeadingAndDescription)
                                  //         .description!,
                                  //     style: TS.f12.copyWith(
                                  //       color: mainController.isDark
                                  //           ? AppConfigs.primaryColor
                                  //           : AppConfigs.g4,
                                  //     )),
                                  const SizedBox(height: 18),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [0, 1, 2, 3]
                                        .map((e) => tileColumn(e))
                                        .toList(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GetBuilder<DataController>(
                            id: 'Dashboard_Advertisement',
                            builder: (dataCntrl) {
                              if (mainController.loading) {
                                return SizedBox(
                                  height: 170,
                                  width: double.infinity,
                                  child: Opacity(
                                    opacity: 0.2,
                                    child: companyLogo,
                                    // child: Base64Image(
                                    //   image: Box3.companyLogo,
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                );
                              }
                              if ((AppConfigs.fetchNewConfig
                                      ? Box3.settings.enablePromotionPreLogin
                                      : Box3.settings.enablePromotionPreLogin ==
                                          'YesBackend') &&
                                  dataCntrl.promotions.isNotEmpty) {
                                if (dataCntrl.fixedPromotion != null) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(9, 15, 9, 15),
                                    child: AdvertisementBanner(
                                      advertisement: dataCntrl.fixedPromotion!,
                                    ),
                                  );
                                } else {
                                  return CustomCarouselSlider(
                                    accountController: mainController,
                                    promotions: dataCntrl.promotions,
                                  );
                                }
                              }
                              return const SizedBox();
                            },
                          ),
                          const SizedBox(height: 20),

                          // News Banner
                          if (Get.find<DataController>().newsList.isNotEmpty)
                            GetBuilder<DataController>(
                              id: 'Dashboard_news',
                              builder: (controller) {
                                return AnimatedSize(
                                  duration: Duration(milliseconds: 300),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.toggleNewsExpanded();
                                      if (controller.isNewsExpanded.isTrue) {
                                        scrollToBottom(
                                            mainController.scrollController);
                                      }
                                    },
                                    child: Container(
                                      constraints: BoxConstraints(
                                        maxHeight:
                                            controller.isNewsExpanded.isTrue
                                                ? 400
                                                : 70,
                                        minHeight: 70,
                                      ),
                                      color: Colors.black.withOpacity(0.8),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 70,
                                            child: Row(
                                              children: [
                                                // News Icon and Text
                                                Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 8.0),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.newspaper,
                                                          color: Colors.blue),
                                                      SizedBox(width: 8),
                                                      Text(
                                                        "News",
                                                        style: TS.f20.copyWith(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                // Scrolling Marquee for News Titles
                                                if (controller
                                                    .isNewsExpanded.isFalse)
                                                  Expanded(
                                                    child: Marquee(
                                                      text: controller.newsList
                                                          .map((e) => e
                                                              .newsTitle
                                                              .toString())
                                                          .join('   •   '),
                                                      style: TS.f14.copyWith(
                                                          color: AppConfigs.w),
                                                      scrollAxis:
                                                          Axis.horizontal,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      blankSpace: 30.0,
                                                      velocity: 50.0,
                                                      pauseAfterRound:
                                                          Duration(seconds: 1),
                                                      startPadding: 10.0,
                                                      accelerationDuration:
                                                          Duration(seconds: 1),
                                                      decelerationDuration:
                                                          Duration(seconds: 1),
                                                    ),
                                                  ),

                                                IconButton(
                                                  icon: Icon(
                                                    controller.isNewsExpanded
                                                            .isFalse
                                                        ? Icons
                                                            .keyboard_arrow_up
                                                        : Icons
                                                            .keyboard_arrow_down,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: () {
                                                    controller
                                                        .toggleNewsExpanded();
                                                    if (controller
                                                        .isNewsExpanded
                                                        .isTrue) {
                                                      scrollToBottom(
                                                          mainController
                                                              .scrollController);
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                          // News Content (Only when expanded)
                                          if (controller.isNewsExpanded.isTrue)
                                            Expanded(
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  children: List.generate(
                                                    controller.newsList.length,
                                                    (index) {
                                                      final newsItem =
                                                          controller
                                                              .newsList[index];
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                                horizontal:
                                                                    16.0,
                                                                vertical: 4.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const Icon(
                                                                    Icons
                                                                        .fiber_manual_record,
                                                                    color: Colors
                                                                        .blue,
                                                                    size: 10),
                                                                const SizedBox(
                                                                    width: 8),
                                                                Expanded(
                                                                  child: Text(
                                                                    newsItem
                                                                        .newsTitle
                                                                        .toString(),
                                                                    style: TS
                                                                        .f14
                                                                        .copyWith(
                                                                            color:
                                                                                AppConfigs.w),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),

                                                            // Show content or loading indicator
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          18.0,
                                                                      top: 4.0),
                                                              child: controller
                                                                      .isLoadingNewsContent(
                                                                          newsItem
                                                                              .code!)
                                                                  ? NewsContentShimmer()
                                                                  : Html(
                                                                      data: newsItem
                                                                              .newsContent
                                                                              ?.toString() ??
                                                                          "",
                                                                      style: {
                                                                        "body":
                                                                            Style(
                                                                          color:
                                                                              AppConfigs.w,
                                                                          fontSize:
                                                                              FontSize(14.0),
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                        "p":
                                                                            Style(
                                                                          color:
                                                                              AppConfigs.w,
                                                                        ),
                                                                        "span": Style(
                                                                            color:
                                                                                AppConfigs.w),
                                                                        "div": Style(
                                                                            color:
                                                                                AppConfigs.w),
                                                                      },
                                                                    ),
                                                            ),

                                                            // Divider between news items
                                                            const Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 4.0),
                                                              child: Divider(
                                                                color: Colors
                                                                    .white24,
                                                                height: 1,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),

                          // Container(
                          //   height: 70,
                          //   color: Colors.black
                          //       .withOpacity(0.8),
                          //   child: Row(
                          //     children: [
                          //       const Padding(
                          //         padding:
                          //             EdgeInsets.symmetric(
                          //                 horizontal: 8.0),
                          //         child: Icon(
                          //             Icons.newspaper,
                          //             color: Colors.white),
                          //       ),
                          //       Expanded(
                          //         child: Marquee(
                          //           text: Get.find<
                          //                   DataController>()
                          //               .newsList
                          //               .map((e) => e
                          //                   .newsTitle
                          //                   .toString())
                          //               .join(
                          //                   '   •   '), // Join titles with a separator
                          //           style: const TextStyle(
                          //               color:
                          //                   Colors.white),
                          //           scrollAxis:
                          //               Axis.horizontal,
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment
                          //                   .center,
                          //           blankSpace: 30.0,
                          //           velocity: 50.0,
                          //           pauseAfterRound:
                          //               Duration(
                          //                   seconds: 1),
                          //           startPadding: 10.0,
                          //           accelerationDuration:
                          //               Duration(
                          //                   seconds: 1),
                          //           decelerationDuration:
                          //               Duration(
                          //                   seconds: 1),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          const SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// 🔹 SEARCH RESULT OVERLAY
            Obx(() {
              if (mainController.loading) {
                return Positioned.fill(
                  child: Container(
                    color: AppConfigs.bodybg(mainController.isDark),
                    child: loader(),
                  ),
                );
              }
              if (mainController.filteredBenefs.isEmpty &&
                  mainController.dashboardSearch.text.trim().isNotEmpty) {
                return Positioned.fill(
                  child: Container(
                    color: AppConfigs.bodybg(mainController.isDark),
                    child: Center(
                      child: Text(
                        'No results found'.tr,
                        style: TS.f16.copyWith(
                          color: mainController.isDark
                              ? AppConfigs.w
                              : AppConfigs.g4,
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (mainController.filteredBenefs.isEmpty ||
                  mainController.dashboardSearch.text.isEmpty) {
                return const SizedBox.shrink();
              }

              return Positioned.fill(
                child: Container(
                  color: AppConfigs.bodybg(mainController.isDark),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    itemCount: mainController.filteredBenefs.length,
                    itemBuilder: (c, i) => beneficiaryTile3(
                      b: mainController.filteredBenefs[i],
                      index: Get.find<DataController>()
                          .beneficiaries
                          .indexOf(mainController.filteredBenefs[i]),
                      moveToTransaction: true,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      );
    });
  }
}
