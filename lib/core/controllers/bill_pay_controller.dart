import 'package:get/get.dart';

import '../exports/controllers.dart';
import '../flavours/constants.dart';

class BillPayController extends GetxController {
  bool isDark = Get.find<AccountController>().isDark;
  BillType billType = BillType.dth;
  String title = 'DTH'.tr;

  void setBillType(BillType b) {
    billType = b;
    switch (b) {
      case BillType.dth:
        title = 'DTH'.tr;
        break;
      case BillType.elec:
        title = 'Electricity'.tr;
        break;
      case BillType.wifi:
        title = 'Wi-Fi'.tr;
        break;
      case BillType.gas:
        title = 'Gas'.tr;
        break;
      case BillType.mobile:
        title = 'mobile_recharge'.tr;
        break;
    }
    update();
  }
}
