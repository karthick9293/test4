import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/account_controller.dart';
import 'package:shimmer/shimmer.dart';

class PaymentModeShimmers extends StatelessWidget {
  const PaymentModeShimmers({super.key, this.gatewayOnly = false});

  final bool gatewayOnly;

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<AccountController>().isDark;

    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20),
          if (!gatewayOnly)
            Padding(
              padding: const EdgeInsets.only(left: 31, right: 31, bottom: 14.7),
              child: _buildShimmerContainer(context, width: MediaQuery.sizeOf(context).width / 3),
            ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              height: 120,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  4,
                  (index) => Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildShimmerContainer(
                          context,
                          height: 50,
                          width: 50,
                          radius: 10,
                        ),
                      ),
                      _buildShimmerContainer(context, width: 40, height: 10),
                      SizedBox(height: 2.5),
                      if (index == 0 || index == 1) _buildShimmerContainer(context, width: 50, height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   padding:
          //       const EdgeInsets.only(left: 31, right: 33, bottom: 20, top: 20),
          //   alignment: Alignment.centerRight,
          //   child: _buildShimmerContainer(context, width: 80),
          // ),
        ],
      ),
    );
  }

  Container _buildShimmerContainer(BuildContext context, {double height = 12, double width = 50, double radius = 4}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
