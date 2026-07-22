import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';

class PrivacyPolicyPage extends StatelessWidget {
  final bool isPrelogin;

  const PrivacyPolicyPage({super.key, this.isPrelogin = false});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();
    controller.getPrivacyPolicy();

    return GetBuilder<AccountController>(builder: (_) {
      return Scaffold(
        backgroundColor: controller.isDark ? AppConfigs.g21 : AppConfigs.w,
        appBar: appBar0(
          cms(Fields.PrivacyPolicy_PageHeading).textHeading!,
          onTap2: Get.back,
        ),
        body:
            controller.privacyPolicy == null && !controller.privacyPolicyFailed
                ? Center(child: loader())
                : controller.privacyPolicy == null
                    ? const Center(child: Text('Something went wrong'))
                    : SafeArea(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Last Updated Badge
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(top: 8),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: controller.isDark
                                        ? AppConfigs.g21
                                        : AppConfigs.geb,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Last updated: November 25, 2025',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 14),

                              /// Intro Text (Optional if API already has)
                              Text(
                                'At IFI, your privacy and security are our top priority.\n'
                                'This Privacy Policy explains how we collect, use, '
                                'protect, and share your information when you use our services.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  height: 1.6,
                                  color: AppConfigs.g77,
                                ),
                              ),

                              const SizedBox(height: 16),

                              /// Divider
                              Divider(
                                color: controller.isDark
                                    ? AppConfigs.g43
                                    : AppConfigs.gd1,
                                height: 1,
                              ),

                              const SizedBox(height: 14),

                              /// HTML Content
                              Html(
                                data: controller.privacyPolicy!,
                                style: {
                                  'body': Style(
                                    margin: Margins.zero,
                                    padding: HtmlPaddings.zero,
                                    fontSize: FontSize(14),
                                    lineHeight: LineHeight.number(1.6),
                                    color: controller.isDark
                                        ? AppConfigs.g8f
                                        : AppConfigs.g77,
                                    textAlign: TextAlign.justify,
                                  ),
                                  'p': Style(
                                    margin: Margins.only(bottom: 12),
                                  ),
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
      );
    });
  }
}
