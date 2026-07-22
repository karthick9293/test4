import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee/marquee.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import 'package:mobiremit/ui_six/custom_widgets/advertisement_banner.dart';
import 'package:mobiremit/ui_six/shimmers/news_content_shimmer.dart';

import '../../../../../core/exports/controllers.dart';
import '../../../../../core/exports/ui_six_pages.dart';
import '../../../../../core/flavours/constants.dart';
import '../../../../custom_widgets/base64_to_image.dart';
import '../../../../custom_widgets/carousel_slider_custom.dart';
import '../../../../custom_widgets/live_rate_widget.dart';
import 'pre_drawer.dart';

class PreLogin extends StatelessWidget {
  const PreLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final ScrollController mainScrollController = ScrollController();
    final dataController = Get.find<DataController>();
    dataController.isNewsExpanded.value = false;

    void scrollToBottom() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mainScrollController.hasClients) {
          Future.delayed(
            const Duration(milliseconds: 100),
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

    return PopScope(
      canPop: false,
      child: GetBuilder<AccountController>(builder: (accountController) {
        return Scaffold(
          key: scaffoldKey,
          // drawer: preDrawer(),
          // backgroundColor: const Color(0xFFFFFDFD), // Soft white/beige backdrop
          body: SafeArea(
            child: Stack(
              children: [
                // Custom gradient background decoration matching screenshot
                Container(
                  decoration: BoxDecoration(
                      gradient: accountController.isDark
                          ? null
                          : AppConfigs.linearGradientUiSix),
                ),
                SingleChildScrollView(
                  controller: mainScrollController,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 120),
                  // Padding to avoid overlap with floating bottom nav
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Premium Custom AppBar ---
                      Container(
                        decoration: BoxDecoration(
                            color: accountController.isDark
                                ? AppConfigs.bf0
                                : AppConfigs.w,
                            border: Border(
                                bottom: BorderSide(
                                    color: AppConfigs.primaryColor
                                        .withOpacity(0.3)))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 10.0),
                          child: Row(
                            children: [
                              // Custom high-fidelity Ahalia Pay Logo
                              _ahaliaLogo(),
                              const Spacer(),
                              // Notification bell with badge '3'
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const AppNotificationPage(
                                      isPrelogin: true));
                                },
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      height: 45,
                                      width: 45,
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                        color: accountController.isDark
                                            ? AppConfigs.w.withOpacity(0.1)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: const Color(0xFFf5d5d6)),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.04),
                                            blurRadius: 8,
                                            offset: const Offset(0, 4),
                                          ),
                                        ],
                                      ),
                                      child: SvgPicture.asset(SvgIcons.notification6,
                                          width: 20,colorFilter: ColorFilter.mode(accountController.isDark?Colors.white:AppConfigs.primaryColor, BlendMode.srcIn),),
                                    ),
                                    // Positioned(
                                    //   right: -2,
                                    //   top: -2,
                                    //   child: Container(
                                    //     padding: const EdgeInsets.all(3.0),
                                    //     decoration: BoxDecoration(
                                    //       color: Color(0xFFD32F2F),
                                    //       shape: BoxShape.circle,
                                    //       border:
                                    //           Border.all(color: AppConfigs.w),
                                    //     ),
                                    //     constraints: const BoxConstraints(
                                    //       minWidth: 14,
                                    //       minHeight: 14,
                                    //     ),
                                    //     child: const Text(
                                    //       '3',
                                    //       style: TextStyle(
                                    //         color: Colors.white,
                                    //         fontSize: 8,
                                    //         fontWeight: FontWeight.bold,
                                    //       ),
                                    //       textAlign: TextAlign.center,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 10),
                              // Profile icon
                              GestureDetector(
                                onTap: () => Get.to(const PreDrawer()),
                                child: Container(
                                  height: 45,
                                  width: 45,
                                  padding: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    color: accountController.isDark
                                        ? AppConfigs.w.withOpacity(0.1)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: const Color(0xFFf5d5d6)),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.04),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: Icon(Icons.menu,color:accountController.isDark
                                      ? Colors.white
                                      : AppConfigs.primaryColor,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // --- Greeting Section ---
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Good morning 👋",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFFB0506D),
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              Box3.companyDataFZ!.companySettings!.companyName
                                      .isNotEmpty
                                  ? Box3.companyDataFZ!.companySettings!
                                      .companyName
                                  : "Ahmed Al Rashidi",
                              style: GoogleFonts.montserrat(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: accountController.isDark ? AppConfigs.w : const Color(0xFF2C1E1B),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // --- Quick Actions Grid Section ---
                      Padding(
                        padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 12.0),
                        child: Text(
                          cms(Fields.Dashboard_QuickAction).textHeading!,
                          style: TS.f14.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppConfigs.primaryColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: LayoutBuilder(builder: (context, constraint) {
                          var maxWidth = constraint.maxWidth / 4 - 5;
                          return Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _quickActionItem(
                                      label: "Send Money",
                                      bgColor: const Color(0xFFD81B60),
                                      // Light pink
                                      icon: SvgPicture.asset(
                                        SvgIcons.sendMoney6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () =>
                                          accountController.preLoginAlert(),
                                      size: maxWidth),
                                  _quickActionItem(
                                      label: "History",
                                      bgColor: const Color(0xFF2E7D32),
                                      // Light green
                                      icon: SvgPicture.asset(
                                        SvgIcons.transferHistory6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () =>
                                          accountController.preLoginAlert(),
                                      size: maxWidth),
                                  _quickActionItem(
                                      label: "Beneficiaries",
                                      bgColor: const Color(0xFFE65100),
                                      // Light peach
                                      icon: SvgPicture.asset(
                                        SvgIcons.beneficiary6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () =>
                                          accountController.preLoginAlert(),
                                      size: maxWidth),
                                  _quickActionItem(
                                      label: "Live Rates",
                                      bgColor: const Color(0xFFC62828),
                                      // Light red
                                      icon: SvgPicture.asset(
                                        SvgIcons.liveRates6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () {
                                        Get.to(() => const ForexRatesPage(
                                            isPrelogin: true));
                                      },
                                      size: maxWidth),
                                ],
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _quickActionItem(
                                      label: "Buy Gold",
                                      bgColor: const Color(0xFFF5B041),
                                      // Light gold
                                      icon: SvgPicture.asset(
                                        SvgIcons.buyGold6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () =>
                                          accountController.preLoginAlert(),
                                      size: maxWidth),
                                  _quickActionItem(
                                      label: "Loyalty",
                                      bgColor: const Color(0xFF7D3C98),
                                      // Light purple
                                      icon: SvgPicture.asset(
                                        SvgIcons.loyalty6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () =>
                                          accountController.preLoginAlert(),
                                      size: maxWidth),
                                  _quickActionItem(
                                      label: "Buy Forex",
                                      bgColor: const Color(0xFFF1C40F),
                                      // Light yellow
                                      icon: SvgPicture.asset(
                                        SvgIcons.buyForex6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () =>
                                          accountController.preLoginAlert(),
                                      size: maxWidth),
                                  _quickActionItem(
                                      label: "Support",
                                      bgColor: const Color(0xFF2980B9),
                                      // Light blue
                                      icon: SvgPicture.asset(
                                        SvgIcons.support6,
                                        width: 27,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                      onTap: () => Get.to(() => Scaffold(
                                            body: const ContactUsPage(
                                                isPreLogin: true),
                                          )),
                                      size: maxWidth),
                                ],
                              ),
                            ],
                          );
                        }),
                      ),

                      // --- Live Rates Carousel/Section ---
                      LiveRateWidget(),

                      // --- Recent Transactions ---
                      // Padding(
                      //   padding: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 12.0),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     children: [
                      //       const Text(
                      //         "RECENT TRANSACTIONS",
                      //         style: TextStyle(
                      //           fontSize: 11,
                      //           fontWeight: FontWeight.w800,
                      //           color: Color(0xFFB0506D),
                      //           letterSpacing: 1.2,
                      //         ),
                      //       ),
                      //       GestureDetector(
                      //         onTap: () => accountController.preLoginAlert(),
                      //         child: Row(
                      //           children: const [
                      //             Text(
                      //               "See All ",
                      //               style: TextStyle(
                      //                 fontSize: 12,
                      //                 fontWeight: FontWeight.bold,
                      //                 color: Color(0xFFB0506D),
                      //               ),
                      //             ),
                      //             Icon(
                      //               Icons.arrow_forward_rounded,
                      //               size: 14,
                      //               color: Color(0xFFB0506D),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      //   child: GestureDetector(
                      //     onTap: () => accountController.preLoginAlert(),
                      //     child: Container(
                      //       width: double.infinity,
                      //       padding: const EdgeInsets.all(16.0),
                      //       decoration: BoxDecoration(
                      //         color: Colors.white,
                      //         borderRadius: BorderRadius.circular(20),
                      //         border: Border.all(color: const Color(0xFFF2EFE8)),
                      //         boxShadow: [
                      //           BoxShadow(
                      //             color: Colors.black.withOpacity(0.02),
                      //             blurRadius: 10,
                      //             offset: const Offset(0, 4),
                      //           ),
                      //         ],
                      //       ),
                      //       child: Row(
                      //         children: [
                      //           // Mock flag/bank avatar
                      //           Container(
                      //             width: 42,
                      //             height: 42,
                      //             decoration: BoxDecoration(
                      //               color: const Color(0xFFF9EBEA),
                      //               borderRadius: BorderRadius.circular(12),
                      //             ),
                      //             alignment: Alignment.center,
                      //             child: const Text(
                      //               "🇮🇳",
                      //               style: TextStyle(fontSize: 20),
                      //             ),
                      //           ),
                      //           const SizedBox(width: 12),
                      //           Expanded(
                      //             child: Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: const [
                      //                 Text(
                      //                   "Rahul Sharma",
                      //                   style: TextStyle(
                      //                     fontSize: 14,
                      //                     fontWeight: FontWeight.bold,
                      //                     color: Color(0xFF2C1E1B),
                      //                   ),
                      //                 ),
                      //                 SizedBox(height: 2),
                      //                 Text(
                      //                   "HDFC Bank, Mumbai",
                      //                   style: TextStyle(
                      //                     fontSize: 12,
                      //                     color: Color(0xFF8C7F7B),
                      //                   ),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //           const Text(
                      //             "AED 500",
                      //             style: TextStyle(
                      //               fontSize: 15,
                      //               fontWeight: FontWeight.w900,
                      //               color: Color(0xFF2C1E1B),
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // Advertisement/Promotion Carousel from base logic
                      GetBuilder<DataController>(
                        id: 'Advertisement',
                        builder: (dataCntrl) {
                          if (accountController.loading) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              height: 140,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppConfigs.primaryColor.withAlpha(50),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Opacity(
                                opacity: 0.2,
                                child: Base64Image(image: Box3.companyLogo),
                              ),
                            );
                          }
                          if (Box3.settings.enablePromotionPreLogin == true &&
                              Get.find<DataController>()
                                  .promotions
                                  .isNotEmpty) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: dataController.fixedPromotion != null
                                  ? AdvertisementBanner(
                                      advertisement:
                                          dataController.fixedPromotion!)
                                  : CustomCarouselSlider(
                                      accountController: accountController,
                                      promotions: dataController.promotions,
                                    ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                ),

                // Floating bottom section for News Marquee and premium custom Navigation Bar
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // News Banner implementation from base logic
                      if (dataController.newsList.isNotEmpty)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                            color: accountController.isDark?AppConfigs.b : AppConfigs.w,
                          ),
                          child: GetBuilder<DataController>(
                            id: 'news',
                            builder: (controller) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: AnimatedSize(
                                  duration: const Duration(milliseconds: 300),
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
                                                ? 300
                                                : 50,
                                        minHeight: 50,
                                      ),
                                      decoration: BoxDecoration(
                                        color: HSLColor.fromColor(AppConfigs.primaryColor)
                                            .withLightness(
                                            (HSLColor.fromColor(AppConfigs.primaryColor).lightness + 0.45).clamp(0.0, 1.0))
                                            .toColor(),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 8,
                                                          vertical: 4),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        color: AppConfigs
                                                            .primaryColor,
                                                      ),
                                                      child: Icon(
                                                        Icons.newspaper,
                                                        color: AppConfigs.w,
                                                      )),
                                                  const SizedBox(width: 5),
                                                  Text(
                                                    "NEWS",
                                                    style: TS.f18B.copyWith(
                                                      color: AppConfigs
                                                          .primaryColor,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 8),
                                                  if (controller
                                                      .isNewsExpanded.isFalse)
                                                    Expanded(
                                                      child: Marquee(
                                                        text: controller
                                                            .newsList
                                                            .map((e) => e
                                                                .newsTitle
                                                                .toString())
                                                            .join('   •   '),
                                                        style: const TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 13),
                                                        scrollAxis:
                                                            Axis.horizontal,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        blankSpace: 30.0,
                                                        velocity: 50.0,
                                                        pauseAfterRound:
                                                            const Duration(
                                                                seconds: 1),
                                                        startPadding: 10.0,
                                                      ),
                                                    ),
                                                  if (controller
                                                      .isNewsExpanded.isTrue)
                                                    const Spacer(),
                                                  Icon(
                                                    controller.isNewsExpanded
                                                            .isFalse
                                                        ? Icons
                                                            .arrow_forward_ios_rounded
                                                        : Icons
                                                            .keyboard_arrow_down_rounded,
                                                    color: AppConfigs.primaryColor,
                                                    size: 17,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
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
                                                                    12.0,
                                                                vertical: 6.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                const CircleAvatar(
                                                                  radius: 4,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .blue,
                                                                ),
                                                                const SizedBox(
                                                                    width: 8),
                                                                Expanded(
                                                                  child: Text(
                                                                    newsItem
                                                                        .newsTitle
                                                                        .toString(),
                                                                    style:
                                                                        const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          13,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left:
                                                                          16.0,
                                                                      top: 4.0),
                                                              child: controller
                                                                      .isLoadingNewsContent(
                                                                          newsItem
                                                                              .code!)
                                                                  ? const NewsContentShimmer()
                                                                  : Html(
                                                                      data: newsItem
                                                                              .newsContent
                                                                              ?.toString() ??
                                                                          "",
                                                                      style: {
                                                                        "body":
                                                                            Style(
                                                                          color:
                                                                              Colors.black87,
                                                                          fontSize:
                                                                              FontSize(13.0),
                                                                        ),
                                                                      },
                                                                    ),
                                                            ),
                                                            const Divider(
                                                                color: Colors
                                                                    .black12),
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
                        ),

                      // --- Premium Ahalia Pay Bottom Navigation Bar ---
                      Container(
                        decoration: BoxDecoration(
                            color: Get.find<AccountController>().isDark
                                ? AppConfigs.bf0
                                : Colors.white,
                            ),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Get.find<AccountController>().isDark
                                  ? AppConfigs.bf0
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.06),
                                  blurRadius: 20,
                                  offset: const Offset(0, -4),
                                ),
                              ],),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _navItem(
                                icon: SvgIcons.home3,
                                label: cms(Fields.Dashboard_HomeIconAndText)
                                    .textHeading!,
                                selected: true,
                                onTap: () {},
                              ),
                              _navItem(
                                icon: SvgIcons.sendMoney6,
                                label: cms(Fields.Dashboard_SendMoneyIconAndText)
                                    .textHeading!,
                                selected: false,
                                onTap: () => accountController.preLoginAlert(),
                              ),
                              _navItem(
                                icon: SvgIcons.liveRates6,
                                label: cms(Fields
                                        .Dashboard_RateCalculatorIconAndText)
                                    .textHeading!,
                                selected: false,
                                onTap: () => accountController.preLoginAlert(),
                              ),
                              _navItem(
                                icon: SvgIcons.loyalty6,
                                label: cms(Fields.Dashboard_LoyaltyIconAndText)
                                    .textHeading!,
                                selected: false,
                                onTap: () => accountController.preLoginAlert(),
                              ),
                              _navItem(
                                icon: SvgIcons.profile6,
                                label: cms(Fields.Dashboard_ProfileIconAndText)
                                    .textHeading!,
                                selected: false,
                                onTap: () => accountController.preLoginAlert(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  // Ahalia Pay Logo drawing using container design
  Widget _ahaliaLogo() {
    final companyLogo = Base64Image(
      image: Box3.companyLogo,
      fit: BoxFit.contain,
    );
    return SizedBox(
      height: 38,
      child: companyLogo,
    );
  }

  // Helper widget for Quick Action Item
  Widget _quickActionItem({
    required String label,
    required Color bgColor,
    required Widget icon,
    required VoidCallback onTap,
    required double size,
  }) {
    return GestureDetector(
      key: Key(label),
      onTap: onTap,
      child: Container(
        width: size,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Get.find<AccountController>().isDark
              ? AppConfigs.w.withOpacity(0.1)
              : Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: bgColor.withOpacity(0.1),
          ),
        ),
        child: Column(
          key: Key('${label}_column'),
          children: [
            Container(
              key: Key('${label}_container'),
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppConfigs.primaryColor.withAlpha(15),
                // borderRadius: BorderRadius.circular(15),
                // border: Border.all(
                //   color: bgColor.withOpacity(0.2),
                // ),
              ),
              child: Center(
                key: Key('${label}_center'),
                child: icon,
              ),
            ),
            const SizedBox(
              key: Key('spacing'),
              height: 8,
            ),
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                label,
                key: Key('${label}_text'),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Get.find<AccountController>().isDark
                      ? AppConfigs.w
                      : Color(0xFF2C1E1B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }



  // Premium Custom Nav Item
  Widget _navItem({
    required String icon,
    required String label,
    required bool selected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      key: Key("nav_item_$label"),
      onTap: onTap,
      child: Container(
        key: Key("nav_item_container_$label"),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        decoration: selected == true
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppConfigs.primaryColor.withOpacity(0.2))
            : null,
        child: Column(
          key: Key("nav_item_column_$label"),
          children: [
            Container(
                key: Key("nav_item_column_container_$label"),
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: null,
                child: SvgPicture.asset(
                  icon,
                  width: 20,
                  key: Key("nav_item_image_$label"),
                  colorFilter: ColorFilter.mode(
                      selected == true
                          ? AppConfigs.primaryColor
                          : AppConfigs.g70,
                      BlendMode.srcIn),
                )),
            ...[
              const SizedBox(height: 5),
              Text(
                label,
                key: Key("nav_item_text_$label"),
                style: TextStyle(
                  color: selected == true
                      ? AppConfigs.primaryColor
                      : AppConfigs.g70,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
