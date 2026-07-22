import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/controllers/account_controller.dart';
import 'package:mobiremit/core/flavours/image_paths.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/flavours/app_config.dart';

class ProfileShimmers extends StatelessWidget {
  const ProfileShimmers({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    bool isDark = Get.find<AccountController>().isDark;
    List<double> detailsRowWidths = [
      screenWidth / 1.8,
      screenWidth / 4,
      screenWidth / 2.2,
      screenWidth / 3,
      screenWidth / 2,
      screenWidth / 1.5,
      screenWidth / 2.5,
      screenWidth / 3.4,
    ];
    return Padding(
      padding: const EdgeInsets.fromLTRB(34, 20, 34, 20),
      child: Shimmer.fromColors(
        baseColor: isDark ? Colors.grey[800]! : Colors.grey[300]!,
        highlightColor: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        child: ListView(
          children: [
            Row(
              children: [
                const Icon(Icons.account_circle, size: 65),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerContainer(width: screenWidth / 2, height: 20),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Icon(Icons.call, size: 12),
                        SizedBox(width: 5),
                        _buildShimmerContainer(width: 100),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                _buildShimmerContainer(width: 50, height: 50, radius: 8),
                SizedBox(width: 7),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildShimmerContainer(),
                    SizedBox(height: 5),
                    _buildShimmerContainer(),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(
                  ImagePath.edit,
                  colorFilter: ColorFilter.mode(isDark ? AppConfigs.w : AppConfigs.g4, BlendMode.srcIn),
                  height: 25,
                  width: 25,
                ),
              ],
            ),
            SizedBox(height: 40),
            ...List.generate(
              detailsRowWidths.length,
              (index) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: _buildShimmerContainer(width: detailsRowWidths[index]),
              ),
            ),
            SizedBox(height: 40),
            Center(
              child: _buildShimmerContainer(
                width: 330,
                height: 200,
                radius: 15,
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _buildShimmerContainer({
    double height = 17,
    double width = 200,
    EdgeInsetsGeometry? margin,
    double radius = 3,
    Widget? child,
  }) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}
