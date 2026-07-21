import 'package:get/get.dart';

import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';
import '../../network/api_service_new.dart';
import '../../others/box3.dart';
import '../editing_controllers.dart/attributes.dart';

class BottomSheetController extends GetxController {
  RxBool isLoading = false.obs;
  RxList<MasterResponseFZ> l = <MasterResponseFZ>[].obs;
  RxList<MasterResponseFZ> list = <MasterResponseFZ>[].obs;

  void updateList(listData) {
    list.value = listData;
    l.value = listData;
    update();
  }

  Future<void> getSourcesNew(FormFieldItem f, FormParameters form, dynamic controller, {Map<String, dynamic>? data}) async {
    isLoading.value = true;
    if (f.ApiKey == "listbank" || f.ApiKey == "listbranch" || f.ApiKey == "listserviceprovider") {
      return;
    }
    form.sources[f.ApiKey] = await ApiService().getCatalogue(typeData: {"Type": f.ApiKey, "LanguageCode": Box3.lang?.Code ?? "EN"}, type: f.ApiKey);
    updateList(form.sources[f.ApiKey]);
    controller.update();
    isLoading.value = false;
    // update();
  }

  Future<List<MasterResponseFZ>> getSource(String key) async {
    List<MasterResponseFZ> list = [];
    if (key == "listbank" || key == "listbranch" || key == "listserviceprovider") {
      return [];
    }
    list = await ApiService().getCatalogue(typeData: {"Type": key, "LanguageCode": Box3.lang?.Code ?? "EN"}, type: key);
    return list;
  }
}
