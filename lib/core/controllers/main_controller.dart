import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/models/beneficiary/beneficiary_fz.dart';
import 'package:mobiremit/ui_common/app_routes.dart';

import '../../models/customer_details/customer_data_fz.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/rate_calculator/rate_calculator_fz.dart';
import '../../network/api_service_new.dart';
import '../editing_controllers.dart/attributes.dart';
import '../exports/controllers.dart';
import '../flavours/constants.dart';
import '../models/security_page_parameters.dart';
import 'package:mobiremit/core/models/formatter.dart';

class MainController extends GetxController {
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  bool loading = false;
  RxBool rateLoading = false.obs;
  late DateTime selectedMonth;
  ThemeType themeType = Box3.theme;
  bool isDark = Get.find<AccountController>().isDark, buttonLoading = false;
  List<Widget> pages = [AppRoutes.getPage(AppRoutes.dashboard)];
  List<PreferredSizeWidget> appBars = [dashBoardAppbar()];
  RechargeType rechargeType = RechargeType.prepaid;
  ScrollController scrollController = ScrollController(keepScrollOffset: true);
  TextEditingController fromAmtCtrl = TextEditingController(),
      toAmtCtrl = TextEditingController(),
      rechargeAmt = TextEditingController(),
      dashboardSearch = TextEditingController(),
      changeLogController = TextEditingController();
  final RxBool searchClear = false.obs;
  List<BeneficiaryFz> benefs = [];
  final RxList<BeneficiaryFz> filteredBenefs = <BeneficiaryFz>[].obs;

  String? fromCur = Box3.companyDataFZ?.companySettings?.primaryBaseCurrency;

  int index = 0, selectedAmount = 399;
  CarouselSliderController sliderController = CarouselSliderController();
  List<Widget> tiles = [];
  ChangePasswordAttributes pwdAttributes = ChangePasswordAttributes(),
      pinAttributes = ChangePasswordAttributes();
  CustomerDataFZ? customerDataFZ = Box3.customerDetailsFZ;
  bool isBiometric = Box3.isBiometricEnabled ?? false;
  List<int> appDrawerRoutePageIndex = [];
  RxString oneUnitValue = '-'.obs;

  void push(Widget w, PreferredSizeWidget? appBar,
      {bool fromAppDrawer = false}) {
    bool clear = pages.length == 1 &&
        pages.last.runtimeType ==
            AppRoutes.getPage(AppRoutes.dashboard).runtimeType;
    if (w == AppRoutes.getPage(AppRoutes.dashboard)) {
      index = 0;
    }
    if (fromAppDrawer) {
      appDrawerRoutePageIndex.add(pages.length);
    }
    if (pages.isNotEmpty) {
      handlePush(pages.last.runtimeType);
    }
    {
      pages.add(w);
      if (appBar != null) {
        appBars.add(appBar);
      }
    }
    if (clear) {
      dashboardSearch.clear();
      benefs.clear();
      // fromAmtCtrl.clear();
      // toAmtCtrl.clear();
    }
    update();
  }

  void handlePush(Type? t) {
    if (t != null) {
      switch (t) {
        // case BillRechargeMorePage _:
        //   Get.delete<BillPayController>();
        //   break;
        default:
          break;
      }
    }
  }

  SecuritySettingsParams ssp = SecuritySettingsParams();

  Future<void> updateTheme(ThemeType t) async {
    await Box3.setTheme(t);
    themeType = t;
    update();
    Get.find<AccountController>()
      ..themeType = t
      ..setTheme(
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark);
  }

  void pop() {
    if (pages.length > 1) {
      Type? t = pages.last.runtimeType;
      if ((t == AppRoutes.getPage(AppRoutes.currencyRates).runtimeType) ||
          t == AppRoutes.getPage(AppRoutes.sendMoney).runtimeType) {
        index = 0;
        update();
      }
      if (!((t == AppRoutes.getPage(AppRoutes.myBeneficiary).runtimeType ||
              (t ==
                  AppRoutes.getPage(AppRoutes.archivedBeneficiary)
                      .runtimeType)) &&
          Get.find<BeneficiaryController>().isSelecting)) {
        pages.removeLast();
        if (appDrawerRoutePageIndex.contains(pages.length)) {
          key.currentState?.openDrawer();
          appDrawerRoutePageIndex.removeLast();
        }
        if (appBars.length > 1) {
          appBars.removeLast();
        }
        update();
        handlePop(t);
      } else {
        Get.find<BeneficiaryController>()
          ..isSelecting = false
          ..markedBeneficiary.clear()
          ..update();
      }
    }
  }

  void handlePop(Type? t) {
    if (t != null) {
      switch (t) {
        // case const (MyBeneficiaryPage):
        //   Get.delete<BeneficiaryController>();
        //   break;
        // case const (BillRechargeMorePage):
        //   Get.delete<BillPayController>();
        //   break;
        default:
          break;
      }
    }
  }

  void search(String v) {
    if (v.isNotEmpty) {
      searchClear.value = true;
      filteredBenefs.assignAll(
        Get.find<DataController>().beneficiaries.where((b) =>
            b.name?.toLowerCase().contains(v.toLowerCase()) == true ||
            b.accountNumber?.toLowerCase().contains(v.toLowerCase()) == true),
      );
    } else {
      searchClear.value = false;
      filteredBenefs.clear();
    }
  }

  Future<void> updateToCurrency(
      {required String s,
      required String type,
      String? serviceCategoryCode}) async {
    rateLoading.value = true;
    // update(['Rate-Card']);

    try {
      RateCalculatorFz? g = await ApiService().guestRate(
          amount: s,
          currency: Get.find<AccountController>().toCur?.Code,
          serviceCategoryCode: serviceCategoryCode,
          type: type);
      if (g != null) {
        if (type == 'L' &&
            fromAmtCtrl.text.isNotEmpty &&
            (g.lcyAmount
                    ?.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength) ==
                double.parse(fromAmtCtrl.text)
                    .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength))) {
          toAmtCtrl.text =
              g.fcyAmount!.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength);
        }
        if (type == 'F' &&
            toAmtCtrl.text.isNotEmpty &&
            (g.fcyAmount
                    ?.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength) ==
                double.parse(toAmtCtrl.text)
                    .toStringWithOptionalFixed(Box3.settings.currencyDecimalLength))) {
          fromAmtCtrl.text =
              g.lcyAmount!.toStringWithOptionalFixed(Box3.settings.currencyDecimalLength);
        }
      }
    } finally {
      rateLoading.value = false;
      // update(['Rate-Card']);
    }
  }

  final FocusNode fromAmountNode = FocusNode();
  final FocusNode toAmountNode = FocusNode();

  KeyboardActionsConfig keyboardConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: fromAmountNode,
          ),
          KeyboardActionsItem(
            focusNode: toAmountNode,
          ),
        ]);
  }

  Timer? debounce;

  /// change MPIN change Password
  KeyboardActionsConfig keyboardConfigMPIN(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: pinAttributes.currentPasswordFocusNode,
          ),
          KeyboardActionsItem(
            focusNode: pinAttributes.newPasswordFocusNode,
          ),
          KeyboardActionsItem(
            focusNode: pinAttributes.confirmPasswordFocusNode,
          ),
        ]);
  }

  /// change mpin and change password form rules part
  ///

  FormParameters resetMPINForm = FormParameters(type: FormType.resetMPINForm),
      resetPasswordForm = FormParameters(type: FormType.resetPasswordForm);

  FormRulesData? resetMPINFormFZ, resetPasswordFormFZ;

  Future<void> getResetMPINFrom() async {
    FormRulesData? f = Box3.resetMPINFormFZ;
    if (f == null) {
      await Box3.getResetMPINForm();
      f = Box3.resetMPINFormFZ;
      loading == false;
      update();
    }
    if (f != null) {
      resetMPINFormFZ = f;
      resetMPINForm.initialiseForm(f.formFieldItem);
      loading == false;
      update();
    }
  }

  Future<void> getResetPasswordFrom() async {
    FormRulesData? f = Box3.resetPasswordFormFZ;
    if (f == null) {
      await Box3.getResetPasswordForm();
      f = Box3.resetPasswordFormFZ;
      loading == false;
      update();
    }
    if (f != null) {
      resetPasswordFormFZ = f;
      resetPasswordForm.initialiseForm(f.formFieldItem);
      loading == false;
      update();
    }
  }

  bool showNewPwd = true,
      showCnfPwd = true,
      showNewMpin = true,
      showCnfMpin = true;
  SignUpAttributes signUpAttributes = SignUpAttributes();

  void handleRateCardSendMoneyTap({
    bool preLogin = true,
    double height = 238,
    Widget Function({String? msg, required String type})?
        updateProfileBodyBuilder,
    PreferredSizeWidget? sendMoneyAppBar,
  }) {
    if (preLogin == false || height == 238) {
      late final SignUpController signupController;
      if (Get.isRegistered<SignUpController>()) {
        signupController = Get.find<SignUpController>();
      } else {
        signupController = Get.put(SignUpController());
      }
      if (Box3.idExpired) {
        signupController.showIDExpiredAlert();
      } else if (Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal() != null &&
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
            Get.toNamed(AppRoutes.visualizationRetryRoutes, arguments: {
              "msg":
                  'There was an error while fetching your documents from UAE PASS. Please retry'
                      .tr,
              "type": 'P',
              "isFrom": 'Dash'
            });
          }
        } else {
          if (Get.isDialogOpen != true && updateProfileBodyBuilder != null) {
            Get.dialog(updateProfileBodyBuilder(
                msg:
                    'Your request/application is under process. We will get back to you within 24 hours'
                        .tr,
                type: 'P'));
          }
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
          Get.toNamed(AppRoutes.visualizationRetryRoutes, arguments: {
            "msg":
                'There was an error while fetching your documents from UAE PASS. Please retry'
                    .tr,
            "type": 'P',
            "isFrom": 'Dash'
          });
        }
      } else {
        if (Get.isRegistered<TransferController>()) {
          Get.find<TransferController>().reset(t: TransferType.all);
        } else {
          Get.put(TransferController(transferType: TransferType.all),
              permanent: true);
        }

        Get.find<TransferController>()
          ..fromAmountCtrl.text = fromAmtCtrl.text
          ..toAmountCtrl.text = toAmtCtrl.text
          ..fromAmtCur = fromCur ?? 'AED'
          ..toAmtCur = Get.find<AccountController>().toCur?.Code
          ..update();
        push(
            AppConfigs.sendMoney(
              key: UniqueKey(),
            ),
            sendMoneyAppBar);
      }
    } else {
      Get.find<AccountController>()
          .preLoginAlert(postLoginDestination: 'send_money');
    }
    update();
  }
}

