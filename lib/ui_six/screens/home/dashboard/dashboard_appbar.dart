import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../core/controllers/beneficiary_conroller.dart';
import '../../../../core/controllers/data_controller.dart';
import '../../../../core/controllers/main_controller.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/exports/ui_six_pages.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../core/icons/svg_icons.dart';
import '../../../../flavors.dart';

/// Creates the custom AppBar for the UI Six Dashboard.
///
/// This AppBar includes:
/// * The company logo (Ahalia logo).
/// * A notification bell icon with a dynamic badge showing the notification count.
/// * A menu icon that opens the application drawer.
///
/// It uses [GetBuilder] to reactively update based on the [MainController] state,
/// such as theme changes (dark mode).
PreferredSizeWidget dashBoardAppbarUISix() {
  return PreferredSize(
    preferredSize:
        Size(Get.width, 68 + MediaQuery.of(Get.context!).viewPadding.top),
    child: GetBuilder<MainController>(builder: (mainController) {
      final statusBarHeight = MediaQuery.of(Get.context!).viewPadding.top;

      return Container(
        height: 68 + statusBarHeight,
        padding: EdgeInsets.only(top: statusBarHeight),
        decoration: BoxDecoration(
          color: mainController.isDark
              ? AppConfigs.g21
              : AppConfigs.w,
          border: Border(bottom: BorderSide(color: AppConfigs.primaryColor.withOpacity(0.3)))
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            children: [
              _ahaliaLogo(),
              const Spacer(),
              // Notification bell with badge '3'
              GestureDetector(
                onTap: () {
                  mainController.push(
                    const AppNotificationPage(),
                    AppBars.notification,
                  );
                },
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height:45,
                      width:45,
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: const Color(0xFFf5d5d6)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.04),
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: SvgPicture.asset(SvgIcons.notification6,
                        width: 20,colorFilter: ColorFilter.mode(mainController.isDark?Colors.white:AppConfigs.primaryColor, BlendMode.srcIn),),
                    ),
                    if (Get.find<DataController>().notificationCount > 0) Positioned(
                      right:-2,
                      top: -2,
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        decoration: BoxDecoration(
                          color: Color(0xFFD32F2F),
                          shape: BoxShape.circle,
                          border: Border.all(color: AppConfigs.w)
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 14,
                          minHeight: 14,
                        ),
                        child: Text(
                          '${Get.find<DataController>().notificationCount}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // Profile icon (opens MyProfilePage)
              GestureDetector(
                onTap: () => mainController.push(const AppDrawerPage(), AppBars.menu),
                child: Container(
                  height:45,
                  width:45,
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: const Color(0xFFf5d5d6)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.04),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(Icons.menu,color:mainController.isDark
                      ? Colors.white
                      : AppConfigs.primaryColor,),
                ),
              ),
            ],
          ),
        ),
      );
    }),
  );
}

/// Helper widget to display the company logo in the AppBar.
///
/// It fetches the logo from [Box3.companyLogo] and applies a fixed height.
Widget _ahaliaLogo() {
  final companyLogo = Base64Image(
    image: Box3.companyLogo,
    fit: BoxFit.contain,
  );
  return SizedBox(
      height: 38,
      child:companyLogo,
  );
}
