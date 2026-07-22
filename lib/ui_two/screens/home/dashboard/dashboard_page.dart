import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';

class DashBoardPageTheme1 extends StatelessWidget {
  const DashBoardPageTheme1({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController mainScrollController = ScrollController();
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
            AppRoutes.getPage(AppRoutes.myTransaction),
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
          "mobile": dashTile2UiTwo(SvgIcons.recharge, 'Mobile'.tr,
              page: const PayBillPage()),
          "dth": dashTile2UiTwo(SvgIcons.dth, 'DTH'.tr,
              page: const PayBillPage(), b: BillType.dth),
          "wifi": dashTile2UiTwo(SvgIcons.wifi, 'WiFi'.tr,
              page: const PayBillPage(), b: BillType.wifi),
          "gas": dashTile2UiTwo(SvgIcons.gas, 'Gas'.tr,
              page: const PayBillPage(), b: BillType.gas),
          "electricity": dashTile2UiTwo(SvgIcons.electricity, 'Electricity'.tr,
              page: const PayBillPage(), b: BillType.elec),
          "rent": dashTile2UiTwo(SvgIcons.rent, 'Rent'.tr,
              page: const PayBillPage()),
          "education": dashTile2UiTwo(SvgIcons.education, 'Education'.tr,
              page: const PayBillPage()),
          "credit card": dashTile2UiTwo(SvgIcons.creditCard, 'Credit_card'.tr,
              page: const PayBillPage()),
          "water": dashTile2UiTwo(SvgIcons.water, 'Water'.tr,
              page: const PayBillPage()),
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

      return KeyboardActions(
        // isDialog: widget.isDialog,
        config: Get.find<MainController>().keyboardConfig(context),
        child: SizedBox(
          height: Get.height - 100,
          child: Stack(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                controller: mainScrollController,
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.transparent,
                              child: dashProfileTileUiTwo(
                                onTap: () => mainController.push(
                                    const MyProfilePage(
                                      fromDashboard: true,
                                    ),
                                    AppBars.myProfile),
                                size: 48,
                                isDark: mainController.isDark,
                                image: Get.find<DataController>().customerImage,
                                c1: const Color(0xFF141414),
                                c2: AppConfigs.g4,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => mainController.push(
                              const AppNotificationPage(),
                              AppBars.notification,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Center(
                                child: Stack(
                                  alignment: Alignment.centerRight,
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: mainController.isDark
                                            ? AppConfigs.g21
                                            : AppConfigs.primaryColor
                                                .withAlpha(30),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12.0),
                                        child: SvgPicture.asset(
                                          ImagePath.notification2,
                                          colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn,
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (Get.find<DataController>()
                                            .notificationCount >
                                        0)
                                      Container(
                                        alignment: Alignment.topRight,
                                        width: 40,
                                        height: 40,
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: Container(
                                          height: 15,
                                          width: 15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(7.5)),
                                            color: AppConfigs.primaryColor,
                                          ),
                                          alignment: Alignment.center,
                                          padding:
                                              const EdgeInsets.only(bottom: 2),
                                          child: Text(
                                            Get.find<DataController>()
                                                .notificationCount
                                                .toString(),
                                            style: TS.f10
                                                .copyWith(color: AppConfigs.w),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    textFormField(
                      hintText: "Search your beneficiary",
                      borderRadius: 50,
                      filledColor: null,
                      border: Border.all(color: AppConfigs.gb0),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SvgPicture.asset(
                          ImagePath.search2,
                          colorFilter: ColorFilter.mode(
                            AppConfigs.primaryColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        dashboardCardTile(
                          name: (cms(Fields.QuickAccess_SendMoneyIconAndText)
                                      .textHeading ??
                                  'send_money'.tr)
                              .split(' ')
                              .join('\n'),
                          icon: SvgIcons.sendMoney2,
                          width: 28,
                          onTap: () {
                            late final SignUpController signupController;
                            if (Get.isRegistered<SignUpController>()) {
                              signupController = Get.find<SignUpController>();
                            } else {
                              signupController = Get.put(SignUpController());
                            }
                            if (Box3.idExpired) {
                              signupController.showIDExpiredAlert();
                            } else if (Box3.fetchUAEPassDoc?.visualizationExpiry
                                        ?.toLocal() !=
                                    null &&
                                Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
                              AccountController a =
                                  Get.find<AccountController>();
                              if (a.contactUs == null) {
                                a.getContactUs();
                              }
                              if (!Get.isRegistered<KycController>()) {
                                Get.put(KycController());
                              }
                              var expDate = Box3
                                  .fetchUAEPassDoc?.visualizationExpiry
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
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          DateTime.now().hour,
                                          DateTime.now().minute)
                                      .toLocal())
                                  .inHours;

                              Get.put(AccountController());

                              if (expiryDays <= 0) {
                                if (Get.currentRoute !=
                                    AppRoutes.visualizationRetryRoutes) {
                                  Get.to(const RetryVisualization(),
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
                            } else if ((Box3
                                        .fetchUAEPassDoc?.visualizationExpiry ==
                                    null) &&
                                Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
                              AccountController a =
                                  Get.find<AccountController>();
                              if (a.contactUs == null) {
                                a.getContactUs();
                              }
                              if (!Get.isRegistered<KycController>()) {
                                Get.put(KycController());
                              }

                              Get.put(AccountController());

                              if (Get.currentRoute !=
                                  AppRoutes.visualizationRetryRoutes) {
                                Get.to(const RetryVisualization(), arguments: {
                                  "msg":
                                      'There was an error while fetching your documents from UAE PASS. Please retry'
                                          .tr,
                                  "type": 'P',
                                  "isFrom": 'Dash'
                                });
                              }
                            } else {
                              if (Get.isRegistered<TransferController>()) {
                                Get.find<TransferController>()
                                    .reset(t: TransferType.all);
                              } else {
                                Get.put(
                                    TransferController(
                                        transferType: TransferType.all),
                                    permanent: true);
                              }
                              Get.find<TransferController>().toAmtCur =
                                  Get.find<AccountController>().toCur?.Code;
                              mainController.push(
                                  AppConfigs.sendMoney(
                                    key: UniqueKey(),
                                  ),
                                  AppBars.sendMoney);
                            }
                          },
                        ),
                        dashboardCardTile(
                          name:
                              (cms(Fields.QuickAccess_MyTransactionsIconAndText)
                                          .textHeading ??
                                      'my_transaction'.tr)
                                  .split(' ')
                                  .join('\n'),
                          icon: SvgIcons.transferHistory,
                          width: 28,
                          onTap: () async {
                            late final SignUpController signupController;
                            if (Get.isRegistered<SignUpController>()) {
                              signupController = Get.find<SignUpController>();
                            } else {
                              signupController = Get.put(SignUpController());
                            }
                            if (Box3.idExpired) {
                              signupController.showIDExpiredAlert();
                            } else if ((Box3
                                        .fetchUAEPassDoc?.visualizationExpiry ==
                                    null) &&
                                Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
                              AccountController a =
                                  Get.find<AccountController>();
                              if (a.contactUs == null) {
                                a.getContactUs();
                              }
                              if (!Get.isRegistered<KycController>()) {
                                Get.put(KycController());
                              }

                              Get.put(AccountController());

                              if (Get.currentRoute !=
                                  AppRoutes.visualizationRetryRoutes) {
                                Get.to(const RetryVisualization(), arguments: {
                                  "msg":
                                      'There was an error while fetching your documents from UAE PASS. Please retry'
                                          .tr,
                                  "type": 'P',
                                  "isFrom": 'Dash'
                                });
                              }
                            } else {
                              if (Get.isRegistered<TransactionController>()) {
                                Get.delete<TransactionController>();
                              }
                              Get.put(TransactionController()).loading = true;
                              mainController.push(
                                AppRoutes.getPage(AppRoutes.myTransaction),
                                AppBars.myTransaction,
                              );
                              await Get.find<DataController>()
                                  .getData(BeneficiaryController);
                            }
                          },
                        ),
                        dashboardCardTile(
                          name:
                              (cms(Fields.QuickAccess_MyBeneficiaryIconAndText)
                                          .textHeading ??
                                      'my_beneficiary')
                                  .tr
                                  .split(' ')
                                  .join('\n'),
                          icon: SvgIcons.beneficiary,
                          width: 28,
                          onTap: () async {
                            late final SignUpController signupController;
                            if (Get.isRegistered<SignUpController>()) {
                              signupController = Get.find<SignUpController>();
                            } else {
                              signupController = Get.put(SignUpController());
                            }
                            if (Box3.idExpired) {
                              signupController.showIDExpiredAlert();
                            } else if (Box3.fetchUAEPassDoc?.visualizationExpiry
                                        ?.toLocal() !=
                                    null &&
                                Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
                              AccountController a =
                                  Get.find<AccountController>();
                              if (a.contactUs == null) {
                                a.getContactUs();
                              }
                              if (!Get.isRegistered<KycController>()) {
                                Get.put(KycController());
                              }
                              Get.put(AccountController());

                              var expDate = Box3
                                  .fetchUAEPassDoc?.visualizationExpiry
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
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          DateTime.now().hour,
                                          DateTime.now().minute)
                                      .toLocal())
                                  .inMinutes;

                              Get.put(AccountController());

                              if (expiryDays <= 0) {
                                if (Get.currentRoute !=
                                    AppRoutes.visualizationRetryRoutes) {
                                  Get.to(const RetryVisualization(),
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
                            } else if ((Box3
                                        .fetchUAEPassDoc?.visualizationExpiry ==
                                    null) &&
                                Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
                              AccountController a =
                                  Get.find<AccountController>();
                              if (a.contactUs == null) {
                                a.getContactUs();
                              }
                              if (!Get.isRegistered<KycController>()) {
                                Get.put(KycController());
                              }

                              Get.put(AccountController());

                              if (Get.currentRoute !=
                                  AppRoutes.visualizationRetryRoutes) {
                                Get.to(const RetryVisualization(), arguments: {
                                  "msg":
                                      'There was an error while fetching your documents from UAE PASS. Please retry'
                                          .tr,
                                  "type": 'P',
                                  "isFrom": 'Dash'
                                });
                              }
                            } else {
                              DataController d = Get.find<DataController>();
                              if (Get.isRegistered<BeneficiaryController>()) {
                                Get.delete<BeneficiaryController>();
                              }
                              if (Get.isRegistered<
                                  AddBeneficiaryController>()) {
                                Get.delete<AddBeneficiaryController>();
                              }
                              Get.put(BeneficiaryController()).loading = true;
                              Get.put(AddBeneficiaryController());
                              mainController.push(
                                AppRoutes.getPage(AppRoutes.myBeneficiary),
                                AppBars.myBeneficiary,
                              );
                              await d.getData(BeneficiaryController);
                            }
                          },
                        ),
                        dashboardCardTile(
                          name: (cms(Fields.QuickAccess_ForexRatesIconAndText)
                                      .textHeading ??
                                  'forex_rates'.tr)
                              .split(' ')
                              .join('\n'),
                          icon: SvgIcons.forexRate2,
                          width: 28,
                          onTap: () {
                            mainController.push(
                                AppRoutes.getPage(AppRoutes.forexRates),
                                AppBars.forexRates);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    const SizedBox(height: 8),
                    Visibility(
                      visible: tiles.isNotEmpty,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                    cms(Fields.Dashboard_utilitiesHeaderText)
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [0, 1, 2, 3]
                                  .map((e) => tileColumn(e))
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Text(
                            cms(Fields.SendMoney_RecentTransaction)
                                .textHeading!,
                            style: TS.f18.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<TransactionController>(
                            builder: (transactionController) {
                          return Wrap(
                            spacing: 0,
                            runSpacing: 20,
                            children: List.generate(
                              transactionController.transactions.length > 8
                                  ? 8
                                  : transactionController.transactions.length,
                              (i) => dashboardCardTile(
                                  name: transactionController
                                          .transactions[i].beneficiaryName ??
                                      "",
                                  icon: transactionController
                                              .transactions[i].serviceType ==
                                          'B'
                                      ? SvgIcons.bankTransfer
                                      : transactionController.transactions[i]
                                                  .serviceType ==
                                              'C'
                                          ? SvgIcons.cashTransfer
                                          : SvgIcons.mobileWallet,
                                  width: 28,
                                  onTap: () {}),
                            ),
                          );
                        })
                      ],
                    ),
                    // promotion banner
                    SizedBox(height: 20),
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
                    // if (Get.find<DataController>().newsList.isNotEmpty)
                    //   GetBuilder<DataController>(
                    //     id: 'Dashboard_news',
                    //     builder: (controller) {
                    //       return AnimatedSize(
                    //         duration: Duration(milliseconds: 300),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             controller.toggleNewsExpanded();
                    //             if (controller.isNewsExpanded.isTrue) {
                    //               scrollToBottom(mainController.scrollController);
                    //             }
                    //           },
                    //           child: Container(
                    //             constraints: BoxConstraints(
                    //               maxHeight: controller.isNewsExpanded.isTrue ? 400 : 70,
                    //               minHeight: 70,
                    //             ),
                    //             color: Colors.black.withOpacity(0.8),
                    //             child: Column(
                    //               children: [
                    //                 SizedBox(
                    //                   height: 70,
                    //                   child: Row(
                    //                     children: [
                    //                       // News Icon and Text
                    //                       Padding(
                    //                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    //                         child: Row(
                    //                           children: [
                    //                             Icon(Icons.newspaper, color: Colors.blue),
                    //                             SizedBox(width: 8),
                    //                             Text(
                    //                               "News",
                    //                               style: TS.f20.copyWith(
                    //                                 color: Colors.blue,
                    //                                 fontWeight: FontWeight.bold,
                    //                               ),
                    //                             ),
                    //                           ],
                    //                         ),
                    //                       ),
                    //
                    //                       // Scrolling Marquee for News Titles
                    //                       if (controller.isNewsExpanded.isFalse)
                    //                         Expanded(
                    //                           child: Marquee(
                    //                             text: controller.newsList.map((e) => e.newsTitle.toString()).join('   •   '),
                    //                             style: TS.f14.copyWith(color: AppConfigs.w),
                    //                             scrollAxis: Axis.horizontal,
                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                    //                             blankSpace: 30.0,
                    //                             velocity: 50.0,
                    //                             pauseAfterRound: Duration(seconds: 1),
                    //                             startPadding: 10.0,
                    //                             accelerationDuration: Duration(seconds: 1),
                    //                             decelerationDuration: Duration(seconds: 1),
                    //                           ),
                    //                         ),
                    //
                    //                       IconButton(
                    //                         icon: Icon(
                    //                           controller.isNewsExpanded.isFalse ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    //                           color: Colors.white,
                    //                         ),
                    //                         onPressed: () {
                    //                           controller.toggleNewsExpanded();
                    //                           if (controller.isNewsExpanded.isTrue) {
                    //                             scrollToBottom(mainController.scrollController);
                    //                           }
                    //                         },
                    //                       ),
                    //                     ],
                    //                   ),
                    //                 ),
                    //                 // News Content (Only when expanded)
                    //                 if (controller.isNewsExpanded.isTrue)
                    //                   Expanded(
                    //                     child: SingleChildScrollView(
                    //                       child: Column(
                    //                         children: List.generate(
                    //                           controller.newsList.length,
                    //                           (index) {
                    //                             final newsItem = controller.newsList[index];
                    //                             return Padding(
                    //                               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                    //                               child: Column(
                    //                                 crossAxisAlignment: CrossAxisAlignment.start,
                    //                                 children: [
                    //                                   Row(
                    //                                     children: [
                    //                                       const Icon(Icons.fiber_manual_record, color: Colors.blue, size: 10),
                    //                                       const SizedBox(width: 8),
                    //                                       Expanded(
                    //                                         child: Text(
                    //                                           newsItem.newsTitle.toString(),
                    //                                           style: TS.f14.copyWith(color: AppConfigs.w),
                    //                                         ),
                    //                                       ),
                    //                                     ],
                    //                                   ),
                    //
                    //                                   // Show content or loading indicator
                    //                                   Padding(
                    //                                     padding: const EdgeInsets.only(left: 18.0, top: 4.0),
                    //                                     child: controller.isLoadingNewsContent(newsItem.code!)
                    //                                         ? NewsContentShimmer()
                    //                                         : Html(
                    //                                             data: newsItem.newsContent?.toString() ?? "",
                    //                                             style: {
                    //                                               "body": Style(
                    //                                                 color: AppConfigs.w,
                    //                                                 fontSize: FontSize(14.0),
                    //                                                 fontWeight: FontWeight.w500,
                    //                                               ),
                    //                                               "p": Style(
                    //                                                 color: AppConfigs.w,
                    //                                               ),
                    //                                               "span": Style(color: AppConfigs.w),
                    //                                               "div": Style(color: AppConfigs.w),
                    //                                             },
                    //                                           ),
                    //                                   ),
                    //
                    //                                   // Divider between news items
                    //                                   const Padding(
                    //                                     padding: EdgeInsets.only(top: 4.0),
                    //                                     child: Divider(
                    //                                       color: Colors.white24,
                    //                                       height: 1,
                    //                                     ),
                    //                                   ),
                    //                                 ],
                    //                               ),
                    //                             );
                    //                           },
                    //                         ),
                    //                       ),
                    //                     ),
                    //                   ),
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    const SizedBox(height: 200)
                  ],
                ),
              ),
              preLoginRateCardTheme1(myContext: context, preLogin: false),
            ],
          ),
        ),
      );
    });
  }
}
