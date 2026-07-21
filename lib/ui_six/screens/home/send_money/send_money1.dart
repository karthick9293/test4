import 'dart:async';

import 'package:dotted_border/dotted_border.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mobiremit/models/masters/master_response_fz.dart';
import 'package:mobiremit/ui_six/screens/form_rules_form/send_money_form_rule.dart';
import 'package:mobiremit/ui_six/shimmers/dropdown_shimmers.dart';

import '../../../../core/exports/controllers.dart';
import '../../../../core/exports/ui_six_custom_widgets.dart';
import '../../../../core/flavours/constants.dart';
import '../../../../models/beneficiary/beneficiary_fz.dart';
import '../../../../ui_four/shimmers/beneficiary_simmer.dart';
import '../../../custom_widgets/currency_dropdown_dashboard.dart';
import 'favourite_beneficiary_tab.dart';
import 'recent_transactions_tab.dart';
import 'select_beneficiary_tab.dart';

class SendMoneyPage1 extends StatelessWidget {
  const SendMoneyPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final tfContrl = Get.find<TransferController>();
    tfContrl.tabIdex.value = 0;
    tfContrl.reArrangeBeneficiaryList();
    tfContrl.isFormUpdating = false;

    return GetBuilder<TransferController>(builder: (transferController) {
      transferController.getData();
      return Stack(
        children: [
          Container(
            color: transferController.isDark ? null : const Color(0xfff8faff),
            child: DefaultTabController(
              length: 3,
              child: Builder(builder: (context) {
                final TabController tabController =
                    DefaultTabController.of(context);

                tabController.addListener(() {
                  if (!tabController.indexIsChanging) {
                    transferController.tabIdex.value = tabController.index;
                  }
                });
                // tabController.animation?.addListener(() {
                //   final newIndex = tabController.animation!.value.round();
                //   if (transferController.tabIdex.value != newIndex) {
                //     transferController.tabIdex.value = newIndex;
                //   }
                // });

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildStepper(),
                    const SizedBox(height: 20),
                    Expanded(
                      child: ListView(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        children: [
                          // Obx(
                          //   () => ClipRect(
                          //     child: AnimatedContainer(
                          //       duration: Duration(milliseconds: 300),
                          //       height: transferController.getTabviewHeight(),
                          //       child: TabBarView(children: [
                          //         selectBeneficiaryTab(),
                          //         favouriteBeneficiaryTab(),
                          //         recentTransactionsTab(),
                          //       ]),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(height: 30),
                          _buildSectionTitle("Selected Beneficiary"),
                          const SizedBox(height: 10),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: transferController.listLoading ||
                                    transferController.syncingBeneficiaries
                                ? SizedBox(
                                    height: 100,
                                    child: BeneficiaryShimmer(
                                      profileHeight: 50,
                                      itemLength: 1,
                                    ),
                                  )
                                : buildBeneficiaryDropdown(transferController),
                          ),
                          _buildSelectedBeneficiaryCard(transferController),

                          /// send money form rules
                          Visibility(
                            visible:
                                transferController.selectedBeneficiary != null,
                            // &&
                            //     (transferController.serviceType ==
                            //             ServiceType.CASH_PICKUP ||
                            //         transferController.serviceType ==
                            //             ServiceType.WALLET_TRANNSFER),

                            child: SendMoneyFormRule(
                                controller: transferController),
                          ),
                          SizedBox(height: 15),
                          _buildAmountCard(transferController, context),
                          Obx(
                            () => Visibility(
                              visible: transferController.selectedBeneficiary !=
                                      null &&
                                  transferController.sourcePurposeVisibility,
                              child: transferController
                                      .loadingSourceNpurpose.isTrue
                                  ? Padding(
                                      padding: EdgeInsets.only(
                                          left: S.p, top: 20, right: S.p),
                                      child: DropdownShimmers(),
                                    )
                                  : Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _buildSectionTitle(
                                            "${'source_of_income'.tr} *"),
                                        customDropdown<MasterResponseFZ>(
                                            key: transferController
                                                .sourceDropdownKey,
                                            top: 5,
                                            buttonHeight: 50,
                                            value: transferController
                                                .selectedSource,
                                            error:
                                                transferController.sourceError,
                                            borderRadius: 10,
                                            disableBorder: transferController
                                                        .selectedSource !=
                                                    null
                                                ? true
                                                : false,
                                            fillColor: transferController
                                                        .selectedSource !=
                                                    null
                                                ? AppConfigs.primaryColor
                                                    .withOpacity(0.1)
                                                : AppConfigs.w,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: transferController
                                                          .selectedSource ==
                                                      null
                                                  ? null
                                                  : AppConfigs.primaryColor,
                                            ),
                                            items: transferController.sources
                                                .map(
                                                    (e) => DropdownMenuItem<
                                                            MasterResponseFZ>(
                                                          value: e,
                                                          child: Text(
                                                            e.Desc,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TS.f14.copyWith(
                                                                color: transferController.selectedSource?.Desc == e.Desc
                                                                    ? AppConfigs.primaryColor
                                                                    : transferController.isDark
                                                                        ? AppConfigs.w
                                                                        : AppConfigs.g4),
                                                          ),
                                                        ))
                                                .toList(),
                                            onChanged: (e) {
                                              transferController
                                                ..selectedSource = e
                                                ..sourceError = false
                                                ..update();
                                            },
                                            hintText:
                                                'Please Select Source'.tr),
                                        errorText(transferController.sourceError
                                            ? 'required'.tr
                                            : ''),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        _buildSectionTitle(
                                            "${'purpose_of_sending_money'.tr} *"),
                                        //_buildPurposeGrid(transferController),

                                        customDropdown<MasterResponseFZ>(
                                            key: transferController
                                                .purposeDropdownKey,
                                            top: 5,
                                            buttonHeight: 50,
                                            value: transferController
                                                .selectedPurpose,
                                            error:
                                                transferController.purposeError,
                                            borderRadius: 10,
                                            disableBorder: transferController
                                                        .selectedPurpose !=
                                                    null
                                                ? true
                                                : false,
                                            fillColor: transferController
                                                        .selectedPurpose !=
                                                    null
                                                ? AppConfigs.primaryColor
                                                    .withOpacity(0.1)
                                                : AppConfigs.w,
                                            icon: Icon(
                                              Icons.keyboard_arrow_down,
                                              color: transferController
                                                          .selectedPurpose ==
                                                      null
                                                  ? null
                                                  : AppConfigs.primaryColor,
                                            ),
                                            items: transferController.purposes
                                                .map(
                                                    (e) => DropdownMenuItem<
                                                            MasterResponseFZ>(
                                                          value: e,
                                                          child: Text(
                                                            e.Desc,
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TS.f14.copyWith(
                                                                color: transferController.selectedPurpose?.Desc == e.Desc
                                                                    ? AppConfigs.primaryColor
                                                                    : transferController.isDark
                                                                        ? AppConfigs.w
                                                                        : AppConfigs.g4),
                                                          ),
                                                        ))
                                                .toList(),
                                            onChanged: (e) {
                                              transferController
                                                ..selectedPurpose = e
                                                ..purposeError = false
                                                ..update();
                                            },
                                            hintText:
                                                'Please Select Purpose'.tr),
                                        errorText(
                                            transferController.purposeError
                                                ? 'required'.tr
                                                : ''),
                                        Visibility(
                                            visible:
                                                transferController.rateCharge !=
                                                    null,
                                            child: rateChargeDetails(
                                                transferController))
                                      ],
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
          if (transferController.isFormUpdating ||
              transferController.formruleLoading) ...[
            ModalBarrier(
              color: Colors.black.withOpacity(0.1),
              dismissible: false,
            ),
            loader(),
          ],
        ],
      );
    });
  }

  Widget _buildAmountCard(
      TransferController transferController, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
      decoration: BoxDecoration(
        color: transferController.isDark
            ? Colors.white.withOpacity(0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppConfigs.primaryColor.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppConfigs.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      color: AppConfigs.primaryColor.withOpacity(0.3)),
                ),
                child: Text(
                  transferController.fromAmtCur ?? "AED",
                  style: TS.f16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: transferController.isDark
                          ? Colors.white
                          : AppConfigs.bf0),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    textFormField(
                      controller: transferController.fromAmountCtrl,
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      style: TS.f28B.copyWith(
                          fontSize: 36,
                          color: transferController.isDark
                              ? Colors.white
                              : AppConfigs.bf0),
                      hintStyle: TS.f28B.copyWith(
                          fontSize: 36,
                          color: transferController.isDark
                              ? Colors.white
                              : AppConfigs.bf0),
                      hintText: "0",
                      disableBorder: true,
                      left: 0,
                      top: 20,
                      bottom: 0,
                      filledColor:
                          transferController.isDark ? Colors.transparent : null,
                      errorText: transferController.fromAmtErr,
                      onChanged: (s) {
                        // if (s.isNotEmpty) {
                        //   transferController.updateToCurrency(s: s, type: 'L');
                        // } else {
                        //   transferController.toAmountCtrl.clear();
                        //   transferController.update();
                        // }

                        if (transferController.searchOnStoppedTyping != null) {
                          transferController.searchOnStoppedTyping!
                              .cancel(); // clear timer
                        }
                        if (s.isNotEmpty) {
                          if (double.parse(s) < 1) {
                            transferController
                              ..fromAmtErr = 'required minimum amount 1'
                              ..toAmtErr = ''
                              ..update();
                            return;
                          }
                          transferController
                            ..fromAmtErr = ''
                            ..toAmtErr = ''
                            ..update();

                          const duration = Duration(milliseconds: 1500);

                          transferController.searchOnStoppedTyping = Timer(
                              duration,
                              () => transferController.updateToCurrency(
                                  s: s, type: 'L'));
                        } else {
                          transferController
                            ..toAmountCtrl.clear()
                            ..rateCharge = null
                            ..update();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Divider(color: AppConfigs.primaryColor.withOpacity(0.1)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cms(Fields.SendMoney_ReceiverGets)
                          .textHeading!
                          .toUpperCase(),
                      style: TS.f12.copyWith(
                          color: AppConfigs.primaryColor.withOpacity(0.7),
                          fontWeight: FontWeight.w900),
                    ),
                    // const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${transferController.toAmtCur ?? "INR"} ",
                          style: TS.f18B.copyWith(color: AppConfigs.teal),
                        ),
                        Obx(
                          () => Visibility(
                            visible: transferController.rateLoader.value,
                            child: Align(
                              alignment: Alignment.center,
                              child: tinyLoader(),
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: TextField(
                              controller: transferController.toAmountCtrl,
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      decimal: true),
                              style: TS.f18B.copyWith(color: AppConfigs.teal),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "0",
                                hintStyle:
                                    TS.f18B.copyWith(color: AppConfigs.teal),
                              ),
                              onChanged: (s) {
                                if (transferController.searchOnStoppedTyping !=
                                    null) {
                                  transferController.searchOnStoppedTyping!
                                      .cancel();
                                }

                                if (s.isNotEmpty) {
                                  if (double.parse(s) < 1) {
                                    transferController
                                      ..fromAmtErr = ''
                                      ..toAmtErr = 'required minimum amount 1'
                                      ..update();
                                    return;
                                  }
                                  transferController
                                    ..fromAmtErr = ''
                                    ..toAmtErr = ''
                                    ..update();

                                  const duration = Duration(milliseconds: 1500);
                                  transferController.searchOnStoppedTyping =
                                      Timer(
                                    duration,
                                    () => transferController.updateToCurrency(
                                        s: s, type: 'F'),
                                  );
                                } else {
                                  transferController
                                    ..fromAmountCtrl.clear()
                                    ..rateCharge = null
                                    ..update();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (transferController.toAmtErr.isNotEmpty)
                      errorText(transferController.toAmtErr)
                  ],
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xffeef4ff),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "1 ${transferController.fromAmtCur} = ${transferController.rC?.chargeDetails?.divisionRate?.toStringAsFixed(2) ?? '0.00'} ${transferController.toAmtCur ?? 'INR'}",
                  style: TS.f12.copyWith(
                      color: const Color(0xff082f76),
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPurposeGrid(TransferController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.7,
        ),
        itemCount: controller.purposes.length,
        itemBuilder: (context, index) {
          final p = controller.purposes[index];
          bool isSelected = controller.selectedPurpose?.Desc == p.Desc;
          return GestureDetector(
            onTap: () {
              // try {
              //   controller.selectedPurpose = controller.purposes.firstWhere((element) => element.Desc == p['title']);
              // } catch (e) {
              //   // controller.selectedPurpose = MasterResponseFZ()..Desc = p['title'] as String?;
              // }
              controller
                ..selectedPurpose = p
                ..purposeError = false
                ..update();
              controller.update();
            },
            child: Container(
              decoration: BoxDecoration(
                color: isSelected
                    ? AppConfigs.primaryColor.withOpacity(0.1)
                    : controller.isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: isSelected
                      ? AppConfigs.primaryColor
                      : AppConfigs.primaryColor.withOpacity(0.1),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // p['isSvg'] == true
                  //     ? SvgPicture.asset(p['icon'] as String, height: 24, width: 24)
                  //     : Icon(p['icon'] as IconData, color: p['color'] as Color, size: 24),
                  // const SizedBox(height: 8),
                  Text(
                    p.Desc,
                    style: TS.f12.copyWith(
                      fontWeight: FontWeight.bold,
                      color:
                          isSelected ? AppConfigs.primaryColor : AppConfigs.bf0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStepper() {
    int currentStep = 1; // This could be managed by the controller later
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Get.find<AccountController>().isDark ? null : Colors.white,
          border: Border(
              bottom:
                  BorderSide(color: AppConfigs.primaryColor.withOpacity(0.4)))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 80,
            right: 80,
            top: 18,
            child: Container(
              width: Get.width,
              height: 2,
              color: AppConfigs.primaryColor.withOpacity(0.6),
              margin: const EdgeInsets.symmetric(horizontal: 5),
            ),
          ),
          Row(
            children: [
              Expanded(
                  child:
                      _stepCircle("1", currentStep >= 1, "Amount & Recipient")),
              Expanded(
                  child: _stepCircle("2", currentStep >= 2, "Confirm & Send")),
            ],
          ),
        ],
      ),
    );
  }

  Widget _stepCircle(String step, bool isActive, String label) {
    return Column(
      children: [
        Container(
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            color: isActive ? AppConfigs.primaryColor : Colors.white,
            shape: BoxShape.circle,
            border: isActive
                ? Border.all(
                    color: AppConfigs.primaryColor.withOpacity(0.2), width: 3)
                : Border.all(
                    color: AppConfigs.primaryColor.withOpacity(0.2), width: 2),
          ),
          child: Center(
            child: Text(
              step,
              style: TS.f14.copyWith(
                color: isActive
                    ? Colors.white
                    : AppConfigs.primaryColor.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TS.f12.copyWith(
            color: AppConfigs.primaryColor,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Text(
        title.toUpperCase(),
        style: TS.f14.copyWith(
            fontWeight: FontWeight.bold,
            color: AppConfigs.primaryColor.withOpacity(0.6)),
      ),
    );
  }

  Widget buildBeneficiaryDropdown(TransferController controller) {
    // print("Rerender beneficiary dropdown");
    return customDropdown<BeneficiaryFz>(
      value: controller.selectedBeneficiary,
      items: [
        ...controller.filteredBenefs.map((e) => DropdownMenuItem(
              value: e,
              child: Text("${e.name} (${e.serviceCurrency?.Code})"),
            )),
        if (Box3.settings.enableAddBenf)
          DropdownMenuItem(
            value: BeneficiaryFz(name: "add_new"),
            child: Text("+ Add New Beneficiary"),
          ),
      ],
      onChanged: (v) {
        // controller.selectedBeneficiary = v;
        if (v != null && v.name == "add_new") {
          controller.addBeneficiary();
          return;
        }
        controller.setBenef(v!);
        controller.update();
      },
      left: 0,
      right: 10,
      hintText: "Select Beneficiary",
      fillColor: Colors.white,
      borderRadius: 12,
      buttonStyleData: ButtonStyleData(
          height: 45,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: controller.isDark
                  ? Colors.white.withOpacity(0.1)
                  : Colors.white,
              border:
                  Border.all(color: AppConfigs.primaryColor.withOpacity(0.2)))),
      disableBorder: true,
    );
  }

  Widget _buildSelectedBeneficiaryCard(TransferController controller) {
    BeneficiaryFz? benef = controller.selectedBeneficiary;
    if (benef == null) return const SizedBox();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(
            radius: Radius.circular(20),
            color: AppConfigs.primaryColor.withOpacity(0.3)),
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: controller.isDark
                ? Colors.white.withOpacity(0.1)
                : AppConfigs.primaryColor.withOpacity(0.03),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xffe8efff),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    getShortName(benef.name ?? ""),
                    style: TS.f18B.copyWith(color: AppConfigs.primaryColor),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      benef.name ?? "",
                      style: TS.f16.copyWith(
                          fontWeight: FontWeight.bold, color: AppConfigs.bf0),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Text("${benef.serviceCurrency?.Code}",
                            style: TS.f12.copyWith(color: AppConfigs.g85)),
                        // Image.asset(currencyFlag(benef.serviceCurrency?.Code),
                        //     height: 12),

                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            (benef.serviceType?.Code == "B")
                                ? "${benef.bank?.Desc ?? ""}, ${benef.branch?.Desc ?? ""}"
                                : (benef.serviceType?.Code == "C")
                                    ? ", Cash Pickup"
                                    : benef.serviceCountry?.Desc ?? "",
                            style: TS.f12.copyWith(color: AppConfigs.g85),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      obscureText(benef.accountNumber ?? ""),
                      style: TS.f12.copyWith(color: AppConfigs.g85),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
