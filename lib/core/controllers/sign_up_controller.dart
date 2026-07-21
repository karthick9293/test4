import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_workers/utils/debouncer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobile_number/mobile_number.dart';
import 'package:mobiremit/core/uae_pass_login_handler.dart';
import 'package:mobiremit/network/api_endpoints.dart';
import 'package:mobiremit/ui_one/custom_widgets/identity_verification_mail_alert.dart';
import 'package:signature/signature.dart';
import 'package:video_player/video_player.dart';

import '../../flavors.dart';
// import '../../models/customer_details/customer_data_fz.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../../models/reg_device/register_device_fz.dart';
import '../../models/uae_pass/fetch_uae_pass_doc.dart';
import '../../models/uae_pass/uae_pass_profile_fz.dart';
import '../../network/api_service_new.dart';
import '../../ui_common/login_otp.dart';
import '../../ui_one/custom_widgets/cblimit_alert.dart';
import '../../ui_one/screens/sign_up/document_sharing_request.dart';
import '../../ui_one/screens/sign_up/nid_alerts.dart';
import '../../ui_one/screens/sign_up/uae_details_confirm.dart';
import '../editing_controllers.dart/attributes.dart';
import '../exports/controllers.dart';
import '../exports/ui_one_custom_widgets.dart';
import '../exports/ui_one_pages.dart';
import '../flavours/constants.dart';
import '../icons/svg_icons.dart';
import '../models/formatter.dart';

class SignUpController extends GetxController {
  SignUpAttributes signUpAttributes = SignUpAttributes();
  LoginAttributes ltc = LoginAttributes();
  ResetCredencialsAttributes rcAttributes = ResetCredencialsAttributes();
  bool buttonLoading = false;
  late ScrollController scrollController;

  List<String> days = Iterable<String>.generate(
      DateTime(2022, DateTime.now().month + 1, 0).day,
      (i) => (i + 1).toString()).toList();

  // List<SignUpFieldBV> fields = [];

  ProfileAttributes profileAttributes = ProfileAttributes();
  IdentityVerificationAttributes ivAttributes =
      IdentityVerificationAttributes();

  List<NotificationArray> otpNotificationArray = [];

  bool isDark = Get.find<AccountController>().isDark;
  bool loading = false,
      uaeLButtonLoading = false,
      pd = true,
      kyc = true,
      security = true,
      signing = false,
      loadingSource = false,
      uaePassLoading = false;

  bool signupLoading = false;

  Timer? ddSearchDebouncer;

  Set<String> loadingSources = {};
  RxMap<String, List<MasterResponseFZ>> list =
      <String, List<MasterResponseFZ>>{}.obs;
  RxMap<String, List<MasterResponseFZ>> filteredList =
      <String, List<MasterResponseFZ>>{}.obs;
  RxMap<String, List<MasterResponseFZ>> backupList =
      <String, List<MasterResponseFZ>>{}.obs;

  // RxList<MasterResponseFZ> list = <MasterResponseFZ>[].obs;

  /// uae pass
  final uaePassHandler = UAEPassLoginHandler();
  var uaePassHandlerData = <String, dynamic>{};
  UaePassProfileFz? uaePassProfileFz;
  String? uaePassAuthToken;

  ///

  TextEditingController newPwd = TextEditingController();

  List<MasterResponseFZ> countries = [],
      nationalities = [],
      ids = [],
      professions = [],
      emirates = [];

  XFile? cameraVideo, selfieImage;
  String nidErrorText = '', selfieError = '', videoError = '';
  String? type, selectedCountry;
  double forgotPwdStrength = 0;
  bool showNewPwd = true,
      showCnfPwd = true,
      showNewMpin = true,
      showCnfMpin = true;
  VideoPlayerController? videoPlayerController;

  Map<String, dynamic> customerAuthData = {};

  SignatureController signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: AppConfigs.primaryColor,
    exportBackgroundColor: Colors.blue,
  );

  final _debouncer = Debouncer(delay: Duration(milliseconds: 500));

  Future<void> checkUserNameAvailability(String username) async {
    _debouncer.call(() async {
      signUpAttributes.usernameLoading = true;
      update();
      signUpAttributes.usernameAvailable =
          await ApiService().checkUsername(username);
      signUpAttributes.usernameError =
          signUpAttributes.usernameAvailable ? '' : 'Unavailable';
      signUpAttributes.usernameLoading = false;
      update();
    });
  }

  Future<void> fillForm(UaePassProfileFz k) async {
    uaePassProfileFz = k;
    List<MasterResponseFZ> nationalities2 = await ApiService()
        .getCatalogue(typeData: {"Type": "NATIONALITY"}, type: 'NATIONALITY');
    signUpAttributes
      ..firstName.text = k.firstnameEN ?? ''
      ..lastName.text = k.lastnameEN ?? ''
      ..email.text = k.email ?? ''
      ..nationality = nationalities2
          .firstWhereOrNull((n) => n.id == nationalities2.firstOrNull?.id)
      ..gender = k.gender?.toLowerCase()
      ..uuid = k.uuid!;
  }

  void showIDExpiredAlert() {
    if (Box3.idExpiryMessage != null) {
      AccountController a = Get.find<AccountController>();
      if (a.contactUs == null) {
        a.getContactUs();
      }
      if (!Get.isRegistered<KycController>()) {
        Get.put(KycController());
      }
      Get.dialog(updateProfileBody(
          msg: Box3.idExpiryMessage!.MessageDescription, type: 'E'));
    }
  }

  void logoutAlert({
    required String title,
    required String description,
    required String yes,
    required String no,
  }) {
    Get.dialog(
        yesOrNoAlert(
            title: title.tr,
            body: description.tr,
            yesText: yes.tr,
            noText: no.tr,
            hideIcon: true,
            onTap: () async {
              Get.offAllNamed((Box3.settings.preLogin)
                  ? AppRoutes.preLogin
                  : AppRoutes.login);
            }),
        barrierColor: Get.find<AccountController>().isDark
            ? AppConfigs.w.withOpacity(0.2)
            : null);
  }

  Future<void> signWithUAEPass(
      {required UAESignInType type, required bool isFromSignup}) async {
    Get.find<AccountController>().retryLoading = false;
    update();
    if (!Get.isRegistered<TransferController>()) {
      Get.put(TransferController(transferType: TransferType.all));
    }
    if (Get.isDialogOpen == true) {
      Get.back();
    }
    setLoading(bool status) {
      if (kDebugMode) {
        print("Loading: $status");
      }
    }

    uaePassHandlerData =
        await uaePassHandler.signUpUAEPass(isDark, setLoading: setLoading);
    uaePassProfileFz = uaePassHandlerData["data"];
    uaePassAuthToken = uaePassHandlerData["uaePassAuthToken"] ?? '';

    if (uaePassProfileFz != null) {
      if (uaePassProfileFz?.userType == 'SOP1' ||
          uaePassProfileFz?.userType == 'SOP2') {
        if (type == UAESignInType.login ||
            type == UAESignInType.unverifiedSignup) {
          uaeLButtonLoading = false;
          if (isFromSignup == false) {
            Get.find<AccountController>().button2Loading = false;
          }
        } else {
          loading = false;
        }
        update();
        Get.back();
        await Get.dialog(kycPendingAlert(isDark,
            'You are not eligible to access this service. Your account is either not upgraded or you have a visitor account. Please contact Sharaf Exchange LLC to access the services.',
            title: 'Unverified account'.tr, image: SvgIcons.deviceVerify));
      } else {
        await Box3.saveKYCBVData(uaePassProfileFz);
        if (type == UAESignInType.login ||
            type == UAESignInType.unverifiedSignup) {
          uaeLButtonLoading = false;
          if (isFromSignup == false) {
            Get.find<AccountController>().button2Loading = false;
          }
        } else {
          loading = false;
        }
        update();
        switch (type) {
          case UAESignInType.login:
            if (type == UAESignInType.login ||
                type == UAESignInType.unverifiedSignup) {
              uaeLButtonLoading = true;
              if (isFromSignup == false) {
                Get.find<AccountController>().button2Loading = true;
              }
            } else {
              loading = true;
            }
            update();
            if (uaePassProfileFz != null &&
                uaePassProfileFz!.idn != null &&
                uaePassProfileFz!.uuid != null) {
              if (await isUAEPassData()) {
                singleUAEPASSData = uaePassData?[0];

                if (await ApiService().validateUUID(
                    uaePassProfileFz!.idn!, uaePassProfileFz!.uuid!)) {
                  fillForm(uaePassProfileFz!);

                  // String token = uaePassAuthToken!;
                  // String mobile = uaePassProfileFz?.mobile ?? '';
                  // String newMobile = mobile.substring(3);

                  validateNid(authData: {
                    "IdNo": uaePassProfileFz?.idn,
                    "Mobile": uaePassProfileFz?.mobile,
                  }, stepOrderId: '0');
                } else {
                  fillForm(uaePassProfileFz!);
                  // String mobile = uaePassProfileFz!.mobile!;
                  // String newMobile = mobile.substring(3);
                  // String token = uaePassAuthToken!;

                  validateNid(authData: {
                    "IdNo": uaePassProfileFz?.idn,
                    "Mobile": uaePassProfileFz?.mobile,
                  }, stepOrderId: '0');
                }
              } else {
                fillForm(uaePassProfileFz!);
                // String mobile = uaePassProfileFz!.mobile!;
                // String newMobile = mobile.substring(3);
                // String token = uaePassAuthToken!;

                validateNid(authData: {
                  "IdNo": uaePassProfileFz?.idn,
                  "Mobile": uaePassProfileFz?.mobile,
                }, stepOrderId: '0');
              }
            }
            if (type == UAESignInType.login ||
                type == UAESignInType.unverifiedSignup) {
              uaeLButtonLoading = false;
              if (isFromSignup == false) {
                Get.find<AccountController>().button2Loading = false;
              }
            } else {
              loading = false;
            }
            update();
            break;
          case UAESignInType.verifiedSignup:
            {
              if (uaePassAuthToken != null && uaePassProfileFz != null) {
                fillForm(uaePassProfileFz!);
                Get.to(
                  () => DocumentSharingPage(
                      uaePassProfileFz!, uaePassAuthToken!, isFromSignup),
                );
              }
            }
            break;
          case UAESignInType.unverifiedSignup:
            if (type == UAESignInType.login ||
                type == UAESignInType.unverifiedSignup) {
              uaeLButtonLoading = true;
            } else {
              loading = true;
            }
            update();
            if (uaePassProfileFz != null &&
                uaePassProfileFz!.idn != null &&
                uaePassProfileFz!.uuid != null) {
              if (await isUAEPassData()) {
                singleUAEPASSData = uaePassData?[0];

                if (await ApiService().validateUUID(
                    uaePassProfileFz!.idn!, uaePassProfileFz!.uuid!)) {
                  fillForm(uaePassProfileFz!);
                  // String mobile = uaePassProfileFz!.mobile!;
                  // String token = uaePassAuthToken!;
                  // String newMobile = mobile.substring(3);

                  validateNid(authData: {
                    "IdNo": uaePassProfileFz?.idn,
                    "Mobile": uaePassProfileFz?.mobile,
                  }, stepOrderId: '0');
                } else {
                  fillForm(uaePassProfileFz!);
                  // String mobile = uaePassProfileFz!.mobile!;
                  // String newMobile = mobile.substring(3);
                  // String token = uaePassAuthToken!;

                  validateNid(authData: {
                    "IdNo": uaePassProfileFz?.idn,
                    "Mobile": uaePassProfileFz?.mobile,
                  }, stepOrderId: '0');
                }
              } else {
                fillForm(uaePassProfileFz!);
                // String mobile = uaePassProfileFz!.mobile!;
                // String newMobile = mobile.substring(3);
                // String token = uaePassAuthToken!;

                validateNid(authData: {
                  "IdNo": uaePassProfileFz?.idn,
                  "Mobile": uaePassProfileFz?.mobile,
                }, stepOrderId: '0');
              }
            }
            if (type == UAESignInType.login ||
                type == UAESignInType.unverifiedSignup) {
              uaeLButtonLoading = false;
            } else {
              loading = false;
            }
            update();
        }
      }
    }
  }

  Map<String, String>? formData = {};
  List<String>? urls = [];
  List<FetchUAEPassDoc>? uaePassData;
  FetchUAEPassDoc? singleUAEPASSData;

  Future<bool> isUAEPassData() async {
    DateTime? dobs;
    DateTime? ieobs;
    String? pobs;
    String employerName;

    formData?.clear();
    urls?.clear();
    uaePassData?.clear();
    singleUAEPASSData = null;

    uaePassData = await ApiService().fetchUAEPassDocUUIDEID(
        eID: uaePassProfileFz?.idn ?? '', uuID: uaePassProfileFz?.uuid ?? '');

    if (kDebugMode) {
      print(uaePassData);
    }

    if (uaePassData?.isNotEmpty == true) {
      Box3.fetchUAEPassDoc = uaePassData?[0];
      FetchUAEPassDoc? myData = uaePassData?.firstOrNull;

      if (myData?.documentCode1 != null &&
          myData?.documentCode1?.isNotEmpty == true) {
        urls?.addAll((myData?.documentCode1 as String).split(','));
        urls?.add((myData?.documentCode1 as String));
      }

      if (myData?.documentCode2 != null &&
          myData?.documentCode2?.isNotEmpty == true) {
        urls?.addAll((myData?.documentCode2 as String).split(','));
        urls?.add((myData?.documentCode2 as String));
      }

      if (uaePassProfileFz?.firstnameEN != null) {
        formData?["First Name"] = uaePassProfileFz!.firstnameEN!;
      }
      if (uaePassProfileFz?.lastnameEN != null) {
        formData?["Last Name"] = uaePassProfileFz!.lastnameEN!;
      }
      if (uaePassProfileFz?.mobile != null) {
        formData?["Mobile"] = uaePassProfileFz!.mobile!.substring(
            uaePassProfileFz!.mobile?.substring(0, 3) == Box3.countryCode
                ? 3
                : 0);
      }
      if (uaePassProfileFz?.idn != null) {
        formData?["EID"] = uaePassProfileFz!.idn!;
      }
      if (uaePassProfileFz?.email != null) {
        formData?["Email"] = uaePassProfileFz!.email!;
      }
      if (uaePassProfileFz?.nationalityEN != null) {
        formData?["Nationality"] = uaePassProfileFz!.nationalityEN!;
      }

      if (myData?.employerName != null &&
          myData?.employerName?.isNotEmpty == true) {
        employerName = myData!.employerName!;
        signUpAttributes.employer.text = employerName;
        formData?["Employer Name"] = signUpAttributes.employer.text;
      }

      if (myData?.dateOfBirth != null) {
        dobs = myData!.dateOfBirth;

        signUpAttributes
          ..dobDateCtrls[0].text = dobs?.day != null
              ? (dobs!.day < 10 ? '0${dobs.day}' : dobs.day.toString())
              : ''
          ..dobDateCtrls[1].text = dobs?.month != null
              ? (dobs!.month < 10 ? '0${dobs.month}' : dobs.month.toString())
              : ''
          ..dobDateCtrls[2].text = dobs?.year.toString() ?? '';
        formData?["DOB"] =
            '${signUpAttributes.dobDateCtrls[0].text}/${signUpAttributes.dobDateCtrls[1].text}/${signUpAttributes.dobDateCtrls[2].text}';
      }
      if (myData?.placeOfBirth != null &&
          myData?.placeOfBirth?.isNotEmpty == true) {
        pobs = myData!.placeOfBirth;
        signUpAttributes.placeOfBirth.text = pobs ?? '';
        formData?["Place Of Birth"] = signUpAttributes.placeOfBirth.text;
      }
      if (myData?.expiryDate1 != null) {
        ieobs = myData!.expiryDate1;

        signUpAttributes
          ..idExpiryDateCtrls[0].text = ieobs?.day != null
              ? (ieobs!.day < 10 ? '0${ieobs.day}' : ieobs.day.toString())
              : ''
          ..idExpiryDateCtrls[1].text = ieobs?.month != null
              ? (ieobs!.day < 10 ? '0${ieobs.month}' : ieobs.month.toString())
              : ''
          ..idExpiryDateCtrls[2].text = ieobs?.year.toString() ?? '';

        formData?["ID Expiry Date"] =
            '${signUpAttributes.idExpiryDateCtrls[0].text}/${signUpAttributes.idExpiryDateCtrls[1].text}/${signUpAttributes.idExpiryDateCtrls[2].text}';
      }
      update();
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> isUAEPassDataNotification1(
      {required DateTime expiryTime}) async {
    DateTime? dobs;
    DateTime? ieobs;
    String? pobs;
    String employerName;

    formData?.clear();
    urls?.clear();
    uaePassData?.clear();
    singleUAEPASSData = null;

    notificationExpiryLoader = true;
    uaePassData = await ApiService().fetchUAEPassDocUUIDEID(
        eID: uaePassProfileFz?.idn ?? '', uuID: uaePassProfileFz?.uuid ?? '');

    if (kDebugMode) {
      print(uaePassData);
    }

    if (uaePassData?.isNotEmpty == true) {
      Box3.fetchUAEPassDoc = uaePassData?[0];
      FetchUAEPassDoc? myData = uaePassData?.firstOrNull;

      if (myData?.documentCode1 != null &&
          myData?.documentCode1?.isNotEmpty == true) {
        urls?.addAll((myData?.documentCode1 as String).split(','));
        urls?.add((myData?.documentCode1 as String));
      }

      if (myData?.documentCode2 != null &&
          myData?.documentCode2?.isNotEmpty == true) {
        urls?.addAll((myData?.documentCode2 as String).split(','));
        urls?.add((myData?.documentCode2 as String));
      }

      if (uaePassProfileFz?.firstnameEN != null) {
        formData?["First Name"] = uaePassProfileFz!.firstnameEN!;
      }
      if (uaePassProfileFz?.lastnameEN != null) {
        formData?["Last Name"] = uaePassProfileFz!.lastnameEN!;
      }
      if (uaePassProfileFz?.mobile != null) {
        formData?["Mobile"] = uaePassProfileFz!.mobile!.substring(
            uaePassProfileFz!.mobile?.substring(0, 3) == Box3.countryCode
                ? 3
                : 0);
      }
      if (uaePassProfileFz?.idn != null) {
        formData?["EID"] = uaePassProfileFz!.idn!;
      }
      if (uaePassProfileFz?.email != null) {
        formData?["Email"] = uaePassProfileFz!.email!;
      }
      if (uaePassProfileFz?.nationalityEN != null) {
        formData?["Nationality"] = uaePassProfileFz!.nationalityEN!;
      }

      if (myData?.employerName != null &&
          myData?.employerName?.isNotEmpty == true) {
        employerName = myData!.employerName!;
        signUpAttributes.employer.text = employerName;
        formData?["Employer Name"] = signUpAttributes.employer.text;
      }

      if (myData?.dateOfBirth != null) {
        dobs = myData!.dateOfBirth;

        signUpAttributes
          ..dobDateCtrls[0].text = dobs?.day != null
              ? (dobs!.day < 10 ? '0${dobs.day}' : dobs.day.toString())
              : ''
          ..dobDateCtrls[1].text = dobs?.month != null
              ? (dobs!.month < 10 ? '0${dobs.month}' : dobs.month.toString())
              : ''
          ..dobDateCtrls[2].text = dobs?.year.toString() ?? '';
        formData?["DOB"] =
            '${signUpAttributes.dobDateCtrls[0].text}/${signUpAttributes.dobDateCtrls[1].text}/${signUpAttributes.dobDateCtrls[2].text}';
      }
      if (myData?.placeOfBirth != null &&
          myData?.placeOfBirth?.isNotEmpty == true) {
        pobs = myData!.placeOfBirth;
        signUpAttributes.placeOfBirth.text = pobs ?? '';
        formData?["Place Of Birth"] = signUpAttributes.placeOfBirth.text;
      }
      if (myData?.expiryDate1 != null) {
        ieobs = myData!.expiryDate1;

        signUpAttributes
          ..idExpiryDateCtrls[0].text = ieobs?.day != null
              ? (ieobs!.day < 10 ? '0${ieobs.day}' : ieobs.day.toString())
              : ''
          ..idExpiryDateCtrls[1].text = ieobs?.month != null
              ? (ieobs!.day < 10 ? '0${ieobs.month}' : ieobs.month.toString())
              : ''
          ..idExpiryDateCtrls[2].text = ieobs?.year.toString() ?? '';

        formData?["ID Expiry Date"] =
            '${signUpAttributes.idExpiryDateCtrls[0].text}/${signUpAttributes.idExpiryDateCtrls[1].text}/${signUpAttributes.idExpiryDateCtrls[2].text}';
      }
      if ((singleUAEPASSData?.reqAuthorized == 'I' ||
          singleUAEPASSData?.reqAuthorized == 'Y')) {
        notificationExpiryLoader = false;
        update();

        Get.showSnackbar(GetSnackBar(
          messageText: Text(
            "Profile data received successfully from UAE PASS.",
            style: TS.f14.copyWith(color: AppConfigs.w),
          ),
          backgroundColor: (AppConfigs.dg).withOpacity(0.7),
          duration: const Duration(seconds: 2),
        ));
        Get.to(() => UAEConfirmDetails(
            formData, () => Get.toNamed(AppRoutes.signUp), urls));
      }
      notificationExpiryLoader = true;
      update();
      notificationExpiryLoader = true;
      var notificationTime = expiryTime;
      var currentTime = DateTime.now().toLocal();
      if (notificationTime.isBefore(currentTime)) {
        return myData?.dateOfBirth != null ? true : false;
      } else {
        return true;
      }
    } else {
      notificationExpiryLoader = true;
      var notificationTime = expiryTime;
      var currentTime = DateTime.now().toLocal();
      if (notificationTime.isBefore(currentTime)) {
        return false;
      } else {
        return true;
      }
    }
  }

  Future<bool> isUAEPassDataDetails({required String isFromSignUp}) async {
    DateTime? dobs;
    DateTime? ieobs;
    String? pobs;
    String? employerName;

    uaePassData = await ApiService().getUserDocumentDetails(
        token: uaePassAuthToken ?? '',
        emiratesID: uaePassProfileFz?.idn ?? '',
        documentType: uaePassProfileFz?.nationalityEN == 'ARE'
            ? 'Passport'
            : gccCountries.contains(uaePassProfileFz?.nationalityEN)
                ? ""
                : 'ResidenceVisa',
        uuid: uaePassProfileFz?.uuid ?? '');

    if (kDebugMode) {
      print(uaePassData);
    }

    if (uaePassData != null && uaePassData?.isNotEmpty == true) {
      Box3.fetchUAEPassDoc = uaePassData?[0];
    }

    if (uaePassData?.isNotEmpty == true) {
      FetchUAEPassDoc? myData = uaePassData?.firstOrNull;

      if (myData?.reqAuthorized == 'Y' ||
          myData?.reqAuthorized == 'I' ||
          myData?.reqAuthorized == 'P') {
        if (myData?.documentCode1 != null &&
            myData?.documentCode1?.isNotEmpty == true) {
          urls?.addAll((myData?.documentCode1 as String).split(','));
          urls?.add((myData?.documentCode1 as String));
        }

        if (myData?.documentCode2 != null &&
            myData?.documentCode2?.isNotEmpty == true) {
          urls?.addAll((myData?.documentCode2 as String).split(','));
          urls?.add((myData?.documentCode2 as String));
        }

        if (uaePassProfileFz?.firstnameEN != null) {
          formData?["First Name"] = uaePassProfileFz!.firstnameEN!;
        }
        if (uaePassProfileFz?.lastnameEN != null) {
          formData?["Last Name"] = uaePassProfileFz!.lastnameEN!;
        }
        if (uaePassProfileFz?.mobile != null) {
          formData?["Mobile"] = uaePassProfileFz!.mobile!.substring(
              uaePassProfileFz!.mobile?.substring(0, 3) == Box3.countryCode
                  ? 3
                  : 0);
        }
        if (uaePassProfileFz?.idn != null) {
          formData?["EID"] = uaePassProfileFz!.idn!;
        }
        if (uaePassProfileFz?.email != null) {
          formData?["Email"] = uaePassProfileFz!.email!;
        }
        if (uaePassProfileFz?.nationalityEN != null) {
          formData?["Nationality"] = uaePassProfileFz!.nationalityEN!;
        }

        if (myData?.employerName != null &&
            myData?.employerName?.isNotEmpty == true) {
          employerName = myData!.employerName!;
          signUpAttributes.employer.text = employerName;
          formData?["Employer Name"] = signUpAttributes.employer.text;
        }

        if (myData?.dateOfBirth != null) {
          dobs = myData!.dateOfBirth;

          signUpAttributes
            ..dobDateCtrls[0].text = dobs?.day != null
                ? (dobs!.day < 10 ? '0${dobs.day}' : dobs.day.toString())
                : ''
            ..dobDateCtrls[1].text = dobs?.month != null
                ? (dobs!.month < 10 ? '0${dobs.month}' : dobs.month.toString())
                : ''
            ..dobDateCtrls[2].text = dobs?.year.toString() ?? '';
          formData?["DOB"] =
              '${signUpAttributes.dobDateCtrls[0].text}/${signUpAttributes.dobDateCtrls[1].text}/${signUpAttributes.dobDateCtrls[2].text}';
        }
        if (myData?.placeOfBirth != null &&
            myData?.placeOfBirth?.isNotEmpty == true) {
          pobs = myData!.placeOfBirth;
          signUpAttributes.placeOfBirth.text = pobs ?? '';
          formData?["Place Of Birth"] = signUpAttributes.placeOfBirth.text;
        }
        if (myData?.expiryDate1 != null) {
          ieobs = myData!.expiryDate1;

          signUpAttributes
            ..idExpiryDateCtrls[0].text = ieobs?.day != null
                ? (ieobs!.day < 10 ? '0${ieobs.day}' : ieobs.day.toString())
                : ''
            ..idExpiryDateCtrls[1].text = ieobs?.month != null
                ? (ieobs!.day < 10 ? '0${ieobs.month}' : ieobs.month.toString())
                : ''
            ..idExpiryDateCtrls[2].text = ieobs?.year.toString() ?? '';

          formData?["ID Expiry Date"] =
              '${signUpAttributes.idExpiryDateCtrls[0].text}/${signUpAttributes.idExpiryDateCtrls[1].text}/${signUpAttributes.idExpiryDateCtrls[2].text}';
        }

        docShareRetry = false;
        update();
        return true;
      } else if (myData?.reqAuthorized == 'N') {
        bool? isUaePassInstall = await ApiService().checkUAEPASSInstalled();
        if (isUaePassInstall == false) {
          await apiAlertDialog(
              title: 'Error'.tr,
              message:
                  'You have rejected the data sharing request on UAE PASS. Please retry'
                      .tr,
              disableBack: true);
        }

        docShareRetry = false;
        uaePassLoading = false;
        update();
        return false;
      } else {
        uaePassLoading = false;
        docShareRetry = false;
        update();
        return false;
      }
    } else {
      uaePassLoading = false;
      docShareRetry = false;
      update();
      return false;
    }
  }

  void registerAlert(UAESignInType type,
      {String body = 'Please select your preferred registration method',
      String title = 'Register',
      Widget? uaeButton}) {
    Get.dialog(Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isDark ? AppConfigs.bf0 : AppConfigs.w,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 15),
              Text(title,
                  style: TS.f20
                      .copyWith(color: isDark ? AppConfigs.w : AppConfigs.g4)),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(body,
                    textAlign: TextAlign.center,
                    style: TS.f14.copyWith(
                        color: isDark ? AppConfigs.w : AppConfigs.g4)),
              ),
              uaeButton ??
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 10),
                    child: uaeLButtonLoading
                        ? loader(top: 15, bottom: 15)
                        : UAEButton(
                            'Sign up with UAE PASS',
                            onTap: () {
                              signWithUAEPass(type: type, isFromSignup: true);
                            },
                          ),
                  ),
              const SizedBox(height: 5),
              Text('Or', style: TS.f14),
              const SizedBox(height: 5),
              roundButton('Signup Through Branch', left: 30, right: 30,
                  onTap: () {
                Get.to(
                  () => Scaffold(
                      backgroundColor: isDark ? AppConfigs.b : null,
                      body: const BranchLocatorPage(isPrelogin: true)),
                );
              }, top: 5),
            ],
          ),
        ),
      ),
    ));
  }

  bool visibilityChecker(String id) =>
      {
        'Password': Box3.settings.LOGINAUTHENTICATIONSECONDARY == "PASSWORD" ||
            Box3.settings.LOGINAUTHENTICATIONSECONDARY == "PASSWORD_MPIN",
        'CONFIRMPASSWORD':
            Box3.settings.LOGINAUTHENTICATIONSECONDARY == "PASSWORD" ||
                Box3.settings.LOGINAUTHENTICATIONSECONDARY == "PASSWORD_MPIN",
      }[id] ??
      true;

  Future validateNid(
      {required Map<String, dynamic> authData,
      required String stepOrderId,
      Map<String, dynamic>? customerData,
      String? authToken,
      bool disableBack = false,
      String? signInMethod,
      UaePassProfileFz? resultFromUAESignIn}) async {
    loading = resultFromUAESignIn == null;
    Get.find<AccountController>()
      ..loginLoader = true
      ..update();
    update();

    if (customerData != null) {
      authData.addAll(customerData);
    }
    RegisterDeviceFZ? registerDeviceFZ = await ApiService().registerDeviceNew(
        signInMethod: signInMethod ?? Box3.settings.REQUIREDLOGINMETHODS,
        stepOrderId,
        authData: authData);

    if (kDebugMode) {
      print(registerDeviceFZ);
    }

    if (registerDeviceFZ != null) {
      customerAuthData = authData;
      String messageHeader =
          registerDeviceFZ.customMessageDetails?.messageHeader ?? "";
      String messageDescription =
          registerDeviceFZ.customMessageDetails?.messageDescription ?? "";

      // loading = false;
      // update();

      // var title = "Login";

      var statusCode = registerDeviceFZ.data?.messageCode;

      String? stepOrderId = registerDeviceFZ.data?.stepOrderId,
          // otpID = registerDeviceFZ.data?.otpId,
          customerCode = registerDeviceFZ.data?.customerCode;

      switch (statusCode) {
        case "SC-NEWCUST":
          await Get.find<DataController>().getSignUpParameters();
          loading = true;
          update();
          addCustomer(customerData: authData, authData: {}, stepOrderId: (stepOrderId==null || stepOrderId=="")?"0":stepOrderId);
          // if ((Box3.settings.processEkycAs) == 'UAEPASS') {
          //   Get.lazyPut(() => TransferController(transferType: TransferType.all));
          //   registerAlert(UAESignInType.verifiedSignup);
          // } else {
          //   Get.toNamed(
          //       {
          //             Flavor.aljadeed: AppRoutes.uploadDocuments,
          //             Flavor.casmex: AppRoutes.uploadDocuments,
          //             Flavor.kabayanremit: AppRoutes.uploadDocuments,
          //             Flavor.royalgrowth: AppRoutes.uploadDocuments,
          //             Flavor.sharafexchange: kDebugMode ? AppRoutes.signUp : AppRoutes.uploadDocuments,
          //             Flavor.unimonioman: AppRoutes.uploadDocuments,
          //             Flavor.aljazeeraexchangeqatar: AppRoutes.uploadDocuments,
          //             Flavor.dohaexchange: kDebugMode ? AppRoutes.signUp : AppRoutes.uploadDocuments,
          //             Flavor.kabayanremit: kDebugMode ? AppRoutes.signUp : AppRoutes.uploadDocuments,
          //           }[F.appFlavor] ??
          //           AppRoutes.uploadDocuments,
          //       arguments: {"idNumber": authData['IdNo'], "stepOrderId": stepOrderId});
          // }
          break;
        case "SC-EXISTINGCUST":
          LoginAttributes().clear();
          await saveCustomerInfo(
            appSession: registerDeviceFZ.data?.appUserToken ?? '',
            customerCode: registerDeviceFZ.data?.customerCode ?? '',
            idNo: authData["IdNo"] ?? '',
          );

          Get.toNamed(AppRoutes.identityVerification, parameters: {
            "stepOrderId": stepOrderId ?? '',
            "customerCode": customerCode ?? '',
            "idNumber": authData["IdNo"],
            "mobileNo": authData["Mobile"]
          });
          loading = false;
          update();
          break;

        case "SC-EXISTDEVICE":
          LoginAttributes().clear();
          loading = true;
          update();
          Get.put(AuthController(), permanent: true);

          var mobileData = authData["Mobile"];
          String? mobileNumber;
          if (mobileData != null) {
            mobileNumber = mobileData;
          }

          ltc.mobileNoCtrl.text = mobileNumber ?? '';
          update();

          await getCustomerInfo(
            appSession: registerDeviceFZ.data?.appUserToken ?? '',
            customerCode: registerDeviceFZ.data?.customerCode ?? '',
            idNo: authData["IdNo"] ?? '',
          );
          loading = false;
          update();
          if (disableBack) {
            Get.until(
                (Route<dynamic> route) => Get.currentRoute == AppRoutes.nid);
          }
          Get.toNamed(AppRoutes.login, arguments: {
            "stepOrderId": stepOrderId,
            "customerCode": customerCode
          });
          break;
        case "SC-IVDDTL":
          loading = false;
          update();
          if (Get.isDialogOpen!) {
            Get.back();
          }
          Get.dialog(kycPendingAlert(isDark, messageDescription,
              title: messageHeader,
              image: statusCode == '401'
                  ? SvgIcons.kycPending
                  : SvgIcons.deviceVerify));
          break;
        case "RMA-INVALIDDETAILS":
          loading = false;
          update();
          if (Get.isDialogOpen!) {
            Get.back();
          }
          Get.dialog(kycPendingAlert(isDark, messageDescription,
              title: messageHeader, image: SvgIcons.info));
          // update();
          break;
        case "SC-ENTEROTP":
          loading = false;
          update();
          startTimer1();
          isResend = false;
          update();
          signUpAttributes.mobOTP.clear();
          if (registerDeviceFZ.data?.notificationArray?.isNotEmpty == true) {
            otpNotificationArray =
                (registerDeviceFZ.data?.notificationArray ?? []).toList();
          }
          NotificationArray smsNotification = otpNotificationArray.firstWhere(
            (element) => element.messageType == 'SMS',
            orElse: () => NotificationArray(),
          );
          // NotificationArray emailNotification = otpNotificationArray.firstWhere(
          //     (element) => element.messageType == 'EMAIL',
          //     orElse: () => NotificationArray());
          if (Get.isDialogOpen == true || Get.isBottomSheetOpen == true) {
            Get.back();
          }
          final details = registerDeviceFZ.customMessageDetails;

          final customErrorMsg = details?.messageDescription.isNotEmpty == true
              ? details!.messageDescription
              : details?.messageHeader ?? '';

          errorText = registerDeviceFZ.statusCode == 'RMA-INVALIDDETAILS' &&
                  customErrorMsg.isNotEmpty
              ? customErrorMsg
              : '';

          validateOTPLogin(
              controller: signUpAttributes.mobOTP,
              errorText: errorText,
              validationValue: OtpType.CREATE_ADDNEWCUSTOMER_OTP,
              customText:
                  '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading} ${otpNotificationArray.isNotEmpty ? maskMobile(smsNotification.recipient ?? '') : ''}',
              onValidate: () async {
                if (signUpAttributes.mobOTP.text.isEmpty) {
                  errorText = 'otp_required'.tr;
                  update();
                  update(['OTP_POPUP']);
                } else if (signUpAttributes.mobOTP.text.length < 6) {
                  errorText = '${'Enter'.tr}${6} digit OTP';
                  update();
                  update(['OTP_POPUP']);
                } else {
                  loading = true;
                  update();
                  update(['OTP_POPUP']);
                  // Map<String, String> validateOTPData = {};

                  if (customerCode?.isNotEmpty == true) {
                    authData["CustomerCode"] = customerCode!;
                  }
                  if (registerDeviceFZ.data?.otpId != null &&
                      registerDeviceFZ.data?.otpId.isNotEmpty == true) {
                    authData["OTPID"] = registerDeviceFZ.data!.otpId;
                  }
                  if (authData['OTPID'] == null ||
                      authData['OTPID']?.isEmpty == true) {
                    if (smsNotification.otpId != null &&
                        smsNotification.otpId?.isNotEmpty == true) {
                      authData["OTPID"] = smsNotification.otpId!;
                    } else {
                      authData["OTPID"] = '';
                    }
                    // if (emailNotification.otpId != null &&
                    //     emailNotification.otpId?.isNotEmpty == true) {
                    //   authData["EMAILOTPID"] = emailNotification.otpId!;
                    //   otpNotificationArray =
                    //       (registerDeviceFZ.data!.notificationArray!).toList();
                    // } else {
                    //   authData["OTPID"] = "";
                    // }
                  }
                  if (signUpAttributes.mobOTP.text.isNotEmpty) {
                    authData["OTP"] = signUpAttributes.mobOTP.text;
                  }

                  // Map<String, dynamic> validateOtpRes = await ApiService()
                  //     .validateOtpRequest(
                  //         otpID: authData["OTPID"],
                  //         otp: signUpAttributes.mobOTP.text);
                  // CustomMessageDetailsFZ? customMessageDetails =
                  //     validateOtpRes['message'];
                  // bool isVerified = validateOtpRes['IsValid'];
                  // if (isVerified) {
                  await validateNid(
                      stepOrderId: stepOrderId ?? '1.1', authData: authData);
                  // } else {
                  //   errorText =
                  //       customMessageDetails?.MessageHeader ?? 'Invalid OTP';
                  //   loading = false;
                  //   update();
                  // }
                }
              },
              onResend: (p0) async {
                sending = true;
                update();
                update(['OTP_POPUP']);
                RegisterDeviceFZ? reg = await ApiService()
                    .resendOtpRequest(idNo: authData['IdNo'] ?? '');
                if (reg != null && reg.data != null) {
                  startTimer1();
                  isResend = false;
                  update();
                  update(['OTP_POPUP']);
                  otpNotificationArray =
                      (reg.data!.notificationArray ?? []).toList();
                  final sOTPID = otpNotificationArray
                          .firstWhereOrNull(
                              (element) => element.messageType == 'SMS')
                          ?.otpId ??
                      '';
                  final eOTPID = otpNotificationArray
                          .firstWhereOrNull(
                              (element) => element.messageType == 'EMAIL')
                          ?.otpId ??
                      '';
                  signUpAttributes.mobOTP.clear();
                  // if (registerDeviceFZ!.data != null) {
                  //   registerDeviceFZ = registerDeviceFZ!.copyWith(
                  //     data: registerDeviceFZ!.data!.copyWith(
                  //       notificationArray: reg.data!.notificationArray,
                  //     ),
                  //   );
                  // }
                  if (otpNotificationArray.isNotEmpty && sOTPID.isNotEmpty) {
                    authData['OTPID'] = sOTPID;
                  }
                  if (otpNotificationArray.isNotEmpty && eOTPID.isNotEmpty) {
                    authData['EMAILOTPID'] = eOTPID;
                  }
                }
                sending = false;
                update();
              },
              onChanged: (v) {
                errorText = '';
                update();
                update(['OTP_POPUP']);
              },
              currentUI: Box3.primaryUI);
          break;

        case "SC-ENTEREMAIL":
          loading = false;
          update();
          update(['OTP_POPUP']);
          if (Get.isDialogOpen == true || Get.isBottomSheetOpen == true) {
            Get.back();
          }
          ivAttributes.idMailController.clear();
          await identityVerificationMailAlert(
            'Register Email'.tr,
            customerCode: authData['CustomerCode'],
            mobileNo: authData["Mobile"],
            onSubmit: () async {
              ivAttributes.idMailError = '';
              ivAttributes.mailVerificationSubmit = true;
              update();
              authData['EMAIL'] = ivAttributes.idMailController.text;
              await validateNid(
                  stepOrderId: stepOrderId ?? '1.1', authData: authData);
              ivAttributes.mailVerificationSubmit = false;
              update();
            },
          );
          break;
        case "SC-ENTEROTPEMAIL":
          loading = false;
          update();
          update(['OTP_POPUP']);
          signUpAttributes.emailOTP.clear();
          if (Get.isDialogOpen == true || Get.isBottomSheetOpen == true) {
            Get.back();
          }
          if (customerCode?.isNotEmpty == true) {
            authData['CustomerCode'] = customerCode;
          }

          if (registerDeviceFZ.data?.notificationArray?.isNotEmpty == true) {
            otpNotificationArray =
                (registerDeviceFZ.data?.notificationArray ?? []).toList();
          }

          startTimer1();
          isResend = false;
          update();
          update(['OTP_POPUP']);
          final details = registerDeviceFZ.customMessageDetails;

          final customErrorMsg = details?.messageDescription.isNotEmpty == true
              ? details!.messageDescription
              : details?.messageHeader ?? '';

          errorText = registerDeviceFZ.statusCode == 'RMA-INVALIDDETAILS' &&
                  customErrorMsg.isNotEmpty
              ? customErrorMsg
              : '';
          validateOTPLogin(
            controller: signUpAttributes.emailOTP,
            errorText: errorText,
            validationValue: OtpType.CREATE_CUSTOMEREMAIL_OTP,
            customText:
                '${cms(Fields.ConfirmAuthentication_OTPSendOn_Email).textHeading} ${otpNotificationArray.firstWhereOrNull((element) => element.messageType == 'EMAIL')?.recipient ?? ''}',
            onValidate: () async {
              if (signUpAttributes.emailOTP.text.isEmpty) {
                errorText = 'otp_required'.tr;
                update();
                update(['OTP_POPUP']);
              } else if (signUpAttributes.emailOTP.text.length < 6) {
                errorText = '${'Enter'.tr}${6} digit OTP';
                update();
                update(['OTP_POPUP']);
              } else {
                loading = true;
                update();
                update(['OTP_POPUP']);
                // Map<String, String> validateOTPData = {};

                if (customerCode?.isNotEmpty == true) {
                  authData['CustomerCode'] = customerCode;
                }

                // String emailOTPID = registerDeviceFZ.data?.emailOtpId ?? '';
                String emailOTPID = otpNotificationArray
                        .firstWhereOrNull(
                            (element) => element.messageType == 'EMAIL')
                        ?.otpId ??
                    authData['EMAILOTPID'] ??
                    '';

                authData['OTPID'] = emailOTPID;

                if (signUpAttributes.emailOTP.text.isNotEmpty) {
                  authData['OTP'] = signUpAttributes.emailOTP.text;
                }

                // Map<String, dynamic> validateOtpRes = await ApiService()
                //     .validateOtpRequest(
                //         otpID: authData["OTPID"],
                //         otp: signUpAttributes.emailOTP.text);
                // CustomMessageDetailsFZ? customMessageDetails =
                //     validateOtpRes['message'];
                // bool isVerified = validateOtpRes['IsValid'];

                // if (isVerified) {
                await validateNid(
                    stepOrderId: stepOrderId ?? '1.1', authData: authData);
                // } else {
                //   errorText =
                //       customMessageDetails?.MessageHeader ?? 'Invalid OTP';
                //   loading = false;
                //   update();
                // }
              }
            },
            onResend: (p0) async {
              sending = true;
              update();
              update(['OTP_POPUP']);
              RegisterDeviceFZ? reg = await ApiService()
                  .resendOtpRequest(idNo: authData['IdNo'] ?? '');
              if (reg != null && reg.data != null) {
                startTimer1();
                isResend = false;
                update();
                otpNotificationArray =
                    (reg.data!.notificationArray ?? []).toList();
                final sOTPID = otpNotificationArray
                        .firstWhereOrNull(
                            (element) => element.messageType == 'SMS')
                        ?.otpId ??
                    '';
                final eOTPID = otpNotificationArray
                        .firstWhereOrNull(
                            (element) => element.messageType == 'EMAIL')
                        ?.otpId ??
                    '';
                signUpAttributes.emailOTP.clear();
                // if (registerDeviceFZ!.data != null) {
                //   registerDeviceFZ = registerDeviceFZ!.copyWith(
                //     data: registerDeviceFZ!.data!.copyWith(
                //       notificationArray: reg.data!.notificationArray,
                //     ),
                //   );
                // }
                if (otpNotificationArray.isNotEmpty && sOTPID.isNotEmpty) {
                  authData['OTPID'] = sOTPID;
                }
                if (otpNotificationArray.isNotEmpty && eOTPID.isNotEmpty) {
                  authData['EMAILOTPID'] = eOTPID;
                }
              }
              sending = false;
              update();
              update(['OTP_POPUP']);
            },
            onChanged: (v) {
              errorText = '';
              update();
              update(['OTP_POPUP']);
            },
            currentUI: Box3.primaryUI,
          );
          break;
        case "SC-SAVECRED":
          loading = true;
          update();
          await saveCustomerInfo(
            appSession: registerDeviceFZ.data?.appUserToken ?? '',
            customerCode: registerDeviceFZ.data?.customerCode ?? '',
            idNo: authData["IdNo"] ?? '',
          );
          Get.toNamed(AppRoutes.setCredentials, arguments: {
            "stepOrderId": stepOrderId,
            "setCredential": true,
            "customerCode": customerCode,
            "idNumber": Box3.customerDetailsFZ?.data?.idNo,
            "mobile": Box3.customerDetailsFZ?.data?.mobileNo,
          });
          loading = false;
          update();
          break;
        case "SC-LOGIN":
          loading = true;
          update();
          await saveCustomerInfo(
            appSession: registerDeviceFZ.data?.appUserToken ?? '',
            customerCode: registerDeviceFZ.data?.customerCode ?? '',
            idNo: authData["IdNo"] ?? '',
          );
          loading = false;
          Get.find<AccountController>()
            ..loginLoader = false
            ..update();
          if (Get.isDialogOpen!) {
            Get.back();
          }
          if (disableBack) {
            Get.until(
                (Route<dynamic> route) => Get.currentRoute == AppRoutes.nid);
          }
          Get.toNamed(AppRoutes.login, arguments: {
            "stepOrderId": stepOrderId,
            "customerCode": customerCode
          });

          if (messageDescription.isNotEmpty) {
            Get.dialog(kycPendingAlert(isDark, messageDescription,
                title: messageHeader, image: SvgIcons.info));
          }

          break;
        case "SC-LOGINSUCCESS":
          loading = true;
          update();
          LoginAttributes().clear();
          await getCustomerInfo(
            appSession: registerDeviceFZ.data?.appUserToken ?? '',
            customerCode: registerDeviceFZ.data?.customerCode ?? '',
            idNo: authData["IdNo"] ?? '',
          );
          loading = false;
          Get.find<AccountController>()
            ..loginLoader = false
            ..update();
          update();

          /* ::::::::: show ID Expiry alert ::::::::: */
          Box3.idExpiryMessage = await ApiService().getIDExpiry();
          if (Box3.idExpiryMessage != null) {
            if (Box3.idExpired) {
              // expired
              showIDExpiredAlert();
            } else {
              // close to expiry
              errorAlert(
                  title: Box3.idExpiryMessage!.MessageHeader,
                  content: Box3.idExpiryMessage!.MessageDescription);
            }
          }

          /* ::::::::: show Remittance Limit alert ::::::::: */
          late AccountController ac;
          if (Get.isRegistered<AccountController>()) {
            ac = Get.find<AccountController>();
          } else {
            ac = Get.put(AccountController());
          }

          ac.cbLimit = await ApiService().getCBLimit();
          if (ac.cbLimit != null) {
            if (Box3.settings.remittanceLimitPopup) {
              cbLimitAlert(cbLimit: ac.cbLimit!, header: 'Remittance Alert'.tr);
            }
          }
          break;
        case "SC-AUTHORIZE":
          loading = false;
          update();
          Get.offAllNamed(
              (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);
          errorAlert(title: messageHeader, content: messageDescription);
          Get.find<AccountController>()
            ..loginLoader = false
            ..update();
          break;
        case "RMA-MISSINGDETAIL":
          loading = false;
          update();
          await errorAlert(title: messageHeader, content: messageDescription);
          Get.find<AccountController>()
            ..loginLoader = false
            ..update();
          break;
        case "000":
          loading = true;
          update();
          LoginAttributes().clear();
          await getCustomerInfo(
            appSession: registerDeviceFZ.data?.appUserToken ?? '',
            customerCode: registerDeviceFZ.data?.customerCode ?? '',
            idNo: authData["IdNo"] ?? '',
          );
          loading = false;
          Get.find<AccountController>()
            ..loginLoader = false
            ..update();
          update();
          break;
        case "401":
          loading = false;
          update();
          Box3.saveConfig(loadSetting: false);
          Get.offAllNamed(
              (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.login);
          errorAlert(title: messageHeader, content: messageDescription);
          Get.find<AccountController>()
            ..loginLoader = false
            ..update();
          break;
        case "603":
          // case for user blocked after multiple invalid attempts
          loading = false;
          update();
          await errorAlert(
            title: messageHeader,
            content: messageDescription,
            function: () => Get.offAllNamed(
                (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.nid),
          );

          break;
        default:
          loading = false;
          update();
          errorAlert(
              title: messageHeader,
              content: messageDescription.isNotEmpty
                  ? messageDescription
                  : "Getting Unexpected Error. Please Retry.${(AppConfigs.env != Environment.prod || kDebugMode) ? "\nAPI: postvalidatelogin" : ""}");
          break;
      }
      Get.find<AccountController>()
        ..loginLoader = false
        ..update();
    } else {
      Get.find<AccountController>()
        ..loginLoader = false
        ..update();
      loading = false;
      update();
    }
  }

  String? newCustOtpID = "";

  Future addCustomer(
      {required Map<String, dynamic> customerData,
      required Map<String, dynamic> authData,
      required String stepOrderId}) async {
    loading = true;
    update();
    var data = {
      "Token": Box3.appKeyToken,
      "EnvironmentCode": "1",
      "LanguageCode": "EN",
      "SignUpMethod": "DEFAULT",
      "StepOrderId": stepOrderId,
      "CustomerDetails": customerData,
      "Authentication": authData
    };
    debugPrint("ADD CUSTOMER DATA :: ${data['Authentication']}");
    RegisterDeviceFZ? addCustomerFZ =
        await ApiService().signupNewCustomer2(data);
    loading = false;
    update();
    if (addCustomerFZ != null) {
      String messageHeader =
          addCustomerFZ.customMessageDetails?.messageHeader ?? "";
      String messageDescription =
          addCustomerFZ.customMessageDetails?.messageDescription ?? "";

      var statusCode = addCustomerFZ.data?.messageCode;

      String? stepOrderId = addCustomerFZ.data?.stepOrderId,
          customerCode = addCustomerFZ.data?.customerCode;
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      switch (statusCode) {
        case "SC-UPLOAD":
          // step 3 :: upload documents
          loading = true;
          update();
          await saveCustomerInfo(
            appSession: addCustomerFZ.data?.appUserToken ?? '',
            customerCode: addCustomerFZ.data?.customerCode ?? '',
            idNo: customerData['IdNo'] ?? '',
          );
          loading = true;
          update();
          bool us = await Get.find<KycController>()
              .uploadDocumentWithCustomerCode(
                  customerCode:
                      addCustomerFZ.data?.customerCode ?? customerCode,
                  idNumber: Box3.customerDetailsFZ?.data?.idNo ?? '');

          if (us) {
            await addCustomer(
              customerData: customerData,
              authData: authData,
              stepOrderId: stepOrderId ?? '0',
            );
          }
          loading = false;
          update();
          break;
        case "SC-VALIDATEOTP":
          // step 2 validate OTP
          loading = false;
          update();
          startTimer1();
          isResend = false;
          update();

          signUpAttributes.mobOTP.clear();
          if (addCustomerFZ.data?.notificationArray?.isNotEmpty == true) {
            newCustOtpID = addCustomerFZ.data!.notificationArray!
                .firstWhere((element) => element.messageType == 'SMS')
                .otpId;
          }
          if (Get.isDialogOpen == true || Get.isBottomSheetOpen == true) {
            Get.back();
          }
          final details = addCustomerFZ.customMessageDetails;

          final customErrorMsg = details?.messageDescription.isNotEmpty == true
              ? details!.messageDescription
              : details?.messageHeader ?? '';

          errorText = addCustomerFZ.statusCode == 'RMA-INVALIDDETAILS' &&
                  customErrorMsg.isNotEmpty
              ? customErrorMsg
              : '';

          await validateOTPLogin(
              data: data['CustomerDetails'],
              controller: signUpAttributes.mobOTP,
              errorText: errorText,
              validationValue: OtpType.CREATE_ADDNEWCUSTOMER_OTP,
              customText:
                  '${cms(Fields.ConfirmAuthentication_OTPSendOn).textHeading} ${maskMobile(customerData['Mobile'] ?? authData['Mobile'] ?? '')}',
              onValidate: () async {
                if (signUpAttributes.mobOTP.text.isEmpty) {
                  errorText = 'otp_required'.tr;
                  update();
                } else if (signUpAttributes.mobOTP.text.length < 6) {
                  errorText = '${'Enter'.tr}${6} digit OTP';
                  update();
                } else {
                  loading = true;
                  update();
                  Map<String, dynamic> auth = {};
                  auth['Otp'] = signUpAttributes.mobOTP.text;
                  auth['OtpId'] = newCustOtpID ?? '';
                  await addCustomer(
                    customerData: customerData,
                    authData: auth,
                    stepOrderId: stepOrderId ?? '1.1',
                  );
                }
              },
              onResend: (val) async {
                // otpID = val ?? "";
                sending = true;
                update();
                RegisterDeviceFZ? reg = await ApiService().resendOtpRequest(
                  idNo: customerData['IdNo'] ?? '',
                  mobile: customerData['Mobile'] ?? '',
                  userIdentification: UserIdentification.addCustomer,
                );
                if (reg != null && reg.data != null) {
                  startTimer1();
                  isResend = false;
                  update();
                  final otpArray = reg.data!.notificationArray ?? [];
                  newCustOtpID = otpArray
                          .firstWhereOrNull(
                              (element) => element.messageType == 'SMS')
                          ?.otpId ??
                      '';
                  signUpAttributes.mobOTP.clear();
                }
                sending = false;
                update();
              },
              onChanged: (v) {
                errorText = '';
                update();
              },
              currentUI: Box3.primaryUI);

          break;

        case "SC-ADDCUSTFORM":
          // step 3 :: fill customer details
          signUpAttributes.mobOTP.clear();
          await Get.find<DataController>().getSignUpParameters();
          loading = false;
          update();
          if ((Box3.settings.processEkycAs) == 'UAEPASS') {
            Get.lazyPut(
                () => TransferController(transferType: TransferType.all));
            registerAlert(UAESignInType.verifiedSignup);
          } else {
            Get.toNamed(
                {
                      Flavor.casmex: AppRoutes.uploadDocuments,
                      Flavor.lmpay: AppRoutes.uploadDocuments,
                      Flavor.cityexchangeuae: AppRoutes.uploadDocuments,
                      Flavor.lakhoos: AppRoutes.uploadDocuments,
                    }[F.appFlavor] ??
                    AppRoutes.uploadDocuments,
                arguments: {
                  "idNumber": customerData['IdNo'],
                  "mobile": customerData['Mobile'],
                  "stepOrderId": stepOrderId
                });
          }
          break;

        case "SC-SETCREDENTIAL":
          loading = true;
          update();
          // step 4 :: goto set credential page
          Get.toNamed(AppRoutes.setCredentials, arguments: {
            "idNumber": "",
            "setCredential": false,
            "stepOrderId": stepOrderId,
            "customerData": form.buildJsonNew(formBV!.formFieldItem)
          });
          if (credFormBV != null) {
            credForm.formClear(credFormBV!.formFieldItem);
          }
          loading = false;
          update();
          break;
        case "SC-COMPLETED":
          // step 5 :: Add customer completed goto login page
          // await getCustomerInfo(
          //     appSession: addCustomerFZ.data?.appUserToken ?? '',
          //     customerCode: addCustomerFZ.data?.customerCode ?? '');
          await saveCustomerInfo(
            appSession: addCustomerFZ.data?.appUserToken ?? '',
            customerCode: addCustomerFZ.data?.customerCode ?? '',
            idNo: customerData['IdNo'] ?? '',
          );

          if (!Box3.settings.checkCustomerAuth) {
            appStatus = AppStatus.loggedIn;
            Get.find<AccountController>().appStatus = AppStatus.loggedIn;
            await Box3.setStatus(AppStatus.loggedIn);
          }

          if (formBV != null) {
            form.formClear(formBV!.formFieldItem);
          }
          if (credFormBV != null) {
            credForm.formClear(credFormBV!.formFieldItem);
          }
          loading = false;
          update();
          Get.until((Route<dynamic> route) => (Box3.settings.preLogin)
              ? Get.currentRoute == AppRoutes.preLogin
              : Get.currentRoute == AppRoutes.nid);
          Get.toNamed(Box3.settings.checkCustomerAuth
              ? AppRoutes.nid
              : AppRoutes.login);
          errorAlert(title: messageHeader, content: messageDescription);
          break;
        case "SC-AUTHORIZE":
          if (formBV != null) {
            form.formClear(formBV!.formFieldItem);
          }
          if (credFormBV != null) {
            credForm.formClear(credFormBV!.formFieldItem);
          }
          loading = false;
          update();
          Get.until((Route<dynamic> route) => (Box3.settings.preLogin)
              ? Get.currentRoute == AppRoutes.preLogin
              : Get.currentRoute == AppRoutes.login);
          Get.toNamed(Box3.settings.checkCustomerAuth
              ? AppRoutes.nid
              : AppRoutes.login);
          errorAlert(title: messageHeader, content: messageDescription);
          break;
        case "000":
          // await getCustomerInfo(
          //     appSession: addCustomerFZ.data?.appUserToken ?? '',
          //     customerCode: addCustomerFZ.data?.customerCode ?? '');
          if (formBV != null) {
            form.formClear(formBV!.formFieldItem);
          }
          if (credFormBV != null) {
            credForm.formClear(credFormBV!.formFieldItem);
          }
          loading = false;
          update();
          Get.until((Route<dynamic> route) => (Box3.settings.preLogin)
              ? Get.currentRoute == AppRoutes.preLogin
              : Get.currentRoute == AppRoutes.login);
          Get.toNamed(AppRoutes.login);
          errorAlert(title: messageHeader, content: messageDescription);
          break;
        case "623":
          loading = false;
          update();
          errorAlert(title: messageHeader, content: messageDescription);
          break;
        case "603":
          // case for user blocked after multiple invalid attempts
          loading = false;
          update();
          await errorAlert(
            title: messageHeader,
            content: messageDescription,
            function: () => Get.offAllNamed(
                (Box3.settings.preLogin) ? AppRoutes.preLogin : AppRoutes.nid),
          );

          break;
        case "601":
          loading = false;
          update();
          errorAlert(title: messageHeader, content: messageDescription);
          break;
        case "600":
          loading = false;
          update();
          errorAlert(title: messageHeader, content: messageDescription);
          break;
        case "401":
          Box3.saveConfig();
          errorAlert(
              title: "Session Expired",
              content: addCustomerFZ.data?.messageDetails ??
                  "Authentication credentials were not provided or are invalid.");
          break;
        case "RMA-MISSINGDETAIL":
          loading = false;
          update();
          await errorAlert(title: messageHeader, content: messageDescription);
          Get.find<AccountController>()
            ..loginLoader = false
            ..update();
          break;
        default:
          loading = false;
          update();
          errorAlert(
              title: messageHeader,
              content: messageDescription.isNotEmpty
                  ? messageDescription
                  : "Getting Unexpected Error. Please Retry.${(AppConfigs.env != Environment.prod || kDebugMode) ? "\nAPI: postdigitaladdcustomer" : ""}");
          break;
      }
    }
  }

  AppStatus appStatus = Box3.status;

  Future<void> getCustomerInfo(
      {required String appSession,
      required String customerCode,
      required String idNo}) async {
    loading = true;
    update();
    var cData = await ApiService().customerDetails(
        customerCode: customerCode, idNo: idNo, appSession: appSession);

    if (cData != null) {
      // var customerDetails = CustomerDataFZ.fromJson(cData);
      if (!Get.isRegistered<AuthController>()) {
        Get.put(() => AuthController(), permanent: true);
      }

      if (Get.isRegistered<AccountController>()) {
        Get.find<AccountController>().customerEKYC = null;
      }

      await Box3.saveUserInfo(cData);

      appStatus = AppStatus.loggedIn;
      Get.find<AccountController>().appStatus = appStatus;
      Get.find<AccountController>().update();
      await Box3.setStatus(AppStatus.loggedIn);

      Get.find<InactivityController>().loginSession.value = true;
      Get.find<InactivityController>().timeoutDuration.value = Duration(
          minutes: int.tryParse(Box3.settings.mobileSessionTimeout) ?? 5);
      update();

      if (!Get.isRegistered<MainController>()) {
        Get.put(() => MainController(), permanent: true);
      }
      Get.find<DataController>().beforeLogin = false;
      Get.lazyPut(() => AuthController());

      ltc.pwd.clear();
      ltc.mpin.clear();
      ltc.usernameCtrl.clear();
      loading = false;
      update();
      //sync Beneficiary
      syncBeneficiaries(customerCode);
      Get.offAllNamed(AppRoutes.main);
    } else {
      loading = false;
      update();
    }
  }

  Future<void> saveCustomerInfo(
      {required String appSession,
      required String customerCode,
      required String idNo}) async {
    loading = true;
    update();
    var cData = await ApiService().customerDetails(
        customerCode: customerCode, idNo: idNo, appSession: appSession);

    if (cData != null) {
      if (!Get.isRegistered<AuthController>()) {
        Get.put(() => AuthController(), permanent: true);
      }

      if (Get.isRegistered<AccountController>()) {
        Get.find<AccountController>().customerEKYC = null;
      }

      await Box3.saveUserInfo(cData);
      update();
    }
    loading = false;
    update();
  }

  Future<void> syncBeneficiaries(String customerCode) async {
    await ApiService().syncBeneficiaries(customerCode: customerCode);
  }

  Timer? notificationTimer;
  bool notificationExpiryLoader = false;

  // validateNidUAEPass(
  //     {String? validationValue,
  //     String? mobile,
  //     String? authToken,
  //     bool disableBack = false,
  //       UaePassProfileFz? resultFromUAESignIn,
  //     bool isFromUAEPass = false,
  //     required bool isFromSignup}) async {
  //   loading = resultFromUAESignIn == null;
  //   update();
  //
  //   RegisterDeviceFZ? result = await ApiService().registerDeviceNew(
  //     signInMethod: Box3.settings.REQUIREDLOGINMETHODS,
  //     "1.3",
  //     authData: {
  //       "IDNUMBER": validationValue ?? 'signUpAttributes.nidConroller.text',
  //       "MOBILE": "${AppConfigs.countryCode}${mobile ?? 'signUpAttributes.mobile.text'}",
  //     },
  //   );
  //
  //   if (kDebugMode) {
  //     print(result);
  //   }
  //
  //   loading = false;
  // }

  // mobile number auth
  String? simMobileNumber1 = '';
  String? simMobileNumber2 = '';
  List<SimCard?> simCards = [];

  Future<void> getSimCards() async {
    var p = await MobileNumber.hasPhonePermission;
    if (p) {
      initMobileNumberState();
    } else {
      await MobileNumber.requestPhonePermission;
    }
  }

  Future<void> initMobileNumberState() async {
    if (!await MobileNumber.hasPhonePermission) {
      await MobileNumber.requestPhonePermission;
      return;
    }
    try {
      simCards = (await MobileNumber.getSimCards)!;
      simMobileNumber1 = simCards[0]?.number.toString();
      if (kDebugMode) {
        print(simCards.toString());
        print(simMobileNumber1.toString());
        print(simMobileNumber2.toString());
      }
    } on PlatformException catch (e) {
      debugPrint("Failed to get mobile number because of '${e.message}'");
    }
  }

  KeyboardActionsConfig keyboardConfig(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardActionsItem(
            focusNode: signUpAttributes.nIDNoFn,
          ),
          KeyboardActionsItem(
            focusNode: signUpAttributes.mobNoFN,
          ),
          KeyboardActionsItem(
            focusNode: signUpAttributes.newMpinFN,
          ),
          KeyboardActionsItem(
            focusNode: signUpAttributes.cnfMpinFN,
          ),
        ]);
  }

  Future<void> documentSharingRequest(
      {required String authToken,
      required UaePassProfileFz uaePassProfileFz,
      bool isFromPopup = false}) async {
    uaePassLoading = true;
    update();

    List<String>? urls = [];
    DateTime? dobs;
    DateTime? ieobs;
    String? pobs;
    String? employerName;
    Map<String, List<String>> uaePassImages = {};
    Map<String, String>? formData = {};
    singleUAEPASSData = null;

    List<FetchUAEPassDoc>? data = await ApiService().getUserDocumentDetails(
        token: authToken,
        emiratesID: uaePassProfileFz.idn!,
        documentType: uaePassProfileFz.nationalityEN == 'ARE'
            ? 'Passport'
            : gccCountries.contains(uaePassProfileFz.nationalityEN)
                ? ""
                : 'ResidenceVisa',
        uuid: uaePassProfileFz.uuid!);

    if (kDebugMode) {
      print(data);
    }

    if (data != null && data.isNotEmpty == true) {
      Box3.fetchUAEPassDoc = data[0];
    }

    if (data?.isNotEmpty == true) {
      singleUAEPASSData = data?.firstOrNull;
      var notificationTime = singleUAEPASSData?.notificationExpiry?.toLocal();
      var currentTime = DateTime.now().toLocal();
      if (singleUAEPASSData?.reqAuthorized == 'Y' ||
          singleUAEPASSData?.reqAuthorized == 'I') {
        if (singleUAEPASSData?.documentCode1 != null &&
            singleUAEPASSData?.documentCode1?.isNotEmpty == true) {
          urls.addAll((singleUAEPASSData?.documentCode1 as String).split(','));
          urls.add((singleUAEPASSData?.documentCode1 as String));
          uaePassImages[singleUAEPASSData!.documentID1!] =
              (singleUAEPASSData!.documentCode1 as String).split(',');
        }

        if (singleUAEPASSData?.documentCode2 != null &&
            singleUAEPASSData?.documentCode2?.isNotEmpty == true) {
          urls.addAll((singleUAEPASSData?.documentCode2 as String).split(','));
          urls.add((singleUAEPASSData?.documentCode2 as String));
          uaePassImages[singleUAEPASSData!.documentID2!] =
              (singleUAEPASSData!.documentCode2 as String).split(',');
        }

        if (uaePassProfileFz.firstnameEN != null) {
          formData["First Name"] = uaePassProfileFz.firstnameEN ?? '';
        }
        if (uaePassProfileFz.lastnameEN != null) {
          formData["Last Name"] = uaePassProfileFz.lastnameEN ?? '';
        }
        if (uaePassProfileFz.mobile != null) {
          formData["Mobile"] = uaePassProfileFz.mobile!.substring(
              uaePassProfileFz.mobile?.substring(0, 3) == Box3.countryCode
                  ? 3
                  : 0);
        }
        if (uaePassProfileFz.idn != null) {
          formData["EID"] = uaePassProfileFz.idn ?? '';
        }
        if (uaePassProfileFz.email != null) {
          formData["Email"] = uaePassProfileFz.email ?? '';
        }
        if (uaePassProfileFz.nationalityEN != null) {
          formData["Nationality"] = uaePassProfileFz.nationalityEN ?? '';
        }

        if (singleUAEPASSData?.employerName != null &&
            singleUAEPASSData?.employerName?.isNotEmpty == true) {
          employerName = singleUAEPASSData!.employerName!;
          signUpAttributes.employer.text = employerName;
          formData["Employer Name"] = signUpAttributes.employer.text;
        }

        if (singleUAEPASSData?.dateOfBirth != null) {
          dobs = singleUAEPASSData!.dateOfBirth;

          signUpAttributes
            ..dobDateCtrls[0].text = dobs?.day != null
                ? (dobs!.day < 10 ? '0${dobs.day}' : dobs.day.toString())
                : ''
            ..dobDateCtrls[1].text = dobs?.month != null
                ? (dobs!.month < 10 ? '0${dobs.month}' : dobs.month.toString())
                : ''
            ..dobDateCtrls[2].text = dobs?.year.toString() ?? '';
          formData["DOB"] =
              '${signUpAttributes.dobDateCtrls[0].text}/${signUpAttributes.dobDateCtrls[1].text}/${signUpAttributes.dobDateCtrls[2].text}';
        }
        if (singleUAEPASSData?.placeOfBirth != null &&
            singleUAEPASSData?.placeOfBirth?.isNotEmpty == true) {
          pobs = singleUAEPASSData!.placeOfBirth;
          signUpAttributes.placeOfBirth.text = pobs ?? '';
          formData["Place Of Birth"] = signUpAttributes.placeOfBirth.text;
        }
        if (singleUAEPASSData?.expiryDate1 != null) {
          ieobs = singleUAEPASSData!.expiryDate1;

          signUpAttributes
            ..idExpiryDateCtrls[0].text = ieobs?.day != null
                ? (ieobs!.day < 10 ? '0${ieobs.day}' : ieobs.day.toString())
                : ''
            ..idExpiryDateCtrls[1].text = ieobs?.month != null
                ? (ieobs!.day < 10 ? '0${ieobs.month}' : ieobs.month.toString())
                : ''
            ..idExpiryDateCtrls[2].text = ieobs?.year.toString() ?? '';

          formData["ID Expiry Date"] =
              '${signUpAttributes.idExpiryDateCtrls[0].text}/${signUpAttributes.idExpiryDateCtrls[1].text}/${signUpAttributes.idExpiryDateCtrls[2].text}';
        }
        Get.showSnackbar(GetSnackBar(
          messageText: Text(
            "Profile data received successfully from UAE PASS.",
            style: TS.f14.copyWith(color: AppConfigs.w),
          ),
          backgroundColor: (AppConfigs.dg).withOpacity(0.7),
          duration: const Duration(seconds: 2),
        ));

        Get.to(() => UAEConfirmDetails(
            formData, () => Get.toNamed(AppRoutes.signUp), urls));
        uaePassLoading = false;
        update();
      } else if (singleUAEPASSData?.reqAuthorized == 'N') {
        uaePassLoading = false;
        update();

        bool? isUaePassInstall = await ApiService().checkUAEPASSInstalled();
        if (isUaePassInstall == false) {
          await apiAlertDialog(
              title: 'Error',
              message:
                  'You have rejected the data sharing request on UAE PASS. Please retry',
              disableBack: true);
        }
      } else if (singleUAEPASSData?.reqAuthorized == 'P' &&
          notificationTime!.isBefore(currentTime)) {
        Get.put(AccountController());
        docShareRetry == false;
        uaePassLoading = false;
        update();
        if (Get.currentRoute != AppRoutes.docShareRetryRoutes) {
          Get.to(const DocShareRetry(), arguments: {
            "message":
                '${'Notification expired, Please retry'.tr} ${Get.find<AccountController>().contactUs?.data?.phoneNo ?? ''}',
            "authToken": authToken,
            "kycBV": uaePassProfileFz
          });
        }
      } else {
        uaePassLoading = false;
        update();
        if (Get.isDialogOpen != true) {
          await apiAlertDialog(
              title: 'Error',
              message: 'Oops, something went wrong. Please try again later.',
              disableBack: true);
        }
      }
    } else {
      uaePassLoading = false;
      update();
      await apiAlertDialog(
          title: 'Error',
          message: 'Oops, something went wrong. Please try again later.',
          disableBack: true);
    }
    uaePassLoading = false;
    uaePassLoading = false;
    docShareRetry = false;
    update();
  }

  bool docShareRetry = false;

  // bool docShareRetry1 = false;

  List<String> gccCountries = ["BHR", "KWT", "OMN", "QAT", "SAU"];
  static const List<String> fileSize = ["B", "KB", "MB"];

  Future<String> getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = fileSize;
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  final _picker = ImagePicker();

  Future<void> selfieImagePicker() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.camera,
      preferredCameraDevice: CameraDevice.front,
    );
    if (pickedFile != null) {
      final size = await getFileSize(pickedFile.path, 1);
      List<String> sizeData = size.split(" ");
      var imageSize = double.parse(sizeData[0]);
      if (kDebugMode) {
        print('CameraFileSize = $size');
      }
      if ((sizeData[1].toLowerCase() == 'b') ||
          (sizeData[1].toLowerCase() == 'kb') ||
          (sizeData[1].toLowerCase() == 'mb') && (imageSize < 10)) {
        selfieImage = pickedFile;
        update();
      } else {
        Get.snackbar('Error'.tr, 'Image size should be less than 10 MB',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error'.tr, '${'Image_not'.tr}${'captured'.tr}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> selfieVideoPicker() async {
    // selfieErrorText = '';
    // update();
    final ImagePicker picker = ImagePicker();

    try {
      var videoData = await picker.pickVideo(
          source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
      if (videoData != null) {
        final size = await getFileSize(videoData.path, 1);
        List<String> sizeData = size.split(" ");
        var imageSize = double.parse(sizeData[0]);
        if (kDebugMode) {
          print('GalleryFileSize = $size');
        }
        if ((sizeData[1].toLowerCase() == 'b') ||
            (sizeData[1].toLowerCase() == 'kb') ||
            (sizeData[1].toLowerCase() == 'mb') && (imageSize < 15)) {
          cameraVideo = videoData;
        } else {
          Get.snackbar('Error'.tr, 'Video size should be less than 15 MB',
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white);
        }
      }
    } catch (e) {
      // requestCameraPermission();
    }

    if (cameraVideo != null) {
      videoPlayerController =
          VideoPlayerController.file(File(cameraVideo!.path));
      await videoPlayerController!.initialize();
      update();
    }
  }

  /// otp part
  TextEditingController mobOTP = TextEditingController();
  bool isResend = false;
  bool sending = false;
  int timeToResend = 60;
  Timer? otpTimer;
  String errorText = '';

  void startTimer1() {
    if (otpTimer != null) {
      otpTimer?.cancel();
    }
    timeToResend = 60;
    const oneSec = Duration(seconds: 1);
    otpTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (timeToResend == 0) {
          otpTimer?.cancel();
          update(['OTP_POPUP']);
        } else {
          timeToResend--;
          update(['OTP_POPUP']);
        }
      },
    );
  }

  void stopTimer1() {
    if (otpTimer != null) {
      otpTimer?.cancel();
      update(['OTP_POPUP']);
    }
  }

  /// form rules related work
  /// form rules
  FormParameters form = FormParameters(type: FormType.signUpCustomerDetails),
      credForm = FormParameters(type: FormType.signUpSetCredentials),
      nIDForm = FormParameters(type: FormType.nID),
      idVerificationForm = FormParameters(type: FormType.identityVerification);

  FormRulesData? nIDFormBV, credFormBV, formBV, idVerificationFormBV;

  void prefillExtractedIDdetails(FormFieldItem f) {
    // Prefill extracted details from KYC/OCR
    if (form.textFieldControllers[f.FzParamName]?.text.isEmpty ?? true) {
      if (f.FzParamName.toLowerCase().contains("firstname") ||
          f.FzParamName.toLowerCase() == "first_name") {
        form.textFieldControllers[f.FzParamName]?.text =
            signUpAttributes.firstName.text;
      } else if (f.FzParamName.toLowerCase().contains("middlename") ||
          f.FzParamName.toLowerCase() == "middle_name") {
        form.textFieldControllers[f.FzParamName]?.text =
            signUpAttributes.middleName.text;
      } else if (f.FzParamName.toLowerCase().contains("lastname") ||
          f.FzParamName.toLowerCase() == "last_name") {
        form.textFieldControllers[f.FzParamName]?.text =
            signUpAttributes.lastName.text;
      }
    }

    if (f.FzParamName == 'DateOfBirth' || f.FzParamName == 'DOB') {
      var extractedCtrls = signUpAttributes.dobDateCtrls;
      var formCtrls = form.dateFieldControllers[f.FzParamName];
      if (formCtrls != null &&
          formCtrls[0].text.isEmpty &&
          formCtrls[1].text.isEmpty &&
          formCtrls[2].text.isEmpty &&
          extractedCtrls[0].text.isNotEmpty) {
        formCtrls[0].text = extractedCtrls[0].text;
        formCtrls[1].text = extractedCtrls[1].text;
        formCtrls[2].text = extractedCtrls[2].text;
        try {
          int day = int.parse(extractedCtrls[0].text);
          int month = int.parse(extractedCtrls[1].text);
          int year = int.parse(extractedCtrls[2].text);
          DateTime date = DateTime(year, month, day);
          form.dates[f.FzParamName] =
              DateFormatter.newFormat(date, 'dd/MMM/yyyy');
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    } else if (f.FzParamName == 'IdExpiryDate' ||
        f.FzParamName == 'ExpiryDate') {
      var extractedCtrls = signUpAttributes.idExpiryDateCtrls;
      var formCtrls = form.dateFieldControllers[f.FzParamName];
      if (formCtrls != null &&
          formCtrls[0].text.isEmpty &&
          formCtrls[1].text.isEmpty &&
          formCtrls[2].text.isEmpty &&
          extractedCtrls[0].text.isNotEmpty) {
        formCtrls[0].text = extractedCtrls[0].text;
        formCtrls[1].text = extractedCtrls[1].text;
        formCtrls[2].text = extractedCtrls[2].text;
        try {
          int day = int.parse(extractedCtrls[0].text);
          int month = int.parse(extractedCtrls[1].text);
          int year = int.parse(extractedCtrls[2].text);
          DateTime date = DateTime(year, month, day);
          form.dates[f.FzParamName] =
              DateFormatter.newFormat(date, 'dd/MMM/yyyy');
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    } else if (f.FzParamName == 'IdIssueDate' || f.FzParamName == 'IssueDate') {
      var extractedCtrls = signUpAttributes.idIssueDateCtrls;
      var formCtrls = form.dateFieldControllers[f.FzParamName];
      if (formCtrls != null &&
          formCtrls[0].text.isEmpty &&
          formCtrls[1].text.isEmpty &&
          formCtrls[2].text.isEmpty &&
          extractedCtrls[0].text.isNotEmpty) {
        formCtrls[0].text = extractedCtrls[0].text;
        formCtrls[1].text = extractedCtrls[1].text;
        formCtrls[2].text = extractedCtrls[2].text;
        try {
          int day = int.parse(extractedCtrls[0].text);
          int month = int.parse(extractedCtrls[1].text);
          int year = int.parse(extractedCtrls[2].text);
          DateTime date = DateTime(year, month, day);
          form.dates[f.FzParamName] =
              DateFormatter.newFormat(date, 'dd/MMM/yyyy');
        } catch (e) {
          debugPrint(e.toString());
        }
      }
    }

    if (f.FzParamName == 'Nationality' || f.FzParamName == 'NationalityCode') {
      if (form.selectedSources[f.FzParamName] == null) {
        var natSources = form.sources[f.ApiKey] ?? form.sources[f.FzParamName];
        if (natSources != null) {
          MasterResponseFZ? matched;
          if (signUpAttributes.nationality != null) {
            var targetNat = signUpAttributes.nationality!;
            matched = natSources.firstWhereOrNull((item) =>
                item.Code.trim().toLowerCase() ==
                    targetNat.Code.trim().toLowerCase() ||
                item.Desc.trim().toLowerCase() ==
                    targetNat.Desc.trim().toLowerCase());
          }
          if (matched == null &&
              signUpAttributes.extractedNationalityText.isNotEmpty) {
            final targetText =
                signUpAttributes.extractedNationalityText.trim().toLowerCase();
            matched = natSources.firstWhereOrNull((item) {
              final code = item.Code.trim().toLowerCase();
              final desc = item.Desc.trim().toLowerCase();
              if (code == targetText || desc == targetText) {
                return true;
              }
              final descPrefix = desc.length >= 4 ? desc.substring(0, 4) : desc;
              final targetPrefix = targetText.length >= 4
                  ? targetText.substring(0, 4)
                  : targetText;
              return descPrefix == targetPrefix ||
                  desc.startsWith(targetText) ||
                  targetText.startsWith(desc);
            });
          }
          if (matched != null) {
            form.selectedSources[f.FzParamName] = matched;
            signUpAttributes.nationality = matched;
          }
        }
      }
    }

    if (f.FzParamName == 'Gender' || f.FzParamName == 'GenderCode') {
      if (form.selectedSources[f.FzParamName] == null &&
          signUpAttributes.gender != null &&
          signUpAttributes.gender!.isNotEmpty) {
        var genderVal = signUpAttributes.gender!.trim().toLowerCase();
        var genderSources =
            form.sources[f.ApiKey] ?? form.sources[f.FzParamName];
        if (genderSources != null) {
          var matched = genderSources.firstWhereOrNull((item) =>
              item.Code.trim().toLowerCase() == genderVal ||
              item.Desc.trim().toLowerCase() == genderVal ||
              (genderVal.startsWith('m') &&
                  item.Code.trim().toLowerCase() == 'm') ||
              (genderVal.startsWith('f') &&
                  item.Code.trim().toLowerCase() == 'f'));
          if (matched != null) {
            form.selectedSources[f.FzParamName] = matched;
          }
        }
      }
    }
  }

  /// NID forms
  Future<void> getNIDForm() async {
    nIDFormBV = Box3.nIDFormBV;
    if (nIDFormBV == null) {
      await Box3.getNIDForm();
      nIDFormBV = Box3.nIDFormBV;
      loading == false;
      update();
    }
    if (nIDFormBV != null) {
      nIDForm.initialiseForm(nIDFormBV!.formFieldItem);
      loadSourcesData(nIDFormBV);
    }
    update();
  }

  /// IDVerification forms
  Future<void> getIdentityVerificationForm() async {
    idVerificationFormBV = Box3.idVerificationFormBV;
    if (idVerificationFormBV == null) {
      await Box3.getIdentityVerificationForm();
      idVerificationFormBV = Box3.idVerificationFormBV;
      loading == false;
      update();
    }
    idVerificationForm.initialiseForm(idVerificationFormBV!.formFieldItem);
    await loadSourcesData(idVerificationFormBV);
    idVerificationForm.initDefaultValue(idVerificationFormBV!.formFieldItem);

    update();
  }

  /// SignUp forms
  Future<void> getSignUpForm({bool? nIDLogin = false}) async {
    formBV = Box3.formBV;
    if (formBV == null) {
      if (Box3.settings.processEkycAs == 'UAE-PASS' && nIDLogin == false) {
        await Box3.getUAEPassSignUpForm();
      } else {
        await Box3.getSignUpForm();
      }
      formBV = Box3.formBV;
      loading == false;
      update();
      // form.initialiseForm(formBV!.formFieldItem);
      // loadSourcesData(formBV);
    } else {
      WidgetsBinding.instance.scheduleFrameCallback(
        (timeStamp) => update(),
      );
      // form.initialiseForm(formBV!.formFieldItem);
      // loadSourcesData(formBV);
    }
    form.initialiseForm(formBV!.formFieldItem);
    await loadSourcesData(formBV);
    form.initDefaultValue(formBV!.formFieldItem);
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) => update(),
    );
  }

  /// Set Cred forms
  Future<void> getCredForm() async {
    credFormBV = Box3.credFormBV;
    if (credFormBV == null) {
      await Box3.getCredForm();
      credFormBV = Box3.credFormBV;
      loading == false;
      update();
    }
    if (credFormBV != null) {
      credForm.initialiseForm(credFormBV!.formFieldItem);
      await loadSourcesData(credFormBV);
      credForm.initDefaultValue(credFormBV!.formFieldItem);
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => update(),
    );
  }

  Future<void> loadSourcesData(FormRulesData? formBV,
      {Map<String, dynamic>? data}) async {
    await Future.wait(formBV!.formFieldItem
        .where((f0) =>
            f0.FieldType == FieldType.dropDownSingle ||
            f0.FieldType == FieldType.dropDownMulti ||
            f0.FieldType == FieldType.radio)
        .map((f1) => getSourcesNew(f1))
        .toList());
    // update();
  }

  Future<void> getSourcesNew(FormFieldItem f) async {
    loadingSources.add(f.FzParamName);
    WidgetsBinding.instance.scheduleFrameCallback(
      (timeStamp) {
        update();
      },
    );
    try {
      form.sources[f.ApiKey] = await ApiService().getCatalogue(
          typeData: {"Type": f.ApiKey, "LanguageCode": Box3.lang?.Code ?? "EN"},
          type: f.ApiKey);

      // if (f.FzParamName == "IdTypeCode") {
      //   if (form.sources[f.ApiKey] != null) {
      //     MasterResponseFZ? idType = form.sources[f.ApiKey]!
      //         .where((e) =>
      //             e.Code == Box3.settings.primaryDocID ||
      //             e.Desc == Box3.settings.primaryDocIDName)
      //         .toList()
      //         .first;
      //     form.selectedSources[f.FzParamName] = MasterResponseFZ().copyWith(
      //       Desc: idType.Desc,
      //       Code: idType.Code,
      //     );
      //   }
      // }
    } finally {
      loadingSources.remove(f.FzParamName);
      update();
    }
  }

  Future<List<MasterResponseFZ>> reFetchSources(FormFieldItem f,
      {FormParameters? currentForm, String searchText = ''}) async {
    List<MasterResponseFZ> newData = [];
    if (loadingSources.contains(f.FzParamName)) {
      return newData;
    }
    loadingSources.add(f.FzParamName);
    filteredList.refresh();
    try {
      // if (f.FzParamName != 'BeneficiaryBranchCode') {
      newData = await Get.put(AddBeneficiaryController())
          .refetchSources(f, currentForm: currentForm, searchText: searchText);
      list[f.FzParamName] = newData;
      filteredList[f.FzParamName] = newData;
      if (searchText.isEmpty) {
        backupList[f.FzParamName] = newData;
      }
      // } else {
      //   newData = await Get.put(AddBeneficiaryController())
      //       .refetchSources(f, currentForm: currentForm);
      // }
    } finally {
      loadingSources.remove(f.FzParamName);
      filteredList.refresh();
    }

    return newData;
  }

  /// nid page done button handling
  List<KeyboardActionsItem> getKeyboardNodesNID() {
    List<KeyboardActionsItem> keyboardActionsItem = [];
    List<FocusNode> focusNodesNew = [];
    List<FormFieldItem> item = nIDFormBV!.formFieldItem
        .where((element) => element.FieldType == FieldType.number)
        .toList();
    List<String> myString = item.map((myData) => myData.FzParamName).toList();

    focusNodesNew.addAll(
        Set<FocusNode>.from(nIDForm.nodes.keys) // Create a set from Map values
          ..retainAll(myString));

    for (var myData in focusNodesNew) {
      keyboardActionsItem.add(KeyboardActionsItem(focusNode: myData));
    }
    return keyboardActionsItem;
  }

  KeyboardActionsConfig keyboardConfigNID(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: getKeyboardNodesNID());
  }

  /// set cred page done button handling
  List<KeyboardActionsItem> getKeyboardNodesSetCred() {
    List<KeyboardActionsItem> keyboardActionsItem = [];
    List<FocusNode> focusNodesNew = [];
    List<FormFieldItem> item = credFormBV!.formFieldItem
        .where((element) => element.FieldType == FieldType.number)
        .toList();
    List<String> myString = item.map((myData) => myData.FzParamName).toList();

    focusNodesNew.addAll(
        Set<FocusNode>.from(credForm.nodes.keys) // Create a set from Map values
          ..retainAll(myString));

    for (var myData in focusNodesNew) {
      keyboardActionsItem.add(KeyboardActionsItem(focusNode: myData));
    }
    return keyboardActionsItem;
  }

  KeyboardActionsConfig keyboardConfigSetCred(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: getKeyboardNodesSetCred());
  }

  /// signup page done button handling
  List<KeyboardActionsItem> getKeyboardNodesSignup() {
    List<KeyboardActionsItem> keyboardActionsItem = [];
    List<FocusNode> focusNodesNew = [];
    List<FormFieldItem> item = formBV!.formFieldItem
        .where((element) => element.FieldType == FieldType.number)
        .toList();
    List<String> myString = item.map((myData) => myData.FzParamName).toList();

    focusNodesNew.addAll(
        Set<FocusNode>.from(form.nodes.keys) // Create a set from Map values
          ..retainAll(myString));

    for (var myData in focusNodesNew) {
      keyboardActionsItem.add(KeyboardActionsItem(focusNode: myData));
    }
    return keyboardActionsItem;
  }

  KeyboardActionsConfig keyboardConfigSignup(BuildContext context) {
    return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: getKeyboardNodesSignup());
  }

  void getNext(String id, T) {
    // int i = filteredFields.indexWhere((e) => e.id == id);
    // if (i != filteredFields.length - 1) {
    //   // if (filteredFields[i + 1].type == 'radio') {
    //   //   Get.focusScope?.unfocus();
    //   // } else if (T == FocusNode) {
    //   //   if (filteredFields[i + 1].type == 'textField' || filteredFields[i + 1].type == 'dateField') {
    //   //     return signUpAttributes.getNode(filteredFields[i + 1].id);
    //   //   } else if (filteredFields[i + 1].type == 'dummyField' && ((i + 2) <= filteredFields.length - 1)) {
    //   //     if (filteredFields[i + 2].type == 'textField' || filteredFields[i + 2].type == 'dateField') {
    //   //       return signUpAttributes.getNode(filteredFields[i + 2].id);
    //   //     } else {
    //   //       return null;
    //   //     }
    //   //   } else {
    //   //     return null;
    //   //   }
    //   // }
    //   // else if (T == BottomSheet) {
    //   //   sheetMap[filteredFields[i + 1].id] != null
    //   //       ? sheetMap[filteredFields[i + 1].id]!()
    //   //       : () {};
    //   // }
    // } else {
    Get.focusScope?.unfocus();
    // }
  }
}
