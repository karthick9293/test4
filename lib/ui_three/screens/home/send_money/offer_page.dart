import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/offers/offers_fz.dart';
import 'package:mobiremit/ui_three/custom_widgets/loader.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/flavours/constants.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    final AccountController accountController = Get.find<AccountController>();
    Get.find<TransferController>().getOffersList();

    return GetBuilder<TransferController>(
      id: 'Offers-list',
      builder: (transferController) {
        return transferController.loading
            ? loader()
            : transferController.offersList.isEmpty
                ? Center(
                    child: Text(
                    'No Offers Available',
                    style: TS.f18.copyWith(
                      color: transferController.isDark
                          ? AppConfigs.a9
                          : AppConfigs.g4,
                    ),
                  ))
                : ListView.builder(
                    itemCount: transferController.offersList.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.all(15),
                    itemBuilder: (c, idx) {
                      Offer offer = transferController.offersList[idx];

                      return GestureDetector(
                        onTap: () =>
                            onOfferTilePressed(idx, transferController),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: EdgeInsets.only(bottom: 15),
                          // padding: const EdgeInsets.symmetric(
                          //     horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppConfigs.accentColor.withOpacity(0.7),
                              AppConfigs.lp,
                            ]),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text('${data[idx]['offer_name']}',
                                    //     style: TS.f22B),
                                    Text(offer.programDescription ?? '',
                                        style: TS.f14),
                                  ],
                                ),
                              ),
                              AnimatedSize(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: Container(
                                  color: Colors.grey[100],
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  height:
                                      transferController.promoIndex == idx ||
                                              transferController
                                                      .selectedOffer?.id ==
                                                  offer.id
                                          ? null
                                          : 0,
                                  child: Opacity(
                                    opacity:
                                        transferController.promoIndex == idx ||
                                                transferController
                                                        .selectedOffer?.id ==
                                                    offer.id
                                            ? 1.0
                                            : 0.0,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10),
                                        // textFormField(
                                        //   left: 0,
                                        //   right: 0,
                                        //   top: 0,
                                        //   bottom: 0,
                                        //   filledColor: AppConfigs.w,
                                        //   hintText: 'Enter Promo Code to apply',
                                        // ),
                                        Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12),
                                          decoration: BoxDecoration(
                                            color: AppConfigs.w,
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          child: Center(
                                            child: Row(
                                              children: [
                                                Expanded(child: SizedBox()),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    offer.promoCode ?? '',
                                                    textAlign: TextAlign.center,
                                                    style: TS.f16.copyWith(
                                                      color: accountController
                                                              .isDark
                                                          ? AppConfigs.g8f
                                                          : AppConfigs.g77,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: GestureDetector(
                                                    onTap: () async {
                                                      await Clipboard.setData(
                                                        ClipboardData(
                                                            text: offer
                                                                    .promoCode ??
                                                                ''),
                                                      );
                                                      Get.snackbar('Copied',
                                                          'Promocode copied to clipboard',
                                                          duration:
                                                              const Duration(
                                                                  seconds: 1));
                                                    },
                                                    child: const Icon(
                                                        Icons.copy,
                                                        size: 14),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                        Center(
                                          child: SizedBox(
                                            width: MediaQuery.sizeOf(context)
                                                    .width /
                                                2,
                                            child: _actionButton(
                                              label: transferController
                                                          .selectedOffer?.id ==
                                                      offer.id
                                                  ? 'Applied'
                                                  : 'Apply',
                                              isSelected: transferController
                                                      .selectedOffer?.id ==
                                                  offer.id,
                                              bgColor: AppConfigs.primaryColor,
                                              onTap: () => onPromoCodeApplied(
                                                  offer, transferController),
                                            ),
                                          ),
                                        ),
                                        // Row(
                                        //   children: [
                                        //     Expanded(
                                        //       child: _actionButton(
                                        //         label: 'SKIP',
                                        //         bgColor: Colors.orange,
                                        //         onTap: () {},
                                        //       ),
                                        //     ),
                                        //     SizedBox(width: 10),
                                        //     Expanded(
                                        //       child: _actionButton(
                                        //         label: 'APPLY',
                                        //         onTap: () {},
                                        //       ),
                                        //     ),
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
      },
    );
  }

  void onOfferTilePressed(int offerIdx, TransferController transferController) {
    transferController
      ..promoIndex = transferController.promoIndex == offerIdx ? null : offerIdx
      ..update(['Offers-list']);
  }

  void onPromoCodeApplied(Offer offer, TransferController transferController) {
    transferController
      ..selectedOffer =
          transferController.selectedOffer?.id == offer.id ? null : offer
      ..update(['Offers-list']);
  }

  ElevatedButton _actionButton(
      {required String label,
      required VoidCallback onTap,
      bool isSelected = false,
      Color bgColor = AppConfigs.dg}) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        side: BorderSide(color: isSelected ? bgColor : Colors.transparent),
        backgroundColor: isSelected ? AppConfigs.w : bgColor,
        shape: StadiumBorder(),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? bgColor : Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
