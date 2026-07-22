import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/beneficiary/beneficiary_fz.dart';
import '../exports/controllers.dart';

class BeneficiaryController extends GetxController {
  bool loading = !Get.find<DataController>().transactionAndBeneficiaryRetrieved, addBeneficiaryButtonLoading = false;
  int? favIndex, statsChangingIndex;
  bool isDark = Get.find<AccountController>().isDark, viewMoreDeails = false, isSelecting = false;
  bool showSearch = false;
  String selectedCountry = 'All';
  final countries = ['All', '🇮🇳 India', '🇵🇰 Pakistan', '🇵🇭 Philippines'];

  List<BeneficiaryFz> benefs = Get.find<DataController>().beneficiaries,
      markedBeneficiary = [],
      archivedBenefs = Get.find<DataController>().beneficiaries.where((e) => e.archive == 'A').toList();

  TextEditingController archiveSearchController = TextEditingController();
}
