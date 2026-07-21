import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:marquee/marquee.dart';

import '../../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../../core/exports/controllers.dart';
import '../../../../../core/flavours/constants.dart';
import '../../../../../core/exports/ui_two_pages.dart';
import '../../../../../core/icons/svg_icons.dart';
import '../../../../shimmers/news_content_shimmer.dart';
import '../report_fraud.dart';

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

          final Map<String, Widget> utilityMap = {
            "mobile": dashTile2UiTwo(
              SvgIcons.recharge,
              'Mobile'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "dth": dashTile2UiTwo(SvgIcons.dth, 'DTH'.tr,
                onTap: accountController.preLoginAlert, b: BillType.dth),
            "wifi": dashTile2UiTwo(SvgIcons.wifi, 'WiFi'.tr,
                onTap: accountController.preLoginAlert, b: BillType.wifi),
            "gas": dashTile2UiTwo(SvgIcons.gas, 'Gas'.tr,
                onTap: accountController.preLoginAlert, b: BillType.gas),
            "electricity": dashTile2UiTwo(SvgIcons.electricity, 'Electricity'.tr,
                onTap: accountController.preLoginAlert, b: BillType.elec),
            "rent": dashTile2UiTwo(
              SvgIcons.rent,
              'Rent'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "education": dashTile2UiTwo(
              SvgIcons.education,
              'Education'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "credit card": dashTile2UiTwo(
              SvgIcons.creditCard,
              'Credit_card'.tr,
              onTap: accountController.preLoginAlert,
            ),
            "water": dashTile2UiTwo(
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
            backgroundColor:
                accountController.isDark ? AppConfigs.b : AppConfigs.w,
            body: SafeArea(
              top: true,
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        key2.currentState?.openDrawer(),
                                    child: Container(
                                      height: 48,
                                      width: 48,
                                      decoration: BoxDecoration(
                                        color: accountController.isDark
                                            ? AppConfigs.g21
                                            : AppConfigs.primaryColor
                                                .withAlpha(30),
                                        shape: BoxShape.circle,
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
                                                    const EdgeInsets.all(12.0),
                                                child: SvgPicture.asset(
                                                  ImagePath.person,
                                                  colorFilter: ColorFilter.mode(
                                                    AppConfigs.primaryColor,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              )
                                            :
                                            // accountController.customerDetails?.profImage != null
                                            //         ? Image.network(
                                            //             accountController.customerDetails!.profImage!,
                                            //             fit: BoxFit.cover,
                                            //             alignment: Alignment.center,
                                            //             errorBuilder: (context, error, stackTrace) => Icon(
                                            //               Icons.person,
                                            //               color: accountController.isDark ? AppConfigs.g8f : AppConfigs.primaryColor,
                                            //               size: 45,
                                            //             ),
                                            //           )
                                            //         :
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(12.0),
                                                child: SvgPicture.asset(
                                                  ImagePath.myProfile,
                                                  colorFilter: ColorFilter.mode(
                                                    AppConfigs.primaryColor,
                                                    BlendMode.srcIn,
                                                  ),
                                                ),
                                              ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${cms(Fields.PreLogin_Welcome).textHeading ?? 'Welcome'.tr}\n${Box3.settings.clientName}',
                                          style: TS.f16
                                              .copyWith(color: AppConfigs.b),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => Get.to(() =>
                                        ReportFraudPage(isPrelogin: true)),
                                    child: Container(
                                      padding:
                                          EdgeInsets.fromLTRB(12, 3, 12, 3),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppConfigs.b, width: 1.2),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Text(
                                        cms(Fields.PreLogin_ReportaFraud)
                                            .textHeading!,
                                        style: TS.f14
                                            .copyWith(color: AppConfigs.b),
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
                                        Container(
                                          height: 48,
                                          width: 48,
                                          decoration: BoxDecoration(
                                            color: accountController.isDark
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
                                                const EdgeInsets.only(top: 5),
                                            child: Container(
                                              height: 15,
                                              width: 15,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(7.5)),
                                                  color:
                                                      AppConfigs.primaryColor),
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                  bottom: 2),
                                              child: Text(
                                                // Get.find<DataController>()
                                                //     .notifications
                                                //     .length
                                                //     .toString(),
                                                Get.find<DataController>()
                                                    .notificationCount
                                                    .toString(),
                                                style: TS.f10.copyWith(
                                                    color: AppConfigs.w),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Container(
                            //   margin: const EdgeInsets.only(
                            //       top: 52, left: 26),
                            //   alignment: Alignment.topLeft,
                            //   child: Row(
                            //     children: [
                            //       GestureDetector(
                            //         onTap: () {
                            //           Get.find<AccountController>().ltc =
                            //               LoginAttributes();
                            //           Get.find<AccountController>()
                            //               .preLoginAlert();
                            //         },
                            //         child: Container(
                            //           margin: const EdgeInsets.only(
                            //               right: 17),
                            //           child: Row(
                            //             children: [
                            //               const Icon(
                            //                 size: 20,
                            //                 Icons.login,
                            //                 color: AppConfigs.w,
                            //               ),
                            //               const SizedBox(width: 5),
                            //               Text(
                            //                 cms(Fields.PreLogin_LoginSignUp)
                            //                     .textHeading ??
                            //                     "",
                            //                 // 'Login'.tr,
                            //                 style: TS.f14.copyWith(
                            //                     color: AppConfigs.w,
                            //                     letterSpacing: 0.1,
                            //                     fontWeight:
                            //                     FontWeight.w700),
                            //               ),
                            //             ],
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            // textFormField(
                            //   hintText: "Search your beneficiary",
                            //   borderRadius: 50,
                            //   prefixIcon: Padding(
                            //     padding: const EdgeInsets.all(12.0),
                            //     child: SvgPicture.asset(
                            //       ImagePath.search2,
                            //       colorFilter: ColorFilter.mode(
                            //         AppConfigs.primaryColor,
                            //         BlendMode.srcIn,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                dashboardCardTile(
                                    name:
                                        (cms(Fields.QuickAccess_SendMoneyIconAndText)
                                                    .textHeading ??
                                                'send_money'.tr)
                                            .split(' ')
                                            .join('\n'),
                                    icon: SvgIcons.sendMoney2,
                                    width: 28,
                                    onTap: () {
                                      Get.find<AccountController>().preLoginAlert(
                                          postLoginDestination: 'send_money');
                                    }),
                                dashboardCardTile(
                                    name:
                                        (cms(Fields.QuickAccess_MyTransactionsIconAndText)
                                                    .textHeading ??
                                                'my_transaction'.tr)
                                            .split(' ')
                                            .join('\n'),
                                    icon: SvgIcons.transferHistory,
                                    width: 28,
                                    onTap: () {
                                      Get.find<AccountController>().preLoginAlert(
                                          postLoginDestination:
                                              'my_transactions');
                                    }),
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
                                    onTap: () {
                                      Get.find<AccountController>().preLoginAlert(
                                          postLoginDestination:
                                              'my_beneficiary');
                                    }),
                                dashboardCardTile(
                                    name:
                                        (cms(Fields.QuickAccess_ForexRatesIconAndText)
                                                    .textHeading ??
                                                'forex_rates'.tr)
                                            .split(' ')
                                            .join('\n'),
                                    icon: SvgIcons.forexRate2,
                                    width: 28,
                                    onTap: () {
                                      Get.to(() => ForexRatesPage(
                                            isPrelogin: true,
                                          ));
                                    }),
                              ],
                            ),
                            SizedBox(height: 20),
                            // Column(
                            //   crossAxisAlignment: CrossAxisAlignment.stretch,
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.only(
                            //           left: 20.0, right: 20),
                            //       child: Text(
                            //         "Recent Transactions",
                            //         style: TS.f20
                            //             .copyWith(fontWeight: FontWeight.w600),
                            //       ),
                            //     ),
                            //     SizedBox(
                            //       height: 10,
                            //     ),
                            //     Wrap(
                            //       spacing: 0,
                            //       runSpacing: 20,
                            //       children: List.generate(
                            //         7,
                            //         (i) => cards(
                            //             name: i < 5 ? "Jane Deo" : "Kevin",
                            //             icon: SvgIcons.myTransaction,
                            //             color: Colors.blue.withAlpha(20)),
                            //       ),
                            //     )
                            //   ],
                            // ),
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
                                        ? Box3.settings.enablePromotionPreLogin
                                        : Box3.settings
                                                .enablePromotionPreLogin ==
                                            'YesBackend') &&
                                    Get.find<DataController>()
                                        .promotions
                                        .isNotEmpty) {
                                  if (dataController.fixedPromotion != null) {
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(9, 15, 9, 15),
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
                            SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                      preLoginRateCardTheme1(myContext: context),
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
                                    color: Colors.black.withOpacity(0.9),
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

  Widget cards(
      {required String name,
      required String icon,
      double? width = 55,
      Color? color,
      GestureTapCallback? onTap}) {
    return GestureDetector(
      onTap: onTap ?? () => Get.find<AccountController>().preLoginAlert(),
      child: SizedBox(
        width: Get.width / 4,
        child: Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color ?? AppConfigs.primaryColor.withAlpha(30),
              child: SvgPicture.asset(
                icon,
                width: width,
                allowDrawingOutsideViewBox: true,
                clipBehavior: Clip.hardEdge,
                colorFilter:
                    ColorFilter.mode(AppConfigs.accentColor, BlendMode.srcIn),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
