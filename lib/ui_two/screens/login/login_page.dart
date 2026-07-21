import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../core/editing_controllers.dart/attributes.dart';
import '../../../core/exports/controllers.dart';
import '../../../core/exports/ui_two_custom_widgets.dart';
import '../../../core/flavours/constants.dart';
import '../../../core/exports/ui_two_pages.dart';
import '../../../network/api_service_new.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final companyLogo = Base64Image(
    image: Box3.companyLogo,
    fit: BoxFit.contain,
    padding: const EdgeInsets.all(8),
    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> arguments = Get.arguments ?? {};
    String stepOrderId = arguments['stepOrderId'] ?? '';
    String customerCode = arguments['customerCode'] ?? '';
    String authenticationMethod2 = Box3.settings.LOGINAUTHENTICATIONSECONDARY;
    return GetBuilder<AccountController>(builder: (accountController) {
      // accountController.getToken();
      return Scaffold(
          // appBar: appBar1(accountController.selectedLanguage ?? '', enableBack: true),
          backgroundColor:
              accountController.isDark ? AppConfigs.b : AppConfigs.w,
          body: SafeArea(
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  // Container(
                  //   height: Get.height - MediaQuery.of(context).padding.top - 58,
                  //   alignment: Alignment.bottomCenter,
                  //   child: Container(
                  //     alignment: Alignment.bottomCenter,
                  //     child: Opacity(
                  //       opacity: accountController.isDark ? 0.3 : 1,
                  //       child: cms(Fields.ValidateCustomer_FooterImage).image != "" && cms(Fields.ValidateCustomer_FooterImage).image != null
                  //           ? Base64Image(image: cms(Fields.ValidateCustomer_FooterImage).image!)
                  //           : SizedBox(),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height:
                        Get.height - MediaQuery.of(context).padding.top - 58,
                    child: Column(
                      children: [
                        companyLogo,
                        Visibility(
                            visible: Box3.settings.LOGINAUTHENTICATIONPRIMARY ==
                                'USERNAME',
                            child: textFormField(
                                labelText: 'Username',
                                controller: accountController.ltc.usernameCtrl,
                                // maxLength: 25,
                                inputFormatters: [
                                  regexFormatter(
                                      r'^[a-zA-Z0-9.accountController]+$')
                                ],
                                onChanged: (v) {
                                  if (accountController
                                      .ltc.userNameError.isNotEmpty) {
                                    accountController.ltc.userNameError = '';
                                  }
                                  accountController.update();
                                },
                                errorText:
                                    accountController.ltc.userNameError)),
                        Visibility(
                          visible: authenticationMethod2 == 'MPIN',
                          child: textFormField(
                            top: 20,
                            labelText: 'MPIN',
                            controller: accountController.ltc.mpin,
                            focusNode: accountController.ltc.pwdNode,
                            onChanged: (v) {
                              if (accountController
                                  .ltc.mpinErrorText.isNotEmpty) {
                                accountController.ltc.mpinErrorText = '';
                              }
                              accountController.update();
                            },
                            maxLength: authenticationMethod2 == 'MPIN'
                                ? 6
                                : pwdMaxLength,
                            // maxLength: 6,
                            obscure: accountController.ltc.obscure,
                            errorText: accountController.ltc.mpinErrorText,
                            inputFormatters: [
                              authenticationMethod2 == 'MPIN'
                                  ? FilteringTextInputFormatter.digitsOnly
                                  : FilteringTextInputFormatter.allow(
                                      RegExp(r"[A-Za-z0-9!@#$&*~]"))
                            ],
                            keyboardType: authenticationMethod2 == 'MPIN'
                                ? TextInputType.number
                                : TextInputType.emailAddress,
                            trailing: GestureDetector(
                              onTap: () async {
                                if (accountController.ltc.obscure) {
                                  accountController
                                    ..ltc.obscure = false
                                    ..update();
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  accountController
                                    ..ltc.obscure = true
                                    ..update();
                                }
                              },
                              child: Icon(
                                accountController.ltc.obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                                color: AppConfigs.g77,
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: authenticationMethod2 == 'PASSWORD' ||
                              authenticationMethod2 == 'PASSWORD_MPIN',
                          child: textFormField(
                            top: 20,
                            labelText: 'Password',
                            controller: accountController.ltc.pwd,
                            focusNode: accountController.ltc.pwdNode,
                            onChanged: (v) {
                              if (accountController
                                  .ltc.passwordErrorText.isNotEmpty) {
                                accountController.ltc.passwordErrorText = '';
                              }
                              accountController.update();
                            },
                            maxLength:
                                authenticationMethod2 == 'MPIN' ? 6 : null,
                            obscure: accountController.ltc.obscure,
                            errorText: accountController.ltc.passwordErrorText,
                            inputFormatters: [
                              authenticationMethod2 == 'MPIN'
                                  ? FilteringTextInputFormatter.digitsOnly
                                  : FilteringTextInputFormatter.allow(
                                      RegExp(r"[A-Za-z0-9!@#$&*~]"))
                            ],
                            keyboardType: authenticationMethod2 == 'MPIN'
                                ? TextInputType.number
                                : TextInputType.emailAddress,
                            trailing: GestureDetector(
                              onTap: () async {
                                if (accountController.ltc.obscure) {
                                  accountController
                                    ..ltc.obscure = false
                                    ..update();
                                  await Future.delayed(
                                      const Duration(seconds: 2));
                                  accountController
                                    ..ltc.obscure = true
                                    ..update();
                                }
                              },
                              child: Icon(
                                accountController.ltc.obscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                size: 20,
                                color: AppConfigs.g77,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(S.p, 7, S.p, 0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Visibility(
                                visible:
                                    authenticationMethod2 == 'PASSWORD_MPIN',
                                child: GestureDetector(
                                  onTap: () {
                                    accountController.fptc =
                                        ForgotPasswordTextControllers();
                                    accountController.ltc = LoginAttributes();
                                    Get.to(() => LoginMPIN(), arguments: {
                                      "stepOrderId": stepOrderId,
                                      "customerCode": customerCode,
                                      "idNumber":
                                          Box3.customerDetailsFZ?.data?.idNo
                                    });
                                  },
                                  child: Text(
                                    cms(Fields.Login_LoginWith).textHeading!,
                                    style: TS.f14.copyWith(
                                        color: accountController.isDark
                                            ? AppConfigs.g8f
                                            : AppConfigs.g4),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Visibility(
                                    visible: authenticationMethod2 == 'MPIN',
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.find<AccountController>().fptc =
                                            ForgotPasswordTextControllers();
                                        accountController.pageRouting =
                                            FormType.forgotMpin;
                                        accountController.ltc =
                                            LoginAttributes();
                                        Get.toNamed(AppRoutes.forgotMPIN);
                                      },
                                      child: Text(
                                        cms(Fields.Login_ForgetMPIN)
                                            .textHeading!,
                                        style: TS.f14.copyWith(
                                            color: accountController.isDark
                                                ? AppConfigs.g8f
                                                : AppConfigs.g4),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible:
                                        authenticationMethod2 == 'PASSWORD' ||
                                            authenticationMethod2 ==
                                                'PASSWORD_MPIN',
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.find<AccountController>().fptc =
                                            ForgotPasswordTextControllers();
                                        accountController.ltc =
                                            LoginAttributes();
                                        accountController.pageRouting =
                                            FormType.forgotPassword;
                                        Get.toNamed(AppRoutes.forgotPassword);
                                      },
                                      child: Text(
                                        cms(Fields.Login_ForgetPassword)
                                            .textHeading!,
                                        style: TS.f14.copyWith(
                                            color: accountController.isDark
                                                ? AppConfigs.g8f
                                                : AppConfigs.g4),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: Box3.settings
                                            .LOGINAUTHENTICATIONPRIMARY ==
                                        'USERNAME',
                                    child: GestureDetector(
                                      onTap: () {
                                        Get.find<AccountController>().fptc =
                                            ForgotPasswordTextControllers();
                                        accountController.pageRouting =
                                            FormType.changeUserName;
                                        Get.toNamed(AppRoutes.forgotUsername);
                                      },
                                      child: Text(
                                        cms(Fields.Login_ForgetUsername)
                                            .textHeading!,
                                        style: TS.f14.copyWith(
                                            color: accountController.isDark
                                                ? AppConfigs.g8f
                                                : AppConfigs.g4),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        accountController.loginLoader
                            ? loader(top: 35, bottom: 30)
                            : roundButton(
                                cms(Fields.Login_SignInButton).textHeading!,
                                top: 35, onTap: () async {
                                ApiService().activateToken(
                                    uniqueToken: accountController.token ?? '',
                                    customerCode: customerCode);

                                await accountController.login(
                                    authenticationMethod2,
                                    customerCode: (customerCode.isNotEmpty ==
                                            true)
                                        ? customerCode
                                        : Box3.customerDetailsFZ?.data
                                                ?.customerCode ??
                                            '');
                              }),
                        Visibility(
                            visible: (Box3.settings.processEkycAs)
                                .split(',')
                                .contains('UAEPASS'),
                            child: const Center(child: Text('OR'))),
                        Visibility(
                          visible: (Box3.settings.processEkycAs)
                              .split(',')
                              .contains('UAEPASS'),
                          child: accountController.button2Loading
                              ? loader(top: 35, bottom: 30)
                              : Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, right: 20),
                                  child: UAEButton(
                                      cms(Fields.Login_SignInWithUAEPASS)
                                          .textHeading!,
                                      top: 10, onTap: () {
                                    Get.lazyPut(() => SignUpController());
                                    Get.find<SignUpController>()
                                        .signWithUAEPass(
                                            type: UAESignInType.login,
                                            isFromSignup: false);
                                  }),
                                ),
                        ),
                        Visibility(
                          visible: (Get.isRegistered<AuthController>() &&
                                  Get.find<AuthController>()
                                          .isBiometricAvailable ==
                                      true) &&
                              (Box3.isBiometricEnabled ?? false) &&
                              Box3.settings.enableBiometric,
                          child: GestureDetector(
                            onTap: () async {
                              AuthController a = Get.find<AuthController>();
                              if (await a.authenticateWithBioMetric()) {
                                var validateBIOMETRICData = {
                                  "IdNo":
                                      Box3.customerDetailsFZ!.data?.idNo ?? '',
                                  "Mobile":
                                      Box3.customerDetailsFZ!.data?.mobileNo ??
                                          '',
                                  "CustomerCode":
                                      (customerCode.isNotEmpty == true)
                                          ? customerCode
                                          : Box3.customerDetailsFZ!.data
                                                  ?.customerCode ??
                                              '',
                                };

                                if (Get.isRegistered<SignUpController>()) {
                                  await Get.find<SignUpController>()
                                      .validateNid(
                                    stepOrderId: '0',
                                    authData: validateBIOMETRICData,
                                  );
                                } else {
                                  await Get.put(SignUpController()).validateNid(
                                    // stepOrderId: '1.3',
                                    stepOrderId: '0',
                                    authData: validateBIOMETRICData,
                                  );
                                }

                                accountController
                                  ..loginLoader = false
                                  ..update();
                                Get.find<AuthController>().ignoreLifecycle =
                                    false;
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: SvgPicture.asset(ImagePath.s4,
                                  colorFilter: ColorFilter.mode(
                                    accountController.isDark
                                        ? Colors.white
                                        : Colors.black87,
                                    BlendMode
                                        .srcIn, // Applies the color while keeping the shape
                                  ),
                                  height: 80,
                                  width: 80),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
