import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/controllers/main_controller.dart';

class FormShimmer extends StatelessWidget {
  const FormShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Shimmer effect for radio buttons (Individual/Corporate)
            _buildShimmerContainer(height: 50),
            const SizedBox(height: 24),

            // Shimmer effects for form fields
            ...List.generate(
              4,
              (index) => Column(
                children: [
                  _buildFormFieldShimmer(),
                  const SizedBox(height: 16),
                ],
              ),
            ),

            _buildFormFieldShimmer(height: 60),
            const SizedBox(height: 16),

            _buildFormFieldShimmer(height: 60),
            const SizedBox(height: 16),

            // Shimmer for radio options
            _buildRadioGroupShimmer(),
            const SizedBox(height: 16),

            // Shimmer for T&C checkbox and text
            _buildCheckboxWithTextShimmer(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerContainer({
    double height = 50,
    double width = double.infinity,
    double radius = 8,
  }) {
    return Shimmer.fromColors(
      baseColor: Get.find<MainController>().isDark ? Colors.grey[800]! : Colors.grey[300]!,
      highlightColor: Get.find<MainController>().isDark ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }

  Widget _buildFormFieldShimmer({double height = 56}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label shimmer
        _buildShimmerContainer(height: 14, width: 120, radius: 4),
        const SizedBox(height: 8),
        // Input field shimmer
        _buildShimmerContainer(height: height),
      ],
    );
  }

  Widget _buildRadioGroupShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label shimmer
        _buildShimmerContainer(height: 14, width: 150, radius: 4),
        const SizedBox(height: 12),
        // Radio options shimmer
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildShimmerContainer(height: 20, width: 20, radius: 10),
                      const SizedBox(width: 8),
                      _buildShimmerContainer(height: 14, width: 80, radius: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCheckboxWithTextShimmer() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildShimmerContainer(height: 24, width: 24, radius: 4),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildShimmerContainer(height: 14, width: double.infinity, radius: 4),
              const SizedBox(height: 6),
              _buildShimmerContainer(height: 14, width: 200, radius: 4),
            ],
          ),
        ),
      ],
    );
  }
}
