import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobiremit/ui_one/custom_widgets/document_uploading.dart';
import 'package:mobiremit/ui_one/screens/sign_up/id_scan_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../../network/api_service_new.dart';
import '../editing_controllers.dart/attributes.dart';
import '../exports/controllers.dart';
import '../flavours/constants.dart';

class KycController extends GetxController {
  Map<KYCType, String> frontDocPath = <KYCType, String>{}, backDocPath = {};
  Map<KYCType, String> cacheFrontDocPath = <KYCType, String>{},
      cacheBackDocPath = {};
  final _picker = ImagePicker();
  String idErrorText = '',
      selfieErrorText = '',
      selfieError = '',
      errorText = '',
      videoError = '';
  XFile? cameraVideo, selfieImage;
  XFile? cacheCameraVideo, cacheSelfieImage;
  VideoPlayerController? videoPlayerController;
  ProfileAttributes profileAttributes = ProfileAttributes();
  SignUpAttributes signUpAttributes = SignUpAttributes();
  String? docNumber, idNo;
  FormParameters form = FormParameters(type: FormType.updateProfile);
  FormRulesData? updateProfileFormFZ;
  String? frontSize, backSize;

  // late File file;
  File? file;
  late XFile xFile;
  bool isDark = Get.find<AccountController>().isDark, loading = false;

  bool validateEditProfile() {
    idErrorText = (frontDocPath[AppConfigs.docType] == null &&
                Get.find<AccountController>().frontImage == null) ||
            (backDocPath[AppConfigs.docType] == null &&
                Get.find<AccountController>().backImage == null)
        ? 'required'.tr
        : '';
    selfieErrorText = '';

    // profileAttributes.expiryError =
    //     (profileAttributes.expiryDateController.text.isEmpty
    //         ? 'required'.tr
    //         : profileAttributes.expiryDateController.text.isEmpty
    //             ? 'Invalid_date'.tr
    //             : '');
    // profileAttributes.idTypeError =
    //     (profileAttributes.selectedIdType == null ? 'required'.tr : '');
    // profileAttributes.idNoError =
    //     (profileAttributes.idNo.text.isEmpty ? 'required'.tr : '');
    // profileAttributes.nationalityError =
    //     (profileAttributes.selectedNationality == null ? 'required'.tr : '');
    // profileAttributes.professionError =
    //     (profileAttributes.selectedProfession == null ? 'required'.tr : '');

    bool status = form.validateNew(updateProfileFormFZ!.formFieldItem);

    return idErrorText.isEmpty && selfieErrorText.isEmpty && status == true;
    // profileAttributes.expiryError.isEmpty &&
    // profileAttributes.nationalityError.isEmpty &&
    // profileAttributes.professionError.isEmpty &&
    // idErrorText.isEmpty &&
    // idErrorText.isEmpty;
  }

  Future<void> getUpdateProfileForm({Map<String, dynamic>? data}) async {
    FormRulesData? f = Box3.profileUpdateFormFZ;
    if (f == null) {
      await Box3.getProfileUpdateForm();
      f = Box3.profileUpdateFormFZ;
      loading == false;
      update();
    }
    if (f != null) {
      form.initialiseForm(f.formFieldItem, data: data);
      updateProfileFormFZ = f;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      update();
    });
  }

  /// update user profile
  Future<bool> updateProfile() async {
    Map<String, dynamic> custData =
        form.buildJsonNew(updateProfileFormFZ!.formFieldItem);
    Map<String, dynamic> cc = {
      "CustomerCode": Box3.customerDetailsFZ?.data?.customerCode,
      "MobileNo": Box3.customerDetailsFZ?.data?.mobileNo
    };
    custData.addAll(cc);
    var data = {"Token": Box3.appKeyToken, "Data": custData};

    var res = await ApiService().updateCustomerDetails(data);
    return res;
  }

  Future<void> onCapture(XFile? media, bool? isFront,
      {bool isSelfie = false, bool isVideo = false, KYCType? type}) async {
    if (media != null) {
      final size = await getFileSize(media.path, 1);
      List<String> sizeData = size.split(" ");
      var imageSize = double.parse(sizeData[0]);
      if (kDebugMode) {
        print('CameraFileSize = $size');
      }
      if ((sizeData[1].toLowerCase() == 'b') ||
          (sizeData[1].toLowerCase() == 'kb') ||
          (sizeData[1].toLowerCase() == 'mb') && (imageSize < 10)) {
        if (isSelfie) {
          selfieImage = media;
        } else if (isVideo) {
          cameraVideo = media;
        } else {
          file = File(media.path);
          xFile = media;
          update();
          if (isFront == true) {
            frontDocPath[AppConfigs.docType] = media.path;
          } else if (isFront == false) {
            backDocPath[AppConfigs.docType] = media.path;
          }
          if (type != KYCType.BILL_RECEIPT) {
            extractText(file!, isFront);
          }
        }
        update();
      } else {
        Get.snackbar('Error'.tr,
            '${isVideo ? "Video" : "Image"} size should be less than 10 MB',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error'.tr,
          '${isVideo ? 'Video_not'.tr : 'Image_not'.tr}${'captured'.tr}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> pickFile(bool? isFront, ImageSource src,
      {KYCType? type, bool isCrop = true}) async {
    final pickedFile = await _picker.pickImage(
      source: src,
      preferredCameraDevice: CameraDevice.rear,
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
        file = File(pickedFile.path);
        update();
        xFile = pickedFile;
        update();
        // file = File(pickedFile.path);
        await cropFile(pickedFile.path, isFront, type: type, isCrop: isCrop);
      } else {
        Get.snackbar('Error'.tr, 'Image size should be less than 10 MB',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error'.tr,
          '${'Image_not'.tr}${src == ImageSource.camera ? 'captured'.tr : 'picked'.tr}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  Future<void> cropFile(String filePath, bool? isFront,
      {KYCType? type, required bool isCrop}) async {
    if (isCrop == true) {
      CroppedFile? croppedFile = await ImageCropper().cropImage(
        sourcePath: filePath,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper'.tr,
              toolbarColor: ConstColors.appBarBackground,
              toolbarWidgetColor: AppConfigs.bf0,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false,
              aspectRatioPresets: [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]),
          IOSUiSettings(
            title: 'Cropper'.tr,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9
            ],
          )
        ],
      );
      if (croppedFile != null) {
        if (isFront == true) {
          frontDocPath[AppConfigs.docType] = croppedFile.path;
          file = File(croppedFile.path);
        } else if (isFront == false) {
          backDocPath[AppConfigs.docType] = croppedFile.path;
          file = File(croppedFile.path);
        } else {
          if (type == KYCType.BILL_RECEIPT) {
            Get.find<TransferController>()
              ..bill = XFile(croppedFile.path)
              ..update();
          }
        }
        if (type != KYCType.BILL_RECEIPT) {
          extractText(file!, isFront);
        }
        update();
      }
    } else {
      if (isFront == true) {
        frontDocPath[AppConfigs.docType] = filePath;
        file = File(filePath);
      } else if (isFront == false) {
        backDocPath[AppConfigs.docType] = filePath;
        file = File(filePath);
      } else {
        if (type == KYCType.BILL_RECEIPT) {
          Get.find<TransferController>()
            ..bill = XFile(filePath)
            ..update();
        }
      }
      if (type != KYCType.BILL_RECEIPT) {
        extractText(file!, isFront);
      }
      update();
    }
  }

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

  Future<void> pickFromDocument(
      {bool? isFront, KYCType? type, bool isCrop = true}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png', 'jpeg', 'heic', 'heif'],
    );

    if (result != null) {
      final size = await getFileSize(result.files.single.path.toString(), 1);
      List<String> sizeData = size.split(" ");
      var imageSize = double.parse(sizeData[0]);
      if (kDebugMode) {
        print('GalleryFileSize = $size');
      }
      if ((sizeData[1].toLowerCase() == 'b') ||
          (sizeData[1].toLowerCase() == 'kb') ||
          (sizeData[1].toLowerCase() == 'mb') && (imageSize < 10)) {
        await cropFile(result.files.single.path.toString(), isFront,
            type: type, isCrop: isCrop);
      } else {
        Get.snackbar('Error'.tr, 'Image size should be less than 10 MB',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white);
      }
    } else {
      Get.snackbar('Error'.tr, 'File_not_picked_successfully'.tr,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  String idPattern = r'^[A-Z0-9]+$';
  RegExp exp = RegExp(r'^[A-Z0-9]+$');

  Future<void> extractText(File file, bool? isFront, {KYCType? type}) async {
    if ((Box3.settings.ocrRequired)) {
      await proceed(file, isFront);
    }
  }

  String _safeExtractName(String blockText) {
    final lower = blockText.toLowerCase();
    final nameIndex = lower.indexOf('name');
    if (nameIndex != -1) {
      int startIdx = nameIndex + 4;
      if (startIdx < blockText.length && blockText[startIdx] == ':') {
        startIdx++;
      }
      return blockText.substring(startIdx).trim();
    }
    return blockText.trim();
  }

  /// Splits a raw name string into (firstName, middleName, lastName).
  (String, String, String) _splitName(String rawName) {
    final cleanName = rawName.trim().replaceAll(RegExp(r'\s+'), ' ');
    if (cleanName.isEmpty) {
      return ('', '', '');
    }

    final tempName = cleanName.split(' ');
    if (tempName.length == 1) {
      return (tempName[0], '', '');
    } else if (tempName.length == 2) {
      return (tempName[0], '', tempName[1]);
    } else if (tempName.length == 3) {
      return (tempName[0], tempName[1], tempName[2]);
    } else {
      final firstName = tempName[0];
      final middleName = tempName[1];
      final lastName = tempName.sublist(2).join(' ');
      return (firstName, middleName, lastName);
    }
  }

  /// extracts the nationality value from the full list of OCR lines.
  String _extractNationalityText(List<String> temp) {
    for (String line in temp) {
      final match =
          RegExp(r'nationality\s*[:,;.]?\s*(.*)', caseSensitive: false)
              .firstMatch(line);
      if (match != null) {
        final nation = match.group(1)?.trim() ?? '';
        print('#######$nation');
        return nation;
      }
    }
    return '';
  }

  (String, String, String, List<String>) _extractNameFromBlocks(
      RecognizedText recognizedText, String labelWord) {
    int nameIndex = recognizedText.blocks.indexWhere(
        (b) => b.lines.first.text.toLowerCase().contains(labelWord));

    if (!nameIndex.isNegative && nameIndex != 0) {
      String extractedName =
          _safeExtractName(recognizedText.blocks[nameIndex].lines[0].text);
      final list =
          extractedName.isEmpty ? <String>[] : extractedName.split(" ");
      final parsed = _splitName(extractedName);
      return (parsed.$1, parsed.$2, parsed.$3, list);
    }
    return ('', '', '', <String>[]);
  }

  List<DateTime> _parseDatesFromLines(List<String> lines, RegExp regex) {
    List<DateTime> dates = [];
    for (String line in lines) {
      for (var match in regex.allMatches(line)) {
        final dateStr = match.group(0)!.trim().replaceAll(' ', '');
        try {
          final parts = dateStr.replaceAll('/', '-').split('-');
          if (parts.length == 3) {
            String year, month, day;
            if (parts[2].length == 4) {
              day = parts[0].padLeft(2, '0');
              month = parts[1].padLeft(2, '0');
              year = parts[2];
            } else {
              year = parts[0];
              month = parts[1].padLeft(2, '0');
              day = parts[2].padLeft(2, '0');
            }
            dates.add(DateTime.parse("$year-$month-$day"));
          }
        } catch (e) {
          if (kDebugMode) {
            print("Date parsing error for $dateStr: $e");
          }
        }
      }
    }
    return dates;
  }

  MasterResponseFZ? _matchNationality(
      String rawNation, List<MasterResponseFZ> nationalityData) {
    if (rawNation.isEmpty) return null;

    final cleanedVal =
        rawNation.toLowerCase().replaceAll(RegExp(r'[^a-z]'), '');
    for (var nat in nationalityData) {
      final desc = nat.Desc.trim().toLowerCase();
      final descFinal = desc.length > 4 ? desc.substring(0, 4) : desc;
      if (cleanedVal.startsWith(descFinal) || desc.contains(cleanedVal)) {
        return nat;
      }
    }
    return null;
  }

  MasterResponseFZ? _matchNationalityFallback(
      List<String> tempLines, List<MasterResponseFZ> nationalityData) {
    for (var nat in nationalityData) {
      final desc = nat.Desc.trim().toLowerCase();
      final prefix = desc.length > 4 ? desc.substring(0, 4) : desc;
      for (var line in tempLines) {
        if (line.toLowerCase().startsWith(prefix)) {
          return nat;
        }
      }
    }
    return null;
  }

  void _populateSignUpDateAttributes(SignUpAttributes attributes,
      DateTime? dobs, DateTime? ends, DateTime? starts) {
    attributes
      ..dobDateCtrls[0].text = dobs?.day != null
          ? (dobs!.day < 10 ? '0${dobs.day}' : dobs.day.toString())
          : ''
      ..dobDateCtrls[1].text = dobs?.month != null
          ? (dobs!.month < 10 ? '0${dobs.month}' : dobs.month.toString())
          : ''
      ..dobDateCtrls[2].text = dobs?.year.toString() ?? ''
      ..idExpiryDateCtrls[0].text = ends?.day != null
          ? (ends!.day < 10 ? '0${ends.day}' : ends.day.toString())
          : ''
      ..idExpiryDateCtrls[1].text = ends?.month != null
          ? (ends!.month < 10 ? '0${ends.month}' : ends.month.toString())
          : ''
      ..idExpiryDateCtrls[2].text = ends?.year.toString() ?? ''
      ..idIssueDateCtrls[0].text = starts?.day != null
          ? (starts!.day < 10 ? '0${starts.day}' : starts.day.toString())
          : ''
      ..idIssueDateCtrls[1].text = starts?.month != null
          ? (starts!.month < 10 ? '0${starts.month}' : starts.month.toString())
          : ''
      ..idIssueDateCtrls[2].text = starts?.year.toString() ?? '';
  }

  SignUpController get sc => Get.isRegistered<SignUpController>()
      ? Get.find<SignUpController>()
      : Get.put(SignUpController());

  // var sa = SignUpAttributes();

  Future<void> proceed(File file, bool? isFront, {KYCType? type}) async {
    String firstName = '';
    String middleName = '';
    String lastName = '';

    var tempName = <String>[];

    late String name;
    late String dob;
    late String startD;
    late String endD;

    late String occupation;

    String nationality = '';
    // late String nationalityId;

    MasterResponseFZ? nationalityBV;

    // late String address;
    List<String> res = [];
    List<String> temp = [];
    final img = InputImage.fromFile(file);
    final textDetector = TextRecognizer();
    // final textDetector = GoogleMlKit.vision.textRecognizer();
    RecognizedText recognizedText = await textDetector.processImage(img);
    await textDetector.close();
    for (TextBlock block in recognizedText.blocks) {
      if (kDebugMode) {
        print(block.lines);
      }
      for (TextLine line in block.lines) {
        if (kDebugMode) {
          print(line.text);
        }
        temp.add(line.text);
      }
    }
    final extractedNat = _extractNationalityText(temp);
    signUpAttributes.extractedNationalityText = extractedNat;
    sc.signUpAttributes.extractedNationalityText = extractedNat;
    if (isFront == true) {
      switch (AppConfigs.docType) {
        case KYCType.DRIVING_LICENCE:
          int licenseIndex = recognizedText.blocks.indexWhere(
              (b) => b.lines.first.text.toLowerCase().contains('licence'));
          String d = recognizedText.blocks[licenseIndex + 2].lines[0].text
              .substring(1);
          res.add(d[0] == ':' ? d.substring(1).trim() : d);
          d = recognizedText.blocks[licenseIndex + 2].lines[1].text;
          res.add(d[0] == ':' ? d.substring(1).trim() : d);
          String? dob =
              temp.firstWhereOrNull((s) => s.toLowerCase().contains('dob'));
          if (dob != null) res.add(dob.split(':').last.trim());
          if (kDebugMode) {
            print(res);
          }
          break;
        case KYCType.PASSPORT:
          List<String> ds = temp.where((e) => e.contains(dateReg)).toList();
          String s = DateTime.now().toString();
          List<DateTime> dates = ds
              .map((e) => DateTime.parse(
                  '${e.replaceAll('/', '-').split('-').reversed.join('-')} 00:00:00'))
              .toList();
          dates.sort((a, b) => a.compareTo(b));
          if (kDebugMode) {
            print('dob:${dates[0].toString()}');
          }
          s = recognizedText.blocks.last.text.split('<').first;
          if (kDebugMode) {
            print('Passport Number:$s');
          }
          List<String> names = recognizedText
              .blocks[recognizedText.blocks.length - 2].text
              .split('<');
          s = names[1].substring(
              0, (names[2].isEmpty ? names[1].length : names[1].length - 1));
          if (kDebugMode) {
            print('First Name: $s');
          }
          s = names[2].isEmpty ? names[3] : names[2];
          if (kDebugMode) {
            print('Last Name: $s');
          }
          s = temp
              .firstWhere((e) => e.contains(',') && e.split(',').length == 2);
          if (kDebugMode) {
            print('Address: $s');
          }
          break;
        case KYCType.EMIRATES_ID:
          DateTime? dobs, ends, starts;
          try {
            docNumber = temp
                .where((e) => e.contains(
                    RegExp(r'^\d{3}[\-\/]\d{4}[\-\/]\d{7}[\-\/]\d{1}')))
                .toString();
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }

          try {
            final parsedName = _extractNameFromBlocks(recognizedText, 'name:');
            firstName = parsedName.$1;
            middleName = parsedName.$2;
            lastName = parsedName.$3;
            tempName = parsedName.$4;

            if (firstName.isNotEmpty || lastName.isNotEmpty) {
              sc
                ..signUpAttributes.firstName.text = firstName
                ..signUpAttributes.middleName.text = middleName
                ..signUpAttributes.lastName.text = lastName
                ..update();
            }
            if (kDebugMode) {
              print('eid');
              print('$firstName $middleName $lastName');
              print(docNumber);
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }

          try {
            final dates = _parseDatesFromLines(
              temp,
              RegExp(r'(([012][0-9])|(3[01]))\/([0]{0,1}[1-9]|1[012])\/\d{4}'),
            );
            if (dates.isNotEmpty) {
              dates.sort((a, b) => a.compareTo(b));
              dobs = dates[0];
              if (dates.length == 2) {
                ends = dates[1];
              }
              if (dates.length == 3) {
                starts = dates[1];
                ends = dates[2];
              }
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }

          try {
            String nation = '';
            for (TextBlock block in recognizedText.blocks) {
              for (TextLine line in block.lines) {
                final match = RegExp(r'nationality\s*[:,;.]?\s*(.*)',
                        caseSensitive: false)
                    .firstMatch(line.text);
                if (match != null) {
                  nation = match.group(1)?.trim() ?? '';
                  break;
                }
              }
              if (nation.isNotEmpty) break;
            }
            nationality = nation;

            var nationalityData = Get.find<DataController>().nationalities;
            nationalityBV = _matchNationality(nationality, nationalityData);
            if (nationalityBV != null) {
              sc.signUpAttributes.nationality = nationalityBV;
              if (kDebugMode) {
                print(
                    "Matched Emirates ID Nationality Data: ${nationalityBV.Desc}");
              }
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
          profileAttributes.expiryDateController.text =
              "${ends?.day != null ? (ends!.day < 10 ? '0${ends.day}' : ends.day.toString()) : ''} / ${ends?.month != null ? (ends!.day < 10 ? '0${ends.month}' : ends.month.toString()) : ''} / ${ends?.year}";
          update();
          idNo = docNumber
              .toString()
              .replaceAll('-', '')
              .replaceAll('(', '')
              .replaceAll(')', '');

          _populateSignUpDateAttributes(signUpAttributes, dobs, ends, starts);
          _populateSignUpDateAttributes(
              Get.find<SignUpController>().signUpAttributes,
              dobs,
              ends,
              starts);

          debugPrint("Emirates ID extraction summary:");
          debugPrint("ID: $docNumber");
          debugPrint("DOB: $dobs");
          debugPrint("Expiry: $ends");
          debugPrint("Nationality: $nationality");
          debugPrint("Name components: $tempName");
          break;
        case KYCType.KUWAITI_ID:
          List<String> ds = temp
              .where((e) => e.contains(RegExp(r'^\d{2}[\-\/]\d{2}[\-\/]\d{4}')))
              .toList();

          List<DateTime> dates = ds
              .map((e) => DateTime.parse(
                  e.replaceAll('/', '-').split('-').reversed.join('-')))
              .toList();

          dates.sort((a, b) => a.compareTo(b));
          DateTime dobs = dates.first;
          DateTime ends = dates.last;

          dob = dobs.toString();
          endD = ends.toString();

          docNumber = temp
              .where((e) => e.contains(RegExp(r'((?:\d *){8} *\d) *$')))
              .toString();

          int nameIndex = recognizedText.blocks.indexWhere(
              (b) => b.lines.first.text.toLowerCase().contains('name'));

          if (!nameIndex.isNegative && nameIndex != 0) {
            String name = _safeExtractName(
                recognizedText.blocks[nameIndex].lines[0].text);
            tempName = name.isEmpty ? [] : name.split(" ");
            final parsedName = _splitName(name);
            firstName = parsedName.$1;
            middleName = parsedName.$2;
            lastName = parsedName.$3;

            sc
              ..signUpAttributes.firstName.text = firstName
              ..signUpAttributes.middleName.text = middleName
              ..signUpAttributes.lastName.text = lastName
              ..update();
          }

          if (kDebugMode) {
            print(docNumber.toString());
            print(dob);
            print(endD);
            print(tempName.toString());
          }
          break;
        case KYCType.QATAR_ID:
          if (kDebugMode) {
            print(temp);
          }

          try {
            var nationalityData = Get.find<DataController>().nationalities;

            TextLine? nationalityLabelLine;
            List<TextLine> otherLines = [];

            for (TextBlock block in recognizedText.blocks) {
              for (TextLine line in block.lines) {
                if (line.text.toLowerCase().contains('nationality')) {
                  nationalityLabelLine = line;
                } else {
                  otherLines.add(line);
                }
              }
            }

            String rawNationalityValue = "";
            if (nationalityLabelLine != null) {
              final text = nationalityLabelLine.text;
              final colonIndex = text.indexOf(':');
              if (colonIndex != -1 && colonIndex + 1 < text.length) {
                rawNationalityValue = text.substring(colonIndex + 1).trim();
              }

              if (rawNationalityValue.isEmpty) {
                final labelBox = nationalityLabelLine.boundingBox;
                final double labelCenterY =
                    labelBox.top + (labelBox.height / 2);

                double closestDistance = double.infinity;
                TextLine? matchedValueLine;

                for (TextLine line in otherLines) {
                  final lineBox = line.boundingBox;
                  final double lineCenterY =
                      lineBox.top + (labelBox.height / 2);

                  if (lineBox.left > labelBox.left) {
                    double verticalDistance =
                        (lineCenterY - labelCenterY).abs();
                    if (verticalDistance < 20 &&
                        verticalDistance < closestDistance) {
                      closestDistance = verticalDistance;
                      matchedValueLine = line;
                    }
                  }
                }

                if (matchedValueLine != null) {
                  rawNationalityValue = matchedValueLine.text.trim();
                }
              }
            }

            nationalityBV =
                _matchNationality(rawNationalityValue, nationalityData);
            if (nationalityBV == null) {
              nationalityBV = _matchNationalityFallback(temp, nationalityData);
            }

            if (nationalityBV != null) {
              sc.signUpAttributes.nationality = nationalityBV;
            }

            if (kDebugMode) {
              print("uniqueCountry ${nationalityBV?.Desc}");
              print("uniqueCountryID ${nationalityBV?.id}");
            }
          } catch (e) {
            if (kDebugMode) {
              print(e.toString());
            }
          }

          try {
            final dates = _parseDatesFromLines(
              temp,
              RegExp(r'\d{1,2}[\-\/]\d{1,2}[\-\/]\d{4}'),
            );
            DateTime? dobs, ends;

            if (dates.length >= 2) {
              dates.sort((a, b) => a.compareTo(b));
              dobs = dates.first;
              ends = dates.last;
            } else if (dates.length == 1) {
              final singleDate = dates.first;
              if (singleDate.year >= DateTime.now().year) {
                ends = singleDate;
              } else {
                dobs = singleDate;
              }
            }

            dob = dobs?.toString() ?? '';
            endD = ends?.toString() ?? '';

            _populateSignUpDateAttributes(
                sc.signUpAttributes, dobs, ends, null);
            sc.update();
          } catch (e) {
            if (kDebugMode) {
              print("Qatar ID date parsing error: $e");
            }
          }

          try {
            var tempDocNo = temp
                .where((e) => e.contains(RegExp(r'((?:\d *){6,15} *\d) *$')))
                .toString();

            docNumber =
                tempDocNo.replaceAll('(', '').replaceAll(')', '').trim();

            if (kDebugMode) {
              print(docNumber.toString());
            }
          } catch (e) {
            if (kDebugMode) {
              print(e.toString());
            }
          }

          try {
            final parsedName = _extractNameFromBlocks(recognizedText, 'name');
            firstName = parsedName.$1;
            middleName = parsedName.$2;
            lastName = parsedName.$3;
            tempName = parsedName.$4;

            if (firstName.isNotEmpty || lastName.isNotEmpty) {
              sc
                ..signUpAttributes.firstName.text = firstName
                ..signUpAttributes.middleName.text = middleName
                ..signUpAttributes.lastName.text = lastName
                ..update();
            }
          } catch (e) {
            if (kDebugMode) {
              print(e.toString());
            }
          }

          if (kDebugMode) {
            print("Qatar ID extraction summary:");
            print("ID: $docNumber");
            print("DOB: $dob");
            print("Expiry: $endD");
            print("Nationality: ${nationalityBV?.Desc}");
            print("Name components: $tempName");
          }
          break;
        case KYCType.RSA_ID:
          docNumber = temp
              .where((e) => e.contains(RegExp(r'((?:\d *){8} *\d) *$')))
              .toString();
          // print(docNumber.toString());

          int nameIndex = recognizedText.blocks
              .indexWhere((b) => b.lines.first.text.contains('Name'));
          if (!nameIndex.isNegative && nameIndex != 0) {
            name = recognizedText.blocks[nameIndex].lines[1].text;
          }
          int surnameIndex = recognizedText.blocks
              .indexWhere((b) => b.lines.first.text.contains('Surname'));
          if (!surnameIndex.isNegative && surnameIndex != 0) {
            name =
                "$name ${recognizedText.blocks[surnameIndex + 1].lines[0].text}";
          }
          // print(name);

          int dobIndex = recognizedText.blocks
              .indexWhere((b) => b.lines.first.text.contains('Date of Birth'));
          if (!dobIndex.isNegative && dobIndex != 0) {
            dob = recognizedText.blocks[dobIndex].lines[1].text;
          }
          // print(dob);
          if (kDebugMode) {
            print(docNumber.toString());
            print(dob);
            print(name.toString());
          }
          break;
        case KYCType.BRITISH_ID:
          List<String> ds = temp
              .where((e) => e.contains(RegExp(r'^\d{2}[\-\/]\d{2}[\-\/]\d{4}')))
              .toList();
          // print(ds);
          List<DateTime> dates = ds
              .map((e) => DateTime.parse(
                  e.replaceAll('/', '-').split('-').reversed.join('-')))
              .toList();
          // print(dates);
          dates.sort((a, b) => a.compareTo(b));
          dob = dates.first.toString();
          startD = dates[1].toString();
          endD = dates.last.toString();
          // print(dob);
          // print(startD);
          // print(endD);
          docNumber = temp
              .where((e) => e.contains(RegExp(r'((?:\d *){8} *\d) *$')))
              .toString();
          // print(docNumber.toString());

          int nameIndex = recognizedText.blocks
              .indexWhere((b) => b.lines.first.text.contains('Surname'));
          if (!nameIndex.isNegative && nameIndex != 0) {
            name = recognizedText.blocks[nameIndex].text;
          }
          int surnameIndex = recognizedText.blocks
              .indexWhere((b) => b.lines.first.text.contains('Given names'));
          if (!surnameIndex.isNegative && surnameIndex != 0) {
            name = "$name ${recognizedText.blocks[surnameIndex].text}";
          }
          if (kDebugMode) {
            print(docNumber.toString());
            print(dob);
            print(startD);
            print(endD);
            print(name.toString());
          }
          break;
        case KYCType.NIGERIAN_ID:
          docNumber = temp
              .where((e) => e.contains(RegExp(r'((?:\d *){8} *\d) *$')))
              .toString();
          // print(docNumber.toString());

          int surnameIndex = recognizedText.blocks.indexWhere(
              (b) => b.lines.first.text.toLowerCase().contains('surname'));
          if (!surnameIndex.isNegative && surnameIndex != 0) {
            name = recognizedText.blocks[surnameIndex].lines[1].text;
          }

          int nameIndex = recognizedText.blocks.indexWhere(
              (b) => b.lines.first.text.toLowerCase().contains('first name'));
          if (!nameIndex.isNegative && nameIndex != 0) {
            name =
                "$name ${recognizedText.blocks[nameIndex + 1].lines[0].text}";
          }
          // print(name);

          int dobIndex = recognizedText.blocks.indexWhere((b) =>
              b.lines.first.text.toLowerCase().contains('date of birth'));
          if (!dobIndex.isNegative && dobIndex != 0) {
            dob = recognizedText.blocks[dobIndex + 1].lines[0].text;
          }
          // print(dob);

          int startDateIndex = recognizedText.blocks.indexWhere(
              (b) => b.lines.first.text.toLowerCase().contains('issue date'));
          if (!startDateIndex.isNegative && startDateIndex != 0) {
            startD = recognizedText.blocks[startDateIndex + 1].lines[0].text;
          }
          // print(startD);

          endD = temp
              .where((e) => e.contains(RegExp(r'^\d{2}[\/\/]\d{2}')))
              .toString();
          // print(endD);
          if (kDebugMode) {
            print(docNumber.toString());
            print(dob);
            print(startD);
            print(endD);
            print(name.toString());
          }

        case KYCType.BILL_RECEIPT:
        // TODO: Handle this case.
        case KYCType.NATIONAL_ID:
        // TODO: Handle this case.
        case KYCType.UAE_PASSPORT:
        // TODO: Handle this case.
      }
    } else if (isFront == false) {
      switch (AppConfigs.docType) {
        case KYCType.BILL_RECEIPT:
        // TODO: Handle this case.
        case KYCType.DRIVING_LICENCE:
        // TODO: Handle this case.
        case KYCType.EMIRATES_ID:
          try {
            docNumber =
                temp.where((e) => e.contains(RegExp(r'^\d{9}'))).toString();
            if (kDebugMode) {
              print(docNumber);
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }

          try {
            int occupationIndex = recognizedText.blocks.indexWhere(
                (b) => b.lines.first.text.toLowerCase().contains('ccupation:'));

            String designation = recognizedText
                .blocks[occupationIndex].lines[0].text
                .substring(11);
            occupation = designation;

            if (kDebugMode) {
              print(occupation);
            }
          } catch (e) {
            if (kDebugMode) {
              print(e);
            }
          }
          break;
        case KYCType.KUWAITI_ID:
        // TODO: Handle this case.
        case KYCType.QATAR_ID:
        // TODO: Handle this case.
        case KYCType.RSA_ID:
        // TODO: Handle this case.
        case KYCType.NATIONAL_ID:
        // TODO: Handle this case.
        case KYCType.NIGERIAN_ID:
        // TODO: Handle this case.
        case KYCType.BRITISH_ID:
        // TODO: Handle this case.
        case KYCType.PASSPORT:
        // TODO: Handle this case.
        case KYCType.UAE_PASSPORT:
        // TODO: Handle this case.
      }
    }
    update();
  }

  Future<bool> requestFilePermission() async {
    PermissionStatus result;
    if (Platform.isAndroid) {
      result = await Permission.storage.request();
    } else {
      result = await Permission.photos.request();
    }
    if (result.isGranted) {
      return true;
    } else {
      return false;
    }
  }

  bool hasCameraPermission = false;
  bool hasGalleryPermission = false;

  void openDocSheet(
      {KYCType? type,
      bool? isFront,
      bool isFromReceipt = false,
      bool isCrop = true}) {
    errorText = '';
    idErrorText = '';
    update();
    Get.bottomSheet(
      Container(
        width: double.infinity,
        height: 115 + MediaQuery.of(Get.context!).padding.bottom,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(46),
            topRight: Radius.circular(46),
          ),
          border: Border.all(color: const Color(0xffd8d8d8), width: 1),
          color: const Color(0xffffffff),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          Get.back();
                          try {
                            if (isFront != null) {
                              Get.to(() => IDScanScreen(
                                    captureType:
                                        isFront == true ? 'front' : 'back',
                                    onCompleted: (img) {
                                      onCapture(img, isFront, type: type);
                                    },
                                  ));
                            } else {
                              await pickFile(isFront, ImageSource.camera,
                                  type: type, isCrop: isCrop);
                            }
                          } catch (e) {
                            requestCameraPermission();
                          }
                        },
                        child: Container(
                          width: 57,
                          height: 57,
                          margin: const EdgeInsets.only(
                              top: 15, bottom: 5, left: 20, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(29)),
                            color: AppConfigs.primaryColor.withAlpha(50),
                          ),
                          child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: SvgPicture.asset(
                                ImagePath.openCamera,
                                colorFilter: ColorFilter.mode(
                                    AppConfigs.primaryColor, BlendMode.srcIn),
                              )),
                        ),
                      ),
                      const SizedBox(
                        height: 4.9,
                      ),
                      Text('open_camera'.tr,
                          style: TextStyles.font12
                              .copyWith(fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center),
                    ],
                  ),
                  isFromReceipt == true
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Get.back();
                                try {
                                  await pickFromDocument(
                                      isFront: isFront,
                                      type: type,
                                      isCrop: isCrop);
                                } catch (e) {
                                  openAppSettings();
                                }
                              },
                              child: Container(
                                width: 57,
                                height: 57,
                                margin: const EdgeInsets.only(
                                    top: 15, bottom: 5, left: 20, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29)),
                                  color: AppConfigs.primaryColor.withAlpha(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                    ImagePath.openGallery,
                                    colorFilter: ColorFilter.mode(
                                        AppConfigs.primaryColor,
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4.9,
                            ),
                            Text('open_gallery'.tr,
                                style: TextStyles.font12
                                    .copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          ],
                        )
                      : Box3.settings.EnableGallery == true
                          ? Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Get.back();
                                    try {
                                      await pickFromDocument(
                                          isFront: isFront,
                                          type: type,
                                          isCrop: isCrop);
                                    } catch (e) {
                                      openAppSettings();
                                    }
                                  },
                                  child: Container(
                                    width: 57,
                                    height: 57,
                                    margin: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 5,
                                        left: 20,
                                        right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(29)),
                                      color:
                                          AppConfigs.primaryColor.withAlpha(50),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.all(15),
                                        child: SvgPicture.asset(
                                          ImagePath.openGallery,
                                          colorFilter: ColorFilter.mode(
                                              AppConfigs.primaryColor,
                                              BlendMode.srcIn),
                                        )),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.9,
                                ),
                                Text('open_gallery'.tr,
                                    style: TextStyles.font12
                                        .copyWith(fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center),
                              ],
                            )
                          : const SizedBox(),
                  isFromReceipt == true
                      ? Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                Get.back();
                                try {
                                  await pickFromDocument(
                                      isFront: isFront,
                                      type: type,
                                      isCrop: isCrop);
                                } catch (e) {
                                  openAppSettings();
                                }
                              },
                              child: Container(
                                width: 57,
                                height: 57,
                                margin: const EdgeInsets.only(
                                    top: 15, bottom: 5, left: 20, right: 20),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(29)),
                                  color: AppConfigs.primaryColor.withAlpha(50),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15),
                                  child: SvgPicture.asset(
                                    ImagePath.openFile,
                                    colorFilter: ColorFilter.mode(
                                        AppConfigs.primaryColor,
                                        BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4.9,
                            ),
                            Text('open_files'.tr,
                                style: TextStyles.font12
                                    .copyWith(fontWeight: FontWeight.w600),
                                textAlign: TextAlign.center),
                          ],
                        )
                      : Box3.settings.EnableFile == true
                          ? Column(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    Get.back();
                                    try {
                                      await pickFromDocument(
                                          isFront: isFront,
                                          type: type,
                                          isCrop: isCrop);
                                    } catch (e) {
                                      openAppSettings();
                                    }
                                  },
                                  child: Container(
                                    width: 57,
                                    height: 57,
                                    margin: const EdgeInsets.only(
                                        top: 15,
                                        bottom: 5,
                                        left: 20,
                                        right: 20),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(29)),
                                      color:
                                          AppConfigs.primaryColor.withAlpha(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: SvgPicture.asset(
                                        ImagePath.openFile,
                                        colorFilter: ColorFilter.mode(
                                            AppConfigs.primaryColor,
                                            BlendMode.srcIn),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.9,
                                ),
                                Text('open_files'.tr,
                                    style: TextStyles.font12
                                        .copyWith(fontWeight: FontWeight.w600),
                                    textAlign: TextAlign.center),
                              ],
                            )
                          : const SizedBox(
                              width: 1,
                            ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(Get.context!).padding.bottom,
              color: const Color(0xffffffff),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> requestCameraPermission() async {
    await Permission.camera.onDeniedCallback(() {
      openAppSettings();
    }).onGrantedCallback(() {
      openAppSettings();
    }).onPermanentlyDeniedCallback(() {
      openAppSettings();
    }).onRestrictedCallback(() {
      openAppSettings();
    }).onLimitedCallback(() {
      openAppSettings();
    }).onProvisionalCallback(() {
      openAppSettings();
    }).request();
  }

  static const List<String> fileSize = ["B", "KB", "MB"];

  Future<String> getFileSize(String filepath, int decimals) async {
    var file = File(filepath);
    int bytes = await file.length();
    if (bytes <= 0) return "0 B";
    const suffixes = fileSize;
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  Future<void> selfieVideoPicker() async {
    selfieErrorText = '';
    update();
    final ImagePicker picker = ImagePicker();

    try {
      // cameraVideo = await picker.pickVideo(source: ImageSource.camera, maxDuration: const Duration(seconds: 10));
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
      requestCameraPermission();
    }

    if (cameraVideo != null) {
      videoPlayerController =
          VideoPlayerController.file(File(cameraVideo!.path));
      await videoPlayerController!.initialize();
      update();
    }
  }

  Future<bool> uploadDocumentWithCustomerCode(
      {String? customerCode, String? idNumber}) async {
    Get.dialog(DocumentUploading(), barrierDismissible: false);
    List<bool> list = [
      await ApiService().uploadMediaDocumentNew(
          isAfterSignUp: true,
          validationValue: idNumber,
          file: XFile(cacheFrontDocPath[AppConfigs.docType]!),
          customerCode: customerCode,
          documentUploadType: 'IDFRONT'),
      await ApiService().uploadMediaDocumentNew(
          isAfterSignUp: true,
          validationValue: idNumber,
          customerCode: customerCode,
          file: XFile(cacheBackDocPath[AppConfigs.docType]!),
          documentUploadType: 'IDBACK'),
      await ApiService().uploadMediaDocumentNew(
          isAfterSignUp: true,
          validationValue: idNumber,
          customerCode: customerCode,
          file: XFile(cacheSelfieImage!.path),
          documentUploadType: 'SELFIE_IMAGE'),
      await ApiService().uploadMediaDocumentNew(
          isAfterSignUp: true,
          validationValue: idNumber,
          customerCode: customerCode,
          file: XFile(cacheCameraVideo!.path),
          documentUploadType: 'VIDEO_KYC')
    ];
    if (Get.isDialogOpen!) Get.back();
    if (list[0] && list[1] && list[2] && list[3]) {
      return true;
    } else {
      Get.showSnackbar(GetSnackBar(
        message: "Document uploading failed please try again",
        duration: Duration(seconds: 2),
      ));
      await Future.delayed(Duration(seconds: 2));
      return false;
    }
  }
}
