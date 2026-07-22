import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:mobiremit/core/exports/controllers.dart';
import 'package:mobiremit/core/flavours/constants.dart';

import '../../core/exports/ui_four_shimmer.dart';

class ModernNewsCard extends StatefulWidget {
  const ModernNewsCard({super.key});

  @override
  State<ModernNewsCard> createState() => _ModernNewsCardState();
}

class _ModernNewsCardState extends State<ModernNewsCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _liveController;

  @override
  void initState() {
    super.initState();
    _liveController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _liveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DataController>(
      id: 'news',
      builder: (controller) {
        if (controller.newsList.isEmpty) return const SizedBox.shrink();

        final isExpanded = controller.isNewsExpanded.value;
        final isDark = Get.find<AccountController>().isDark;

        return AnimatedPositioned(
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutBack,
          bottom: isExpanded ? 0 : 20,
          left: isExpanded ? 0 : 16,
          right: isExpanded ? 0 : 16,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutBack,
            height: isExpanded ? MediaQuery.of(context).size.height * 0.5 : 80,
            decoration: BoxDecoration(
              color: isExpanded
                  ? (isDark
                      ? AppConfigs.g21
                      : (controller.beforeLogin
                          ? Colors.white.withOpacity(0.9)
                          : AppConfigs.w))
                  : Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(isExpanded ? 30 : 20),
              border: Border.all(
                color: isExpanded
                    ? AppConfigs.primaryColor.withOpacity(0.3)
                    : Colors.white.withOpacity(0.2),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                )
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(isExpanded ? 30 : 20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: isExpanded
                    ? _buildExpandedContent(context, controller, isDark)
                    : _buildCollapsedContent(context, controller),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildCollapsedContent(
      BuildContext context, DataController controller) {
    return InkWell(
      onTap: () => controller.toggleNewsExpanded(),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppConfigs.primaryColor, AppConfigs.accentColor],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppConfigs.primaryColor.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 5,
                    )
                  ],
                ),
                child:
                    const Icon(Icons.newspaper, color: Colors.white, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "NEWS",
                          style: TextStyle(
                            color: AppConfigs.primaryColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        FadeTransition(
                          opacity: _liveController,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 20,
                      child: GetBuilder<DataController>(
                        id: 'news',
                        builder: (controller) {
                          final marqueeText = controller.newsList
                              .map((news) {
                                String title = news.newsTitle ?? "";
                                String content =
                                    _stripHtml(news.newsContent ?? "");
                                if (content.isNotEmpty) {
                                  return "$title: $content";
                                }
                                return title;
                              })
                              .where((t) => t.isNotEmpty)
                              .join("   •   ");

                          if (marqueeText.isEmpty) {
                            return const SizedBox.shrink();
                          }

                          return Marquee(
                            key: ValueKey(marqueeText),
                            text: marqueeText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            scrollAxis: Axis.horizontal,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            blankSpace: 100.0,
                            velocity: 40.0,
                            pauseAfterRound: const Duration(seconds: 2),
                            startPadding: 10.0,
                            accelerationDuration: const Duration(seconds: 1),
                            accelerationCurve: Curves.linear,
                            decelerationDuration:
                                const Duration(milliseconds: 500),
                            decelerationCurve: Curves.easeOut,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.expand_less, color: Colors.white70),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedContent(
      BuildContext context, DataController controller, bool isDark) {
    final targetHeight = MediaQuery.of(context).size.height * 0.5;
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: targetHeight,
        child: Column(
          children: [
            Container(
              height: 5,
              width: 50,
              margin: const EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 15, 24, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "News & Updates",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AppConfigs.primaryColor,
                    ),
                  ),
                  IconButton(
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.grey.withOpacity(0.1),
                    ),
                    onPressed: () => controller.toggleNewsExpanded(),
                    icon: Icon(Icons.close,
                        size: 20, color: isDark ? Colors.white : Colors.black),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                itemCount: controller.newsList.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 25),
                itemBuilder: (context, index) {
                  final news = controller.newsList[index];
                  return Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: isDark
                          ? Colors.white.withOpacity(0.05)
                          : Colors.black.withOpacity(0.03),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          news.newsTitle ?? "",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : AppConfigs.b,
                          ),
                        ),
                        const SizedBox(height: 12),
                        if (news.newsContent != null &&
                            news.newsContent!.isNotEmpty)
                          Html(
                            data: news.newsContent,
                            style: {
                              "body": Style(
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                                fontSize: FontSize(14),
                                color: isDark ? Colors.white : AppConfigs.b,
                                lineHeight: LineHeight.em(1.5),
                              ),
                              "p": Style(
                                color: isDark ? Colors.white : AppConfigs.b,
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                              ),
                              "div": Style(
                                color: isDark ? Colors.white : AppConfigs.b,
                                margin: Margins.zero,
                                padding: HtmlPaddings.zero,
                              ),
                              "span": Style(
                                color: isDark ? Colors.white : AppConfigs.b,
                              ),
                              "li": Style(
                                color: isDark ? Colors.white : AppConfigs.b,
                              ),
                            },
                          )
                        else if (controller
                            .isLoadingNewsContent(news.code ?? ""))
                          const NewsContentShimmer()
                        else
                          const Text("No content available"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _stripHtml(String html) {
    if (html.isEmpty) return "";
    // Basic regex to strip HTML tags and decode common entities
    return html
        .replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), ' ')
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim();
  }
}
