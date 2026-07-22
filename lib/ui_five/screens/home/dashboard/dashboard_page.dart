import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/core/exports/controllers.dart';

import '../../../../core/exports/ui_five_custom_widgets.dart';
import '../../../../core/exports/ui_five_pages.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../core/flavours/constants.dart';
import '../app_drawer/prelogin/pre_login_ratecard.dart';

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
          "rent":
              dashtile2(SvgIcons.rent, 'Rent'.tr, page: const PayBillPage()),
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
            const SizedBox(height: 12),
            tiles.length > i + 4 ? tiles[i + 4] : const SizedBox(),
          ],
        );
      }

      return Scaffold(
        backgroundColor: mainController.isDark ? Colors.black : Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: mainController.isDark
              ? const Color(0xFF0B0F1E)
              : AppConfigs.primaryColor.withOpacity(0.09),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    Expanded(
                      child: KeyboardActions(
                        // isDialog: widget.isDialog,
                        config:
                            Get.find<MainController>().keyboardConfig(context),
                        child: ListView(
                          physics: const ClampingScrollPhysics(),
                          controller: mainController.scrollController,
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 20),
                              decoration: BoxDecoration(
                                gradient: mainController.isDark
                                    ? LinearGradient(
                                        colors: [
                                          Color(0xFF0A1932),
                                          const Color(0xFF080E1C),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : null,
                                color: mainController.isDark
                                    ? null
                                    : AppConfigs.primaryColor,
                                borderRadius: mainController.isDark
                                    ? null
                                    : const BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                              ),
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
                                  const SizedBox(height: 10),
                                  preLoginRateCard(
                                      top: 4, height: 238, myContext: context),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: mainController.isDark ? 10 : 30),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dashtile2(
                                    SvgIcons.sendMoney2,
                                    cms(Fields.QuickAccess_SendMoneyIconAndText)
                                        .textHeading!
                                        .split(' ')
                                        .join('\n'),
                                    onTap: () {
                                      late final SignUpController
                                          signupController;
                                      if (Get.isRegistered<
                                          SignUpController>()) {
                                        signupController =
                                            Get.find<SignUpController>();
                                      } else {
                                        signupController =
                                            Get.put(SignUpController());
                                      }
                                      if (Box3.idExpired) {
                                        signupController.showIDExpiredAlert();
                                      } else if (Box3.fetchUAEPassDoc
                                                  ?.visualizationExpiry
                                                  ?.toLocal() !=
                                              null &&
                                          Box3.fetchUAEPassDoc?.reqAuthorized ==
                                              'I') {
                                        AccountController a =
                                            Get.find<AccountController>();
                                        if (a.contactUs == null) {
                                          a.getContactUs();
                                        }
                                        if (!Get.isRegistered<
                                            KycController>()) {
                                          Get.put(KycController());
                                        }
                                        var expDate = Box3.fetchUAEPassDoc
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
                                                    DateTime.now().month,
                                                    DateTime.now().day,
                                                    DateTime.now().hour,
                                                    DateTime.now().minute)
                                                .toLocal())
                                            .inHours;

                                        Get.put(AccountController());

                                        if (expiryDays <= 0) {
                                          if (Get.currentRoute !=
                                              AppRoutes
                                                  .visualizationRetryRoutes) {
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
                                      } else if ((Box3.fetchUAEPassDoc
                                                  ?.visualizationExpiry ==
                                              null) &&
                                          Box3.fetchUAEPassDoc?.reqAuthorized ==
                                              'N') {
                                        AccountController a =
                                            Get.find<AccountController>();
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
                                        if (Get.isRegistered<
                                            TransferController>()) {
                                          Get.find<TransferController>()
                                              .reset(t: TransferType.all);
                                        } else {
                                          Get.put(
                                              TransferController(
                                                  transferType:
                                                      TransferType.all),
                                              permanent: true);
                                        }
                                        Get.find<TransferController>()
                                                .toAmtCur =
                                            Get.find<AccountController>()
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
                                      SvgIcons.transferHistory,
                                      cms(Fields
                                              .QuickAccess_MyTransactionsIconAndText)
                                          .textHeading!
                                          .split(' ')
                                          .join('\n'), onTap: () async {
                                    late final SignUpController
                                        signupController;
                                    if (Get.isRegistered<SignUpController>()) {
                                      signupController =
                                          Get.find<SignUpController>();
                                    } else {
                                      signupController =
                                          Get.put(SignUpController());
                                    }
                                    if (Box3.idExpired) {
                                      signupController.showIDExpiredAlert();
                                    } else if ((Box3.fetchUAEPassDoc
                                                ?.visualizationExpiry ==
                                            null) &&
                                        Box3.fetchUAEPassDoc?.reqAuthorized ==
                                            'N') {
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
                                      if (Get.isRegistered<
                                          TransactionController>()) {
                                        Get.delete<TransactionController>();
                                      }
                                      Get.put(TransactionController()).loading =
                                          true;
                                      mainController.push(
                                        const MyTransactionsPage(),
                                        AppBars.myTransaction,
                                      );
                                      await Get.find<DataController>()
                                          .getData(BeneficiaryController);
                                    }
                                  }),
                                  dashtile2(
                                      SvgIcons.beneficiary,
                                      cms(Fields
                                              .QuickAccess_MyBeneficiaryIconAndText)
                                          .textHeading!
                                          .split(' ')
                                          .join('\n'), onTap: () async {
                                    late final SignUpController
                                        signupController;
                                    if (Get.isRegistered<SignUpController>()) {
                                      signupController =
                                          Get.find<SignUpController>();
                                    } else {
                                      signupController =
                                          Get.put(SignUpController());
                                    }
                                    if (Box3.idExpired) {
                                      signupController.showIDExpiredAlert();
                                    } else if (Box3.fetchUAEPassDoc
                                                ?.visualizationExpiry
                                                ?.toLocal() !=
                                            null &&
                                        Box3.fetchUAEPassDoc?.reqAuthorized ==
                                            'I') {
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
                                            AppRoutes
                                                .visualizationRetryRoutes) {
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
                                    } else if ((Box3.fetchUAEPassDoc
                                                ?.visualizationExpiry ==
                                            null) &&
                                        Box3.fetchUAEPassDoc?.reqAuthorized ==
                                            'N') {
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
                                      DataController d =
                                          Get.find<DataController>();
                                      if (Get.isRegistered<
                                          BeneficiaryController>()) {
                                        Get.delete<BeneficiaryController>();
                                      }
                                      if (Get.isRegistered<
                                          AddBeneficiaryController>()) {
                                        Get.delete<AddBeneficiaryController>();
                                      }
                                      Get.put(BeneficiaryController()).loading =
                                          true;
                                      Get.put(AddBeneficiaryController());
                                      mainController.push(
                                        AppRoutes.getPage(
                                            AppRoutes.myBeneficiary),
                                        AppBars.myBeneficiary,
                                      );
                                      await d.getData(BeneficiaryController);
                                    }
                                  }),
                                  dashtile2(
                                    SvgIcons.forexRate2,
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
                            Column(
                              children: [
                                const SizedBox(height: 20),
                                Visibility(
                                  visible: tiles.isNotEmpty,
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 10, 20, 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                      ? AppConfigs.w
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
                                                    style: TextStyles.font12
                                                        .copyWith(
                                                            color: mainController
                                                                    .isDark
                                                                ? AppConfigs.w
                                                                : AppConfigs
                                                                    .primaryColor,
                                                            decorationThickness:
                                                                5),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        // Text(
                                        //     cms(Fields
                                        //             .Utility_HeadingAndDescription)
                                        //         .description!,
                                        //     style: TS.f12.copyWith(
                                        //       color: mainController.isDark
                                        //           ? AppConfigs.primaryColor
                                        //           : AppConfigs.g4,
                                        //     )),
                                        const SizedBox(height: 12),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment
                                          //         .spaceBetween,
                                          spacing: 30,
                                          children: [0, 1, 2, 3]
                                              .map((e) => tileColumn(e))
                                              .toList(),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // SizedBox(
                                //   height:
                                //       MediaQuery.sizeOf(context).height /
                                //           15,
                                // ),
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
                                            ? Box3.settings
                                                .enablePromotionPreLogin
                                            : Box3.settings
                                                    .enablePromotionPreLogin ==
                                                'YesBackend') &&
                                        dataCntrl.promotions.isNotEmpty) {
                                      if (dataCntrl.fixedPromotion != null) {
                                        return Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              9, 15, 9, 15),
                                          child: AdvertisementBanner(
                                            advertisement:
                                                dataCntrl.fixedPromotion!,
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
                                // const SizedBox(height: 80),
                              ],
                            ),
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
        ),
      );
    });
  }
}
