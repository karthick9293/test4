import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../core/exports/controllers.dart';
import '../../core/exports/ui_six_custom_widgets.dart';
import '../../core/flavours/constants.dart';

class AppBars {
  static PreferredSizeWidget aboutUs = appBar0(cms(Fields.SideMenu_AboutUsIconAndText).textHeading!);
  static PreferredSizeWidget addBeneficiary = appBar0(cms(Fields.MyBeneficiary_AddBeneficiary).textHeading!);
  static PreferredSizeWidget archivedBeneficiaries = appBar0('Archived_Beneficiaries'.tr);
  static PreferredSizeWidget bankTransfer = appBar0('bank_transfer'.tr);
  static PreferredSizeWidget billRechargeMore = appBar0('bills_recharges_more'.tr);
  static PreferredSizeWidget branchLocator = appBar0('branch_locator'.tr);
  static PreferredSizeWidget cashTransfer = appBar0('cash_pickup_service'.tr);
  static PreferredSizeWidget walletTransfer = appBar0('wallet_transfer_service'.tr);
  static PreferredSizeWidget contactUs = appBar0(cms(Fields.SideMenu_ContactUsIconAndText).textHeading!);
  static PreferredSizeWidget createAlert = appBar0('create_alert'.tr);
  static PreferredSizeWidget chatWithUs = PreferredSize(
    preferredSize: const Size(double.infinity, 58),
    child: GetBuilder<AccountController>(builder: (accountController) {
      return appBar2(
        cms(Fields.SideMenu_WhatsAppIconAndText).textHeading!,
        RotatedBox(
          quarterTurns: Box3.lang!.Code == 'ar' ? 2 : 0,
          child: SvgPicture.asset(ImagePath.backIcon,
              height: 30, colorFilter: accountController.isDark ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn) : null),
        ),
        RotatedBox(
          quarterTurns: Box3.lang!.Code == 'ar' ? 2 : 0,
          child: SvgPicture.asset(ImagePath.chatCall,
              height: 20, colorFilter: accountController.isDark ? const ColorFilter.mode(AppConfigs.w, BlendMode.srcIn) : null),
        ),
      );
    }),
  );
  static PreferredSizeWidget changePassword = appBar0('change_password'.tr);
  static PreferredSizeWidget changeLogs = appBar0('Change Logs'.tr);
  static PreferredSizeWidget currencyRates = appBar0(cms(Fields.CurrencyRates_PageHeading).textHeading!);
  static PreferredSizeWidget editBeneficiary = appBar0(cms(Fields.MyBeneficiary_EditBeneficiary).textHeading!);
  static PreferredSizeWidget faq = appBar0(cms(Fields.SideMenu_FaqIconAndText).textHeading!, onTap2: () {
    if (Get.find<AccountController>().faqNode.hasFocus) {
      Get.find<AccountController>().faqNode.unfocus();
    } else {
      Get.find<MainController>().pop();
    }
  });
  static PreferredSizeWidget reportaFraud = appBar0(cms(Fields.SideMenu_ReportFraudIconAndText).textHeading!);
  static PreferredSizeWidget forexRates = PreferredSize(
    preferredSize: const Size(double.infinity, 80),
    child: GetBuilder<AccountController>(
      builder: (accountController) {
        final isDark = accountController.isDark;
        final nowStr = DateFormat('h:mm a').format(DateTime.now());
        return SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppConfigs.g21 : const Color(0xFFFFFDFD),
              border: Border(
                bottom: BorderSide(
                  color: const Color(0xFFFDECEE).withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Get.find<MainController>().pop(),
                  child: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: isDark ? AppConfigs.g14 : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFFDECEE),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: isDark ? AppConfigs.w : const Color(0xFF2C1E1B),
                        size: 20,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Live Exchange Rates",
                        style: TS.f22B.copyWith(
                          color: isDark ? AppConfigs.w : const Color(0xFF2C1E1B),
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Updated $nowStr today",
                        style: const TextStyle(
                          color: Color(0xFFE06D7B),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }
    ),
  );
  static PreferredSizeWidget sendMoney = appBar0(cms(Fields.SendMoney_PageHeading).textHeading!);
  static PreferredSizeWidget confirmPaymentDetails = appBar0(cms(Fields.ConfirmPaymentDetail_PageHeading).textHeading!);
  static PreferredSizeWidget paymentConfirmation = appBar0(
    cms(Fields.PaymentConfirmation_PageHeading).textHeading!,
    onTap2: () => Get.find<TransferController>().showCancelTxnAlert(),
  );
  // static PreferredSizeWidget myBeneficiary = appBar0(cms(Fields.MyBeneficiary_PageHeading).textHeading!);
  static PreferredSizeWidget myProfile = appBar0(cms(Fields.MyProfile_PageHeading).textHeading!);
  static PreferredSizeWidget menu = appBar0(cms(Fields.SideMenu_PageHeading).textHeading!);
  static PreferredSizeWidget myTransaction = appBar0(cms(Fields.MyTransaction_PageHeading).textHeading!,action: IconButton(
    onPressed: (){},
    icon: Icon(Icons.search),
  ));
  static PreferredSizeWidget notification = appBar0(cms(Fields.Notification_PageHeading).textHeading!);
  static PreferredSizeWidget offer = appBar0(cms(Fields.SideMenu_OffersIconAndText).textHeading!);
  static PreferredSizeWidget privacyPolicy = appBar0(cms(Fields.PrivacyPolicy_PageHeading).textHeading!);
  static PreferredSizeWidget setCredential = appBar0(cms(Fields.SetCredential_PageHeading).textHeading!);
  static PreferredSizeWidget selectLanguage = appBar0(cms(Fields.SelectLanguage_PageHeading).textHeading!);
  static PreferredSizeWidget selectLanguageFromMpin = appBar0(cms(Fields.SelectLanguage_PageHeading).textHeading!, onTap2: Get.back);
  static PreferredSizeWidget settings = appBar0(cms(Fields.SideMenu_SettingsIconAndText).textHeading!);
  static PreferredSizeWidget termsAndConditions = appBar0(cms(Fields.TermsAndConditions_PageHeading).textHeading!);
  static PreferredSizeWidget viewBeneficiary = appBar0(cms(Fields.ViewBeneficary_PageHeading).textHeading!);
  static PreferredSizeWidget setForexRates = appBar0(cms(Fields.SideMenu_ForexBookingIconAndText).textHeading!);
  static PreferredSizeWidget trackTransaction = appBar0(cms(Fields.SideMenu_TrackRemittanceIconAndText).textHeading!);
}
