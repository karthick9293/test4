import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/core/icons/svg_icons.dart';

import '../../../core/editing_controllers.dart/attributes.dart';
import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/exports/ui_two_pages.dart';
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
      // accountController.getToken();

      return Scaffold(
        // appBar: appBar1(
        //   accountController.selectedLanguage ?? '',
        //   title: cms(Fields.Login_ScreenHeading).textHeading,
        //   enableBack: true,
        // ),
        backgroundColor: accountController.isDark ? AppConfigs.b : AppConfigs.w,
        body: SafeArea(
          child: SingleChildScrollView(
            // physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                // SizedBox(
                //   height: Get.height - 60,
                //   child: Container(
                //     alignment: Alignment.bottomCenter,
                //     child: Opacity(
                //       opacity: accountController.isDark ? 0.3 : 0.2,
                //       child: cms(Fields.Login_FooterImage).image != null &&
                //               cms(Fields.Login_FooterImage).image!.isNotEmpty
                //           ? Base64Image(
                //               image: cms(Fields.Login_FooterImage).image!,
                //               width: Get.width,
                //               colorFilter: ColorFilter.mode(
                //                   AppConfigs.primaryColor, BlendMode.srcIn),
                //             )
                //           : SizedBox(),
                //     ),
                //   ),
                // ),
                SizedBox(
                  // height: Get.height - MediaQuery.of(context).padding.top - 58,
                  child: KeyboardActions(
                    disableScroll: true,
                    // isDialog: widget.isDialog,
                    config: accountController.keyboardConfig(context),
                    child: Column(
                      children: [
                        Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 300, height: 200, child: companyLogo),
                              SvgPicture.asset(SvgIcons.lock),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Welcome Back",
                                style: TS.f26B
                                    .copyWith(color: AppConfigs.primaryColor),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text("Enter a 6-digit MPIN to continue",
                                  style: TS.f16),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MpinPut(
                          controller: accountController.ltc.mpin,
                          focusNode: accountController.ltc.mpinNode,
                          errorText: accountController.ltc.mpinErrorText,
                          borderRadius: 50,
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
                              customerCode: (customerCode.isNotEmpty == true)
                                  ? customerCode
                                  : Box3.customerDetailsFZ!.data
                                          ?.customerCode ??
                                      '',
                              stepOrderId: stepOrderId,
                            );
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.fromLTRB(S.p, 20,
                              MediaQuery.sizeOf(context).width * 0.1, 0),
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
                              style: TS.f16
                                  .copyWith(color: AppConfigs.primaryColor),
                            ),
                          ),
                        ),
                        if (accountController.loginLoader)
                          loader(top: 35, bottom: 30),
                        SizedBox(
                          height: 100,
                        ),
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
                                          SvgIcons.fingerPrint,
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
                                              color: AppConfigs.primaryColor),
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
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
