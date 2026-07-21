import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/controllers/main_controller.dart';
import '../../../core/exports/ui_six_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/icons/svg_icons.dart';
import '../../../models/all_rates/all_rates_fz.dart';

class ForexRatesPage extends StatefulWidget {
  final bool isPrelogin;

  const ForexRatesPage({super.key, this.isPrelogin = false});

  @override
  State<ForexRatesPage> createState() => _ForexRatesPageState();
}

class _ForexRatesPageState extends State<ForexRatesPage> {
  final TextEditingController _searchController = TextEditingController();
  CurrencyRateList? _selectedRate;
  String _selectedPeriod = '1W';
  String _selectedCategory = 'All';

  final List<String> _periods = ['1D', '1W', '1M', '3M'];
  final List<String> _categories = [
    'All',
    'South Asia',
    'SE Asia',
    'Africa',
    'Europe'
  ];

  @override
  void initState() {
    super.initState();
    // Get rates on startup
    Get.find<AccountController>().getRates();
  }

  // Region grouping maps
  final Map<String, List<String>> _regionCurrencies = {
    'South Asia': ['INR', 'PKR', 'BDT', 'NPR', 'LKR'],
    'SE Asia': ['PHP', 'SGD', 'MYR', 'THB', 'IDR', 'VND'],
    'Africa': ['EGP', 'KES', 'GHS', 'NGN', 'ZAR'],
    'Europe': ['EUR', 'GBP', 'CHF'],
  };

  // Predefined mock metadata for currencies to match screenshot exactly
  Map<String, dynamic> _getRateMetadata(String code) {
    switch (code.toUpperCase()) {
      case 'INR':
        return {
          'change': '+0.12%',
          'isPositive': true,
          'fullName': 'India • Rupee',
          'chartData': [
            0.2,
            0.25,
            0.22,
            0.32,
            0.28,
            0.42,
            0.38,
            0.48,
            0.44,
            0.54
          ]
        };
      case 'PKR':
        return {
          'change': '-0.08%',
          'isPositive': false,
          'fullName': 'Pakistan • Rupee',
          'chartData': [
            0.6,
            0.58,
            0.52,
            0.48,
            0.45,
            0.42,
            0.38,
            0.35,
            0.32,
            0.3
          ]
        };
      case 'PHP':
        return {
          'change': '+0.22%',
          'isPositive': true,
          'fullName': 'Philippines • Peso',
          'chartData': [
            0.1,
            0.15,
            0.12,
            0.25,
            0.22,
            0.35,
            0.32,
            0.45,
            0.42,
            0.55
          ]
        };
      case 'BDT':
        return {
          'change': '+0.05%',
          'isPositive': true,
          'fullName': 'Bangladesh • Taka',
          'chartData': [
            0.3,
            0.32,
            0.31,
            0.35,
            0.34,
            0.38,
            0.37,
            0.4,
            0.39,
            0.42
          ]
        };
      case 'NPR':
        return {
          'change': '-0.11%',
          'isPositive': false,
          'fullName': 'Nepal • Rupee',
          'chartData': [0.5, 0.48, 0.45, 0.42, 0.4, 0.38, 0.35, 0.32, 0.3, 0.28]
        };
      case 'LKR':
        return {
          'change': '+0.35%',
          'isPositive': true,
          'fullName': 'Sri Lanka • Rupee',
          'chartData': [0.2, 0.28, 0.24, 0.36, 0.32, 0.44, 0.4, 0.52, 0.48, 0.6]
        };
      default:
        final hash = code.hashCode;
        final isPos = hash % 2 == 0;
        final changeVal = ((hash % 40) + 1) / 100.0;
        final changeStr =
            "${isPos ? '+' : '-'}${changeVal.toStringAsFixed(2)}%";

        final List<double> data = [0.3];
        for (int i = 1; i < 10; i++) {
          final next =
              data.last + (isPos ? 0.04 : -0.04) + ((hash + i) % 8 - 4) / 100.0;
          data.add(next.clamp(0.1, 0.9));
        }

        return {
          'change': changeStr,
          'isPositive': isPos,
          'fullName': '$code • Currency',
          'chartData': data
        };
    }
  }

  // Modify chart data based on selected period tab for nice micro-animations
  List<double> _getAdjustedChartData(List<double> baseData, String period) {
    double scale = 1.0;
    double offset = 0.0;
    if (period == '1D') {
      scale = 0.7;
      offset = 0.1;
    } else if (period == '1M') {
      scale = 1.2;
      offset = -0.05;
    } else if (period == '3M') {
      scale = 0.9;
      offset = 0.05;
    }
    return baseData.map((e) => (e * scale + offset).clamp(0.05, 0.95)).toList();
  }

  @override
  Widget build(BuildContext context) {
    int forexDecLen = int.parse(Box3.settings.forexDecimalLength);

    return GetBuilder<AccountController>(
      id: 'all-rates',
      builder: (accountController) {
        final isDark = accountController.isDark;
        final primaryColor =
            const Color(0xFFC62828); // Vibrant Burgundy Red from mockup
        final nowStr = DateFormat('h:mm a').format(DateTime.now());

        // Select initial rate if not set yet
        if (_selectedRate == null &&
            accountController.rates != null &&
            accountController.rates!.isNotEmpty) {
          // Try to find INR first as default to match screenshot
          _selectedRate = accountController.rates!.firstWhere(
            (e) => e.currencyCode.toUpperCase() == 'INR',
            orElse: () => accountController.rates!.first,
          );
        }

        // Filter and Search logic
        List<CurrencyRateList> filteredList = [];
        if (accountController.rates != null) {
          filteredList = accountController.rates!.where((rate) {
            final code = rate.currencyCode.toLowerCase();
            final searchMatch =
                code.contains(_searchController.text.toLowerCase()) ||
                    rate.currency
                        .toLowerCase()
                        .contains(_searchController.text.toLowerCase());
            if (!searchMatch) return false;

            if (_selectedCategory == 'All') return true;
            final allowedCodes = _regionCurrencies[_selectedCategory] ?? [];
            return allowedCodes.contains(rate.currencyCode.toUpperCase());
          }).toList();
        }

        final selectedMeta = _selectedRate != null
            ? _getRateMetadata(_selectedRate!.currencyCode)
            : null;
        final selectedPrice = _selectedRate != null
            ? (accountController.forexType == 'buy'
                ? _selectedRate!.cashRateBuy
                : _selectedRate!.cashRateSell)
            : 0.0;
        final selectedChange =
            selectedMeta != null ? selectedMeta['change'] as String : '';
        final isSelectedPositive =
            selectedMeta != null ? selectedMeta['isPositive'] as bool : true;
        final selectedChartData = selectedMeta != null
            ? selectedMeta['chartData'] as List<double>
            : <double>[];
        final adjustedChartData =
            _getAdjustedChartData(selectedChartData, _selectedPeriod);

        // Header for Pre-login mode
        Widget preloginAppBar = SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isDark ? AppConfigs.g21 : const Color(0xFFFFFDFD),
              border: Border(
                bottom: BorderSide(
                  color: AppConfigs.primaryColor.withOpacity(0.5),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => widget.isPrelogin
                      ? Get.back()
                      : Get.find<MainController>().pop(),
                  child: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, bottom: 0),
                    decoration: BoxDecoration(
                      color: isDark ? AppConfigs.g14 : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFFDECEE),
                        width: 1.5,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(SvgIcons.arrowLeft),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Live Exchange Rates",
                        style: TS.f22B.copyWith(
                          color:
                              isDark ? AppConfigs.w : const Color(0xFF2C1E1B),
                          fontWeight: FontWeight.w900,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Updated $nowStr today",
                        style: const TextStyle(
                          color: Color(0xFFE06D7B),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );

        Widget body = accountController.rates == null
            ? Center(child: loader())
            : Column(
                children: [
                  if (widget.isPrelogin) preloginAppBar,
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: [
                          const SizedBox(height: 16),

                          // --- 1. Rate Trend Sparkline Card ---
                          if (_selectedRate != null)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: isDark ? AppConfigs.g14 : Colors.white,
                                  borderRadius: BorderRadius.circular(24.0),
                                  border: Border.all(
                                    color: isDark
                                        ? Colors.grey.withOpacity(0.2)
                                        : const Color(0xFFFDECEE),
                                    width: 1.5,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: const Color(0xFFB0506D)
                                          .withOpacity(0.04),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Top header row inside Trend Card
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "AED → ${_selectedRate!.currencyCode}",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: isDark
                                                ? AppConfigs.g8f
                                                : const Color(0xFFB0506D),
                                            letterSpacing: 0.5,
                                          ),
                                        ),
                                        // Period tabs selector
                                        Container(
                                          padding: const EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                            color: isDark
                                                ? AppConfigs.g21
                                                : const Color(0xFFFFF6F6),
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Row(
                                            children: _periods.map((p) {
                                              final isSel =
                                                  _selectedPeriod == p;
                                              return GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _selectedPeriod = p;
                                                  });
                                                },
                                                child: Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 12,
                                                      vertical: 6),
                                                  decoration: BoxDecoration(
                                                    color: isSel
                                                        ? (isDark
                                                            ? AppConfigs
                                                                .primaryColor
                                                            : Colors.white)
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    border: isSel && !isDark
                                                        ? Border.all(
                                                            color: const Color(
                                                                0xFFE06D7B),
                                                            width: 1.5)
                                                        : null,
                                                  ),
                                                  child: Text(
                                                    p,
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontWeight: isSel
                                                          ? FontWeight.w900
                                                          : FontWeight.bold,
                                                      color: isSel
                                                          ? (isDark
                                                              ? Colors.white
                                                              : const Color(
                                                                  0xFFC62828))
                                                          : (isDark
                                                              ? AppConfigs.g8f
                                                              : const Color(
                                                                      0xFFE06D7B)
                                                                  .withOpacity(
                                                                      0.7)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),

                                    // Main Big Rate Label
                                    Text(
                                      selectedPrice
                                          .toStringAsFixed(forexDecLen),
                                      style: TextStyle(
                                        fontSize: 42,
                                        fontWeight: FontWeight.w900,
                                        color: isDark
                                            ? AppConfigs.w
                                            : const Color(0xFF2C1E1B),
                                        height: 1.1,
                                      ),
                                    ),
                                    const SizedBox(height: 6),

                                    // Trend Icon & Change description
                                    Row(
                                      children: [
                                        Icon(
                                          isSelectedPositive
                                              ? Icons.arrow_drop_up_rounded
                                              : Icons.arrow_drop_down_rounded,
                                          color: isSelectedPositive
                                              ? const Color(0xFF2E7D32)
                                              : const Color(0xFFC62828),
                                          size: 24,
                                        ),
                                        Text(
                                          "$selectedChange today",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800,
                                            color: isSelectedPositive
                                                ? const Color(0xFF2E7D32)
                                                : const Color(0xFFC62828),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 24),

                                    // Beautiful Custom Sparkline Painter with Blue Gradient underlay
                                    SizedBox(
                                      height: 110,
                                      width: double.infinity,
                                      child: CustomPaint(
                                        painter: SparklinePainter(
                                          data: adjustedChartData,
                                          lineColor: primaryColor,
                                          gradientColors: isDark
                                              ? [
                                                  const Color(0xFFB0506D)
                                                      .withOpacity(0.3),
                                                  Colors.transparent,
                                                ]
                                              : [
                                                  const Color(
                                                      0xFFD0E1FD), // Gorgeous soft blue top under curve
                                                  Colors.white.withOpacity(0.0),
                                                ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          const SizedBox(height: 20),

                          // --- 2. Beautiful Expanded Search Bar ---
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: isDark ? AppConfigs.g14 : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                  color: isDark
                                      ? Colors.grey.withOpacity(0.2)
                                      : const Color(0xFFFDECEE),
                                  width: 1.5,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.015),
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: TextField(
                                controller: _searchController,
                                onChanged: (val) {
                                  setState(() {});
                                },
                                style: TextStyle(
                                  color: isDark
                                      ? AppConfigs.w
                                      : const Color(0xFF2C1E1B),
                                  fontWeight: FontWeight.w600,
                                ),
                                decoration: InputDecoration(
                                  hintText: "Search currency name or code...",
                                  hintStyle: TextStyle(
                                    color: isDark
                                        ? AppConfigs.g8f
                                        : const Color(0xFFB0506D)
                                            .withOpacity(0.5),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search_rounded,
                                    color: isDark
                                        ? AppConfigs.g8f
                                        : const Color(0xFFB0506D),
                                  ),
                                  suffixIcon: _searchController.text.isNotEmpty
                                      ? IconButton(
                                          icon: const Icon(Icons.clear_rounded),
                                          onPressed: () {
                                            setState(() {
                                              _searchController.clear();
                                            });
                                          },
                                        )
                                      : null,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 20),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 16),

                          // --- 3. Region Category horizontal tabs bar ---
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              physics: const BouncingScrollPhysics(),
                              itemCount: _categories.length,
                              itemBuilder: (context, idx) {
                                final cat = _categories[idx];
                                final isSel = _selectedCategory == cat;
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _selectedCategory = cat;
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        right: 8, top: 4, bottom: 4),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 22, vertical: 8),
                                    decoration: BoxDecoration(
                                      color: isSel
                                          ? primaryColor
                                          : (isDark
                                              ? AppConfigs.g14
                                              : Colors.white),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                        color: isSel
                                            ? Colors.transparent
                                            : const Color(0xFFFDECEE),
                                        width: 1.5,
                                      ),
                                      boxShadow: isSel
                                          ? [
                                              BoxShadow(
                                                color: primaryColor
                                                    .withOpacity(0.2),
                                                blurRadius: 8,
                                                offset: const Offset(0, 4),
                                              ),
                                            ]
                                          : null,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      cat,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w900,
                                        color: isSel
                                            ? Colors.white
                                            : (isDark
                                                ? AppConfigs.g8f
                                                : const Color(0xFFB0506D)),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(height: 12),

                          // --- 4. Currencies list ---
                          filteredList.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 40.0),
                                  child: Center(
                                    child: Text(
                                      "No Data Found".tr,
                                      style: TS.f20.copyWith(
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  padding: EdgeInsets.zero,
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: filteredList.length,
                                  itemBuilder: (context, idx) {
                                    final rate = filteredList[idx];

                                    // Check if we should render this based on type (buy/sell)
                                    final hasValidRate =
                                        accountController.forexType == 'buy'
                                            ? rate.cashRateBuy > 0
                                            : rate.cashRateSell > 0;

                                    if (!hasValidRate) return const SizedBox();

                                    final meta =
                                        _getRateMetadata(rate.currencyCode);
                                    final changeStr = meta['change'] as String;
                                    final isPositive =
                                        meta['isPositive'] as bool;
                                    final fullName = meta['fullName'] as String;

                                    final price =
                                        accountController.forexType == 'buy'
                                            ? rate.cashRateBuy
                                            : rate.cashRateSell;

                                    final isCurrentSelected =
                                        _selectedRate?.currencyCode ==
                                            rate.currencyCode;

                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedRate = rate;
                                        });
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 16, vertical: 6),
                                        padding: const EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: isDark
                                              ? AppConfigs.g14
                                              : Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: isCurrentSelected
                                                ? primaryColor
                                                : (isDark
                                                    ? Colors.grey
                                                        .withOpacity(0.15)
                                                    : const Color(0xFFFDECEE)),
                                            width:
                                                isCurrentSelected ? 2.0 : 1.5,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black
                                                  .withOpacity(0.015),
                                              blurRadius: 12,
                                              offset: const Offset(0, 4),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            // Rounded rectangle Flag representation
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Container(
                                                width: 44,
                                                height: 32,
                                                color: isDark
                                                    ? AppConfigs.g21
                                                    : const Color(0xFFFFF6F6),
                                                child: Base64Image(
                                                  image:
                                                      rate.currencyFlagPath ??
                                                          "",
                                                  width: 44,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 14),

                                            // Country & Code Info
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "AED → ${rate.currencyCode}",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      color: isDark
                                                          ? AppConfigs.w
                                                          : const Color(
                                                              0xFF2C1E1B),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 2),
                                                  Text(
                                                    fullName,
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: isDark
                                                          ? AppConfigs.g8f
                                                          : const Color(
                                                                  0xFFB0506D)
                                                              .withOpacity(0.7),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),

                                            // Rate & Trend Info
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  price.toStringAsFixed(
                                                      forexDecLen),
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w900,
                                                    color: isDark
                                                        ? AppConfigs.w
                                                        : const Color(
                                                            0xFF2C1E1B),
                                                  ),
                                                ),
                                                const SizedBox(height: 2),
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      isPositive
                                                          ? Icons
                                                              .arrow_drop_up_rounded
                                                          : Icons
                                                              .arrow_drop_down_rounded,
                                                      color: isPositive
                                                          ? const Color(
                                                              0xFF2E7D32)
                                                          : const Color(
                                                              0xFFC62828),
                                                      size: 18,
                                                    ),
                                                    Text(
                                                      changeStr,
                                                      style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        color: isPositive
                                                            ? const Color(
                                                                0xFF2E7D32)
                                                            : const Color(
                                                                0xFFC62828),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              );

        return Scaffold(
          backgroundColor: isDark ? Colors.black : const Color(0xFFFFFDFD),
          body: PopScope(
            canPop: false,
            onPopInvokedWithResult: (c, t) async {
              if (widget.isPrelogin) {
                Get.back();
              } else {
                Get.find<MainController>().pop();
              }
              return;
            },
            child: SafeArea(
              top: !widget.isPrelogin,
              child: Stack(
                children: [
                  // Premium gradient backdrop decoration
                  if (!isDark)
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFEAF0FF), // Soft Indigo/Blue
                            Color(0xFFFFF8F6), // Warm Pink/Peach
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.0, 0.45],
                        ),
                      ),
                    ),
                  body,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

// Custom Painter to draw extremely premium smooth curve sparklines with custom gradients under the curves.
class SparklinePainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;
  final List<Color> gradientColors;

  SparklinePainter({
    required this.data,
    required this.lineColor,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final width = size.width;
    final height = size.height;
    final stepX = width / (data.length - 1);

    final path = Path();
    final fillPath = Path();

    // Scaling
    double minVal = data.first;
    double maxVal = data.first;
    for (var val in data) {
      if (val < minVal) minVal = val;
      if (val > maxVal) maxVal = val;
    }
    final range = maxVal - minVal == 0 ? 1.0 : maxVal - minVal;

    double getX(int index) => index * stepX;
    double getY(int index) {
      final normalized = (data[index] - minVal) / range;
      return height - (normalized * (height - 30) + 15);
    }

    path.moveTo(getX(0), getY(0));
    fillPath.moveTo(getX(0), height);
    fillPath.lineTo(getX(0), getY(0));

    for (int i = 0; i < data.length - 1; i++) {
      final x1 = getX(i);
      final y1 = getY(i);
      final x2 = getX(i + 1);
      final y2 = getY(i + 1);

      // Smooth Bezier Curve segments
      final cx1 = x1 + stepX / 2.2;
      final cy1 = y1;
      final cx2 = x2 - stepX / 2.2;
      final cy2 = y2;

      path.cubicTo(cx1, cy1, cx2, cy2, x2, y2);
      fillPath.cubicTo(cx1, cy1, cx2, cy2, x2, y2);
    }

    fillPath.lineTo(width, height);
    fillPath.close();

    // Draw fading gradient fill
    final paintFill = Paint()
      ..shader = LinearGradient(
        colors: gradientColors,
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, width, height))
      ..style = PaintingStyle.fill;

    canvas.drawPath(fillPath, paintFill);

    // Draw the main curve line
    final paintLine = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round;

    canvas.drawPath(path, paintLine);
  }

  @override
  bool shouldRepaint(covariant SparklinePainter oldDelegate) {
    return oldDelegate.data != data ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.gradientColors != gradientColors;
  }
}
