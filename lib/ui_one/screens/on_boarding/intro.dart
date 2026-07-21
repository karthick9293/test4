import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/controllers/data_controller.dart';
import '../../../core/exports/ui_one_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/models/intro_tiles.dart';
import '../../../flavors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  String getAppName() {
    return {
          Flavor.casmex: "Casmex",
          Flavor.lmpay: 'LMPAY',
          Flavor.cityexchangeuae: 'City Exchange UAE',
          Flavor.lakhoos: 'Lakhoos',
        }[F.appFlavor] ??
        "Casmex";
  }

  @override
  Widget build(BuildContext context) {
    List<IntroTile> tiles = [
      IntroTile(
          img:
              cms(Fields.Introduction_CarousalImageHeadingDescription1).image ??
                  "",
          title: cms(Fields.Introduction_CarousalImageHeadingDescription1)
                  .textHeading ??
              "missing csm heading1",
          subtitle:
              "${cms(Fields.Introduction_CarousalImageHeadingDescription1).description ?? "missing csm description1"} ${getAppName()}"),
      IntroTile(
          img:
              cms(Fields.Introduction_CarousalImageHeadingDescription2).image ??
                  "",
          title: cms(Fields.Introduction_CarousalImageHeadingDescription2)
                  .textHeading ??
              "missing csm heading2",
          subtitle: cms(Fields.Introduction_CarousalImageHeadingDescription2)
                  .description ??
              "missing csm description2"),
      IntroTile(
          img:
              cms(Fields.Introduction_CarousalImageHeadingDescription3).image ??
                  "",
          title: cms(Fields.Introduction_CarousalImageHeadingDescription3)
                  .textHeading ??
              "missing csm heading3",
          subtitle: cms(Fields.Introduction_CarousalImageHeadingDescription3)
                  .description ??
              "missing csm description3"),
    ];
    return GetBuilder<AccountController>(builder: (accountController) {
      return Scaffold(
        backgroundColor: AppConfigs.bodybg(accountController.isDark),
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              appBar1(accountController.selectedLanguage ?? '', fromMpin: true),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CarouselSlider(
                    items: tiles
                        .map((i) => SizedBox(
                              // height: 250,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: S.p, right: S.p, top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Base64Image(
                                      image: i.img,
                                      height: 250,
                                    ),
                                    const SizedBox(height: 14),
                                    Text(
                                      i.title,
                                      style: TS.f20.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 20,
                                          color: accountController.isDark
                                              ? AppConfigs.w
                                              : AppConfigs.bf0),
                                    ),
                                    Text(
                                      i.subtitle,
                                      maxLines: 4,
                                      overflow: TextOverflow.ellipsis,
                                      style: TS.f14.copyWith(
                                        color: accountController.isDark
                                            ? AppConfigs.g8f
                                            : AppConfigs.g4,
                                      ),
                                      textAlign: TextAlign.justify,
                                    )
                                  ],
                                ),
                              ),
                            ))
                        .toList(),
                    carouselController: accountController.sliderController,
                    options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        aspectRatio: 1,
                        initialPage: 0,
                        onPageChanged: (index, reason) {
                          accountController.index = index;
                          accountController.update();
                        }),
                  ),
                  GetBuilder<AccountController>(builder: (accountController) {
                    return SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: tiles.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => accountController.sliderController
                                .animateToPage(entry.key),
                            child: Container(
                              width: 7.0,
                              height: 7.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 4.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: accountController.index != entry.key
                                    ? const Color(0xFFB9B4BF)
                                    : const Color(0xFF666171),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    );
                  })
                ],
              )),
              roundButton(cms(Fields.Introduction_OkButton).textHeading!,
                  key: const Key('Let\'s Start'), onTap: () {
                Get.put(DataController(beforeLogin: true), permanent: true);
                Get.find<AccountController>().onBoard();
              })
            ],
          ),
        ),
      );
    });
  }
}
