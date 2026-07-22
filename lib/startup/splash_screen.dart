import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mobiremit/flavors.dart';

import '../core/exports/controllers.dart';
import '../core/exports/ui_one_pages.dart';
import '../core/flavours/constants.dart';
import '../network/api_service_new.dart';
import 'flavor_selection_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class LottieConfig {
  final String asset;
  final double? height;
  final double? width;
  final bool repeat;

  LottieConfig({
    required this.asset,
    this.height,
    this.width,
    this.repeat = false,
  });
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _introController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  final Completer<void> _animationCompleter = Completer<void>();

  final lottieAnims = <Flavor, LottieConfig>{
    Flavor.cityexchangeuae: LottieConfig(
      asset: 'assets/animation/city-splash.json',
      repeat: false,
    ),
    Flavor.globalexchange: LottieConfig(
      asset: 'assets/animation/globalexch-splash.json',
      height: 250,
      width: 250,
      repeat: true,
    ),
  };

  @override
  void initState() {
    super.initState();

    _introController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _introController,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _introController,
        curve: const Interval(0.0, 1.0, curve: Curves.easeOutCubic),
      ),
    );

    if (!lottieAnims.containsKey(F.appFlavor)) {
      // Fallback for non-Lottie flavors
      Future.delayed(const Duration(milliseconds: 1500), () async {
        if (mounted) {
          await _introController.forward();
          if (!_animationCompleter.isCompleted) _animationCompleter.complete();
        }
      });
    }

    // Safety timeout in case Lottie fails to load or animation gets stuck
    Future.delayed(const Duration(seconds: 8), () {
      if (!_animationCompleter.isCompleted) _animationCompleter.complete();
    });

    // Delay initApp to let Lottie decode and start animating smoothly first
    Future.delayed(const Duration(milliseconds: 400), () {
      initApp();
    });
  }

  @override
  void dispose() {
    _introController.dispose();
    super.dispose();
  }

  Future<void> initApp() async {
    if (F.appFlavor == Flavor.casmex && AppConfigs.env == Environment.demo) {
      await Get.to(() => const FlavorSelectionScreen());
    }
    await Box3.init();
    await AppConfigs.initPackageInfo();

    // Box3.checkVPN();
    // Box3.disableScreenshot();
    // Box3.monitorInternetConnection();

    if (Box3.isVpn) return;
    final status = Box3.status;

    Get.put(AccountController(), permanent: true);
    Get.put(DataController(), permanent: true);
    Get.find<AccountController>()
      ..themeType = Box3.theme
      ..ltc.mobileNoCtrl.text = Box3.customerDetailsFZ?.data?.mobileNo ?? ''
      ..ltc.idNo.text = Box3.customerDetailsFZ?.data?.idNo ?? ''
      ..ltc.pwd.text = Box3.customerDetailsFZ?.data?.password ?? ''
      ..ltc.mpin.text = Box3.customerDetailsFZ?.data?.mPIN ?? ''
      ..update();

    final List<Future<dynamic>> initTasks = [];

    if (status == AppStatus.onBoarded) {
      Get.put(SignUpController());
      initTasks.add(Get.find<SignUpController>().getNIDForm());
    }

    Get.put(LanguageController(), permanent: true);
    initTasks.add(initLanguageController(Get.find<LanguageController>()));

    // if (Box3.data.read(Keys.cms) == null) {
    initTasks.add(Box3.loadCms());
    // }

    // Run independent API calls concurrently to speed up initialization
    await Future.wait(initTasks);

    // Wait for both splash animations to complete before redirecting
    if (!_animationCompleter.isCompleted) {
      await _animationCompleter.future;
    }

    if (!mounted) return;

    switch (status) {
      case AppStatus.firstLaunch:
        Get.find<InactivityController>().loginSession.value = false;
        Get.offAllNamed(AppRoutes.selectLanguage);
        break;

      case AppStatus.onBoarded:
        Get.find<InactivityController>().loginSession.value = false;
        Get.offAllNamed(
          Box3.settings.preLogin ? AppRoutes.preLogin : AppRoutes.nid,
        );
        break;

      case AppStatus.loggedIn:
        Get.put(AuthController(), permanent: true);
        Get.put(MainController(), permanent: true);
        Get.find<InactivityController>().loginSession.value = false;
        Get.offAllNamed(
          Box3.settings.preLogin ? AppRoutes.preLogin : AppRoutes.login,
        );
        break;
    }
  }

  Future<void> initLanguageController(LanguageController controller) async {
    final languageList = await ApiService().getCatalogue(
      typeData: {"Type": "LANGUAGE", "LanguageCode": "EN"},
      type: 'LANGUAGE',
    );

    controller.languageList.value = languageList;

    final selected = Box3.lang ??
        languageList.where((e) => e.Code.toLowerCase() == "en").toList().first;

    Get.updateLocale(Locale(selected.Code.toLowerCase(), selected.Code));
    controller.selectedLanguage.value = selected;
    controller.locale.value = selected.Code.toLowerCase();
    controller
      ..isLoading = true
      ..update();
    await Box3.setLang(controller.selectedLanguage.value);
    controller
      ..isLoading = false
      ..update();
  }

  @override
  Widget build(BuildContext context) {
    // bool isDark = Box3.theme == ThemeType.dark;
    final primaryColor = AppConfigs.primaryColor;

    if(F.appFlavor == Flavor.alzamanexchange){
      return Scaffold(
        backgroundColor: AppConfigs.bg,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
                    child: Column(
                      children: [
                        const Spacer(flex: 2),

                        // Brand mark
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Image.asset(
                            ImagePath.clientLogo,
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                        const SizedBox(height: 28),

                        // Feature chips
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          alignment: WrapAlignment.center,
                          children: [
                            AzChip(
                              label: 'Send',
                              icon: Icons.send_rounded,
                              bgColor: AppConfigs.accentLt,
                              fgColor: AppConfigs.accent,
                            ),
                            AzChip(
                              label: 'Receive',
                              icon: Icons.call_received_rounded,
                              bgColor: AppConfigs.tealLt,
                              fgColor: AppConfigs.teal,
                            ),
                            AzChip(
                              label: 'Relax',
                              icon: Icons.spa_rounded,
                              bgColor: AppConfigs.goldLt,
                              fgColor: AppConfigs.goldDk,
                            ),
                          ],
                        ),

                        const SizedBox(height: 28),

                        // Headline + subtitle
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: AzText.h1.copyWith(fontSize: 26),
                            children: const [
                              TextSpan(text: 'Alzaman'),
                              TextSpan(
                                text: ' Exchange',
                                style: TextStyle(color: AppConfigs.accent),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            'Fast & secure worldwide remittances. Send, receive '
                                'and relax with Qatar’s trusted exchange partner.',
                            textAlign: TextAlign.center,
                            style: AzText.body,
                          ),
                        ),

                        const SizedBox(height: 22),

                        // Dots indicator
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _Dot(active: true),
                            const SizedBox(width: 6),
                            _Dot(),
                            const SizedBox(width: 6),
                            _Dot(),
                          ],
                        ),

                        const Spacer(flex: 3),

                        // CTAs
                        FadeTransition(
                          opacity: _fadeAnimation,
                          child: SlideTransition(
                            position: _slideAnimation,
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 12),
                                  decoration: BoxDecoration(
                                    color: primaryColor.withOpacity(0.07),
                                    borderRadius: BorderRadius.circular(40),
                                    border: Border.all(
                                        color: primaryColor.withOpacity(0.2)),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      CupertinoActivityIndicator(
                                        radius: 8.0,
                                        animating: true,
                                        color: primaryColor,
                                      ),
                                      const SizedBox(width: 14),
                                      Text(
                                        "ESTABLISHING SECURE CONNECTION",
                                        style: TS.f12.copyWith(
                                          color:
                                          // isDark
                                          //     ? Colors.grey[300] :
                                          Colors.grey[800],
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 50),
                                const SizedBox(height: 10),
                                const Text(
                                  'Licensed by Qatar Central Bank',
                                  style: AzText.muted,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: AppConfigs.w,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  child: Center(
                    child: lottieAnims.containsKey(F.appFlavor)
                        ? SizedBox(
                            height: lottieAnims[F.appFlavor]!.height,
                            width: lottieAnims[F.appFlavor]!.width,
                            child: Lottie.asset(
                              lottieAnims[F.appFlavor]!.asset,
                              repeat: lottieAnims[F.appFlavor]!.repeat,
                              onLoaded: (composition) {
                                // Trigger bottom animation precisely after Lottie completes its single run
                                Future.delayed(composition.duration, () async {
                                  if (mounted) {
                                    await _introController.forward();
                                    if (!_animationCompleter.isCompleted) {
                                      _animationCompleter.complete();
                                    }
                                  }
                                });
                              },
                            ),
                          )
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Image.asset(
                              ImagePath.clientLogo,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                  ),
                ),
                // Bottom Branding & Status Sequence
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.07),
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(
                                color: primaryColor.withOpacity(0.2)),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CupertinoActivityIndicator(
                                radius: 8.0,
                                animating: true,
                                color: primaryColor,
                              ),
                              const SizedBox(width: 14),
                              Text(
                                "ESTABLISHING SECURE CONNECTION",
                                style: TS.f12.copyWith(
                                  color:
                                      // isDark
                                      //     ? Colors.grey[300] :
                                      Colors.grey[800],
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Text(
                          "POWERED BY",
                          style: TS.f10.copyWith(
                            color: Colors.grey,
                            letterSpacing: 5,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          APIConstants.clientName.toUpperCase(),
                          style: TS.f16.copyWith(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 3.0,
                            color:
                                // isDark ? Colors.white :
                                Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class _Dot extends StatelessWidget {
  final bool active;
  const _Dot({this.active = false});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: active ? 22 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? AppConfigs.accent : AppConfigs.border2,
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

/// Pill-shaped tag — small, accent-tinted background.
class AzChip extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Color? bgColor;
  final Color? fgColor;
  final EdgeInsetsGeometry? padding;

  const AzChip({
    super.key,
    required this.label,
    this.icon,
    this.bgColor,
    this.fgColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor ?? AppConfigs.surface3,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: AppConfigs.border, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: fgColor ?? AppConfigs.text),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: AzText.chipText.copyWith(color: fgColor ?? AppConfigs.text),
          ),
        ],
      ),
    );
  }
}

/// Primary action button — solid red rounded pill.
/// Use [AzCta.outlined] for the secondary variant.
class AzCta extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool loading;
  final bool outlined;
  final IconData? leadingIcon;
  final String? trailing;
  final Color? color;

  const AzCta({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.leadingIcon,
    this.trailing,
    this.color,
  }) : outlined = false;

  const AzCta.outlined({
    super.key,
    required this.label,
    this.onPressed,
    this.loading = false,
    this.leadingIcon,
    this.trailing,
    this.color,
  }) : outlined = true;

  @override
  Widget build(BuildContext context) {
    final fg = outlined ? (color ?? AppConfigs.accent) : Colors.white;
    final bg = outlined ? Colors.transparent : (color ?? AppConfigs.accent);

    return SizedBox(
      width: double.infinity,
      height: 52,
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(AppConfigs.r),
        elevation: outlined ? 0 : 6,
        shadowColor: AppConfigs.accent.withOpacity(0.28),
        child: InkWell(
          onTap: loading ? null : onPressed,
          borderRadius: BorderRadius.circular(AppConfigs.r),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppConfigs.r),
              border: outlined
                  ? Border.all(color: color ?? AppConfigs.accent, width: 1.5)
                  : null,
            ),
            alignment: Alignment.center,
            child: loading
                ? SizedBox(
              width: 22,
              height: 22,
              child: CircularProgressIndicator(
                strokeWidth: 2.4,
                valueColor: AlwaysStoppedAnimation<Color>(fg),
              ),
            )
                : Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (leadingIcon != null) ...[
                  Icon(leadingIcon, size: 18, color: fg),
                  const SizedBox(width: 8),
                ],
                Text(
                  label,
                  style: AzText.ctaText.copyWith(color: fg),
                ),
                if (trailing != null) ...[
                  const SizedBox(width: 6),
                  Text(trailing!,
                      style: AzText.ctaText.copyWith(color: fg)),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}