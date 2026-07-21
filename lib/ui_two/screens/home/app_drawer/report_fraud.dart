import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class ReportFraudPage extends StatelessWidget {
  final bool isPrelogin;

  ReportFraudPage({super.key, this.isPrelogin = false});

  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final bool isDark = Get.isRegistered<MainController>() ? Get.find<MainController>().isDark : false;
    return Scaffold(
      backgroundColor: (isDark ? AppConfigs.b : AppConfigs.w),
      appBar: isPrelogin ? appBar0('Report a Fraud'.tr, onTap2: Get.back) : null,
      body: Container(
        color: AppConfigs.bodybg(isDark),
        child: SafeArea(
          child:
              // Stack(
              //   children: [
              Container(
            padding: const EdgeInsets.only(top: 8.0, right: 1.0, left: 8.0, bottom: 10),
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              thickness: 4.0,
              radius: const Radius.circular(4),
              child: SingleChildScrollView(
                controller: scrollController,
                // padding: const EdgeInsets.only(top: 8.0, right: 1.0, left: 8.0, bottom: 8.0),
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 8.0,
                  ),
                  padding: const EdgeInsets.only(top: 8.0, right: 1.0, left: 8.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title("${Box3.companyDataFZ?.companySettings?.companyName} – Fraud Awareness Guide"),
                      buildContactLink("📞 Customer Care: ${Box3.companyDataFZ?.companySettings?.phoneNumber}",
                          "tel:${Box3.companyDataFZ?.companySettings?.phoneNumber}"),
                      buildEmailLink("📧 Email: ${Box3.companyDataFZ?.companySettings?.emailId}", "${Box3.companyDataFZ?.companySettings?.emailId}"),
                      buildContactLink("🌐 Website: https://${Box3.companyDataFZ?.companySettings?.companyName.toLowerCase().replaceAll(" ", "")}.ae",
                          "https://${Box3.companyDataFZ?.companySettings?.companyName.toLowerCase().replaceAll(" ", "")}.ae"),
                      sectionTitle("Protect Yourself Against Financial Fraud"),
                      paragraph(
                          "Financial fraud affects millions globally, but with the right information and caution, you can avoid becoming a victim. This International Fraud Awareness Week, ${Box3.companyDataFZ?.companySettings?.companyName} is dedicated to empowering our customers through education and awareness."),
                      sectionTitle("Recognize the Red Flags"),
                      bulletPoints([
                        "🚫 Unsolicited messages, suspicious links, or fake offers",
                        "🔐 Never share your PINs, passwords, or account information",
                        "📵 ${Box3.companyDataFZ?.companySettings?.companyName} will never request personal details via phone, email, or social media"
                      ]),
                      paragraph("If something feels suspicious—it probably is. Always verify the source before acting on any request or offer."),
                      sectionTitle("Report Fraud Immediately"),
                      paragraph("Your awareness protects not just you, but everyone. If you suspect any fraudulent activity:"),
                      buildContactLink("📞 Customer Care: +971 600 54 0002", "tel:+971600540002"),
                      buildEmailLink("📧 Email: ${Box3.companyDataFZ?.companySettings?.emailId}", "${Box3.companyDataFZ?.companySettings?.emailId}"),
                      sectionTitle("You can also report fraud to the authorities:"),
                      subtitle("Dubai Police"),
                      buildContactLink("• Toll-free: 901", "tel:901"),
                      buildContactLink("• E-Crime Platform: www.dubaipolice.gov.ae", "https://www.dubaipolice.gov.ae"),
                      subtitle("Abu Dhabi Police"),
                      buildContactLink("• “Aman” Hotline: 800-2626", "tel:8002626"),
                      buildContactLink("• www.adpolice.gov.ae", "https://www.adpolice.gov.ae"),
                      subtitle("Ministry of Interior"),
                      buildContactLink("• Hotline: 8005000", "tel:8005000"),
                      buildEmailLink("• Email: moi@moi.gov.ae", "moi@moi.gov.ae"),
                      sectionTitle("Our Commitment"),
                      bulletPoints([
                        "- Using the latest fraud detection technologies",
                        "- Training our staff to identify suspicious behavior",
                        "- Running public awareness campaigns to educate customers",
                      ]),
                      sectionTitle("How Fraudsters Operate"),
                      bulletPoints([
                        "📞 Phone Calls",
                        "📩 SMS",
                        "📱 WhatsApp",
                        "📧 Emails",
                        "📢 Social Media",
                      ]),
                      paragraph(
                          "They trick victims by offering fake prizes or creating false urgency, asking for:\n- Personal data\n- Bank information\n- Advance fees to \"claim\" winnings\nThey may even urge secrecy to prevent “disqualification”."),
                      sectionTitle("Protect Yourself: Best Practices"),
                      paragraph("✔ ${Box3.companyDataFZ?.companySettings?.companyName} will never:"),
                      bulletPoints([
                        "- Ask for personal or financial details over the phone",
                        "- Request fees to claim a prize",
                      ]),
                      paragraph("🎯 Verify authenticity:"),
                      bulletPoints([
                        "- All communication will come from official phone numbers",
                        "- Visit a ${Box3.companyDataFZ?.companySettings?.companyName} branch or call our helpline for confirmation",
                        "- Cross-check with our website and official social media",
                      ]),
                      paragraph("🚨 Stay Safe Tips:"),
                      bulletPoints([
                        "- Don’t share personal data with unverified sources",
                        "- Confirm identities of callers",
                        "- Never transfer money based on phone/email claims",
                        "- Avoid clicking on suspicious links",
                        "- Report suspicious activity without delay",
                      ]),
                      sectionTitle("Common Types of Fraud"),
                      bulletPoints([
                        "1. Email Scams: Fake emails from banks to capture login credentials.",
                        "2. Lottery Scams: Fake ${Box3.companyDataFZ?.companySettings?.companyName} prize claims asking for data or fees.",
                        "3. ATM Tampering: Devices or cameras to steal PIN and card data.",
                        "4. SIM Swap: Hijacking your number to intercept OTPs.",
                        "5. Magic Ink Fraud: Altering cheques using heat to steal money.",
                        "6. Business Email Compromise: Fraudulent payment requests via hacked emails.",
                        "7. Phone Banking Fraud: Calls posing as bank employees asking for details.",
                        "8. Data Privacy Breach: Using personal info to access your accounts.",
                      ]),
                      sectionTitle("Stay Informed, Stay Protected"),
                      paragraph("Your security is our top priority. Together, let’s prevent fraud and build a safer financial community."),
                      sectionTitle("${Box3.companyDataFZ?.companySettings?.companyName}"),
                      buildContactLink(
                          "📞 ${Box3.companyDataFZ?.companySettings?.phoneNumber}", "tel:${Box3.companyDataFZ?.companySettings?.phoneNumber}"),
                      buildEmailLink("📧 ${Box3.companyDataFZ?.companySettings?.emailId}", "${Box3.companyDataFZ?.companySettings?.emailId}"),
                      buildContactLink("🌐 www.${Box3.companyDataFZ?.companySettings?.companyName.toLowerCase().replaceAll(" ", "")}.com",
                          "https://www.${Box3.companyDataFZ?.companySettings?.companyName.toLowerCase().replaceAll(" ", "")}.com"),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //     Positioned(
          //       bottom: 8,
          //       left: 0,
          //       right: 0,
          //       child: Center(
          //         child: roundButton('Ok'.tr,
          //             top: 12,
          //             bottom: 0,
          //             onTap: () {
          //               Get.back();
          //             },
          //             left: 32,
          //             right: 32),
          //       ),
          //     ),
          //   ],
          // ),
        ),
      ),
    );
  }

  Widget buildContactLink(String label, String url) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(
          label,
          style: TextStyle(
            color: AppConfigs.accentColor.withOpacity(0.8),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget title(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 24, color: Get.find<MainController>().isDark ? AppConfigs.w : AppConfigs.g77)),
      );

  Widget sectionTitle(String text) => Padding(
        padding: const EdgeInsets.only(top: 14, bottom: 4),
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: Get.find<MainController>().isDark ? AppConfigs.w : AppConfigs.g77)),
      );

  Widget subtitle(String text) => Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
        child: Text(text, style: TextStyle(fontWeight: FontWeight.w600, color: Get.find<MainController>().isDark ? AppConfigs.w : AppConfigs.g77)),
      );

  Widget paragraph(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 14, color: Get.find<MainController>().isDark ? AppConfigs.w : AppConfigs.g77),
        ),
      );

  Widget bulletPoints(List<String> items) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map((item) => Padding(
                  padding: const EdgeInsets.only(bottom: 2.0),
                  child: Text(item, style: TextStyle(fontSize: 14, color: Get.find<MainController>().isDark ? AppConfigs.w : AppConfigs.g77)),
                ))
            .toList(),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    final uri = Uri.parse(url);

    try {
      if (uri.scheme == 'mailto') {
        final emailUri = Uri(
          scheme: 'mailto',
          path: uri.path,
          query: uri.query,
        );
        if (await canLaunchUrl(emailUri)) {
          await launchUrl(emailUri);
        } else {
          Get.snackbar("Error", "No email app found to send email.");
        }
      } else {
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri, mode: LaunchMode.externalApplication);
        } else {
          Get.snackbar("Error", "Cannot open: $url");
        }
      }
    } catch (e) {
      Get.snackbar("Error", "Could not launch: $url\n$e");
    }
  }

  Widget buildEmailLink(String label, String url) {
    return InkWell(
      onTap: () => sendEmailWithFallback(
        mail: url,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0),
        child: Text(
          label,
          style: TextStyle(
            color: AppConfigs.accentColor.withOpacity(0.8),
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Future<void> sendEmailWithFallback({required String mail}) async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: mail,
      queryParameters: {
        'subject': '',
        'body': '',
      },
    );

    if (!await launchUrl(emailUri)) {
      // Fallback
      Get.snackbar(
        'Email Not Supported',
        'No email app found. Please contact us at ${Box3.companyDataFZ?.companySettings?.emailId}',
      );
    }
  }

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries.map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}').join('&');
  }
}
