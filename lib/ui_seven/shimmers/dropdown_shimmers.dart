import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/account_controller.dart';
import 'package:shimmer/shimmer.dart';

class DropdownShimmers extends StatelessWidget {
  const DropdownShimmers({super.key, this.itemcount = 2});

  final int itemcount;

  @override
  Widget build(BuildContext context) {
    bool isDark = Get.find<AccountController>().isDark;
    return Shimmer.fromColors(
      baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          itemcount,
          (index) => _buildShimmerItem(context),
        ),
      ),
    );
  }

  Column _buildShimmerItem(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 12,
          width: MediaQuery.sizeOf(context).width / 2.5,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(height: 5),
        Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
