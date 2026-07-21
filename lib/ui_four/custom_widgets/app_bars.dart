import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_four_custom_widgets.dart';
import '../../core/flavours/constants.dart';

class AppBars {
  static PreferredSizeWidget aboutUs =
      appBar0(cms(Fields.SideMenu_AboutUsIconAndText).textHeading!);
  static PreferredSizeWidget addBeneficiary =
      appBar0(cms(Fields.MyBeneficiary_AddBeneficiary).textHeading!);
  static PreferredSizeWidget archivedBeneficiaries =
      appBar0('Archived_Beneficiaries'.tr);
  static PreferredSizeWidget bankTransfer = appBar0('bank_transfer'.tr);
  static PreferredSizeWidget billRechargeMore =
      appBar0('bills_recharges_more'.tr);
  static PreferredSizeWidget branchLocator = appBar0('branch_locator'.tr);
  static PreferredSizeWidget cashTransfer = appBar0('cash_pickup_service'.tr);
  static PreferredSizeWidget walletTransfer =
      appBar0('wallet_transfer_service'.tr);
  static PreferredSizeWidget contactUs =
      appBar0(cms(Fields.SideMenu_ContactUsIconAndText).textHeading!);
  static PreferredSizeWidget createAlert = appBar0('create_alert'.tr);
  static PreferredSizeWidget chatWithUs = PreferredSize(
    preferredSize: const Size(double.infinity, 58),
    child: GetBuilder<AccountController>(builder: (accountController) {
      return appBar2(
        cms(Fields.SideMenu_WhatsAppIconAndText).textHeading!,
        RotatedBox(
          quarterTurns: Box3.lang!.Code == 'ar' ? 2 : 0,
          child: SvgPicture.asset(ImagePath.backIcon,
              height: 30,
              colorFilter: accountController.isDark
                  ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn)
                  : null),
        ),
        RotatedBox(
          quarterTurns: Box3.lang!.Code == 'ar' ? 2 : 0,
          child: SvgPicture.asset(ImagePath.chatCall,
              height: 20,
              colorFilter: accountController.isDark
                  ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn)
                  : null),
        ),
      );
    }),
  );
  static PreferredSizeWidget changePassword = appBar0('change_password'.tr);
  static PreferredSizeWidget changeLogs = appBar0('Change Logs'.tr);
  static PreferredSizeWidget currencyRates =
      appBar0(cms(Fields.CurrencyRates_PageHeading).textHeading!);
  static PreferredSizeWidget editBeneficiary =
      appBar0(cms(Fields.MyBeneficiary_EditBeneficiary).textHeading!);
  static PreferredSizeWidget faq =
      appBar0(cms(Fields.SideMenu_FaqIconAndText).textHeading!, onTap2: () {
    if (Get.find<AccountController>().faqNode.hasFocus) {
      Get.find<AccountController>().faqNode.unfocus();
    } else {
      Get.find<MainController>().pop();
    }
  });
  static PreferredSizeWidget reportaFraud =
      appBar0(cms(Fields.SideMenu_ReportFraudIconAndText).textHeading!);
  static PreferredSizeWidget forexRates =
      appBar0(cms(Fields.ForexRates_PageHeading).textHeading!);
  static PreferredSizeWidget sendMoney =
      appBar0(cms(Fields.SendMoney_PageHeading).textHeading!);
  static PreferredSizeWidget confirmPaymentDetails =
      appBar0(cms(Fields.ConfirmPaymentDetail_PageHeading).textHeading!);
  static PreferredSizeWidget paymentConfirmation = appBar0(
    cms(Fields.PaymentConfirmation_PageHeading).textHeading!,
    onTap2: () => Get.find<TransferController>().showCancelTxnAlert(),
  );
  static PreferredSizeWidget myBeneficiary =
      appBar0(cms(Fields.MyBeneficiary_PageHeading).textHeading!);
  static PreferredSizeWidget myProfile =
      appBar0(cms(Fields.MyProfile_PageHeading).textHeading!);
  static PreferredSizeWidget myTransaction =
      appBar0(cms(Fields.MyTransaction_PageHeading).textHeading!);
  static PreferredSizeWidget notification =
      appBar0(cms(Fields.Notification_PageHeading).textHeading!);
  static PreferredSizeWidget offer =
      appBar0(cms(Fields.SideMenu_OffersIconAndText).textHeading!);
  static PreferredSizeWidget privacyPolicy =
      appBar0(cms(Fields.PrivacyPolicy_PageHeading).textHeading!);
  static PreferredSizeWidget setCredential =
      appBar0(cms(Fields.SetCredential_PageHeading).textHeading!);
  static PreferredSizeWidget selectLanguage =
      appBar0(cms(Fields.SelectLanguage_PageHeading).textHeading!);
  static PreferredSizeWidget selectLanguageFromMpin = appBar0(
      cms(Fields.SelectLanguage_PageHeading).textHeading!,
      onTap2: Get.back);
  static PreferredSizeWidget settings =
      appBar0(cms(Fields.SideMenu_SettingsIconAndText).textHeading!);
  static PreferredSizeWidget termsAndConditions =
      appBar0(cms(Fields.TermsAndConditions_PageHeading).textHeading!);
  static PreferredSizeWidget viewBeneficiary =
      appBar0(cms(Fields.ViewBeneficary_PageHeading).textHeading!);
  static PreferredSizeWidget setForexRates =
      appBar0(cms(Fields.SideMenu_ForexBookingIconAndText).textHeading!);
  static PreferredSizeWidget trackTransaction =
      appBar0(cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!);
}
