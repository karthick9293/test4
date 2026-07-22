import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../core/flavours/constants.dart';
import '../core/flavours/flavor_config.dart';

class FlavorSelectionScreen extends StatefulWidget {
  const FlavorSelectionScreen({super.key});

  @override
  State<FlavorSelectionScreen> createState() => _FlavorSelectionScreenState();
}

class _FlavorSelectionScreenState extends State<FlavorSelectionScreen>
    with TickerProviderStateMixin {
  List<FlavorConfig>? _flavors;
  late AnimationController _listCtrl;
  late Animation<double> _listFade;

  @override
  void initState() {
    super.initState();
    _listCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _listFade = CurvedAnimation(parent: _listCtrl, curve: Curves.easeOutCubic);
    _loadFlavors();

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
  }

  Future<void> _loadFlavors() async {
    final flavors = await FlavorConfig.loadAvailableFlavors();
    if (mounted) {
      setState(() => _flavors = flavors);
      _listCtrl.forward();
    }
  }

  @override
  void dispose() {
    _listCtrl.dispose();
    super.dispose();
  }

  void _onSelect(FlavorConfig config) {
    AppConfigs.appKey = config.appKey;
    AppConfigs.selectedDemoFlavorName = config.flavor.name;
    Get.back(result: true);
  }

  @override
  Widget build(BuildContext context) {
    final primary = AppConfigs.primaryColor;

    return Scaffold(
      backgroundColor: const Color(0xFFFCFDFE), // Ultra clean white/grey
      body: Stack(
        children: [
          // ── Decorative Background Elements ───────────────────────────────
          Positioned(
            top: -100,
            right: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary.withOpacity(0.04),
              ),
            ),
          ),
          Positioned(
            bottom: -80,
            left: -80,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: primary.withOpacity(0.03),
              ),
            ),
          ),

          // ── Main Content ──────────────────────────────────────────────────
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 40, 24, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "DEMO MODE",
                          style: TS.f12.copyWith(
                            color: primary,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Choose Client.",
                        style: TS.f28.copyWith(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: const Color(0xFF111827),
                          height: 1.1,
                          letterSpacing: -1.0,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Select the target environment to continue.",
                        style: TS.f14.copyWith(
                          color: AppConfigs.g21,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                // List
                Expanded(
                  child: _flavors == null
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            color: primary,
                          ),
                        )
                      : Center(
                          child: FadeTransition(
                            opacity: _listFade,
                            child: ListView.separated(
                              shrinkWrap: true,
                              padding:
                                  const EdgeInsets.fromLTRB(24, 16, 24, 24),
                              physics: const BouncingScrollPhysics(),
                              itemCount: _flavors!.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 12),
                              itemBuilder: (context, index) {
                                final config = _flavors![index];
                                return _ListCard(
                                  config: config,
                                  primaryColor: primary,
                                  onTap: () => _onSelect(config),
                                  index: index,
                                );
                              },
                            ),
                          ),
                        ),
                ),

                // Footer
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, top: 10),
                    child: Text(
                      "Powered by Distinct Infotech Solutions".toUpperCase(),
                      style: TS.f12.copyWith(
                        color: Colors.grey,
                        fontSize: 11,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListCard extends StatefulWidget {
  final FlavorConfig config;
  final Color primaryColor;
  final VoidCallback onTap;
  final int index;

  const _ListCard({
    required this.config,
    required this.primaryColor,
    required this.onTap,
    required this.index,
  });

  @override
  State<_ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<_ListCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _pressCtrl;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _pressCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.95,
      upperBound: 1.0,
      value: 1.0,
    );
    _scaleAnim = CurvedAnimation(parent: _pressCtrl, curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    _pressCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cfg = widget.config;

    return ScaleTransition(
      scale: _scaleAnim,
      child: GestureDetector(
        onTapDown: (_) => _pressCtrl.reverse(),
        onTapUp: (_) {
          _pressCtrl.forward();
          widget.onTap();
        },
        onTapCancel: () => _pressCtrl.forward(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFF3F4F6),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: widget.primaryColor.withOpacity(0.04),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Row(
            children: [
              // Logo Circle
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(0xFFF9FAFB),
                  border: Border.all(
                    color: const Color(0xFFF3F4F6),
                    width: 1,
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Image.asset(
                  cfg.logoAsset,
                  fit: BoxFit.contain,
                  errorBuilder: (_, __, ___) => const Icon(
                    Icons.business_outlined,
                    color: Color(0xFF9CA3AF),
                    size: 28,
                  ),
                ),
              ),
              const SizedBox(width: 16),

              // Text Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      cfg.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TS.f18.copyWith(
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF1F2937),
                        letterSpacing: -0.3,
                      ),
                    ),
                    if (cfg.subtitle.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        cfg.subtitle,
                        style: TS.f14.copyWith(
                          color: AppConfigs.g14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ],
                ),
              ),

              // Arrow
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFF9FAFB),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF3F4F6), width: 1),
                ),
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: Color(0xFF9CA3AF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
