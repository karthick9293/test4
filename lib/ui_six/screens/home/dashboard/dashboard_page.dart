import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:marquee/marquee.dart';
import 'package:mobiremit/ui_six/shimmers/news_content_shimmer.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/exports/ui_six_pages.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/transaction_details/transaction_details_fz.dart';
import '../../../custom_widgets/live_rate_widget.dart';
import '../benefciary/beneficiary_tile3.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppRoutes.getPage(AppRoutes.dashboard);
  }
}

class DashboardPageUiSix extends StatefulWidget {
  const DashboardPageUiSix({super.key});

  @override
  State<DashboardPageUiSix> createState() => _DashboardPageUiSixState();
}

class _DashboardPageUiSixState extends State<DashboardPageUiSix> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInit();
  }

  getInit() async {
    Get.put(TransactionController()).loading = true;
    await Get.find<DataController>().getData(TransactionController);
  }

  @override
  Widget build(BuildContext context) {
    void scrollToBottom(ScrollController mainScrollController) {
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

    final companyLogo = Base64Image(
      image: Box3.companyLogo,
    );

    return GetBuilder<MainController>(builder: (mainController) {
      // Logic from base dashboard page:
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
            page: const PayBillPage(),
          ));
        } else if (utilityTypes.contains("dth")) {
          tiles.add(
            dashtile2(SvgIcons.dth, 'DTH'.tr,
                page: const PayBillPage(), b: BillType.dth),
          );
        } else if (utilityTypes.contains("wifi")) {
          tiles.add(
            dashtile2(SvgIcons.wifi, 'WiFi'.tr,
                page: const PayBillPage(), b: BillType.wifi),
          );
        } else if (utilityTypes.contains("gas")) {
          tiles.add(
            dashtile2(SvgIcons.gas, 'Gas'.tr,
                page: const PayBillPage(), b: BillType.gas),
          );
        } else if (utilityTypes.contains("electricity")) {
          tiles.add(
            dashtile2(SvgIcons.electricity, 'Electricity'.tr,
                page: const PayBillPage(), b: BillType.elec),
          );
        } else if (utilityTypes.contains("rent")) {
          tiles.add(
            dashtile2(
              SvgIcons.rent,
              'Rent'.tr,
              page: const PayBillPage(),
            ),
          );
        } else if (utilityTypes.contains("education")) {
          tiles.add(
            dashtile2(
              SvgIcons.education,
              'Education'.tr,
              page: const PayBillPage(),
            ),
          );
        } else if (utilityTypes.contains("credit card")) {
          tiles.add(
            dashtile2(
              SvgIcons.creditCard,
              'Credit_card'.tr,
              page: const PayBillPage(),
            ),
          );
        } else if (utilityTypes.contains("water")) {
          tiles.add(dashtile2(
            SvgIcons.water,
            'Water'.tr,
            page: const PayBillPage(),
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

      // Action Handlers containing the secure visual/KYC logic from base dashboard page:
      void handleSendMoney() {
        late final SignUpController signupController;
        if (Get.isRegistered<SignUpController>()) {
          signupController = Get.find<SignUpController>();
        } else {
          signupController = Get.put(SignUpController());
        }
        if (Box3.idExpired) {
          signupController.showIDExpiredAlert();
        } else if (Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal() !=
                null &&
            Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
          AccountController a = Get.find<AccountController>();
          if (a.contactUs == null) {
            a.getContactUs();
          }
          if (!Get.isRegistered<KycController>()) {
            Get.put(KycController());
          }
          var expDate = Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
          int expiryDays = (DateTime(expDate!.year, expDate.month, expDate.day,
                      expDate.hour, expDate.minute)
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
            if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
              Get.to(const RetryVisualization(), arguments: {
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
        } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry == null) &&
            Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
          AccountController a = Get.find<AccountController>();
          if (a.contactUs == null) {
            a.getContactUs();
          }
          if (!Get.isRegistered<KycController>()) {
            Get.put(KycController());
          }

          Get.put(AccountController());

          if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
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
          if (Get.isRegistered<TransferController>()) {
            Get.find<TransferController>().reset(t: TransferType.all);
          } else {
            Get.put(TransferController(transferType: TransferType.all),
                permanent: true);
          }
          Get.find<TransferController>().toAmtCur =
              Get.find<AccountController>().toCur?.Code;
          mainController.push(
              AppConfigs.sendMoney(
                key: UniqueKey(),
              ),
              AppBars.sendMoney);
          d.getData(BeneficiaryController);
        }
      }

      void handleHistory() async {
        late final SignUpController signupController;
        if (Get.isRegistered<SignUpController>()) {
          signupController = Get.find<SignUpController>();
        } else {
          signupController = Get.put(SignUpController());
        }
        if (Box3.idExpired) {
          signupController.showIDExpiredAlert();
        } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry == null) &&
            Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
          AccountController a = Get.find<AccountController>();
          if (a.contactUs == null) {
            a.getContactUs();
          }
          if (!Get.isRegistered<KycController>()) {
            Get.put(KycController());
          }

          Get.put(AccountController());

          if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
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
            const MyTransactionsPage(),
            AppBars.myTransaction,
          );
          await Get.find<DataController>().getData(BeneficiaryController);
        }
      }

      void handleBeneficiaries() async {
        late final SignUpController signupController;
        if (Get.isRegistered<SignUpController>()) {
          signupController = Get.find<SignUpController>();
        } else {
          signupController = Get.put(SignUpController());
        }
        if (Box3.idExpired) {
          signupController.showIDExpiredAlert();
        } else if (Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal() !=
                null &&
            Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
          AccountController a = Get.find<AccountController>();
          if (a.contactUs == null) {
            a.getContactUs();
          }
          if (!Get.isRegistered<KycController>()) {
            Get.put(KycController());
          }
          Get.put(AccountController());

          var expDate = Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
          int expiryDays = (DateTime(expDate!.year, expDate.month, expDate.day,
                      expDate.hour, expDate.minute)
                  .toLocal())
              .difference(DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      DateTime.now().hour,
                      DateTime.now().minute)
                  .toLocal())
              .inMinutes;

          if (expiryDays <= 0) {
            if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
              Get.to(const RetryVisualization(), arguments: {
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
        } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry == null) &&
            Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
          AccountController a = Get.find<AccountController>();
          if (a.contactUs == null) {
            a.getContactUs();
          }
          if (!Get.isRegistered<KycController>()) {
            Get.put(KycController());
          }

          Get.put(AccountController());

          if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
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
          if (Get.isRegistered<AddBeneficiaryController>()) {
            Get.delete<AddBeneficiaryController>();
          }
          Get.put(BeneficiaryController()).loading = true;
          Get.put(AddBeneficiaryController());
          mainController.push(
              AppRoutes.getPage(AppRoutes.myBeneficiary),
              const PreferredSize(
                  preferredSize: Size(0, 0), child: SizedBox()));
          await d.getData(BeneficiaryController);
        }
      }

      // Greetings showing dynamic authenticated user name:
      String displayName = "Ahmed Al Rashidi";
      if (Box3.customerDetailsFZ?.data != null) {
        final profile = Box3.customerDetailsFZ!.data!;
        displayName = profile.name ?? profile.name ?? "Ahmed Al Rashidi";
      }

      return Scaffold(
        // backgroundColor: const Color(0xFFFFFDFD), // Soft white/beige backdrop
        body: PopScope(
          canPop: false,
          child: SafeArea(
            top: true,
            bottom: false,
            child: Stack(
              children: [
                // Custom gradient background decoration matching screenshot
                Container(
                  decoration: BoxDecoration(
                    gradient: mainController.isDark?null:AppConfigs.linearGradientUiSix
                  ),
                ),
                KeyboardActions(
                  config: Get.find<MainController>().keyboardConfig(context),
                  child: SingleChildScrollView(
                    controller: mainController.scrollController,
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 120),
                    // Avoid overlap with news list/overlay
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // --- Premium Custom AppBar ---
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                        //   child: Row(
                        //     children: [
                        //       _ahaliaLogo(),
                        //       const Spacer(),
                        //       // Notification bell with badge '3'
                        //       GestureDetector(
                        //         onTap: () {
                        //           mainController.push(
                        //             const AppNotificationPage(),
                        //             AppBars.notification,
                        //           );
                        //         },
                        //         child: Stack(
                        //           clipBehavior: Clip.none,
                        //           children: [
                        //             Container(
                        //               padding: const EdgeInsets.all(8.0),
                        //               decoration: BoxDecoration(
                        //                 color: Colors.white,
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 border: Border.all(color: const Color(0xFFf5d5d6)),
                        //                 boxShadow: [
                        //                   BoxShadow(
                        //                     color: Colors.black.withOpacity(0.04),
                        //                     blurRadius: 8,
                        //                     offset: const Offset(0, 4),
                        //                   ),
                        //                 ],
                        //               ),
                        //               child: const Icon(
                        //                 Icons.notifications_none_rounded,
                        //                 color: Color(0xFFD32F2F),
                        //                 size: 24,
                        //               ),
                        //             ),
                        //             Positioned(
                        //               right:-2,
                        //               top: -2,
                        //               child: Container(
                        //                 padding: const EdgeInsets.all(3.0),
                        //                 decoration: const BoxDecoration(
                        //                   color: Color(0xFFD32F2F),
                        //                   shape: BoxShape.circle,
                        //                 ),
                        //                 constraints: const BoxConstraints(
                        //                   minWidth: 14,
                        //                   minHeight: 14,
                        //                 ),
                        //                 child: const Text(
                        //                   '3',
                        //                   style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontSize: 8,
                        //                     fontWeight: FontWeight.bold,
                        //                   ),
                        //                   textAlign: TextAlign.center,
                        //                 ),
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //       const SizedBox(width: 10),
                        //       // Profile icon (opens MyProfilePage)
                        //       GestureDetector(
                        //         onTap: () => mainController.push(const MyProfilePage(), AppBars.myProfile),
                        //         child: Container(
                        //           padding: const EdgeInsets.all(8.0),
                        //           decoration: BoxDecoration(
                        //             color: Colors.white,
                        //             borderRadius: BorderRadius.circular(10),
                        //             border: Border.all(color: const Color(0xFFf5d5d6)),
                        //             boxShadow: [
                        //               BoxShadow(
                        //                 color: Colors.black.withOpacity(0.04),
                        //                 blurRadius: 8,
                        //                 offset: const Offset(0, 4),
                        //               ),
                        //             ],
                        //           ),
                        //           child: const Icon(
                        //             Icons.person_outline_rounded,
                        //             color: Color(0xFF5D6D7E),
                        //             size: 24,
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),

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
                              Text(displayName,
                                style: GoogleFonts.montserrat(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  color: mainController.isDark ? AppConfigs.w : const Color(0xFF2C1E1B),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // --- Last Transaction Gradient Card ---
                        GetBuilder<TransactionController>(builder: (tc) {
                          if (tc.transactions.isEmpty) return SizedBox();
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [

                                    HSLColor.fromColor(AppConfigs.primaryColor)
                                    .withLightness(
                                    (HSLColor.fromColor(AppConfigs.primaryColor).lightness + 0.08).clamp(0.0, 1.0))
                                    .toColor(),

                                    AppConfigs.primaryColor,

                                HSLColor.fromColor(AppConfigs.primaryColor)
                                    .withLightness(
                                    (HSLColor.fromColor(AppConfigs.primaryColor).lightness - 0.10).clamp(0.0, 1.0))
                                    .toColor(),

                                ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight
                                ),
                                borderRadius: BorderRadius.circular(24.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: AppConfigs.primaryColor
                                        .withOpacity(0.25),
                                    blurRadius: 15,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "LAST TRANSACTION",
                                    style: TS.f12.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white.withOpacity(0.85),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    children: [
                                      // Receiver Avatar
                                      Container(
                                        width: 48,
                                        height: 48,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.2),
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        alignment: Alignment.center,
                                        child: Text(
                                          tc.transactions.first.beneficiaryName
                                              .toString()
                                              .split('')
                                              .first
                                              .toUpperCase(),
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      // Recipient & Bank details
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              tc.transactions.first
                                                      .beneficiaryName ??
                                                  "Rahul Sharma",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(height: 2),
                                            Text(
                                              tc.transactions.first.bankName ??
                                                  "🇮🇳 HDFC Bank, Mumbai",
                                              style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.95),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Amount Details
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "SENT",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.7),
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          CurrencySymbolWithAmount(
                                            currencyCode: Box3
                                                    .companyDataFZ
                                                    ?.companySettings
                                                    ?.primaryBaseCurrency ??
                                                "AED",
                                            amount: (tc.transactions.first
                                                        .netAmount ??
                                                    "0")
                                                .toString(),
                                            textStyle: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                          ),
                                          const SizedBox(height: 2),
                                          CurrencySymbolWithAmount(
                                            currencyCode: tc.transactions.first
                                                    .fromCurrencyCode ??
                                                "AED",
                                            amount: (tc.transactions.first
                                                        .paymentAmount ??
                                                    "0")
                                                .toString(),
                                            textStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w900),
                                            label: "→ ",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  // Repeat Transfer Button
                                  GestureDetector(
                                    onTap: handleSendMoney,
                                    child: Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12.0),
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.12),
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        border: Border.all(
                                          color: Colors.white.withOpacity(0.35),
                                          width: 1,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Icon(
                                            Icons.autorenew_rounded,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                            "Repeat This Transfer",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

                        // --- Quick Actions Grid Section ---
                        Padding(
                          padding: EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 12.0),
                          child: Text(
                            cms(Fields.Dashboard_QuickAction).textHeading!,
                            style: TS.f14.copyWith(
                              fontWeight: FontWeight.w900,
                              color: AppConfigs.primaryColor,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: LayoutBuilder(
                              builder: (context,constraint) {
                                var maxWidth = constraint.maxWidth/4 - 5;
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
                                        icon: SvgPicture.asset(SvgIcons.sendMoney6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: handleSendMoney,
                                        size: maxWidth
                                      ),
                                      _quickActionItem(
                                        label: "History",
                                        bgColor: const Color(0xFF2E7D32),
                                        // Light green
                                        icon: SvgPicture.asset(SvgIcons.transferHistory6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: handleHistory,
                                          size: maxWidth
                                      ),
                                      _quickActionItem(
                                        label: "Beneficiaries",
                                        bgColor: const Color(0xFFE65100),
                                        // Light peach
                                        icon: SvgPicture.asset(SvgIcons.beneficiary6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: handleBeneficiaries,
                                          size: maxWidth
                                      ),
                                      _quickActionItem(
                                        label: "Live Rates",
                                        bgColor: const Color(0xFFC62828),
                                        // Light red
                                        icon: SvgPicture.asset(SvgIcons.liveRates6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: () {
                                          mainController.push(
                                              const ForexRatesPage(),
                                              AppBars.forexRates);
                                        },
                                          size: maxWidth
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 18),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      _quickActionItem(
                                        label: "Buy Gold",
                                        bgColor: const Color(0xFFF5B041),
                                        // Light gold
                                        icon: SvgPicture.asset(SvgIcons.buyGold6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: () {
                                          alert("Gold",
                                              "Buy Gold option coming soon!");
                                        },
                                          size: maxWidth
                                      ),
                                      _quickActionItem(
                                        label: "Loyalty",
                                        bgColor: const Color(0xFF7D3C98),
                                        // Light purple
                                        icon: SvgPicture.asset(SvgIcons.loyalty6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: () {
                                          alert("Loyalty",
                                              "Loyalty Rewards program coming soon!");
                                        },
                                          size: maxWidth
                                      ),
                                      _quickActionItem(
                                        label: "Buy Forex",
                                        bgColor: const Color(0xFFF1C40F),
                                        // Light yellow
                                        icon: SvgPicture.asset(SvgIcons.buyForex6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: () {
                                          alert(
                                            "Forex",
                                            "Foreign currency orders coming soon!",
                                          );
                                        },
                                          size: maxWidth
                                      ),
                                      _quickActionItem(
                                        label: "Support",
                                        bgColor: const Color(0xFF2980B9),
                                        // Light blue
                                        icon: SvgPicture.asset(SvgIcons.support6, width: 27,colorFilter: ColorFilter.mode(AppConfigs.primaryColor, BlendMode.srcIn),),
                                        onTap: () {
                                          mainController.push(const ContactUsPage(),
                                              AppBars.contactUs);
                                        },
                                          size: maxWidth
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                          ),
                        ),

                        // --- Rate calculator component from base dashboard ---
                        // const SizedBox(height: 24),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        //   child: preLoginRateCard(
                        //       top: 182, height: 238, myContext: context, isPreLogin: false),
                        // ),

                        // --- Live Rates Section ---
                        LiveRateWidget(),

                        // --- Recent Transactions Section ---
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                cms(Fields.Dashboard_RecentTransaction).textHeading!,
                                style: TS.f14.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: AppConfigs.primaryColor,
                                ),
                              ),
                              GestureDetector(
                                onTap: handleHistory,
                                child: Row(
                                  children:[
                                    Text(
                                    cms(Fields.Dashboard_RecentTransactionSeeAll).textHeading!,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: AppConfigs.primaryColor,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_rounded,
                                      size: 14,
                                      color: AppConfigs.primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        GetBuilder<TransactionController>(builder: (tc) {
                          return Column(
                            children: List.generate(
                                tc.transactions.length > 5
                                    ? 5
                                    : tc.transactions.length, (i) {
                              TransactionDetailsFz trs = tc.transactions[i];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 2.5),
                                child: GestureDetector(
                                  onTap: handleHistory,
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.all(16.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: AppConfigs.primaryColor.withOpacity(0.2)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.02),
                                          blurRadius: 10,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 42,
                                          height: 42,
                                          decoration: BoxDecoration(
                                            color: const Color(0xFFF9EBEA),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "🇮🇳",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ),
                                        const SizedBox(width: 12),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                trs.beneficiaryName ??
                                                    "Rahul Sharma",
                                                style: TS.f14.copyWith(
                                                  fontWeight: FontWeight.w900,
                                                  color: AppConfigs.b,
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                trs.bankName ??
                                                    "HDFC Bank, Mumbai",
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color(0xFF8C7F7B),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            CurrencySymbolWithAmount(
                                              currencyCode: Box3
                                                      .companyDataFZ
                                                      ?.companySettings
                                                      ?.primaryBaseCurrency ??
                                                  "AED",
                                              amount:
                                                  (trs.netAmount ?? '0').toString(),
                                              textStyle: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w900),
                                            ),
                                            SizedBox(height: 5,),
                                            trs.transactionStatus
                                                ?.toLowerCase()
                                                .contains('processing') ==
                                                true ||
                                                trs.transactionStatus
                                                    ?.toLowerCase()
                                                    .contains('under process') ==
                                                    true
                                                ? StatusTiles.underProcessingTile(
                                                trs.transactionStatus)
                                                : trs.transactionStatus
                                                ?.toLowerCase()
                                                .contains('requested') ==
                                                true ||
                                                trs.transactionStatus
                                                    ?.toLowerCase()
                                                    .contains('pending') ==
                                                    true
                                                ? StatusTiles.waitingForApprovalTile(
                                                trs.transactionStatus)
                                                : trs.transactionStatus?.toLowerCase() ==
                                                'success'
                                                ? StatusTiles.successTile()
                                                : StatusTiles.failTile(
                                                text: trs.transactionStatus),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          );
                        }),

                        // --- Utility billing tiles from base logic ---
                        Visibility(
                          visible: tiles.isNotEmpty,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 24, 16, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        cms(Fields
                                                .Utility_HeadingAndDescription)
                                            .textHeading!,
                                        style: TS.f14.copyWith(
                                          fontWeight: FontWeight.w900,
                                          color: AppConfigs.primaryColor,
                                        )),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                    cms(Fields.Utility_HeadingAndDescription)
                                        .description!,
                                    style: TS.f12.copyWith(
                                      color: AppConfigs.accentColor,
                                    )),
                                const SizedBox(height: 18),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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

                        // Advertisement Carousel from base dashboard:
                        GetBuilder<DataController>(
                          id: 'Dashboard_Advertisement',
                          builder: (dataCntrl) {
                            if (mainController.loading) {
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
                                  child: companyLogo,
                                ),
                              );
                            }
                            if (Box3.settings.enablePromotionPreLogin == true &&
                                dataCntrl.promotions.isNotEmpty) {
                              if (dataCntrl.fixedPromotion != null) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 16.0),
                                  child: AdvertisementBanner(
                                    advertisement: dataCntrl.fixedPromotion!,
                                  ),
                                );
                              } else {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: CustomCarouselSlider(
                                    accountController: mainController,
                                    promotions: dataCntrl.promotions,
                                  ),
                                );
                              }
                            }
                            return const SizedBox();
                          },
                        ),
                      ],
                    ),
                  ),
                ),

                // Floating News list overlay (only shown when newsList is loaded)
                if (Get.find<DataController>().newsList.isNotEmpty)
                  GetBuilder<DataController>(
                    id: 'news',
                    builder: (controller) {
                      return Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                          decoration: BoxDecoration(
                            color: mainController.isDark?AppConfigs.b : AppConfigs.w.withOpacity(0.95),
                          ),
                          child: AnimatedSize(
                            duration: const Duration(milliseconds: 300),
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
                                  maxHeight: controller.isNewsExpanded.isTrue
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12.0),
                                        child: Row(
                                          children: [
                                            Container(
                                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(8),
                                                  color: AppConfigs.primaryColor,
                                                ),
                                                child: Icon(Icons.newspaper,color: AppConfigs.w,)
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "NEWS",
                                              style: TS.f18B.copyWith(
                                                color: AppConfigs.primaryColor,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(width: 8),
                                            if (controller
                                                .isNewsExpanded.isFalse)
                                              Expanded(
                                                child: Marquee(
                                                  text: controller.newsList
                                                      .map((e) => e.newsTitle
                                                          .toString())
                                                      .join('   •   '),
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 13),
                                                  scrollAxis: Axis.horizontal,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
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
                                                    controller.newsList[index];
                                                return Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12.0,
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
                                                                Colors.blue,
                                                          ),
                                                          const SizedBox(
                                                              width: 8),
                                                          Expanded(
                                                            child: Text(
                                                              newsItem.newsTitle
                                                                  .toString(),
                                                              style:
                                                                  const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 13,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                left: 16.0,
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
                                                                  "body": Style(
                                                                    color: Colors
                                                                        .black87,
                                                                    fontSize:
                                                                        FontSize(
                                                                            13.0),
                                                                  ),
                                                                },
                                                              ),
                                                      ),
                                                      const Divider(
                                                          color:
                                                              Colors.black12),
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
                        ),
                      );
                    },
                  ),

                /// 🔹 SEARCH RESULT OVERLAY (Remains active at top tier of the body stack from base logic)
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
        ),
      );
    });
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
          color: Get.find<AccountController>().isDark?AppConfigs.w.withOpacity(0.1):Colors.white,
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
                  color: Get.find<AccountController>().isDark?AppConfigs.w:Color(0xFF2C1E1B),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for Rate Card
  Widget _rateCard({
    required String pair,
    required String rate,
    required String change,
    required bool isPositive,
  }) {
    return Container(
      key: Key('rate_card_$pair'),
      width: Get.width * 0.30,
      // padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Get.find<MainController>().isDark?AppConfigs.w.withOpacity(0.1):Colors.white,
        // borderRadius: BorderRadius.circular(20),
        border: Border(right: BorderSide(
          color: Colors.grey.withAlpha(40)
        )),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        key: Key('rate_card_column_$pair'),
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            pair,
            key: Key('rate_card_pair_$pair'),
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: Color(0xFF8C7F7B),
            ),
          ),

          const SizedBox(
            key: Key('rate_card_spacing_1'),
            height: 2,
          ),

          Text(
            rate,
            key: Key('rate_card_rate_$pair'),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Get.find<MainController>().isDark?AppConfigs.w:Color(0xFF2C1E1B),
            ),
          ),

          const SizedBox(
            key: Key('rate_card_spacing_2'),
            height: 2,
          ),

          Text(
            change,
            key: Key('rate_card_change_$pair'),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: isPositive
                  ? const Color(0xFF2E7D32)
                  : const Color(0xFFC62828),
            ),
          ),
        ],
      ),
    );
  }
}

void alert(String t, String s) {
  Get.snackbar(
    t,
    s,
    // key: Key('snackbar_${t}_$s'),
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.all(12),
    borderRadius: 16,
    duration: const Duration(seconds: 3),
    barBlur: 30,
    backgroundGradient: LinearGradient(
      colors: [
        AppConfigs.accentColor,
        AppConfigs.primaryColor
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),

    titleText: Text(
      t,
      key: Key('snackbar_title_$t'),
      style: TextStyle(
        color: AppConfigs.accentColor,
        fontWeight: FontWeight.w900,
        fontSize: 15,
      ),
    ),

    messageText: Text(
      s,
      key: Key('snackbar_message_$s'),
      style: TextStyle(
        color: AppConfigs.accentColor,
        fontSize: 13,
      ),
    ),

    icon: const Icon(
      Icons.notifications_active_rounded,
      key: Key('snackbar_icon'),
      color: Colors.white,
    ),

    shouldIconPulse: true,
    snackStyle: SnackStyle.FLOATING,
    forwardAnimationCurve: Curves.easeOutBack,
    reverseAnimationCurve: Curves.easeIn,

    boxShadows: [
      BoxShadow(
        color: Colors.black.withOpacity(0.15),
        blurRadius: 10,
        offset: const Offset(0, 4),
      ),
    ],
  );
}
