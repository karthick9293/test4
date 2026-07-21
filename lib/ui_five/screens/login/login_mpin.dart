import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/editing_controllers.dart/attributes.dart';
import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_five_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';
import '../../../core/flavours/app_routes.dart';

class LoginMPIN extends StatefulWidget {
  const LoginMPIN({super.key});

  @override
  State<LoginMPIN> createState() => _LoginMPINState();
}

class _LoginMPINState extends State<LoginMPIN> {
  late String customerCode;
  late String stepOrderId;
  AccountController acController = Get.find<AccountController>();
  final companyLogo = Base64Image(
    image: Box3.companyLogo,
    fit: BoxFit.contain,
    height: 200,
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> arguments = Get.arguments ?? {};
    stepOrderId = arguments['stepOrderId'] ?? '';
    customerCode = arguments['customerCode'] ?? '';

    if (Box3.isBiometricEnabled == true) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        authenticateWithBioMetric();
      });
    }
    acController.getToken();
  }

  Future<void> setBiometric() async {
    AuthController authCntroller = Get.find<AuthController>();

    // Enable biometric authentication in settings
    if (await authCntroller.authenticateWithBioMetric()) {
      await Box3.setBiometric(true);
      Get.find<MainController>()
        ..isBiometric = Box3.isBiometricEnabled ?? false
        ..update();
      authCntroller.update(['Login_Biometric']);
    }
  }

  Future<void> authenticateWithBioMetric() async {
    AuthController authCntroller = Get.find<AuthController>();
    AccountController acController = Get.find<AccountController>();

    bool isBiometricEnabled = (authCntroller.isBiometricAvailable == true) &&
        (Box3.isBiometricEnabled ?? false) &&
        Box3.settings.enableBiometric;
    if (isBiometricEnabled == false) return;

    /* => if biometric authentication is enabled, proceed with authentication <= */
    if (await authCntroller.authenticateWithBioMetric()) {
      var validateBIOMETRICData = {
        "IdNo": Box3.customerDetailsFZ!.data?.idNo ?? '',
        "Mobile": Box3.customerDetailsFZ!.data?.mobileNo ?? '',
        "CustomerCode": (customerCode.isNotEmpty == true)
            ? customerCode
            : Box3.customerDetailsFZ!.data?.customerCode ?? '',
      };

      if (Get.isRegistered<SignUpController>()) {
        await Get.find<SignUpController>().validateNid(
          stepOrderId: '0',
          authData: validateBIOMETRICData,
        );
      } else {
        await Get.put(SignUpController()).validateNid(
          stepOrderId: '0',
          authData: validateBIOMETRICData,
        );
      }

      acController
        ..loginLoader = false
        ..update();
      authCntroller.ignoreLifecycle = false;

      acController
        ..loginLoader = false
        ..update();
      authCntroller.ignoreLifecycle = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccountController>(builder: (accountController) {
      String userName = Box3.customerDetailsFZ?.data?.firstName ?? '';

      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appBar1(
          accountController.selectedLanguage ?? '',
          title: cms(Fields.Login_ScreenHeading).textHeading,
          enableBack: true,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: accountController.isDark ? AppConfigs.b : AppConfigs.w,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Soft White Theme Background
            Container(
              decoration: BoxDecoration(
                color: accountController.isDark ? AppConfigs.b : AppConfigs.w,
              ),
            ),
            // Modern Geometric Accents
            Positioned(
              top: -100,
              left: -100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: accountController.isDark
                      ? AppConfigs.w.withOpacity(0.06)
                      : AppConfigs.primaryColor.withOpacity(0.06),
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: -60,
              child: Transform.rotate(
                angle: 0.5,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    color: accountController.isDark
                        ? AppConfigs.w.withOpacity(0.06)
                        : AppConfigs.primaryColor.withOpacity(0.04),
                  ),
                ),
              ),
            ),
            // Subtle Top Detail Line
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppConfigs.primaryColor.withOpacity(0.2),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            ),

            // Footer Image (Subtle)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Opacity(
                opacity: accountController.isDark ? 0.15 : 0.4,
                child: cms(Fields.Login_FooterImage).image != null &&
                        cms(Fields.Login_FooterImage).image!.isNotEmpty
                    ? Base64Image(
                        image: cms(Fields.Login_FooterImage).image!,
                        width: Get.width,
                      )
                    : const SizedBox(),
              ),
            ),

            // Main Content
            SafeArea(
              child: Builder(builder: (context) {
                final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

                return LayoutBuilder(
                  builder: (context, constraints) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.fromLTRB(24, 0, 24, keyboardHeight),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight:
                              constraints.maxHeight - keyboardHeight - 70,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // const SizedBox(height: 20),
                            // Logo Section with subtle animation/shadow
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppConfigs.primaryColor
                                        .withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: ClipOval(
                                child: Base64Image(
                                  image: Box3.companyLogo,
                                  fit: BoxFit.contain,
                                  height: 80,
                                  width: 80,
                                ),
                              ),
                            ),
                            const SizedBox(height: 32),

                            // Welcome Text
                            Text(
                              userName.isNotEmpty
                                  ? "Welcome back,"
                                  : "Welcome,",
                              style: TS.f18.copyWith(
                                color: accountController.isDark
                                    ? AppConfigs.gd1
                                    : AppConfigs.g70,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            if (userName.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  userName,
                                  style: TS.f24.copyWith(
                                    color: accountController.isDark
                                        ? AppConfigs.w
                                        : AppConfigs.b,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 48),

                            // MPIN Input Card (Refined Minimalist Style)
                            Container(
                              padding: const EdgeInsets.all(28),
                              decoration: BoxDecoration(
                                color: accountController.isDark
                                    ? AppConfigs.g21
                                    : AppConfigs.w,
                                borderRadius: BorderRadius.circular(28),
                                border: Border.all(
                                  color: accountController.isDark
                                      ? Colors.white.withOpacity(0.05)
                                      : Colors.black.withOpacity(0.03),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(
                                        accountController.isDark ? 0.2 : 0.05),
                                    blurRadius: 20,
                                    offset: const Offset(0, 10),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    "Enter your 6-digit MPIN",
                                    style: TS.f16.copyWith(
                                      color: accountController.isDark
                                          ? AppConfigs.gd1
                                          : AppConfigs.g70,
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                  MpinPut(
                                    controller: accountController.ltc.mpin,
                                    focusNode: accountController.ltc.mpinNode,
                                    errorText:
                                        accountController.ltc.mpinErrorText,
                                    borderRadius: 12,
                                    onChanged: (s) {
                                      if (accountController
                                          .ltc.mpinErrorText.isNotEmpty) {
                                        accountController.ltc.mpinErrorText =
                                            '';
                                      }
                                      accountController.update();
                                    },
                                    onCompleted: (p0) async {
                                      accountController
                                        ..loginLoader = true
                                        ..update();
                                      await ApiService().activateToken(
                                          uniqueToken:
                                              accountController.token ?? '',
                                          customerCode: customerCode);
                                      await accountController.login(
                                        'MPIN',
                                        authenticationMethod1: 'MPIN',
                                        customerCode:
                                            (customerCode.isNotEmpty == true)
                                                ? customerCode
                                                : Box3.customerDetailsFZ!.data
                                                        ?.customerCode ??
                                                    '',
                                        stepOrderId: stepOrderId,
                                      );
                                    },
                                  ),
                                  const SizedBox(height: 24),
                                  GestureDetector(
                                    onTap: () {
                                      accountController.fptc =
                                          ForgotPasswordTextControllers();
                                      accountController.ltc = LoginAttributes();
                                      accountController.pageRouting =
                                          FormType.forgotMpin;
                                      Get.toNamed(AppRoutes.forgotMPIN);
                                    },
                                    child: Text(
                                      cms(Fields.Login_ForgetMPIN).textHeading!,
                                      style: TS.f14.copyWith(
                                        color: accountController.isDark
                                            ? AppConfigs.w
                                            : AppConfigs.primaryColor,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            if (accountController.loginLoader)
                              Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: loader(),
                              ),

                            const SizedBox(height: 48),

                            // Biometric Section
                            GetBuilder<AuthController>(
                                id: 'Login_Biometric',
                                builder: (controller) {
                                  bool showBiometric =
                                      (Get.find<AuthController>()
                                                  .isBiometricAvailable ==
                                              true) &&
                                          Box3.settings.enableBiometric;

                                  if (!showBiometric) return const SizedBox();

                                  return GestureDetector(
                                    onTap: Box3.isBiometricEnabled == true
                                        ? authenticateWithBioMetric
                                        : setBiometric,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 16),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: AppConfigs.primaryColor
                                              .withOpacity(0.3),
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppConfigs.primaryColor
                                            .withOpacity(0.05),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SvgPicture.asset(
                                            Platform.isIOS
                                                ? ImagePath.s11
                                                : ImagePath.s4,
                                            height: 24,
                                            width: 24,
                                            colorFilter: ColorFilter.mode(
                                              AppConfigs.primaryColor,
                                              BlendMode.srcIn,
                                            ),
                                          ),
                                          const SizedBox(width: 12),
                                          Text(
                                            cms(Platform.isIOS
                                                    ? Box3.isBiometricEnabled ==
                                                            true
                                                        ? Fields.Login_UseFaceID
                                                        : Fields
                                                            .Login_EnableFaceID
                                                    : Box3.isBiometricEnabled ==
                                                            true
                                                        ? Fields
                                                            .Login_UseFingerprint
                                                        : Fields
                                                            .Login_EnableFingerprint)
                                                .textHeading!,
                                            style: TS.f16.copyWith(
                                              color: accountController.isDark
                                                  ? AppConfigs.w
                                                  : AppConfigs.primaryColor,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(height: 40),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      );
    });
  }
}
