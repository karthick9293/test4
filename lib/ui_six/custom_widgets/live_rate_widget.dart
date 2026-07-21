import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/account_controller.dart';

import '../../core/controllers/main_controller.dart';
import '../../core/flavours/constants.dart';

class LiveRateWidget extends StatelessWidget {
  const LiveRateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding:
            const EdgeInsets.fromLTRB(0, 24.0, 0, 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cms(Fields.Dashboard_LiveRates).textHeading!,
                  style: TS.f14.copyWith(
                    fontWeight: FontWeight.w900,
                    color: AppConfigs.primaryColor,
                  ),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Row(
                      children:[
                        Text(
                          cms(Fields.Dashboard_LiveRatesViewAll).textHeading!,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: AppConfigs.primaryColor,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 14,
                          color: AppConfigs.primaryColor,
                        ),
                      ],
                    )
                ),
              ],
            )
          ),
          Container(
            height: 90,
            padding: EdgeInsets.symmetric(vertical: 5),
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(color: Colors.grey.withAlpha(30),blurRadius: 6)
                ]
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              // padding: const EdgeInsets.symmetric(horizontal: 16.0),
              physics: const BouncingScrollPhysics(),
              children: [
                _rateCard(
                  pair: "AED→INR",
                  rate: "22.84",
                  change: "▲ +0.12%",
                  isPositive: true,
                ),
                _rateCard(
                  pair: "AED→PKR",
                  rate: "76.40",
                  change: "▼ -0.08%",
                  isPositive: false,
                ),
                _rateCard(
                    pair: "AED→PHP",
                    rate: "15.62",
                    change: "▲ +0.22%",
                    isPositive: true,
                    isLast: true
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Helper widget for Rate Card
Widget _rateCard({
  required String pair,
  required String rate,
  required String change,
  required bool isPositive,
  bool? isLast=false
}) {
  return Container(
    width: Get.width * 0.30,
    // padding: const EdgeInsets.only(left: 20),
    decoration: BoxDecoration(
      color: Get.find<AccountController>().isDark?AppConfigs.w.withOpacity(0.1):Colors.white,
      // borderRadius: BorderRadius.circular(20),
      border: isLast==true?null:Border(right: BorderSide(
          color: Colors.grey.withAlpha(40)
      )),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.02),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          pair,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w700,
            color: Color(0xFF8C7F7B),
          ),
        ),
        const SizedBox(height: 2),

        Text(
          rate,
          style: TS.f20.copyWith(
            fontWeight: FontWeight.w900,
            color: Get.find<AccountController>().isDark
                ? AppConfigs.w
                : Color(0xFF2C1E1B),
          ),
        ),
        // const SizedBox(height: 2),
        // Text(
        //   change,
        //   style: TextStyle(
        //     fontSize: 11,
        //     fontWeight: FontWeight.bold,
        //     color: isPositive
        //         ? const Color(0xFF2E7D32)
        //         : const Color(0xFFC62828),
        //   ),
        // ),
      ],
    ),
  );
}
