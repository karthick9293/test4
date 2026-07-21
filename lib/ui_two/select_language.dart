import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/cms/cms_fz.dart';

import '../core/exports/controllers.dart';
import '../core/exports/ui_two_custom_widgets.dart';
import '../core/flavours/constants.dart';
import '../core/exports/ui_two_pages.dart';

class SelectLanguage extends StatefulWidget {
  final bool firstLaunch;

  final bool fromMpin;

  const SelectLanguage(
      {super.key, this.firstLaunch = false, this.fromMpin = false});

  @override
  State<SelectLanguage> createState() => _SelectLanguageState();
}

class _SelectLanguageState extends State<SelectLanguage> {
  List<CmsList> cmsList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    List<CmsList> list = await Box3.pageCms(page: "SelectLanguage");
    if (!mounted) return;
    setState(() {
      cmsList = list;
    });

    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(builder: (languageController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(languageController.isDark),
        body: SafeArea(
          child: Obx(() {
            if (languageController.languageList.isEmpty == true) {
              return loader();
            } else {
              return Column(
                children: [
                  if (widget.firstLaunch || widget.fromMpin)
                    AppbarUiTwo(
                      title: cmsList
                              .firstWhereOrNull(
                                (e) =>
                                    e.parameterName?.trim() ==
                                    Fields.SelectLanguage_PageHeading.name,
                              )
                              ?.textHeading ??
                          'Choose Language',
                      isBackButton: !widget.firstLaunch,
                    ),
                  Container(
                    child: textFormField(
                        borderRadius: 50,
                        hintText: cms(Fields.SelectLanguage_SearchYourLanguage)
                                .textHeading ??
                            "Search your language",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            ImagePath.search2,
                            colorFilter: ColorFilter.mode(
                              AppConfigs.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        onChanged: languageController.filterLanguage),
                  ),
                  Expanded(
                      child: ListView.builder(
                          physics: const ClampingScrollPhysics(),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          itemCount:
                              languageController.filterLanguageList.length,
                          itemBuilder: (c, i) {
                            String languageName =
                                languageController.filterLanguageList[i].Desc;
                            return GestureDetector(
                              onTap: () async {
                                cmsLoadingAlert(languageName);
                                await languageController.updateLocale(
                                    languageController.filterLanguageList[i]);
                                languageController.selectedItem.value = i;
                                if (Get.isDialogOpen == true) Get.back();
                                cmsList = Box3.cmsList;
                                languageController.update();
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 7.5),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: languageController
                                                .selectedLanguage.value.Desc ==
                                            languageName
                                        ? AppConfigs.w
                                        : AppConfigs.primaryColor
                                            .withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(50),
                                    boxShadow: languageController
                                                .selectedLanguage.value.Desc ==
                                            languageName
                                        ? [
                                            BoxShadow(
                                                color: AppConfigs.primaryColor
                                                    .withOpacity(0.2),
                                                offset: Offset(0, 0),
                                                blurRadius: 10)
                                          ]
                                        : null),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 20,
                                      child: Icon(Icons.flag),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(languageName,
                                        style: TS.f.copyWith(
                                            color: languageController
                                                        .selectedLanguage
                                                        .value
                                                        .Desc ==
                                                    languageName
                                                ? (languageController.isDark
                                                    ? AppConfigs.w
                                                    : const Color(0xff0e0e0e))
                                                : (languageController.isDark
                                                    ? AppConfigs.g8f
                                                    : const Color(0xff6a6a6a)),
                                            fontWeight: languageController
                                                        .selectedLanguage
                                                        .value
                                                        .Desc ==
                                                    languageName
                                                ? FontWeight.w700
                                                : FontWeight.w600,
                                            fontSize: languageController
                                                        .selectedLanguage
                                                        .value
                                                        .Desc ==
                                                    languageName
                                                ? 18
                                                : 16)),
                                    Spacer(),
                                    if (languageController
                                            .selectedLanguage.value.Desc ==
                                        languageName)
                                      SvgPicture.asset(ImagePath.check,
                                          height: 30)
                                  ],
                                ),
                              ),
                            );
                          })),
                  Visibility(
                    visible: Get.find<AccountController>().appStatus ==
                            AppStatus.firstLaunch &&
                        false,
                    child: roundButton(
                        cmsList
                                .firstWhereOrNull(
                                  (e) =>
                                      e.parameterName?.trim() ==
                                      Fields.Introduction_SkipButton.name,
                                )
                                ?.textHeading ??
                            'Continue',
                        textDecoration: TextDecoration.underline,
                        onTap: () async {
                      Get.put(DataController(beforeLogin: true),
                          permanent: true);
                      await Box3.setStatus(AppStatus.onBoarded);
                      Get.offAllNamed((Box3.settings.preLogin)
                          ? AppRoutes.preLogin
                          : AppRoutes.nid);
                    },
                        borderOnly: true,
                        bottom: 0,
                        borderColor: Colors.transparent),
                  ),
                  languageController.isLoading
                      ? SizedBox(
                          height: 50,
                          child: Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ))
                      : roundButton(
                          cmsList
                                  .firstWhereOrNull(
                                    (e) =>
                                        e.parameterName?.trim() ==
                                        Fields.SelectLanguage_OkButton.name,
                                  )
                                  ?.textHeading ??
                              'Continue',
                          key: const Key('Select Language OK'),
                          top: 0, onTap: () {
                          AppStatus a = Get.find<AccountController>().appStatus;
                          if (a == AppStatus.loggedIn) {
                            if (widget.fromMpin) {
                              Get.back();
                            } else {
                              Get.find<MainController>()
                                ..pages.clear()
                                ..appBars.clear()
                                ..push(const DashBoardPage(), dashBoardAppbar())
                                ..update();
                              Get.offAllNamed((Box3.settings.preLogin)
                                  ? AppRoutes.preLogin
                                  : AppRoutes.nid);
                            }
                          } else {
                            Get.toNamed(a == AppStatus.firstLaunch
                                ? AppRoutes.intro
                                : AppRoutes.preLogin);
                          }
                        }),
                ],
              );
            }
          }),
        ),
      );
    });
  }
}
