import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/editing_controllers.dart/attributes.dart';
import '../../core/exports/controllers.dart';
import '../../core/exports/ui_two_custom_widgets.dart';
import '../../core/flavours/constants.dart';
import '../../models/form_rules/form_rules_response_fz.dart';
import '../../models/masters/master_response_fz.dart';

Widget genericBottomSheet(
    {String errorText = '',
    String value = '',
    dynamic controller,
    required String labelText,
    String? hintText,
    required void Function(MasterResponseFZ) onTap,
    bool showBack = false,
    bool enableSecondTheme = false,
    FormParameters? form,
    void Function(String)? onChanged,
    List<MasterResponseFZ>? selected,
    String? benefKey,
    String? beneListKey,
    String? custKey,
    String? credKey,
    String? sendMoneyKey,
    String? id,
    Color? fillColor = const Color(0xFFEFF6FF),
    Key? key,
    required bool isDark,
    required FormFieldItem? f,
    bool? enable = true,
    bool includeCheckbox = false}) {
  //.
  //...
  // ---------- on search event handler ----------- //
  void onSearchEvent(
    String v, {
    required SignUpController signUpController,
    required List<MasterResponseFZ> list,
  }) {
    if (f!.FzParamName != 'BeneficiaryBranchCode' &&
        f.FzParamName != 'AgentLocation') {
      signUpController.filteredList[f.FzParamName] = v.isNotEmpty
          ? list
              .where((d) => d.Desc.toLowerCase().contains(v.toLowerCase()))
              .toList()
          : list;
    } else {
      if (signUpController.ddSearchDebouncer?.isActive ?? false) {
        signUpController.ddSearchDebouncer!.cancel();
      }
      if (v.isNotEmpty) {
        signUpController.ddSearchDebouncer =
            Timer(const Duration(milliseconds: 1000), () async {
          await signUpController.reFetchSources(
            f,
            currentForm: form,
            searchText: v,
          );
        });
      } else {
        signUpController.filteredList[f.FzParamName] =
            signUpController.backupList[f.FzParamName] ?? [];
      }
    }
  }

  return GetBuilder<SignUpController>(
      init: SignUpController(),
      id: 'dropdown-list',
      builder: (signUpController) {
        MasterResponseFZ? selectedItem;
        if (form != null) {
          selectedItem = form.selectedSources[f?.FzParamName];
        }
        String search = labelText;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          signUpController.list.remove(f?.FzParamName);
          signUpController.filteredList.remove(f?.FzParamName);
          final List<MasterResponseFZ>? optionsFromRule =
              f != null && f.SetOptions.isNotEmpty ? f.setOptions() : null;
          final originalList =
              optionsFromRule != null && optionsFromRule.isNotEmpty
                  ? optionsFromRule
                  : labelText == 'Emirate *'
                      ? signUpController.emirates
                      : (beneListKey != null && beneListKey.isNotEmpty == true)
                          ? Get.find<AddBeneficiaryController>()
                                  .benefAttributes
                                  .fieldOptions[beneListKey] ??
                              []
                          : (custKey != null && custKey.isNotEmpty == true)
                              ? signUpController.form.sources[custKey] ?? []
                              : (credKey != null && credKey.isNotEmpty == true)
                                  ? signUpController.form.sources[credKey] ?? []
                                  : (benefKey != null &&
                                          benefKey.isNotEmpty == true)
                                      ? Get.find<AddBeneficiaryController>()
                                              .form
                                              .sources[benefKey] ??
                                          []
                                      : (sendMoneyKey != null &&
                                              sendMoneyKey.isNotEmpty == true)
                                          ? Get.find<TransferController>()
                                                  .form
                                                  .sources[sendMoneyKey] ??
                                              []
                                          : Get.find<AddBeneficiaryController>()
                                                  .form
                                                  .sources[id] ??
                                              [];

          final list = List<MasterResponseFZ>.from(originalList);
          list.sort(
              (e, b) => e.Desc.toLowerCase().compareTo(b.Desc.toLowerCase()));
          signUpController.list[f!.FzParamName] = list;
          signUpController.filteredList[f.FzParamName] = list;
          signUpController.backupList[f.FzParamName] = list;
        });

        return GestureDetector(
          onTap: enable == true
              ? () async {
                  if (f?.FzParamName != null) {
                    signUpController.filteredList[f!.FzParamName] =
                        signUpController.backupList[f.FzParamName] ??
                            signUpController.list[f.FzParamName] ??
                            [];
                  }
                  Get.focusScope?.unfocus();
                  Get.bottomSheet(
                    Obx(() {
                      List<MasterResponseFZ> list =
                          signUpController.list[f?.FzParamName] ?? [];
                      List<MasterResponseFZ> l =
                          signUpController.filteredList[f?.FzParamName] ?? [];
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color(0x2e000000),
                                  offset: Offset(0, 0),
                                  blurRadius: 10,
                                  spreadRadius: 0)
                            ],
                            color:
                                isDark ? Colors.grey.shade900 : AppConfigs.w),
                        child: SafeArea(
                          child: Column(
                            children: [
                              titleTile(labelText, isDark),
                              textFormField(
                                  labelText: 'Search Here',
                                  hintText: 'Search $hintText',
                                  bottom: 10,
                                  filledColor:
                                      AppConfigs.primaryColor.withOpacity(0.1),
                                  onChanged: (v) async {
                                    search = v;
                                    onSearchEvent(
                                      v,
                                      signUpController: signUpController,
                                      list: list,
                                    );
                                  }),
                              signUpController.loadingSources
                                      .contains(f?.FzParamName)
                                  ? loader()
                                  : l.isEmpty
                                      ? list.isNotEmpty
                                          ? Center(
                                              child: Text(
                                                '$search not found',
                                                style: TS.f16.copyWith(
                                                    color:
                                                        signUpController.isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.g4),
                                              ),
                                            )
                                          : Center(
                                              child: Text(
                                                'No results found',
                                                style: TS.f16.copyWith(
                                                    color:
                                                        signUpController.isDark
                                                            ? AppConfigs.w
                                                            : AppConfigs.g4),
                                              ),
                                            )
                                      : Expanded(
                                          child: ListView.builder(
                                            itemCount: l.length,
                                            itemBuilder: (c, i) => contentTile(
                                              onTap: onTap,
                                              data: l[i],
                                              isDark: signUpController.isDark,
                                              includeCheckbox: includeCheckbox,
                                              selected: selected,
                                              isBankBranches: id ==
                                                      'BeneficiaryBranchCode' ||
                                                  id == 'AgentLocation',
                                            ),
                                          ),
                                        )
                            ],
                          ),
                        ),
                      );
                    }),
                  );

                  // ::::::::----------- refetch the data if its empty -----------:::::::
                  if (f != null) {
                    final listForKey = signUpController.list[f.FzParamName];
                    final hasRuleOptions = f.SetOptions.isNotEmpty;
                    final needsRefetch = !hasRuleOptions &&
                        (listForKey == null || listForKey.isEmpty) &&
                        !signUpController.loadingSources
                            .contains(f.FzParamName);
                    if (needsRefetch) {
                      await signUpController.reFetchSources(f,
                          currentForm: form);
                    }
                  }
                }
              : null,
          child: enableSecondTheme
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // if (f != null)
                    //   Padding(
                    //     padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                    //     child: Text(
                    //       labelText,
                    //       style: TS.f14.copyWith(color: Get.find<TransferController>().isDark ? AppConfigs.g8f : AppConfigs.g4),
                    //     ),
                    //   ),
                    textFormField(
                      hintText: hintText,
                      labelText: labelText,
                      enabled: false,
                      controller: TextEditingController(text: value),
                      errorText: errorText,
                      filledColor: fillColor ??
                          (selectedItem != null
                              ? AppConfigs.primaryColor.withOpacity(0.1)
                              : null),
                      key: key,
                      top: 7,
                      borderRadius: 10,
                      style: selectedItem != null
                          ? TS.f14.copyWith(color: AppConfigs.primaryColor)
                          : null,
                      disableBorder: selectedItem != null ? true : false,
                      trailing: Icon(
                        Icons.keyboard_arrow_down,
                        color: selectedItem != null
                            ? AppConfigs.primaryColor
                            : null,
                      ),
                      // prefixIcon: Padding(
                      //   padding: const EdgeInsets.all(12.0),
                      //   child: SvgPicture.asset(
                      //     ImagePath.search2,
                      //     height: 11.8,
                      //     width: 12,
                      //     colorFilter:
                      //         ColorFilter.mode(Color(0xffd1d1d1), BlendMode.srcIn),
                      //   ),
                      // ),
                    ),
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: textFormField(
                    labelText: labelText,
                    hintText: hintText,
                    enabled: false,
                    controller: TextEditingController(text: value),
                    errorText: errorText,
                    filledColor: fillColor,
                    borderRadius: 12,
                    key: key,
                  ),
                ),
        );
      });
}

// Widget genericBottomSheet(
//     {String errorText = '',
//     String value = '',
//     dynamic controller,
//     required String labelText,
//     required void Function(MasterResponseFZ) onTap,
//     bool showBack = false,
//     void Function(String)? onChanged,
//     List<MasterResponseFZ>? selected,
//     String? benefKey,
//     String? beneListKey,
//     String? custKey,
//     String? credKey,
//     String? sendMoneyKey,
//     String? id,
//     Color? fillColor,
//     Key? key,
//     required bool isDark,
//     required FormFieldItem? f,
//     bool includeCheckbox = false}) {
//   String search = labelText;
//   List<MasterResponseFZ> list = labelText == 'Emirate *'
//       ? Get.find<SignUpController>().emirates
//       : (beneListKey != null && beneListKey.isNotEmpty == true)
//           ? Get.find<AddBeneficiaryController>().benefAttributes.fieldOptions[beneListKey] ?? []
//           : (custKey != null && custKey.isNotEmpty == true)
//               ? Get.find<SignUpController>().form.sources[custKey] ?? []
//               : (credKey != null && credKey.isNotEmpty == true)
//                   ? Get.find<SignUpController>().form.sources[credKey] ?? []
//                   : (benefKey != null && benefKey.isNotEmpty == true)
//                       ? Get.find<AddBeneficiaryController>().form.sources[benefKey] ?? []
//                       : (sendMoneyKey != null && sendMoneyKey.isNotEmpty == true)
//                           ? Get.find<TransferController>().form.sources[sendMoneyKey] ?? []
//                           : Get.find<AddBeneficiaryController>().form.sources[id] ?? [];
//   list.sort((e, b) => e.Desc.toLowerCase().compareTo(b.Desc.toLowerCase()));
//   List<MasterResponseFZ> l = list;
//   return GestureDetector(
//     onTap: () async {
//       if (list.isEmpty) {
//         Get.bottomSheet(Container(
//           decoration: BoxDecoration(
//               borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//               boxShadow: const [BoxShadow(color: Color(0x2e000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
//               color: isDark ? AppConfigs.b : AppConfigs.w),
//           child: Column(
//             children: [
//               titleTile(labelText, false),
//               SizedBox(
//                 height: 50,
//               ),
//               loader()
//             ],
//           ),
//         ));
//         if (f != null) {
//           list = await Get.put(BottomSheetController()).getSource(f.ApiKey);
//           l = list;
//           if (Get.isBottomSheetOpen!) Get.back();
//         } else {
//           await Future.delayed(Duration(seconds: 3), () {
//             Get.back();
//           });
//         }
//       }
//       Get.bottomSheet(
//         GetBuilder<SignUpController>(
//           builder: (signUpController) {
//             return Container(
//               decoration: BoxDecoration(
//                   borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
//                   boxShadow: const [BoxShadow(color: Color(0x2e000000), offset: Offset(0, 0), blurRadius: 10, spreadRadius: 0)],
//                   color: isDark ? AppConfigs.b : AppConfigs.w),
//               child: Column(
//                 children: [
//                   titleTile(labelText, false),
//                   textFormField(
//                       labelText: 'Search Here',
//                       bottom: 10,
//                       onChanged: (v) {
//                         search = v;
//                         l = v.isNotEmpty ? list.where((d) => d.Desc.toLowerCase().contains(v.toLowerCase())).toList() : list;
//                         signUpController.update();
//                       }),
//                   l.isEmpty
//                       ? list.isNotEmpty
//                           ? Center(child: Text("$search not found"))
//                           : loader()
//                       : Expanded(
//                           child: ListView.builder(
//                             itemCount: l.length,
//                             itemBuilder: (c, i) =>
//                                 contentTile(onTap: onTap, data: l[i], isDark: false, includeCheckbox: includeCheckbox, selected: selected),
//                           ),
//                         )
//                 ],
//               ),
//             );
//           },
//         ),
//       );
//     },
//     child: textFormField(labelText: labelText, enabled: false, controller: TextEditingController(text: value), errorText: errorText, key: key),
//   );
// }

Widget genericBottomSheet3(
    {String errorText = '',
    String value = '',
    dynamic controller,
    required String labelText,
    required void Function(MasterResponseFZ) onTap,
    bool showBack = false,
    void Function(String)? onChanged,
    List<MasterResponseFZ>? selected,
    required List<MasterResponseFZ> list,
    Key? key,
    required bool isDark,
    bool includeCheckbox = false}) {
  list.sort((e, b) => e.Desc.toLowerCase().compareTo(b.Desc.toLowerCase()));
  List<MasterResponseFZ> l = list;
  return GestureDetector(
    onTap: () {
      Get.bottomSheet(
        GetBuilder<SignUpController>(
          builder: (signUpController) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0x2e000000),
                        offset: Offset(0, 0),
                        blurRadius: 10,
                        spreadRadius: 0)
                  ],
                  color: isDark ? AppConfigs.b : AppConfigs.w),
              child: Column(
                children: [
                  titleTile(labelText, false),
                  textFormField(
                      labelText: 'Search Here',
                      bottom: 10,
                      onChanged: (v) {
                        l = v.isNotEmpty
                            ? list
                                .where((d) => d.Desc.toLowerCase()
                                    .contains(v.toLowerCase()))
                                .toList()
                            : list;
                        signUpController.update();
                      }),
                  l.isEmpty
                      ? loader()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: l.length,
                            itemBuilder: (c, i) => contentTile(
                                onTap: onTap,
                                data: l[i],
                                isDark: false,
                                includeCheckbox: includeCheckbox,
                                selected: selected),
                          ),
                        )
                ],
              ),
            );
          },
        ),
      );
    },
    child: textFormField(
        labelText: labelText,
        enabled: false,
        noPad: true,
        controller: TextEditingController(text: value),
        errorText: errorText,
        key: key),
  );
}

Widget genericBottomSheet2(
    {String errorText = '',
    String value = '',
    dynamic controller,
    required String labelText,
    required void Function(MasterResponseFZ) onTap,
    bool showBack = false,
    void Function(String)? onChanged,
    List<MasterResponseFZ>? selected,
    String? benefKey,
    String? beneListKey,
    String? custKey,
    String? credKey,
    String? sendMoneyKey,
    String? id,
    Key? key,
    required bool isDark,
    Color? fillColor,
    bool includeCheckbox = false}) {
  List<MasterResponseFZ> list = labelText == 'Emirate *'
      ? Get.find<SignUpController>().emirates
      : (beneListKey != null && beneListKey.isNotEmpty == true)
          ? Get.find<AddBeneficiaryController>()
                  .benefAttributes
                  .fieldOptions[beneListKey] ??
              []
          : (custKey != null && custKey.isNotEmpty == true)
              ? Get.find<SignUpController>().form.sources[custKey] ?? []
              : (credKey != null && credKey.isNotEmpty == true)
                  ? Get.find<SignUpController>().form.sources[credKey] ?? []
                  : (benefKey != null && benefKey.isNotEmpty == true)
                      ? Get.find<AddBeneficiaryController>()
                              .form
                              .sources[benefKey] ??
                          []
                      : (sendMoneyKey != null &&
                              sendMoneyKey.isNotEmpty == true)
                          ? Get.find<TransferController>()
                                  .form
                                  .sources[sendMoneyKey] ??
                              []
                          : Get.find<AddBeneficiaryController>()
                                  .form
                                  .sources[id] ??
                              [];
  List<MasterResponseFZ> l = list;
  return GestureDetector(
    onTap: () {
      Get.bottomSheet(GetBuilder<TransferController>(
        builder: (transferController) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                boxShadow: const [
                  BoxShadow(
                      color: Color(0x2e000000),
                      offset: Offset(0, 0),
                      blurRadius: 10,
                      spreadRadius: 0)
                ],
                color: isDark ? AppConfigs.b : AppConfigs.w),
            child: Column(
              children: [
                titleTile(labelText, false),
                textFormField(
                    labelText: 'Search Here',
                    bottom: 10,
                    onChanged: (v) {
                      l = v.isNotEmpty
                          ? list
                              .where((d) => d.Desc.toLowerCase()
                                  .contains(v.toLowerCase()))
                              .toList()
                          : list;
                      transferController.update();
                    }),
                l.isEmpty
                    ? loader()
                    : Expanded(
                        child: ListView.builder(
                          itemCount: l.length,
                          itemBuilder: (c, i) => contentTile(
                              onTap: onTap,
                              data: l[i],
                              isDark: false,
                              includeCheckbox: includeCheckbox,
                              selected: selected),
                        ),
                      )
              ],
            ),
          );
        },
      ));
    },
    child: textFormField(
        labelText: labelText,
        filledColor: fillColor,
        enabled: false,
        controller: TextEditingController(text: value),
        errorText: errorText,
        key: key),
  );
}

Widget genericBottomSheet4(
    {String errorText = '',
    String value = '',
    dynamic controller,
    required String labelText,
    required void Function(MasterResponseFZ) onTap,
    bool showBack = false,
    void Function(String)? onChanged,
    List<MasterResponseFZ>? selected,
    String? benefKey,
    String? beneListKey,
    String? custKey,
    String? credKey,
    String? sendMoneyKey,
    String? id,
    Key? key,
    required bool isDark,
    Color? fillColor,
    required FormFieldItem formItem,
    bool includeCheckbox = false}) {
  return GestureDetector(
    onTap: () {
      Get.bottomSheet(BottomSheetContainer(
        labelText: labelText,
        onTap: onTap,
        isDark: isDark,
        sendMoneyKey: sendMoneyKey,
        onChanged: onChanged,
        key: key,
        fillColor: fillColor,
        custKey: custKey,
        credKey: credKey,
        controller: controller,
        beneListKey: beneListKey,
        benefKey: benefKey,
        id: id,
        selected: selected,
        formItem: formItem,
      ));
    },
    child: textFormField(
        labelText: labelText,
        filledColor: fillColor,
        enabled: false,
        controller: TextEditingController(text: value),
        errorText: errorText,
        key: key),
  );
}

class BottomSheetContainer extends StatefulWidget {
  final String errorText;
  final String value;
  final dynamic controller;
  final String labelText;
  final void Function(MasterResponseFZ) onTap;
  final bool showBack = false;
  final void Function(String)? onChanged;
  final List<MasterResponseFZ>? selected;
  final String? benefKey;
  final String? beneListKey;
  final String? custKey;
  final String? credKey;
  final String? sendMoneyKey;
  final String? id;
  final bool isDark;
  final Color? fillColor;
  final bool includeCheckbox = false;
  final FormFieldItem formItem;

  const BottomSheetContainer(
      {super.key,
      this.benefKey,
      this.beneListKey,
      this.custKey,
      this.credKey,
      this.sendMoneyKey,
      this.id,
      this.controller,
      required this.labelText,
      required this.onTap,
      this.onChanged,
      this.selected,
      required this.isDark,
      this.fillColor,
      this.errorText = "",
      this.value = "",
      required this.formItem});

  @override
  State<BottomSheetContainer> createState() => _BottomSheetContainerState();
}

class _BottomSheetContainerState extends State<BottomSheetContainer> {
  bool _isLoading = false;
  List<MasterResponseFZ> l = [];
  List<MasterResponseFZ> list = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    setState(() {
      _isLoading = true;
    });
    if (widget.labelText == 'Emirate *') {
      list = Get.find<SignUpController>().emirates;
    } else if (widget.beneListKey != null &&
        widget.beneListKey?.isNotEmpty == true) {
      list = Get.find<AddBeneficiaryController>()
              .benefAttributes
              .fieldOptions[widget.beneListKey] ??
          [];
    } else if (widget.custKey != null && widget.custKey?.isNotEmpty == true) {
      Get.find<SignUpController>().form.sources[widget.custKey] ?? [];
    } else if (widget.credKey != null && widget.credKey?.isNotEmpty == true) {
      Get.find<SignUpController>().form.sources[widget.credKey] ?? [];
    } else if (widget.benefKey != null && widget.benefKey?.isNotEmpty == true) {
      if (Get.find<AddBeneficiaryController>().form.sources[widget.benefKey] !=
          null) {
        list = Get.find<AddBeneficiaryController>()
                .form
                .sources[widget.benefKey] ??
            [];
      } else {
        await Get.find<AddBeneficiaryController>()
            .getSourcesNew(widget.formItem);
        list = Get.find<AddBeneficiaryController>()
                .form
                .sources[widget.benefKey] ??
            [];
      }
    } else if (widget.sendMoneyKey != null &&
        widget.sendMoneyKey?.isNotEmpty == true) {
      Get.find<TransferController>().form.sources[widget.sendMoneyKey] ?? [];
    } else {
      Get.find<AddBeneficiaryController>().form.sources[widget.id] ?? [];
    }
    l = list;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: const [
            BoxShadow(
                color: Color(0x2e000000),
                offset: Offset(0, 0),
                blurRadius: 10,
                spreadRadius: 0)
          ],
          color: widget.isDark ? AppConfigs.b : AppConfigs.w),
      child: Column(
        children: [
          titleTile(widget.labelText, false),
          textFormField(
              labelText: 'Search Here',
              bottom: 10,
              onChanged: (v) {
                l = v.isNotEmpty
                    ? list
                        .where((d) =>
                            d.Desc.toLowerCase().contains(v.toLowerCase()))
                        .toList()
                    : list;
                setState(() {});
              }),
          _isLoading
              ? loader()
              : Expanded(
                  child: ListView.builder(
                    itemCount: l.length,
                    itemBuilder: (c, i) => contentTile(
                        onTap: widget.onTap,
                        data: l[i],
                        isDark: false,
                        includeCheckbox: widget.includeCheckbox,
                        selected: widget.selected),
                  ),
                )
        ],
      ),
    );
  }
}
