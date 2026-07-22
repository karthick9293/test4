import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:marquee/marquee.dart';
import 'package:mobiremit/flavors.dart';

import '../../../../../core/editing_controllers.dart/attributes.dart';
import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_seven_custom_widgets.dart';
import '../../../../../core/exports/ui_seven_pages.dart';
import '../../../../../core/exports/ui_seven_shimmer.dart';
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

    void scrollToBottom() {
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
          if (utilityTypes.contains("mobile")) {
            tiles.add(dashtile2(
              SvgIcons.recharge,
              'Mobile'.tr,
              onTap: accountController.preLoginAlert,
              // page: const MobileRechargePage(),
            ));
          } else if (utilityTypes.contains("dth")) {
            tiles.add(
              dashtile2(SvgIcons.dth, 'DTH'.tr,
                  onTap: accountController.preLoginAlert,
                  // page: const PayBillPage(),
                  b: BillType.dth),
            );
          } else if (utilityTypes.contains("wifi")) {
            tiles.add(
              dashtile2(SvgIcons.wifi, 'WiFi'.tr,
                  // page: const PayBillPage(),
                  onTap: accountController.preLoginAlert,
                  b: BillType.wifi),
            );
          } else if (utilityTypes.contains("gas")) {
            tiles.add(
              dashtile2(SvgIcons.gas, 'Gas'.tr,
                  onTap: accountController.preLoginAlert,
                  // page: const PayBillPage(),
                  b: BillType.gas),
            );
          } else if (utilityTypes.contains("electricity")) {
            tiles.add(
              dashtile2(SvgIcons.electricity, 'Electricity'.tr,
                  onTap: accountController.preLoginAlert,
                  // page: const PayBillPage(),
                  b: BillType.elec),
            );
          } else if (utilityTypes.contains("rent")) {
            tiles.add(
              dashtile2(
                SvgIcons.rent,
                'Rent'.tr,
                onTap: accountController.preLoginAlert,
              ),
            );
          } else if (utilityTypes.contains("education")) {
            tiles.add(
              dashtile2(
                SvgIcons.education,
                'Education'.tr,
                onTap: accountController.preLoginAlert,
              ),
            );
          } else if (utilityTypes.contains("credit card")) {
            tiles.add(
              dashtile2(
                SvgIcons.creditCard,
                'Credit_card'.tr,
                onTap: accountController.preLoginAlert,
              ),
            );
          } else if (utilityTypes.contains("water")) {
            tiles.add(dashtile2(
              SvgIcons.water,
              'Water'.tr,
              onTap: accountController.preLoginAlert,
            ));
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
            endDrawer: preDrawer(),
            backgroundColor:
                accountController.isDark ? AppConfigs.b : AppConfigs.w,
            body: SafeArea(
              top: false,
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
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
                            Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Container(
                                  height: 140,
                                  width: double.infinity,
                                  margin: EdgeInsets.zero,
                                  decoration: BoxDecoration(
                                    color: accountController.isDark
                                        ? AppConfigs.b
                                        : AppConfigs.w,
                                  ),
                                  child: SvgPicture.asset(
                                    ImagePath.globalHeaderBg,
                                    fit: BoxFit.fitHeight,
                                    // colorFilter: ColorFilter.mode(
                                    //     AppConfigs.primaryColor,
                                    //     BlendMode.srcIn),
                                  ),
                                ),
                                SafeArea(
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        15, 10, 15, 0),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          accountController.isDark
                                              ? ImagePath.alzamanExchLogoDark
                                              : ImagePath.alzamanExchLogo,
                                          height: 70,
                                          width: 90,
                                        ),
                                        Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => Get.to(() =>
                                                      const AppNotificationPage(
                                                          isPrelogin: true)),
                                                  child: Stack(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    children: [
                                                      SvgPicture.asset(
                                                        ImagePath.notification,
                                                        colorFilter:
                                                            ColorFilter.mode(
                                                                accountController
                                                                        .isDark
                                                                    ? AppConfigs
                                                                        .w
                                                                    : AppConfigs
                                                                        .primaryColor,
                                                                BlendMode
                                                                    .srcIn),
                                                      ),
                                                      if (Get.find<
                                                                  DataController>()
                                                              .notificationCount >
                                                          0)
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          width: 40,
                                                          height: 40,
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: Container(
                                                            height: 15,
                                                            width: 15,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    const BorderRadius
                                                                        .all(
                                                                        Radius.circular(
                                                                            7.5)),
                                                                color: accountController
                                                                        .isDark
                                                                    ? AppConfigs
                                                                        .w
                                                                    : AppConfigs
                                                                        .primaryColor),
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    bottom: 2),
                                                            child: Text(
                                                              // Get.find<DataController>()
                                                              //     .notifications
                                                              //     .length
                                                              //     .toString(),
                                                              Get.find<
                                                                      DataController>()
                                                                  .notificationCount
                                                                  .toString(),
                                                              style: TS.f10.copyWith(
                                                                  color: accountController
                                                                          .isDark
                                                                      ? AppConfigs
                                                                          .w
                                                                      : AppConfigs
                                                                          .primaryColor),
                                                            ),
                                                          ),
                                                        )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10),
                                                GestureDetector(
                                                  onTap: () => key2.currentState
                                                      ?.openEndDrawer(),
                                                  child: SvgPicture.asset(
                                                    ImagePath.hamBurger,
                                                    colorFilter: ColorFilter.mode(
                                                        accountController.isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs
                                                                .primaryColor,
                                                        BlendMode.srcIn),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10),
                                            GestureDetector(
                                              onTap: () => Get.to(() =>
                                                  ReportFraudPage(
                                                      isPrelogin: true)),
                                              child: Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    12, 3, 12, 3),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: accountController
                                                              .isDark
                                                          ? AppConfigs.w
                                                          : AppConfigs.bf0,
                                                      width: 1.2),
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                ),
                                                child: Text(
                                                  cms(Fields
                                                          .PreLogin_ReportaFraud)
                                                      .textHeading!,
                                                  style: TS.f14.copyWith(
                                                      color: accountController
                                                              .isDark
                                                          ? AppConfigs.w
                                                          : AppConfigs.bf0),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SafeArea(
                                  child: preLoginRateCard(
                                      myContext: context, top: 150),
                                ),
                                SafeArea(
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        top: 100, left: 26),
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 63,
                                          width: 63,
                                          decoration: BoxDecoration(
                                            color: accountController.isDark
                                                ? AppConfigs.g21
                                                : AppConfigs.geb,
                                            border: Border.all(
                                                color: accountController.isDark
                                                    ? AppConfigs.b
                                                    : AppConfigs.w,
                                                width: 5,
                                                strokeAlign: BorderSide
                                                    .strokeAlignCenter),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(100),
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            child: accountController
                                                            .customerDetails ==
                                                        null &&
                                                    Box3.status ==
                                                        AppStatus.loggedIn
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            5.0),
                                                    child: F.appFlavor ==
                                                            Flavor.kabayanremit
                                                        ? Image.asset(
                                                            "assets/images/kabayan_fav.png",
                                                            fit: BoxFit.fill,
                                                          )
                                                        : Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(10),
                                                            child: SvgPicture
                                                                .asset(
                                                              ImagePath.person,
                                                              colorFilter: ColorFilter.mode(
                                                                  accountController
                                                                          .isDark
                                                                      ? AppConfigs
                                                                          .g8f
                                                                      : AppConfigs
                                                                          .g77,
                                                                  BlendMode
                                                                      .srcIn),
                                                            ),
                                                          ),
                                                  )
                                                : F.appFlavor ==
                                                        Flavor.kabayanremit
                                                    ? Image.asset(
                                                        "assets/images/kabayan_fav.png",
                                                        fit: BoxFit.fill,
                                                      )
                                                    : Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        child: SvgPicture.asset(
                                                          ImagePath.person,
                                                          colorFilter: ColorFilter.mode(
                                                              accountController
                                                                      .isDark
                                                                  ? AppConfigs
                                                                      .g8f
                                                                  : AppConfigs
                                                                      .g77,
                                                              BlendMode.srcIn),
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
                                                '${cms(Fields.PreLogin_Welcome).textHeading ?? 'Welcome'.tr}\n${Box3.settings.clientName}',
                                                style: TS.f16.copyWith(
                                                    color:
                                                        accountController.isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.bf0),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 15)
                                            ],
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Get.find<AccountController>().ltc =
                                                LoginAttributes();
                                            Get.find<AccountController>()
                                                .preLoginAlert();
                                          },
                                          child: Container(
                                            margin: const EdgeInsets.only(
                                                right: 17),
                                            child: Row(
                                              children: [
                                                if (Flavor.kabayanremit ==
                                                    F.appFlavor)
                                                  SizedBox(
                                                    height: 25,
                                                    width: 40,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          boxShadow: [
                                                            BoxShadow(
                                                                color: Colors
                                                                    .white
                                                                    .withAlpha(
                                                                        20),
                                                                blurRadius: 5,
                                                                offset: Offset(
                                                                    1, 1))
                                                          ]),
                                                      child: Image.asset(
                                                        "assets/images/flags/php.png",
                                                      ),
                                                    ),
                                                  )
                                                else
                                                  Icon(
                                                    size: 20,
                                                    CupertinoIcons
                                                        .square_arrow_right,
                                                    color:
                                                        accountController.isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.bf0,
                                                  ),
                                                const SizedBox(width: 5),
                                                Text(
                                                  cms(Fields.PreLogin_LoginSignUp)
                                                          .textHeading ??
                                                      "",
                                                  // 'Login'.tr,
                                                  style: TS.f14.copyWith(
                                                    color:
                                                        accountController.isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.bf0,
                                                    letterSpacing: 0.1,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 12),
                              // const EdgeInsets.only(left: 20, right: 20, top: 33),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  dashtile2(
                                      SvgIcons.sendMoney,
                                      (cms(Fields.QuickAccess_SendMoneyIconAndText)
                                                  .textHeading ??
                                              'send_money'.tr)
                                          .split(' ')
                                          .join('\n'),
                                      key: const Key('Send Money prelogin'),
                                      onTap: () {
                                    accountController.preLoginAlert();
                                    // Get.put(TransferController());
                                    // Get.to(() => const SendMoneyPage());
                                  }, enableBorder: true),
                                  dashtile2(
                                      SvgIcons.myTransaction,
                                      (cms(Fields.QuickAccess_MyTransactionsIconAndText)
                                                  .textHeading ??
                                              'my_transaction'.tr)
                                          .split(' ')
                                          .join('\n'), onTap: () {
                                    accountController.preLoginAlert();
                                    // Get.put(TransactionController());
                                    // Get.to(() => const MyTransactionsPage());
                                  }, enableBorder: true),
                                  dashtile2(
                                      SvgIcons.myBeneficiary,
                                      (cms(Fields.QuickAccess_MyBeneficiaryIconAndText)
                                                  .textHeading ??
                                              'my_beneficiary')
                                          .tr
                                          .split(' ')
                                          .join('\n'), onTap: () {
                                    accountController.preLoginAlert();

                                    // Get.put(BeneficiaryController());
                                    // Get.to(() => const MyBeneficiaryPage());
                                  }, enableBorder: true),
                                  dashtile2(
                                      SvgIcons.forexRate,
                                      (cms(Fields.QuickAccess_ForexRatesIconAndText)
                                                  .textHeading ??
                                              'forex_rates'.tr)
                                          .split(' ')
                                          .join('\n'), onTap: () {
                                    Get.to(() =>
                                        const ForexRatesPage(isPrelogin: true));
                                  }, enableBorder: true)
                                ],
                              ),
                            ),
                            Visibility(
                              visible: tiles.isNotEmpty,
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 16, 20, 10),
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
                                    // const SizedBox(height: 18),
                                  ],
                                ),
                              ),
                            ),
                            Stack(
                              alignment: Alignment.topCenter,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      // color: AppConfigs.accentColor.withOpacity(
                                      //     accountController.isDark ? 0.6 : 1),
                                      border: F.appFlavor == Flavor.kabayanremit
                                          ? Border(
                                              top: BorderSide(
                                                  color:
                                                      AppConfigs.highlightColor,
                                                  width: 4))
                                          : null),
                                  margin: const EdgeInsets.only(top: 40),
                                  // padding: const EdgeInsets.only(top: 64),
                                  // child: SizedBox(),
                                  child: SvgPicture.asset(
                                    ImagePath.globalFooterBg,
                                    height: 200,
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        F.appFlavor == Flavor.kabayanremit
                                            ? AppConfigs.highlightColor
                                            : AppConfigs.primaryColor
                                                .withOpacity(
                                                    accountController.isDark
                                                        ? 1
                                                        : 1),
                                        BlendMode.srcIn),
                                  ),
                                ),
                                Column(
                                  children: [
                                    GetBuilder<DataController>(
                                      id: 'Advertisement',
                                      builder: (dataCntrl) {
                                        if (accountController.loading) {
                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            height: 200,
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
                                                ? Box3.settings
                                                    .enablePromotionPreLogin
                                                : Box3.settings
                                                        .enablePromotionPreLogin ==
                                                    'YesBackend') &&
                                            Get.find<DataController>()
                                                .promotions
                                                .isNotEmpty) {
                                          if (dataController.fixedPromotion !=
                                              null) {
                                            return AdvertisementBanner(
                                              advertisement: dataController
                                                  .fixedPromotion!,
                                            );
                                          } else {
                                            return CustomCarouselSlider(
                                              accountController:
                                                  accountController,
                                              promotions:
                                                  dataController.promotions,
                                            );
                                          }
                                        }
                                        return const SizedBox();
                                      },
                                    ),
                                    SizedBox(height: 100),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (dataController.newsList.isNotEmpty)
                        GetBuilder<DataController>(
                          id: 'news',
                          builder: (controller) {
                            return Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: AnimatedSize(
                                duration: Duration(milliseconds: 300),
                                child: GestureDetector(
                                  onTap: () {
                                    controller.toggleNewsExpanded();
                                    if (controller.isNewsExpanded.isTrue) {
                                      scrollToBottom();
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
                                    color: AppConfigs.accentColor,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 70,
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 0, 8, 15),
                                            child: Row(
                                              children: [
                                                // News Icon and Text
                                                Row(
                                                  children: [
                                                    Icon(Icons.newspaper,
                                                        color: AppConfigs.w),
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "News",
                                                      style: TS.f20.copyWith(
                                                        color: AppConfigs.w,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: 8),

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

                                                if (controller
                                                    .isNewsExpanded.isTrue)
                                                  Spacer(),

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
                                                      scrollToBottom();
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        // Expanded News Content (Only when expanded)
                                        if (controller.isNewsExpanded.isTrue)
                                          Expanded(
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: List.generate(
                                                  controller.newsList.length,
                                                  (index) {
                                                    final newsItem = controller
                                                        .newsList[index];
                                                    return Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16.0,
                                                          vertical: 4.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                  Icons
                                                                      .fiber_manual_record,
                                                                  color:
                                                                      AppConfigs
                                                                          .w,
                                                                  size: 10),
                                                              const SizedBox(
                                                                  width: 8),
                                                              Expanded(
                                                                child: Text(
                                                                  newsItem
                                                                      .newsTitle
                                                                      .toString(),
                                                                  style: TS.f14
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
                                                                    left: 18.0,
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
                                                            padding:
                                                                EdgeInsets.only(
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
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
