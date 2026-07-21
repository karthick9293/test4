import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/controllers/account_controller.dart';
import '../../../core/controllers/data_controller.dart';
import '../../../core/controllers/kyc_controller.dart';
import '../../../core/controllers/main_controller.dart';
import '../../../core/controllers/sign_up_controller.dart';
import '../../../core/controllers/transfer_controller.dart';
import '../../../core/exports/ui_three_custom_widgets.dart';
import '../../../core/exports/ui_three_pages.dart';
import '../../../core/flavours/constants.dart';

class _NavItem {
  final IconData icon;
  final String label;
  const _NavItem(this.icon, this.label);
}


final _barColor = AppConfigs.primaryColor;
const _activeColor = Colors.white;
const _inactiveColor = Colors.white60;
const _fabSize = 62.0;
const _barHeight = 70.0;

class CurvedBottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const CurvedBottomNavBar({
    super.key,
    required this.selectedIndex,
  });

  @override
  State<CurvedBottomNavBar> createState() => _CurvedBottomNavBarState();
}

class _CurvedBottomNavBarState extends State<CurvedBottomNavBar>
    with TickerProviderStateMixin {
  List<_NavItem> get _navItems => [
    _NavItem(CupertinoIcons.house_fill,
        cms(Fields.Dashboard_HomeIconAndText).textHeading!),
    _NavItem(
        Icons.calculate_rounded,
        cms(Fields.Dashboard_RateCalculatorIconAndText)
            .textHeading!
            .split(' ')
            .join('\n')),
    _NavItem(
        Icons.account_balance_rounded,
        cms(Fields.Dashboard_BankTransferIconAndText)
            .textHeading!
            .split(' ')
            .join('\n')),
    _NavItem(
        Icons.payments_rounded,
        cms(Fields.Dashboard_CashTransferIconAndText)
            .textHeading!
            .split(' ')
            .join('\n')),
  ];

  late List<AnimationController> _scaleControllers;
  // late List<Animation<double>> _scaleAnims;
  late AnimationController _fabBounce;
  late Animation<double> _fabScale;

  @override
  void initState() {
    super.initState();
    _scaleControllers = List.generate(
      _navItems.length,
      (i) => AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 250),
      ),
    );
    // _scaleAnims = _scaleControllers
    //     .map((c) => Tween<double>(begin: 1.0, end: 1.15).animate(
    //           CurvedAnimation(parent: c, curve: Curves.easeOutBack),
    //         ))
    //     .toList();

    _fabBounce = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    _fabScale = Tween<double>(begin: 1.0, end: 1.0).animate(_fabBounce);

    _scaleControllers[widget.selectedIndex].forward();
  }

  @override
  void didUpdateWidget(covariant CurvedBottomNavBar old) {
    super.didUpdateWidget(old);
    if (old.selectedIndex != widget.selectedIndex) {
      _scaleControllers[old.selectedIndex].reverse();
      _scaleControllers[widget.selectedIndex].forward();
      _triggerFabBounce();
    }
  }

  void _triggerFabBounce() {
    _fabBounce.reset();
    _fabScale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.2), weight: 40),
      TweenSequenceItem(tween: Tween(begin: 1.2, end: 0.9), weight: 30),
      TweenSequenceItem(tween: Tween(begin: 0.9, end: 1.0), weight: 30),
    ]).animate(CurvedAnimation(parent: _fabBounce, curve: Curves.easeInOut));
    _fabBounce.forward();
  }

  @override
  void dispose() {
    for (final c in _scaleControllers) {
      c.dispose();
    }
    _fabBounce.dispose();
    super.dispose();
  }

  // Calculate the center X position for the bubble based on the index
  double _getCenterPos(BuildContext context, int index) {
    final screenW = MediaQuery.of(context).size.width;
    final tabWidth = screenW / _navItems.length;
    // Reverses visual index calculation in RTL layouts (e.g. Arabic) because the layout orders tabs right-to-left
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final visualIndex = isRtl ? (_navItems.length - 1 - index) : index;
    return (tabWidth * visualIndex) + (tabWidth / 2);
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final centerPos = _getCenterPos(context, widget.selectedIndex);

    return SizedBox(
      height: _barHeight + _fabSize / 2 + bottomPadding,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // ── Background with Moving Notch ───────────────────────────────────
          Positioned.fill(
            top: 6,
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: centerPos, end: centerPos),
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              builder: (context, value, child) {
                return CustomPaint(
                  painter: _NotchedBarPainter(
                    bottomPadding: bottomPadding,
                    notchCenterX: value,
                    primaryColor: _barColor,
                  ),
                );
              },
            ),
          ),

          // ── Nav Items ─────────────────────────────────────────────────────
          Positioned.fill(
            top: 6,
            child: Padding(
              padding: EdgeInsets.only(bottom: bottomPadding),
              child: Row(
                children: List.generate(_navItems.length, (i) {
                  return Expanded(
                    child: _buildNavItem(i),
                  );
                }),
              ),
            ),
          ),

          // ── Moving Bubble (FAB) ──────────────────────────────────────────
          AnimatedPositioned(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOutCubic,
            top: -12,
            left: centerPos - _fabSize / 2,
            child: _buildFab(),
          ),
        ],
      ),
    );
  }

  void onSelectedEvent(int idx) {
    Get.find<MainController>().index = idx;

    switch (idx) {
      case 0:
        homeBtnSelected(idx);
        break;
      case 1:
        rateCalcSelected(idx);
        break;
      case 2:
        bankTransferSelected(idx);
        break;
      case 3:
        cashTransferSelected(idx);
        break;
    }
  }

  void homeBtnSelected(int idx) {
    Get.find<MainController>()
      ..pages.clear()
      ..appBars.clear()
      ..index = idx
      ..push(const DashBoardPage(), dashBoardAppbar())
      ..update();
  }

  void rateCalcSelected(int idx) {
    Get.find<AccountController>()
      // ..fromAmtCtrl.clear()
      // ..toAmtCtrl.clear()
      ..fromAmtCtrl.text = "1"
      ..updateToCurency(s: '1', type: 'L')
      // ..toAmtCtrl.clear()
      ..currencyRatesType = 'rates'
      ..update();
    Get.find<MainController>()
      ..pages.clear()
      ..appBars.clear()
      ..index = idx
      ..push(const DashBoardPage(), dashBoardAppbar())
      ..push(const CurrencyRatesPage(), AppBars.currencyRates)
      ..update();
  }

  void bankTransferSelected(int idx) async {
    late final SignUpController signupController;
    if (Get.isRegistered<SignUpController>()) {
      signupController = Get.find<SignUpController>();
    } else {
      signupController = Get.put(SignUpController());
    }
    if (Box3.idExpired) {
      signupController.showIDExpiredAlert();
    } else if (Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal() != null &&
        Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
      AccountController a = Get.find<AccountController>();
      if (a.contactUs == null) {
        a.getContactUs();
      }
      if (!Get.isRegistered<KycController>()) {
        Get.put(KycController());
      }
      var expDate = Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
      int expiryDays = (DateTime(expDate!.year, expDate.month, expDate.day,
                  expDate.hour, expDate.minute)
              .toLocal())
          .difference(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour,
                  DateTime.now().minute)
              .toLocal())
          .inMinutes;

      Get.put(AccountController());

      if (expiryDays <= 0) {
        if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
          Get.to(const RetryVisualization(), arguments: {
            "msg":
                'There was an error while fetching your documents from UAE PASS. Please retry'
                    .tr,
            "type": 'P',
            "isFrom": 'Dash'
          });
        }
      } else {
        Get.dialog(updateProfileBody(
            msg:
                'Your request/application is under process. We will get back to you within 24 hours'
                    .tr,
            type: 'P'));
      }
    } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry == null) &&
        Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
      AccountController a = Get.find<AccountController>();
      if (a.contactUs == null) {
        a.getContactUs();
      }
      if (!Get.isRegistered<KycController>()) {
        Get.put(KycController());
      }

      Get.put(AccountController());

      if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
        Get.to(const RetryVisualization(), arguments: {
          "msg":
              'There was an error while fetching your documents from UAE PASS. Please retry'
                  .tr,
          "type": 'P',
          "isFrom": 'Dash'
        });
      }
    } else {
      if (Get.isRegistered<TransferController>()) {
        Get.find<TransferController>().reset(t: TransferType.bank);
      } else {
        Get.put(TransferController(transferType: TransferType.bank),
            permanent: true);
      }
      Get.find<DataController>().getData(TransferController);
      Get.find<MainController>()
        ..pages.clear()
        ..appBars.clear()
        ..index = idx
        ..push(const DashBoardPage(), dashBoardAppbar())
        ..push(
            AppConfigs.sendMoney(
              key: UniqueKey(),
            ),
            AppBars.bankTransfer)
        ..update();
    }
  }

  void cashTransferSelected(int idx) async {
    late final SignUpController signupController;
    if (Get.isRegistered<SignUpController>()) {
      signupController = Get.find<SignUpController>();
    } else {
      signupController = Get.put(SignUpController());
    }
    if (Box3.idExpired) {
      signupController.showIDExpiredAlert();
    } else if (Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal() != null &&
        Box3.fetchUAEPassDoc?.reqAuthorized == 'I') {
      AccountController a = Get.find<AccountController>();
      if (a.contactUs == null) {
        a.getContactUs();
      }
      if (!Get.isRegistered<KycController>()) {
        Get.put(KycController());
      }
      var expDate = Box3.fetchUAEPassDoc?.visualizationExpiry?.toLocal();
      int expiryDays = (DateTime(expDate!.year, expDate.month, expDate.day,
                  expDate.hour, expDate.minute)
              .toLocal())
          .difference(DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour,
                  DateTime.now().minute)
              .toLocal())
          .inMinutes;

      Get.put(AccountController());

      if (expiryDays <= 0) {
        if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
          Get.to(const RetryVisualization(), arguments: {
            "msg":
                'There was an error while fetching your documents from UAE PASS. Please retry'
                    .tr,
            "type": 'P',
            "isFrom": 'Dash'
          });
        }
        // Get.dialog(retryAlert(msg: 'There was an error while fetching your documents from UAE PASS. Please retry'.tr, type: 'P', isFrom: 'Dash'));
      } else {
        Get.dialog(updateProfileBody(
            msg:
                'Your request/application is under process. We will get back to you within 24 hours'
                    .tr,
            type: 'P'));
      }
    } else if ((Box3.fetchUAEPassDoc?.visualizationExpiry == null) &&
        Box3.fetchUAEPassDoc?.reqAuthorized == 'N') {
      AccountController a = Get.find<AccountController>();
      if (a.contactUs == null) {
        a.getContactUs();
      }
      if (!Get.isRegistered<KycController>()) {
        Get.put(KycController());
      }

      Get.put(AccountController());

      if (Get.currentRoute != AppRoutes.visualizationRetryRoutes) {
        Get.to(const RetryVisualization(), arguments: {
          "msg":
              'There was an error while fetching your documents from UAE PASS. Please retry'
                  .tr,
          "type": 'P',
          "isFrom": 'Dash'
        });
      }
    } else {
      if (Get.isRegistered<TransferController>()) {
        Get.find<TransferController>().reset(t: TransferType.cash);
      } else {
        Get.put(TransferController(transferType: TransferType.cash),
            permanent: true);
      }
      Get.find<DataController>().getData(TransferController);
      Get.find<MainController>()
        ..pages.clear()
        ..appBars.clear()
        ..index = idx
        ..push(const DashBoardPage(), dashBoardAppbar())
        ..push(
            AppConfigs.sendMoney(
              key: UniqueKey(),
            ),
            AppBars.cashTransfer)
        ..update();
    }
  }

  Widget _buildFab() {
    return ScaleTransition(
      scale: _fabScale,
      child: Container(
        width: _fabSize,
        height: _fabSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              Color.lerp(_barColor, Colors.white, 0.4)!,
              Color.lerp(_barColor, Colors.white, 0.12)!,
            ],
            center: Alignment(-0.3, -0.3),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(80),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
          border: Border.all(color: Colors.white, width: 2),
        ),
        child: Icon(
          _navItems[widget.selectedIndex].icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final item = _navItems[index];
    final isSelected = widget.selectedIndex == index;

    return GestureDetector(
      onTap: () => onSelectedEvent(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20), // Push icons down to make room for bubble
          Icon(
            item.icon,
            color: isSelected
                ? Colors.transparent
                : _inactiveColor, // Hide if selected
            size: 25,
          ),
          const SizedBox(height: 4),
          Text(
            item.label,
            textAlign: TextAlign.center,
            style: TS.f14.copyWith(
              color: isSelected ? _activeColor : _inactiveColor,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Moving Notch Painter ────────────────────────────────────────────────────

class _NotchedBarPainter extends CustomPainter {
  final double bottomPadding;
  final double notchCenterX;
  final Color primaryColor;

  _NotchedBarPainter({
    required this.bottomPadding,
    required this.notchCenterX,
    required this.primaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Gradient setup
    final lightColor =
        Color.lerp(primaryColor, Colors.white, 0.2) ?? primaryColor;
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [lightColor, primaryColor],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // Notch dimensions
    const gap = 4.0;
    const notchRadius = (_fabSize / 2) + gap;
    const spread = 30.0;
    const depth = 48.0;
    const cornerR = 0.0;

    final path = Path();

    // 1. START: Top-left corner
    path.moveTo(0, cornerR);
    path.quadraticBezierTo(0, 0, cornerR, 0);

    // 2. LINE: To the start of the "dent"
    path.lineTo(notchCenterX - notchRadius - spread, 0);

    // 3. THE DIP (Creating the transparent hole)
    // We trace the inside of the dip so it's NOT filled
    path.cubicTo(
      notchCenterX - notchRadius, 0, // CP1: Control point for entry
      notchCenterX - notchRadius, depth, // CP2: Bottom of dip
      notchCenterX, depth, // Center point of dip
    );
    path.cubicTo(
      notchCenterX + notchRadius, depth, // CP3: Bottom of dip
      notchCenterX + notchRadius, 0, // CP4: Control point for exit
      notchCenterX + notchRadius + spread, 0,
    );

    // 4. TOP-RIGHT: Continue to the end of the bar
    path.lineTo(size.width - cornerR, 0);
    path.quadraticBezierTo(size.width, 0, size.width, cornerR);

    // 5. BOTTOM: Draw the rest of the bar shape
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // 6. CLOSE: Close back to the start
    path.close();

    // Draw shadow
    canvas.drawShadow(path, Colors.black.withOpacity(0.3), 10.0, true);

    // Fill the path
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _NotchedBarPainter old) =>
      old.notchCenterX != notchCenterX ||
      old.bottomPadding != bottomPadding ||
      old.primaryColor != primaryColor;
}
