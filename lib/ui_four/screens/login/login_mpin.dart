import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/flavours/app_routes.dart';

import '../../../core/editing_controllers.dart/attributes.dart';
import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_four_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../network/api_service_new.dart';

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
    height: 150,
    width: 200,
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
      // accountController.getToken();

      return Scaffold(
        appBar: appBar1(
          accountController.selectedLanguage ?? '',
          title: cms(Fields.Login_ScreenHeading).textHeading,
          enableBack: true,
        ),
        backgroundColor: accountController.isDark ? AppConfigs.b : AppConfigs.w,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            // Top Header
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: 280,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppConfigs.primaryColor, AppConfigs.accentColor],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: SafeArea(
                  bottom: false,
                  child: Stack(
                    children: [
                      Positioned(
                        right: -30,
                        top: -20,
                        child: Icon(Icons.security,
                            size: 200,
                            color: AppConfigs.w.withValues(alpha: 0.1)),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Secure Login',
                              style: TS.f28B.copyWith(color: AppConfigs.w),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Enter your MPIN',
                              style: TS.f18.copyWith(
                                  color: AppConfigs.w.withValues(alpha: 0.8)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Sheet
            Positioned(
              top: 210,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: accountController.isDark ? AppConfigs.b : AppConfigs.w,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.1),
                      blurRadius: 20,
                      offset: const Offset(0, -5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                  // child: KeyboardActions(
                  //   disableScroll: true,
                  //   autoScroll: false,
                  //   config: accountController.keyboardConfig(context),
                  child: Stack(
                    children: [
                      Container(
                        height: Get.height * 0.7,
                        alignment: Alignment.bottomCenter,
                        child: Opacity(
                          opacity: accountController.isDark ? 0.3 : 0.2,
                          child: cms(Fields.Login_FooterImage).image != null &&
                                  cms(Fields.Login_FooterImage)
                                      .image!
                                      .isNotEmpty
                              ? Base64Image(
                                  image: cms(Fields.Login_FooterImage).image!,
                                  width: Get.width,
                                  colorFilter: ColorFilter.mode(
                                      AppConfigs.primaryColor, BlendMode.srcIn),
                                )
                              : SizedBox(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 30.0),
                        child: Column(
                          children: [
                            AnimatedSize(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              child:
                                  MediaQuery.of(context).viewInsets.bottom > 0
                                      ? const SizedBox(width: double.infinity)
                                      : companyLogo,
                            ),
                            const SizedBox(height: 20),
                            MpinPut(
                              controller: accountController.ltc.mpin,
                              focusNode: accountController.ltc.mpinNode,
                              errorText: accountController.ltc.mpinErrorText,
                              onChanged: (s) {
                                // authController
                                //   ..authAttributes.mPinTrailer = const SizedBox()
                                //   ..authAttributes.mpinErrorText = ''
                                //   ..update();
                                if (accountController
                                    .ltc.mpinErrorText.isNotEmpty) {
                                  accountController.ltc.mpinErrorText = '';
                                }
                                accountController.update();
                              },
                              onCompleted: (p0) async {
                                accountController
                                  ..loginLoader = true
                                  ..update();
                                await ApiService().activateToken(
                                    uniqueToken: accountController.token ?? '',
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
                            // textFormField(
                            //   top: 20,
                            //   labelText: 'MPIN',
                            //   controller: accountController.ltc.mpin,
                            //   focusNode: accountController.ltc.mpinNode,
                            //   onChanged: (v) {
                            //     if (accountController
                            //         .ltc.mpinErrorText.isNotEmpty) {
                            //       accountController.ltc.mpinErrorText = '';
                            //     }
                            //     accountController.update();
                            //   },
                            //   maxLength: 6,
                            //   obscure: accountController.ltc.obscure,
                            //   errorText: accountController.ltc.mpinErrorText,
                            //   inputFormatters: [
                            //     FilteringTextInputFormatter.digitsOnly
                            //   ],
                            //   keyboardType: TextInputType.number,
                            //   trailing: GestureDetector(
                            //     onTap: () async {
                            //       if (accountController.ltc.obscure) {
                            //         accountController
                            //           ..ltc.obscure = false
                            //           ..update();
                            //         await Future.delayed(
                            //             const Duration(seconds: 2));
                            //         accountController
                            //           ..ltc.obscure = true
                            //           ..update();
                            //       }
                            //     },
                            //     child: Icon(
                            //       accountController.ltc.obscure
                            //           ? Icons.visibility_off
                            //           : Icons.visibility,
                            //       size: 20,
                            //       color: AppConfigs.g77,
                            //     ),
                            //   ),
                            // ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.fromLTRB(5, 20, 5, 0),
                              child: GestureDetector(
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
                                  style: TS.f14
                                      .copyWith(color: AppConfigs.primaryColor),
                                ),
                              ),
                            ),
                            if (accountController.loginLoader)
                              loader(top: 35, bottom: 30),
                            const SizedBox(height: 20),
                            // : roundButton(
                            //     cms(Fields.Login_MPINOkButton)
                            //         .textHeading!,
                            //     top: 35, onTap: () async {
                            //     accountController
                            //       ..loginLoader = true
                            //       ..update();
                            //     ApiService().activateToken(
                            //         uniqueToken:
                            //             accountController.token ?? '');
                            //     accountController.login('MPIN',
                            //         authenticationMethod1: 'MOBILE',
                            //         customerCode:
                            //             (customerCode.isNotEmpty == true)
                            //                 ? customerCode
                            //                 : Box3.customerDetailsFZ!.data
                            //                         ?.customerCode ??
                            //                     '',
                            //         stepOrderId: stepOrderId);
                            //   }),
                            GetBuilder<AuthController>(
                                id: 'Login_Biometric',
                                builder: (controller) {
                                  return Visibility(
                                    visible: (Get.find<AuthController>()
                                                .isBiometricAvailable ==
                                            true) &&
                                        // (Box3.isBiometricEnabled ?? false) &&
                                        Box3.settings.enableBiometric,
                                    child: GestureDetector(
                                      onTap: Box3.isBiometricEnabled == true
                                          ? authenticateWithBioMetric
                                          : setBiometric,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SvgPicture.asset(
                                              Platform.isIOS
                                                  ? ImagePath.s11
                                                  : ImagePath.s4,
                                              height: 20,
                                              width: 20,
                                              colorFilter: ColorFilter.mode(
                                                AppConfigs.primaryColor,
                                                BlendMode.srcIn,
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              cms(Platform.isIOS
                                                      ? Box3.isBiometricEnabled ==
                                                              true
                                                          ? Fields
                                                              .Login_UseFaceID
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
                                                  color:
                                                      AppConfigs.primaryColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ],
                  ),
                  // ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
