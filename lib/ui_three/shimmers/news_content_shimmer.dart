import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/controllers/account_controller.dart';

class NewsContentShimmer extends StatelessWidget {
  const NewsContentShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    bool isDark = Get.find<AccountController>().isDark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildShimmerContainer(width: double.infinity),
          const SizedBox(height: 6),
          _buildShimmerContainer(width: screenWidth / 1.5),
          const SizedBox(height: 6),
          _buildShimmerContainer(width: double.infinity),
          const SizedBox(height: 6),
          _buildShimmerContainer(width: screenWidth / 2.5),
        ],
      ),
    );
  }

  Container _buildShimmerContainer({required double width}) {
    return Container(
      width: width,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}
