import 'package:awesome_custom_dialog/awesome_custom_dialog.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_custom_dialog/flutter_custom_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/flavours/constants.dart';
import '../../custom_widgets/chat_bubble.dart';

class ChatWithUsPage extends StatelessWidget {
  const ChatWithUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    ACDDialog.init(context);
    return SafeArea(
      child: GetBuilder<AccountController>(builder: (accountController) {
        return Column(
          children: [
            Container(
              height: 35,
              color: accountController.isDark ? AppConfigs.b01222d : AppConfigs.primaryColor.withOpacity(0.1),
              padding: const EdgeInsets.only(left: 34, right: 34),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Jhon Bruse",
                      style: TextStyles.font12.copyWith(
                        color: accountController.isDark ? AppConfigs.w : AppConfigs.g4,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start),
                  Text("XXXX XXXX 2334",
                      style: TextStyles.font12.copyWith(
                        color: accountController.isDark ? AppConfigs.w : AppConfigs.g4,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.start)
                ],
              ),
            ),
            Expanded(
              child: ListView(
                physics: const ClampingScrollPhysics(),
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 21, 34, 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 37,
                          height: 37,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Color(0xff05a6dd),
                          ),
                          margin: const EdgeInsets.only(right: 8),
                          padding: const EdgeInsets.all(5),
                          child: SvgPicture.asset(
                            ImagePath.chatSupport,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sam Farnadis",
                                style: TextStyles.font14.copyWith(
                                  color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g14,
                                  fontWeight: FontWeight.w600,
                                ),
                                textAlign: TextAlign.start),
                            Text("1_min_ago".tr,
                                style: TextStyles.font10.copyWith(
                                  color: accountController.isDark ? AppConfigs.g8f : AppConfigs.g14,
                                  fontWeight: FontWeight.w400,
                                ),
                                textAlign: TextAlign.start)
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
                    child: Align(alignment: Alignment.centerLeft, child: chatBubble('Hello_is_there_something_we'.tr, true)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
                    child: Align(alignment: Alignment.centerLeft, child: chatBubble('Just_let_me_know'.tr, true)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
                    child: Align(alignment: Alignment.centerRight, child: chatBubble('Hello_is_there_something_we'.tr, false)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(34, 0, 34, 0),
                    child: Align(alignment: Alignment.centerRight, child: chatBubble('Just_let_me_know'.tr, false)),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 53,
              margin: const EdgeInsets.only(left: 26, right: 34, bottom: 19, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: yynoticedialog,
                    child: SvgPicture.asset(
                      ImagePath.chatHamburger,
                      height: 25,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.2),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(25),
                          ),
                          color: accountController.isDark ? AppConfigs.g21 : null,
                          border: accountController.isDark ? null : Border.all(color: const Color(0xffd9d7d7), width: 1),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 15,
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      hintText: 'Write_a_reply...'.tr,
                                      hintStyle: TextStyles.font14),
                                ),
                              ),
                            ),
                            // textFormField(hintText: , ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                right: 10,
                              ),
                              child: SvgPicture.asset(
                                ImagePath.chatAttachment,
                                height: 22,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: SvgPicture.asset(
                                ImagePath.chatSendMsg,
                                height: 22,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}

ACDDialog yynoticedialog() {
  return ACDDialog().build()
    ..gravity = ACDGravity.leftBottom
    ..width = 312
    ..height = 211
    ..backgroundColor = Colors.black.withOpacity(0.8)
    ..borderRadius = 10.0
    ..showCallBack = () {}
    ..dismissCallBack = () {}
    // ..widgetList = [
    //
    // ]
    ..backgroundColor = Colors.transparent
    ..widget(
      Container(
          margin: const EdgeInsets.only(left: 39, bottom: 44),
          decoration: const BoxDecoration(
            color: Color(0xfff5f6fa),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 21),
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Share_My_Account_Information".tr,
                      style: TextStyles.font12.copyWith(
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                ),
              ),
              const Divider(
                height: 1,
                color: Color(0xffd9d7d7),
              ),
              Container(
                margin: const EdgeInsets.only(left: 21),
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("I_can_send_money".tr,
                      style: TextStyles.font12.copyWith(
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                ),
              ),
              const Divider(
                height: 1,
                color: Color(0xffd9d7d7),
              ),
              Container(
                margin: const EdgeInsets.only(left: 21),
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("I_paid_the_wrong_person".tr,
                      style: TextStyles.font12.copyWith(
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                ),
              ),
              const Divider(
                height: 1,
                color: Color(0xffd9d7d7),
              ),
              Container(
                margin: const EdgeInsets.only(left: 21),
                height: 40,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Money_not_received".tr,
                      style: TextStyles.font12.copyWith(
                        color: const Color(0xff444444),
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.start),
                ),
              ),
            ],
          )),
    )
    ..show();
}
