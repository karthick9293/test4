import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/flavors.dart';

import '../../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_five_custom_widgets.dart';
import '../../../../../core/exports/ui_five_pages.dart';
import '../../../../../core/flavours/constants.dart';
import '../../../../../core/icons/svg_icons.dart';
import 'pre_drawer.dart';
import 'pre_login_ratecard.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> key2 = GlobalKey();
    ScrollController mainScrollController = ScrollController();
    final dataController = Get.find<DataController>();
    dataController.isNewsExpanded.value = false;

    final companyLogo = Base64Image(
      image: Box3.companyLogo,
    );

    return NavigatorPopHandler(
      onPop: () async {
        return Future.value(false); // Prevents the pop until action is handled
      },
      child: GetBuilder<AccountController>(builder: (accountController) {
        // if (accountController.contactUs == null) {
        //   accountController.getContactUs();
        // }

        List<Widget> tiles = [];
        String featureString = Box3.settings.enableUTILITY;
        List<String> utilityTypes = [];

        if (featureString.isNotEmpty == true) {
          String featureData = featureString.toLowerCase();
          utilityTypes = featureData.split(",");

          final Map<String, Widget> utilityMap = {
            "mobile": dashtile2(
              SvgIcons.recharge,
              'Mobile'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "dth": dashtile2(SvgIcons.dth, 'DTH'.tr,
                onTap: accountController.preLoginAlert, b: BillType.dth),
            "wifi": dashtile2(SvgIcons.wifi, 'WiFi'.tr,
                onTap: accountController.preLoginAlert, b: BillType.wifi),
            "gas": dashtile2(SvgIcons.gas, 'Gas'.tr,
                onTap: accountController.preLoginAlert, b: BillType.gas),
            "electricity": dashtile2(SvgIcons.electricity, 'Electricity'.tr,
                onTap: accountController.preLoginAlert, b: BillType.elec),
            "rent": dashtile2(
              SvgIcons.rent,
              'Rent'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "education": dashtile2(
              SvgIcons.education,
              'Education'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "credit card": dashtile2(
              SvgIcons.creditCard,
              'Credit_card'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "water": dashtile2(
              SvgIcons.water,
              'Water'.tr,
              onTap: accountController.preLoginAlert,
            ),
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
            key: key2,
            drawer: preDrawer(),
            backgroundColor: accountController.isDark
                ? const Color(0xFF0B0F1E)
                : AppConfigs.w,
            body: SafeArea(
              top: false,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                color: accountController.isDark
                    ? const Color(0xFF0B0F1E)
                    : AppConfigs.primaryColor.withOpacity(0.09),
                child: KeyboardActions(
                  disableScroll: true,
                  // isDialog: widget.isDialog,
                  config: Get.find<MainController>().keyboardConfig(context),
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        controller: mainScrollController,
                        physics: const ClampingScrollPhysics(),
                        padding: EdgeInsets.zero,
                        child: Column(
                          // physics: const ClampingScrollPhysics(),
                          children: [
                            Container(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.fromLTRB(10, 10, 10, 30),
                              decoration: BoxDecoration(
                                gradient: accountController.isDark
                                    ? LinearGradient(
                                        colors: [
                                          Color(0xFF0A1932),
                                          const Color(0xFF080E1C),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      )
                                    : null,
                                color: accountController.isDark
                                    ? null
                                    : AppConfigs.primaryColor,
                                borderRadius: accountController.isDark
                                    ? null
                                    : const BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30),
                                      ),
                              ),
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              key2.currentState?.openDrawer(),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 5),
                                            child: SvgPicture.asset(
                                              ImagePath.hamBurger,
                                              colorFilter:
                                                  const ColorFilter.mode(
                                                      AppConfigs.w,
                                                      BlendMode.srcIn),
                                            ),
                                          ),
                                        ),
                                        Spacer(),
                                        GestureDetector(
                                          onTap: () => Get.to(() =>
                                              ReportFraudPage(
                                                  isPrelogin: true)),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                12, 3, 12, 3),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppConfigs.w,
                                                  width: 1.2),
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                            ),
                                            child: Text(
                                              cms(Fields.PreLogin_ReportaFraud)
                                                  .textHeading!,
                                              style: TS.f14.copyWith(
                                                  color: AppConfigs.w),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        GestureDetector(
                                          onTap: () => Get.to(() =>
                                              const AppNotificationPage(
                                                  isPrelogin: true)),
                                          child: Stack(
                                            alignment: Alignment.centerRight,
                                            children: [
                                              SvgPicture.asset(
                                                ImagePath.notification,
                                                colorFilter:
                                                    const ColorFilter.mode(
                                                        AppConfigs.w,
                                                        BlendMode.srcIn),
                                              ),
                                              if (Get.find<DataController>()
                                                      .notificationCount >
                                                  0)
                                                Container(
                                                  alignment: Alignment.topRight,
                                                  width: 40,
                                                  height: 40,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 5),
                                                  child: Container(
                                                    height: 16,
                                                    width: 16,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: AppConfigs
                                                          .accentColor,
                                                      border: Border.all(
                                                        color: AppConfigs.w,
                                                        width: 1.5,
                                                      ),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.15),
                                                          blurRadius: 4,
                                                          offset: const Offset(
                                                              0, 2),
                                                        ),
                                                      ],
                                                    ),
                                                    alignment: Alignment.center,
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 1),
                                                    child: Center(
                                                      child: Text(
                                                        // Get.find<DataController>()
                                                        //     .notifications
                                                        //     .length
                                                        //     .toString(),
                                                        Get.find<
                                                                DataController>()
                                                            .notificationCount
                                                            .toString(),
                                                        style: TS.f8.copyWith(
                                                            color: AppConfigs.w,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15, vertical: 10),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 45,
                                            width: 45,
                                            decoration: BoxDecoration(
                                              color: accountController.isDark
                                                  ? AppConfigs.g21
                                                  : AppConfigs.w,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: accountController
                                                                .customerDetails ==
                                                            null &&
                                                        Box3.status ==
                                                            AppStatus.loggedIn
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(5.0),
                                                        child: F.appFlavor ==
                                                                Flavor
                                                                    .kabayanremit
                                                            ? Image.asset(
                                                                "assets/images/kabayan_fav.png",
                                                                fit:
                                                                    BoxFit.fill,
                                                              )
                                                            : Icon(
                                                                Icons.person,
                                                                color: accountController
                                                                        .isDark
                                                                    ? AppConfigs
                                                                        .g8f
                                                                    : AppConfigs
                                                                        .primaryColor,
                                                                size: 35,
                                                              ),
                                                      )
                                                    : F.appFlavor ==
                                                            Flavor.kabayanremit
                                                        ? Image.asset(
                                                            "assets/images/kabayan_fav.png",
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Icon(
                                                            Icons.person,
                                                            color: accountController
                                                                    .isDark
                                                                ? AppConfigs.g8f
                                                                : AppConfigs
                                                                    .primaryColor,
                                                            size: 35,
                                                          ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 10),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  cms(Fields.PreLogin_Welcome)
                                                          .textHeading ??
                                                      'Welcome'.tr,
                                                  style: TS.f16.copyWith(
                                                    color: accountController
                                                            .isDark
                                                        ? AppConfigs.w
                                                            .withOpacity(0.7)
                                                        : AppConfigs.w,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                Text(
                                                  Box3.settings.clientName,
                                                  style: TS.f16.copyWith(
                                                      color: accountController
                                                              .isDark
                                                          ? AppConfigs.w
                                                              .withOpacity(0.9)
                                                          : AppConfigs.w,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.find<AccountController>()
                                                  .ltc = LoginAttributes();
                                              Get.find<AccountController>()
                                                  .preLoginAlert();
                                            },
                                            child: Row(
                                              children: [
                                                if (Flavor.kabayanremit ==
                                                    F.appFlavor)
                                                  SizedBox(
                                                    height: 25,
                                                    width: 40,
                                                    child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors
                                                                      .white
                                                                      .withAlpha(
                                                                          20),
                                                                  blurRadius: 5,
                                                                  offset:
                                                                      Offset(
                                                                          1, 1))
                                                            ]),
                                                        child: Image.asset(
                                                          "assets/images/flags/php.png",
                                                        )),
                                                  )
                                                else
                                                  Icon(
                                                    size: 20,
                                                    Icons.login,
                                                    color: accountController
                                                            .isDark
                                                        ? AppConfigs.w
                                                            .withOpacity(0.8)
                                                        : AppConfigs.w,
                                                  ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  cms(Fields.PreLogin_LoginSignUp)
                                                          .textHeading ??
                                                      "",
                                                  // 'Login'.tr,
                                                  style: TS.f16.copyWith(
                                                      color: accountController
                                                              .isDark
                                                          ? AppConfigs.w
                                                              .withOpacity(0.9)
                                                          : AppConfigs.w,
                                                      letterSpacing: 0.1,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    preLoginRateCard(
                                        top: 0, myContext: context),
                                  ],
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(
                                  top: accountController.isDark ? 10 : 35),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: dashtile2(
                                      width: 50,
                                      SvgIcons.sendMoney2,
                                      (cms(Fields.QuickAccess_SendMoneyIconAndText)
                                                  .textHeading ??
                                              'send_money'.tr)
                                          .split(' ')
                                          .join('\n'),
                                      key: const Key('Send Money prelogin'),
                                      onTap: () {
                                        accountController.preLoginAlert(
                                            postLoginDestination: 'send_money');
                                        // Get.put(TransferController());
                                        // Get.to(() => const SendMoneyPage());
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: dashtile2(
                                      width: 50,
                                      SvgIcons.transferHistory,
                                      (cms(Fields.QuickAccess_MyTransactionsIconAndText)
                                                  .textHeading ??
                                              'my_transaction'.tr)
                                          .split(' ')
                                          .join('\n'),
                                      onTap: () {
                                        accountController.preLoginAlert(
                                            postLoginDestination:
                                                'my_transactions');
                                        // Get.put(TransactionController());
                                        // Get.to(() => const MyTransactionsPage());
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: dashtile2(
                                      width: 50,
                                      SvgIcons.beneficiary,
                                      (cms(Fields.QuickAccess_MyBeneficiaryIconAndText)
                                                  .textHeading ??
                                              'my_beneficiary')
                                          .tr
                                          .split(' ')
                                          .join('\n'),
                                      onTap: () {
                                        accountController.preLoginAlert(
                                            postLoginDestination:
                                                'my_beneficiary');

                                        // Get.put(BeneficiaryController());
                                        // Get.to(() => const MyBeneficiaryPage());
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: dashtile2(
                                      width: 50,
                                      SvgIcons.forexRate2,
                                      (cms(Fields.QuickAccess_ForexRatesIconAndText)
                                                  .textHeading ??
                                              'forex_rates'.tr)
                                          .split(' ')
                                          .join('\n'),
                                      onTap: () {
                                        Get.to(() => const ForexRatesPage(
                                            isPrelogin: true));
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Visibility(
                              visible: tiles.isNotEmpty,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 30, 20, 0),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            cms(Fields.Dashboard_utilitiesHeaderText)
                                                    .textHeading ??
                                                "",
                                            style: TS.f18.copyWith(
                                              fontWeight: FontWeight.w700,
                                              color: accountController.isDark
                                                  ? AppConfigs.w
                                                  : AppConfigs.g4,
                                            )),
                                      ],
                                    ),

                                    const SizedBox(height: 12),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      spacing: 30,
                                      // mainAxisAlignment:
                                      //     MainAxisAlignment.spaceBetween,
                                      children: [0, 1, 2, 3]
                                          .map((e) => tileColumn(e))
                                          .toList(),
                                    ),
                                    // const SizedBox(height: 18),
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(
                            //   height: MediaQuery.sizeOf(context).height / 10,
                            // ),
                            GetBuilder<DataController>(
                              id: 'Advertisement',
                              builder: (dataCntrl) {
                                if (accountController.loading) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 12),
                                    height: 190,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        color: AppConfigs.primaryColor
                                            .withAlpha(50),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Opacity(
                                      opacity: 0.2,
                                      child: companyLogo,
                                    ),
                                  );
                                }
                                if ((AppConfigs.fetchNewConfig
                                        ? Box3.settings.enablePromotionPreLogin
                                        : Box3.settings
                                                .enablePromotionPreLogin ==
                                            'YesBackend') &&
                                    Get.find<DataController>()
                                        .promotions
                                        .isNotEmpty) {
                                  if (dataController.fixedPromotion != null) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          9, 15, 9, 15),
                                      child: AdvertisementBanner(
                                        advertisement:
                                            dataController.fixedPromotion!,
                                      ),
                                    );
                                  } else {
                                    return CustomCarouselSlider(
                                      accountController: accountController,
                                      promotions: dataController.promotions,
                                    );
                                  }
                                }
                                return const SizedBox();
                              },
                            ),
                            SizedBox(height: 110)
                          ],
                        ),
                      ),
                      const ModernNewsCard(),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
