import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';
import '../../../../core/exports/ui_two_custom_widgets.dart';
import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/exports/ui_two_pages.dart';
import '../../../../core/flavours/app_routes.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final controller = Get.find<AccountController>();
    controller.idSideActiveIdx.value = 0;
    controller.getEKYCData();
    controller.getMyProfileForm();
  }

  @override
  Widget build(BuildContext context) {
    String authenticationMethod2 = (Box3.settings.LOGINAUTHENTICATIONSECONDARY);
    return GetBuilder<AccountController>(builder: (accountController) {
      var customerData = Box3.customerDetailsFZ?.data?.toJson();
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            AppbarUiTwo(
              title: "Account",
              isBackButton: false,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 66,
                          width: 66,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(33),
                              color: ConstColors.greyd7),
                          child:
                              Box3.customerDetailsFZ?.data?.profilePic != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(33),
                                      child: Base64Image(
                                        image: Box3.customerDetailsFZ!.data!
                                            .profilePic!,
                                        height: 250,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : SvgPicture.asset(
                                      SvgIcons.avator,
                                      fit: BoxFit.fitWidth,
                                    ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${Box3.customerDetailsFZ?.data?.name}",
                              style: TS.f18.copyWith(
                                  color: accountController.isDark
                                      ? AppConfigs.w
                                      : null,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 22),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${Box3.customerDetailsFZ?.data?.mobile}",
                              style: TS.f14.copyWith(
                                  color: accountController.isDark
                                      ? AppConfigs.g21
                                      : AppConfigs.g21),
                            ),
                          ],
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    title(
                        title: cms(Fields.SideMenu_MyProfileIconAndText)
                            .textHeading!,
                        leading: SvgPicture.asset(
                          SvgIcons.user2,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.myProfile);
                        }),
                    title(
                      title: "Location",
                      leading: SvgPicture.asset(
                        SvgIcons.locationPin,
                        colorFilter: ColorFilter.mode(
                            accountController.isDark
                                ? AppConfigs.g8f
                                : AppConfigs.b,
                            BlendMode.srcIn),
                      ),
                    ),
                    title(
                        title: cms(Fields.SideMenu_Language).textHeading!,
                        leading: SvgPicture.asset(
                          SvgIcons.global,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.selectLanguage,
                              parameters: {"firstLaunch": "false"});
                        }),
                    title(
                        title: cms(Fields.SideMenu_SettingsIconAndText)
                            .textHeading!,
                        leading: SvgPicture.asset(
                          SvgIcons.setting,
                          width: 22,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.settings);
                        }),
                    Visibility(
                      visible: authenticationMethod2 == 'MPIN' ||
                          authenticationMethod2 == 'PASSWORD_MPIN',
                      child: title(
                          title: "Change MPIN",
                          leading: SvgPicture.asset(
                            SvgIcons.resetPin,
                            colorFilter: ColorFilter.mode(
                                accountController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.b,
                                BlendMode.srcIn),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.changeMPIN);
                          }),
                    ),
                    Visibility(
                      visible: authenticationMethod2 == 'PASSWORD' ||
                          authenticationMethod2 == 'PASSWORD_MPIN',
                      child: title(
                          title: "Change Password",
                          leading: SvgPicture.asset(
                            SvgIcons.resetPin,
                            colorFilter: ColorFilter.mode(
                                accountController.isDark
                                    ? AppConfigs.g8f
                                    : AppConfigs.b,
                                BlendMode.srcIn),
                          ),
                          onTap: () {
                            Get.toNamed(AppRoutes.changePassword);
                          }),
                    ),
                    title(
                        title: cms(Fields.SideMenu_AboutUsIconAndText)
                            .textHeading!,
                        leading: SvgPicture.asset(
                          SvgIcons.aboutUs,
                          width: 20,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.aboutUs,
                          );
                        }),
                    title(
                        title: cms(Fields.SideMenu_PrivacyPolicyIconAndText)
                            .textHeading!,
                        leading: SvgPicture.asset(
                          SvgIcons.privacy,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.privacyPolicy);
                        }),
                    title(
                        title:
                            cms(Fields.SideMenu_TermsAndConditionsIconAndText)
                                .textHeading!,
                        leading: SvgPicture.asset(
                          SvgIcons.docs,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.toNamed(AppRoutes.termConditions);
                        }),
                    title(
                        title: cms(Fields.SideMenu_ContactUsIconAndText)
                            .textHeading!,
                        leading: SvgPicture.asset(
                          SvgIcons.inAppChat,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.contactUs,
                          );
                        }),
                    title(
                        title: "Logout",
                        leading: SvgPicture.asset(
                          SvgIcons.logout2,
                          colorFilter: ColorFilter.mode(
                              accountController.isDark
                                  ? AppConfigs.g8f
                                  : AppConfigs.b,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          Get.dialog(
                              yesOrNoAlert(
                                  title: cms(Fields.LogoutAlert_PageHeading)
                                      .textHeading!,
                                  body: cms(Fields.LogoutAlert_ImageAndText)
                                      .textHeading!,
                                  yesText:
                                      cms(Fields.PopUp_LogOut).textHeading!,
                                  noText: cms(Fields.PopUp_Cancel).textHeading!,
                                  hideIcon: true,
                                  onTap: () async {
                                    await Get.find<AccountController>()
                                        .userLogout();
                                  }),
                              barrierColor: Get.find<AccountController>().isDark
                                  ? AppConfigs.w.withOpacity(0.2)
                                  : null);
                        }),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }

  Widget title({String? title, GestureTapCallback? onTap, Widget? leading}) {
    return ListTile(
      onTap: onTap,
      title: Text(
        "$title",
        style: TS.f16,
      ),
      leading: leading,
      trailing: Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
