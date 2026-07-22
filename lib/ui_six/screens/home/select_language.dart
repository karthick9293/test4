import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/cms/cms_fz.dart';

import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/exports/ui_six_pages.dart';
import '../../../core/flavours/constants.dart';

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
        appBar: widget.firstLaunch || widget.fromMpin
            ? appBar0(
                cmsList
                        .firstWhereOrNull(
                          (e) =>
                              e.parameterName?.trim() ==
                              Fields.SelectLanguage_PageHeading.name,
                        )
                        ?.textHeading ??
                    'Choose Language',
                disableBack: widget.firstLaunch,
                onTap2: widget.fromMpin ? Get.back : null)
            : null,
        backgroundColor: AppConfigs.bodybg(languageController.isDark),
        body: SafeArea(
          child: Obx(() {
            if (languageController.languageList.isEmpty == true) {
              return loader();
            } else {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: AppConfigs.linearGradientUiSix
                ),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: languageController.languageList.length,
                            itemBuilder: (c, i) {
                              String languageName =
                                  languageController.languageList[i].Desc;
                              return GestureDetector(
                                onTap: () async {
                                  cmsLoadingAlert(languageName);
                                  await languageController.updateLocale(
                                      languageController.languageList[i]);
                                  languageController.selectedItem.value = i;
                                  if (Get.isDialogOpen == true) Get.back();
                                  cmsList = Box3.cmsList;
                                  languageController.update();
                                },
                                child: Container(
                                  // height: 45,
                                  margin: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                                  padding: EdgeInsets.symmetric(vertical: 15),
                                  decoration: BoxDecoration(
                                    color: languageController
                                        .selectedLanguage.value.Desc ==
                                        languageName
                                        ? AppConfigs.primaryColor.withOpacity(0.3)
                                        : Colors.transparent,
                                    border: Border.all(color: AppConfigs.primaryColor.withOpacity(0.3)),
                                    borderRadius: BorderRadius.circular(15)
                                  ),

                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text(languageName,
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
                                                        : const Color(
                                                            0xff6a6a6a)),
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
                                      ),
                                      languageController
                                                  .selectedLanguage.value.Desc ==
                                              languageName
                                          ? Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 30, right: 30),
                                              child: SvgPicture.asset(
                                                  ImagePath.check,
                                                  height: 30),
                                            )
                                          : const SizedBox()
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
                              '',
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
                                Get.offAllNamed(AppRoutes.preLogin);
                              }
                            } else {
                              Get.toNamed(a == AppStatus.firstLaunch
                                  ? AppRoutes.intro
                                  : AppRoutes.preLogin);
                            }
                          }),
                  ],
                ),
              );
            }
          }),
        ),
      );
    });
  }
}
