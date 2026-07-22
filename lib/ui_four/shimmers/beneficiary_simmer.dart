import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/main_controller.dart';
import 'package:shimmer/shimmer.dart';

class BeneficiaryShimmer extends StatelessWidget {
  final int? itemLength;
  final double? profileHeight;

  const BeneficiaryShimmer({super.key, this.itemLength = 10, this.profileHeight = 60});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemLength,
      padding: EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) => ShimmerCard(
        profileHeight: profileHeight,
      ),
    );
  }
}

class ShimmerCard extends StatelessWidget {
  final double? profileHeight;

  const ShimmerCard({super.key, this.profileHeight});

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<MainController>().isDark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            // Icon placeholder
            Container(
              height: profileHeight,
              width: profileHeight,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 12),
            // Text placeholders
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 12, width: 100, color: Colors.white),
                  const SizedBox(height: 6),
                  Container(height: 12, width: 180, color: Colors.white),
                  const SizedBox(height: 6),
                  Container(height: 12, width: 60, color: Colors.white),
                ],
              ),
            ),
            const SizedBox(width: 12),
            // Heart icon placeholder
            Container(
              height: 24,
              width: 24,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 12),
            // Dot menu placeholder
            Container(
              height: 20,
              width: 4,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
