import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mobiremit/models/advertiesments/advertiesment_fz.dart';

import '../../core/exports/ui_one_custom_widgets.dart';

class CustomCarouselSlider extends StatelessWidget {
  final dynamic accountController;
  final List<AdvertisementList> promotions;

  const CustomCarouselSlider(
      {super.key, required this.accountController, required this.promotions});

  @override
  Widget build(BuildContext context) {
    final cachedItems = promotions
        .map((promotion) => Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              child: AdvertisementBanner(advertisement: promotion),
            ))
        .toList();
    return CarouselSlider(
      items: cachedItems,
      carouselController: accountController.sliderController,
      options: CarouselOptions(
        height: 210,
        autoPlay: true,
        enableInfiniteScroll: true,
        initialPage: 0,
        viewportFraction: 0.85,
        enlargeCenterPage: false,
      ),
    );
    // return CarouselSlider.builder(
    //   itemCount: promotions.length,
    //   itemBuilder: (_, index, realIndex) {
    //     final promotion = promotions[index];
    //     return Container(
    //       margin: const EdgeInsets.symmetric(horizontal: 1),
    //       child: AdvertisementBanner(advertisement: promotion),
    //     );
    //   },
    //   carouselController: accountController.sliderController,
    //   options: CarouselOptions(
    //     height: 170,
    //     // autoPlay: true,
    //     enableInfiniteScroll: true,
    //     initialPage: 0,
    //     viewportFraction: 0.87,
    //     enlargeCenterPage: false,
    //     // onPageChanged: (index, reason) {},
    //   ),
    // );
  }
}
