import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/masters/master_response_fz.dart';
import '../../network/api_service_new.dart';
import '../../ui_common/app_routes.dart';
import '../exports/controllers.dart';
import '../flavours/constants.dart';

class LanguageController extends GetxController {
  bool isLoading = false;
  var selectedItem = 2.obs;

  final RxString locale = Get.locale.toString().obs;

  bool isDark = Get.find<AccountController>().isDark;

  var languageList = <MasterResponseFZ>[].obs;
  var filterLanguageList = <MasterResponseFZ>[].obs;
  var selectedLanguage = MasterResponseFZ().obs;

  Future<void> getLanguageList() async {
    languageList.value = await ApiService().getCatalogue(
        typeData: {"Type": "LANGUAGE", "LanguageCode": "EN"}, type: 'LANGUAGE');
    filterLanguageList.value = languageList;
    updateLocale(Box3.lang ?? languageList.where((e) => e.Code == "EN").first);
  }

  Future<void> filterLanguage(String val) async {
    if (val.isNotEmpty) {
      filterLanguageList.value = languageList
          .where((e) => e.Desc.toLowerCase().contains(val.toLowerCase()))
          .toList();
    } else {
      filterLanguageList.value = languageList;
    }
    Future.delayed(Duration(milliseconds: 300), () {
      update();
    });
  }

  Future<void> updateLocale(MasterResponseFZ l) async {
    Get.updateLocale(Locale(l.Code.toString().toLowerCase(), l.Code));
    locale.value = Get.locale.toString();
    selectedLanguage.value = l;
    isLoading = true;
    update();
    await Box3.setLang(selectedLanguage.value);
    isLoading = false;
    update();
    await Box3.loadCms();
    update();
    if (Get.isRegistered<AccountController>() == true) {
      Get.find<AccountController>()
        ..getContactUs(force: true)
        ..update();
    }

    if (Get.isRegistered<AuthController>() == true) {
      Get.find<AuthController>().update();
    }

    if (Get.isRegistered<BeneficiaryController>() == true) {
      Get.find<BeneficiaryController>().update();
    }

    if (Get.isRegistered<AddBeneficiaryController>() == true) {
      Get.find<AddBeneficiaryController>().update();
    }

    if (Get.isRegistered<BillPayController>() == true) {
      Get.find<BillPayController>().update();
    }

    if (Get.isRegistered<DataController>() == true) {
      Get.find<DataController>()
        ..getNews()
        ..getPromotions()
        ..update();
    }

    if (Get.isRegistered<KycController>() == true) {
      Get.find<KycController>().update();
    }

    if (Get.isRegistered<MainController>() == true) {
      Get.find<MainController>().update();
    }

    if (Get.isRegistered<SignUpController>() == true) {
      Get.find<SignUpController>().update();
    }

    if (Get.isRegistered<TimerContoller>() == true) {
      Get.find<TimerContoller>().update();
    }

    if (Get.isRegistered<TransactionController>() == true) {
      Get.find<TransactionController>().update();
    }

    if (Get.isRegistered<TransferController>() == true) {
      Get.find<TransferController>().update();
    }
    if (Get.isRegistered<LanguageController>() == true) {
      Get.find<LanguageController>().update();
    }

    update();
  }

  String getRoute() {
    switch (Box3.status) {
      case AppStatus.firstLaunch:
        Get.put(AccountController())
          ..themeType = Box3.theme
          ..update();
        return AppRoutes.selectLanguage;
      case AppStatus.onBoarded:
        Get.put(AccountController());
        return (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.nid;
      case AppStatus.loggedIn:
        Get
          ..put(AccountController()).ltc.mobileNoCtrl.text =
              Box3.customerDetailsFZ?.data?.mobileNo ?? ''
          ..put(AuthController(), permanent: true);
        return (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login;
    }
  }

  @override
  void onInit() {
    // getLanguageList();
    super.onInit();
  }
}
