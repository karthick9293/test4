import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../core/flavours/constants.dart';
import '../../core/controllers/account_controller.dart';
import '../screens/home/main_page.dart';

/// A custom Scaffold that automatically detects if it is rendered inside `MainPage`.
/// - If inside MainPage: It makes its own background transparent so the `MainPage`'s
///   svg header and background can show through.
/// - If rendered independently (e.g., pushed via Get.to): It provides its own
///   solid background and renders the SVG header behind the body.
class GlobalScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final bool extendBodyBehindAppBar;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const GlobalScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  });

  @override
  Widget build(BuildContext context) {
    // Check if this scaffold is a child of MainPage in the widget tree.
    // True if rendered inside m.pages list. False if pushed via Get.to().
    final bool isInsideMainPage =
        context.findAncestorWidgetOfExactType<MainPage>() != null;

    final bool isDark = Get.isRegistered<AccountController>()
        ? Get.find<AccountController>().isDark
        : false;

    final Color defaultBg = AppConfigs.bodybg(isDark);

    if (isInsideMainPage) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: floatingActionButtonLocation,
        body: body,
      );
    }

    // Rendered independently: Supply background and SVG header.
    return Material(
      color: backgroundColor ?? defaultBg,
      child: Stack(
        alignment: Alignment.topCenter,
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: 140,
            width: double.infinity,
            child: SvgPicture.asset(
              ImagePath.globalHeaderBg,
              fit: BoxFit.fitHeight,
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            bottomNavigationBar: bottomNavigationBar,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            body: body,
          ),
        ],
      ),
    );
  }
}
