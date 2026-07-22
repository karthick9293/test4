import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/account_controller.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';

class FAQPage extends StatelessWidget {
  final bool isPreLogin;

  const FAQPage({super.key, this.isPreLogin = false});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return GetBuilder<AccountController>(builder: (accountController) {
      accountController.getFAQ();
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        body: SafeArea(
          top: false,
          child: Container(
            decoration: BoxDecoration(
                gradient: accountController.isDark?null:AppConfigs.linearGradientUiSix
            ),
            child: Column(
              children: [
                Visibility(
                  visible: isPreLogin,
                  child: appBar0(cms(Fields.FAQ_PageHeading).textHeading ?? "", onTap2: () {
                    if (Get.find<AccountController>().faqNode.hasFocus) {
                      Get.find<AccountController>().faqNode.unfocus();
                    }
                    Get.back();
                  }),
                ),
                Expanded(
                  child: accountController.faqs == null && !accountController.faqFailed
                      ? Center(child: loader())
                      : accountController.faqs == null
                          ? RefreshIndicator(
                              color: AppConfigs.primaryColor,
                              backgroundColor: accountController.isDark ? AppConfigs.g21 : AppConfigs.w,
                              onRefresh: () async {
                                accountController
                                  ..faqFailed = false
                                  ..update();
                                await accountController.getFAQ();
                              },
                              child: ListView(children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20, right: 20, top: 200),
                                  child: Text(cms(Fields.FAQ_PageErrorMessage).textHeading ?? ""),
                                )
                              ]))
                          : Column(
                              children: [
                                textFormField(
                                  key: key,
                                  top: 20,
                                  focusNode: accountController.faqNode,
                                  controller: controller,
                                  hintText: cms(Fields.FAQ_SearchFaq).textHeading ?? "",
                                  onChanged: (v) {
                                    accountController.update();
                                  },
                                  onFocusChange: (b) {},
                                  trailing: Container(
                                    width: 40,
                                    alignment: Alignment.center,
                                    child: SvgPicture.asset(ImagePath.search, height: 20, width: 20),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: controller.text.isNotEmpty &&
                                            accountController.faqs!
                                                .where((e) =>
                                                    e.Question.toLowerCase().contains(controller.text.toLowerCase()) ||
                                                    e.Answer.toLowerCase().contains(controller.text.toLowerCase()))
                                                .toList()
                                                .isEmpty
                                        ? Center(
                                            child: Text(
                                            'No Records Found',
                                            style: TS.f20.copyWith(color: accountController.isDark ? AppConfigs.w : AppConfigs.g4),
                                          ))
                                        : Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 20,),
                                            Text(
                                              cms(Fields.FAQ_PageHeading).textHeading ?? "",
                                              style: TS.f14.copyWith(fontWeight:FontWeight.w900,color: AppConfigs.primaryColor.withOpacity(0.7)),
                                            ),
                                            Expanded(
                                              child: ListView.builder(
                                                  physics: const ClampingScrollPhysics(),
                                                  itemCount: accountController.faqs!.length,
                                                  padding: EdgeInsets.symmetric(vertical: 10),
                                                  itemBuilder: (c, i) {
                                                    var e = accountController.faqs![i];
                                                    return _FaqTile(title: e.Question, content: e.Answer);
                                                  },
                                                ),
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
        ),
      );
    });
  }
}

class _FaqTile extends StatefulWidget {
  final String title;
  final String content;

  const _FaqTile({
    required this.title,
    required this.content,
  });

  @override
  State<_FaqTile> createState() => _FaqTileState();
}

class _FaqTileState extends State<_FaqTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppConfigs.primaryColor.withOpacity(0.2))
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          onExpansionChanged: (value) {
            setState(() {
              isExpanded = value;
            });
          },
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 4,
          ),
          childrenPadding: const EdgeInsets.fromLTRB(
            16,
            0,
            16,
            16,
          ),
          collapsedIconColor: const Color(0xFF7C8BB4),
          iconColor: const Color(0xFF7C8BB4),
          trailing: Icon(isExpanded
              ? Icons.arrow_drop_up:Icons.arrow_drop_down,size: 40,),
          title: Text(
            widget.title,
            style: TS.f18B,
          ),
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(height: 1),
                const SizedBox(height: 12),
                Text(
                  widget.content,
                  style: TS.f14,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}