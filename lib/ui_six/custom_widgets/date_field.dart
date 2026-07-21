import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:mobiremit/models/application_settings/settings_fz.dart';

import '../../core/controllers/account_controller.dart';
import '../../core/flavours/constants.dart';

Widget dateField(
    {required List<TextEditingController> ctrls,
    required List<FocusNode> nodes,
    required Function() update,
    void Function()? onComplete,
    required void Function(bool, {DateTime? date}) erfc,
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    String error = '',
    double left = 20,
    double right = 20,
    double bottom = 10,
    double height = 50,
    double topMargin = 8,
    String? title,
    Color? textColor,
    Key? key,
    required context}) {
  // Helper function to validate the date
  void validateDate() {
    try {
      int d = int.parse(ctrls[0].text);
      int m = int.parse(ctrls[1].text);
      int y = int.parse(ctrls[2].text);

      DateTime dt = DateTime(y, m, d);

      if (dt.year == y &&
          dt.month == m &&
          dt.day == d &&
          (lastDate != null ? dt.isBefore(lastDate) : true) &&
          (firstDate != null ? dt.isAfter(firstDate) : true)) {
        if (nodes.length > 3) {
          nodes[3].requestFocus();
        }

        if (onComplete != null) {
          onComplete();
        }

        erfc(true, date: dt);
      } else {
        erfc(false);
      }
    } catch (e) {
      erfc(false);
    }
  }

  Widget field(
      {required TextEditingController c,
      required FocusNode n1,
      FocusNode? n2,
      FocusNode? previousNode,
      required String ht,
      void Function()? onEditingComplete,
      void Function()? onTap,
      void Function(String)? onChanged}) {
    return GetBuilder<AccountController>(builder: (ac) {
      return Container(
        margin: EdgeInsets.only(top: topMargin),
        width: ht == 'YYYY' ? 50 : 30,
        height: 30,
        child: KeyboardActions(
          config: _buildConfig(n1),
          disableScroll: true,
          child: KeyboardListener(
            focusNode: FocusNode(),
            onKeyEvent: (KeyEvent event) {
              if (event is KeyDownEvent) {
                if (event.logicalKey == LogicalKeyboardKey.backspace) {
                  // If field is empty and backspace is pressed, move to previous field
                  if (c.text.isEmpty && previousNode != null) {
                    previousNode.requestFocus();
                  }
                }
              }
            },
            child: TextField(
              controller: c,
              style: TS.f16.copyWith(color: ac.isDark ? AppConfigs.w : textColor ?? AppConfigs.g4),
              maxLength: ht == 'YYYY' ? 4 : 3,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              onTap: onTap,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              focusNode: n1,
              onChanged: onChanged,
              textAlignVertical: TextAlignVertical.bottom,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              scrollPadding: const EdgeInsets.only(bottom: 150),
              decoration: InputDecoration(
                  counterText: '',
                  contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  hintStyle: TS.f16.copyWith(
                      color: error.isNotEmpty
                          ? AppConfigs.der
                          : ac.isDark
                              ? AppConfigs.g8f
                              : AppConfigs.primaryColor.withOpacity(0.5)),
                  hintText: ht),
              onEditingComplete: onEditingComplete ??
                  () {
                    n2?.requestFocus();
                  },
            ),
          ),
        ),
      );
    });
  }

  return GetBuilder<AccountController>(builder: (ac) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: left, bottom: 5, top: 5),
          alignment: Alignment.centerLeft,
          child: Text(
            (title ?? 'Date_of_Birth'.tr).toUpperCase(),
            style: TS.f14.copyWith(color: ac.isDark ? AppConfigs.g8f : AppConfigs.primaryColor.withOpacity(0.8),fontWeight: FontWeight.w900),
          ),
        ),
        Container(
          key: key,
          height: height,
          margin: EdgeInsets.only(left: left, right: right,bottom: bottom),
          padding: const EdgeInsets.only(left: 10, right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ac.isDark ? AppConfigs.g21 : null,
            border: Border.all(
                color: error.isNotEmpty
                    ? AppConfigs.der
                    : ac.isDark
                        ? AppConfigs.g21
                        : AppConfigs.primaryColor.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              field(
                  c: ctrls[0],
                  n1: nodes[0],
                  n2: nodes[1],
                  previousNode: null,
                  //  ht: 'dd',
                  ht: 'DD',
                  onChanged: (v) {
                    if (v.isEmpty) {
                      nodes[0].requestFocus();
                    } else if (v.length == 2) {
                      // Only move to next field when 2 digits are entered
                      nodes[1].requestFocus();

                      // Check if we can validate the date now
                      if (ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty && ctrls[2].text.length == 4) {
                        validateDate();
                      }
                    } else if (v.length > 2) {
                      String extra = v.substring(2);
                      ctrls[0].text = v.substring(0, 2);
                      ctrls[0].selection = TextSelection.fromPosition(
                        TextPosition(offset: ctrls[0].text.length),
                      );
                      nodes[1].requestFocus();
                      // Move extra digit(s) into next field if exists
                      int currentIndex = ctrls.indexOf(ctrls[0]);
                      if (currentIndex + 1 < ctrls.length) {
                        final nextCtrl = ctrls[currentIndex + 1];
                        nextCtrl.text = extra;
                        nextCtrl.selection = TextSelection.fromPosition(
                          TextPosition(offset: nextCtrl.text.length),
                        );
                        nodes[1].requestFocus();
                      }
                    }
                  },
                  onEditingComplete: () {
                    // Add leading zero only when leaving the field if it's a single digit
                    if (ctrls[0].text.length == 1) {
                      ctrls[0].text = '0${ctrls[0].text}';
                    }

                    nodes[1].requestFocus();

                    // If all fields are filled, try to validate the date
                    if (ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty && ctrls[2].text.length == 4) {
                      validateDate();
                    }
                  }),
              Text(
                '/',
                style: TextStyles.font16.copyWith(color: ConstColors.grey4),
              ),
              field(
                  c: ctrls[1],
                  n1: nodes[1],
                  n2: nodes[2],
                  previousNode: nodes[0],
                  // ht: 'mm',
                  ht: 'MM',
                  onChanged: (v) {
                    if (v.isEmpty) {
                      nodes[0].requestFocus();
                    } else if (v.length == 2) {
                      // Only move to next field when 2 digits are entered
                      nodes[2].requestFocus();

                      // Check if we can validate the date now
                      if (ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty && ctrls[2].text.length == 4) {
                        validateDate();
                      }
                    } else if (v.length > 2) {
                      String extra = v.substring(2);
                      ctrls[1].text = v.substring(0, 2);
                      ctrls[1].selection = TextSelection.fromPosition(
                        TextPosition(offset: ctrls[0].text.length),
                      );
                      nodes[2].requestFocus();
                      // Move extra digit(s) into next field if exists
                      int currentIndex = ctrls.indexOf(ctrls[1]);
                      if (currentIndex + 1 < ctrls.length) {
                        final nextCtrl = ctrls[currentIndex + 1];
                        nextCtrl.text = extra;
                        nextCtrl.selection = TextSelection.fromPosition(
                          TextPosition(offset: nextCtrl.text.length),
                        );
                        nodes[2].requestFocus();
                      }
                    }
                  },
                  onEditingComplete: () {
                    // Add leading zero only when leaving the field if it's a single digit
                    if (ctrls[1].text.length == 1) {
                      ctrls[1].text = '0${ctrls[1].text}';
                    }

                    nodes[2].requestFocus();

                    // If all fields are filled, try to validate the date
                    if (ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty && ctrls[2].text.length == 4) {
                      validateDate();
                    }
                  }),
              Text(
                '/',
                style: TextStyles.font14.copyWith(color: ConstColors.grey4),
              ),
              field(
                  c: ctrls[2],
                  n1: nodes[2],
                  previousNode: nodes[1],
                  //  ht: 'yyyy',
                  ht: 'YYYY',
                  onChanged: (v) {
                    if (v.isEmpty) {
                      nodes[1].requestFocus();
                    } else if (v.length == 4) {
                      // Only validate when year is complete
                      if (ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty) {
                        validateDate();
                      }
                    } else {
                      erfc(true);
                    }
                  },
                  onEditingComplete: () {
                    nodes[2].unfocus();
                    // If all fields are filled, try to validate the date
                    if (ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty) {
                      validateDate();
                    } else {
                      validateDate();
                    }
                  }),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      nodes[ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty ? 2 : 0].requestFocus();
                    },
                    child: Container(
                      height: 40,
                      color: Colors.transparent,
                    )),
              ),
              GestureDetector(
                onTap: () async {
                  DateTime n = DateTime.now();
                  DateTime? selected = await showDatePicker(
                      initialEntryMode: DatePickerEntryMode.calendarOnly,
                      context: context,
                      initialDate: initialDate ?? DateTime(n.year - 18, n.month, n.day),
                      firstDate: firstDate ?? DateTime(1900),
                      lastDate: lastDate ?? DateTime(n.year, n.month, n.day));
                  if (selected != null) {
                    ctrls[0].text = selected.day < 10 ? '0${selected.day}' : '${selected.day}';
                    ctrls[1].text = selected.month < 10 ? '0${selected.month}' : '${selected.month}';
                    ctrls[2].text = '${selected.year}';
                    if (nodes[2].hasFocus) {
                      nodes[2].unfocus();
                    }
                    if (onComplete != null) {
                      erfc(true, date: selected);
                      onComplete();
                    }
                    update();
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    ImagePath.calendar,
                    height: 20,
                    colorFilter: ColorFilter.mode(
                        error.isNotEmpty
                            ? AppConfigs.der
                            : ac.isDark
                                ? AppConfigs.w
                                : AppConfigs.g4,
                        BlendMode.srcIn),
                  ),
                ),
              )
            ],
          ),
        ),
        Visibility(
          visible: error.isNotEmpty,
          child: Container(
            margin: EdgeInsets.only(right: S.p, top: 3, left: S.p),
            alignment: Alignment.centerRight,
            child: Text(error, style: TS.f12.copyWith(color: AppConfigs.der, fontWeight: FontWeight.w600), textAlign: TextAlign.start),
          ),
        )
      ],
    );
  });
}

KeyboardActionsConfig _buildConfig(FocusNode? focusNode) {
  return KeyboardActionsConfig(
    keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
    actions: [
      KeyboardActionsItem(
        focusNode: focusNode ?? FocusNode(),
        toolbarButtons: [
          (node) {
            return GestureDetector(
              onTap: () => node.unfocus(),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Done".tr,
                  style: TS.f12.copyWith(color: AppConfigs.primaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            );
          }
        ],
      ),
    ],
  );
}

// Widget dateField(
//     {required List<TextEditingController> ctrls,
//     required List<FocusNode> nodes,
//     required Function() update,
//     void Function()? onComplete,
//     required void Function(bool, {DateTime? date}) erfc,
//     DateTime? initialDate,
//     DateTime? firstDate,
//     DateTime? lastDate,
//     String error = '',
//     double left = 20,
//     double right = 20,
//     double topMargin = 8,
//     String? title,
//     Color? textColor,
//     Key? key,
//     required context}) {
//   Widget field(
//       {required TextEditingController c,
//       required FocusNode n1,
//       FocusNode? n2,
//       required String ht,
//       void Function()? onEditingComplete,
//       void Function()? onTap,
//       void Function(String)? onChanged}) {
//     return GetBuilder<AccountController>(builder: (_) {
//       return Container(
//         margin: EdgeInsets.only(top: topMargin),
//         width: ht == 'yyyy' ? 50 : 30,
//         height: 30,
//         child: TextField(
//           controller: c,
//           style: TS.f16.copyWith(color: _.isDark ? AppConfigs.w : textColor ?? AppConfigs.g4),
//           maxLength: ht == 'yyyy' ? 4 : 2,
//           textAlign: TextAlign.center,
//           keyboardType: TextInputType.number,
//           onTap: () {
//             // if (onTap != null) {
//             //   onTap();
//             // }
//             if (ht == 'mm' && (int.tryParse(ctrls[0].text) ?? 0) <= 3 && ctrls[0].text.length == 1) {
//               ctrls[0].text = '0${ctrls[0].text}';
//             }
//             if (ht == 'yyyy' && (int.tryParse(ctrls[1].text) ?? 0) < 2 && ctrls[1].text.length == 1) {
//               ctrls[1].text = '0${ctrls[01].text}';
//             }
//             if (ctrls[0].text.length == 2 && ctrls[1].text.isEmpty) {
//               nodes[1].requestFocus();
//             }
//             if (ctrls[1].text.length == 2 && ctrls[2].text.isEmpty) {
//               nodes[2].requestFocus();
//             }
//           },
//           maxLengthEnforcement: MaxLengthEnforcement.enforced,
//           focusNode: n1,
//           onChanged: onChanged,
//           textAlignVertical: TextAlignVertical.bottom,
//           inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//           decoration: InputDecoration(
//               counterText: '',
//               contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 13),
//               border: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               hintStyle: TS.f16.copyWith(
//                   color: error.isNotEmpty
//                       ? AppConfigs.der
//                       : _.isDark
//                           ? AppConfigs.g8f
//                           : AppConfigs.g77),
//               hintText: ht),
//           onEditingComplete: onEditingComplete ??
//               () {
//                 n2?.requestFocus();
//               },
//         ),
//       );
//     });
//   }

//   return GetBuilder<AccountController>(builder: (_) {
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.only(left: left, bottom: 5, top: 5),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             title ?? 'Date_of_Birth'.tr,
//             style: TextStyles.font12.copyWith(color: _.isDark ? AppConfigs.g8f : AppConfigs.g77),
//           ),
//         ),
//         Container(
//           key: key,
//           margin: EdgeInsets.only(left: left, right: right),
//           padding: const EdgeInsets.only(left: 10, right: 15),
//           decoration: BoxDecoration(
//             borderRadius: const BorderRadius.all(Radius.circular(5)),
//             color: _.isDark ? AppConfigs.g21 : null,
//             border: Border.all(
//                 color: error.isNotEmpty
//                     ? AppConfigs.der
//                     : _.isDark
//                         ? AppConfigs.g21
//                         : AppConfigs.gd7),
//           ),
//           child: Row(
//             children: [
//               // field(
//               //     c: ctrls[0],
//               //     n1: nodes[0],
//               //     n2: nodes[1],
//               //     ht: 'dd',
//               //     onChanged: (v) {
//               //       // if (error.isNotEmpty && v.isNotEmpty) {
//               //       //   error = '';
//               //       // }
//               //       if (v.isEmpty) {
//               //         nodes[0].requestFocus();
//               //       } else if (int.parse(v) > 1 || v.length == 2) {
//               //         if (int.parse(v) > 1 && v.length == 1) {
//               //           ctrls[1].text = '0${ctrls[0].text}';
//               //         }
//               //         nodes[1].requestFocus();
//               //       }
//               //       // else if (v.isNotEmpty && (int.parse(v) > 3 || v.length == 2)) {
//               //       //   if (int.parse(v) > 3 && v.length == 1) {
//               //       //     ctrls[0].text = '0${ctrls[0].text}';
//               //       //   }
//               //       //   nodes[1].requestFocus();
//               //       // }
//               //       else if (ctrls[0].text.isNotEmpty == true && ctrls[1].text.isNotEmpty == true && ctrls[2].text.isNotEmpty == true && (v.length == 1 || v.length == 2)) {
//               //         int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//               //         DateTime dt = DateTime(y, m, d);
//               //         if (dt.year == y &&
//               //             dt.month == m &&
//               //             dt.day == d &&
//               //             (lastDate != null ? dt.isBefore(lastDate) : true) &&
//               //             (firstDate != null ? dt.isAfter(firstDate) : true)) {
//               //           if (nodes.length > 3) {
//               //             nodes[1].requestFocus();
//               //           }
//               //           if (onComplete != null) {
//               //             onComplete();
//               //           }
//               //
//               //           erfc(true, date: dt);
//               //         } else {
//               //           erfc(false);
//               //         }
//               //       }
//               //
//               //     },
//               //     onEditingComplete: () {
//               //       int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//               //       DateTime dt = DateTime(y, m, d);
//               //       if (dt.year == y &&
//               //           dt.month == m &&
//               //           dt.day == d &&
//               //           (lastDate != null ? DateTime(y, m, d).isBefore(lastDate) : true) &&
//               //           (firstDate != null ? DateTime(y, m, d).isAfter(firstDate) : true) &&
//               //           onComplete != null) {
//               //         onComplete();
//               //       }
//               //     }),

//               field(
//                   c: ctrls[0],
//                   n1: nodes[0],
//                   n2: nodes[1],
//                   ht: 'dd',
//                   onChanged: (v) {
//                     if (v.isEmpty) {
//                       nodes[0].requestFocus();
//                     } else if (ctrls[0].text.isNotEmpty == true &&
//                         ctrls[1].text.isNotEmpty == true &&
//                         ctrls[2].text.isNotEmpty == true &&
//                         v.length == 2) {
//                       int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//                       DateTime dt = DateTime(y, m, d);
//                       if (dt.year == y &&
//                           dt.month == m &&
//                           dt.day == d &&
//                           (lastDate != null ? dt.isBefore(lastDate) : true) &&
//                           (firstDate != null ? dt.isAfter(firstDate) : true)) {
//                         if (nodes.length > 3) {
//                           nodes[1].requestFocus();
//                         }
//                         if (onComplete != null) {
//                           onComplete();
//                         }

//                         erfc(true, date: dt);
//                       } else {
//                         erfc(false);
//                       }
//                     } else if (int.parse(v) > 1 || v.length == 2) {
//                       if (int.parse(v) > 1 && v.length == 1) {
//                         ctrls[0].text = '0${ctrls[0].text}';
//                       }
//                       nodes[1].requestFocus();
//                     }
//                   },

//                   // onTap: () {
//                   //   if (ctrls[1].text.length == 2) {  // Detect tap after max length
//                   //     if (kDebugMode) {
//                   //       print('Tapped after max length!');
//                   //     }
//                   //     nodes[2].requestFocus();
//                   //   }
//                   // },
//                   onEditingComplete: () {
//                     int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//                     DateTime dt = DateTime(y, m, d);
//                     if (dt.year == y &&
//                         dt.month == m &&
//                         dt.day == d &&
//                         (lastDate != null ? DateTime(y, m, d).isBefore(lastDate) : true) &&
//                         (firstDate != null ? DateTime(y, m, d).isAfter(firstDate) : true) &&
//                         onComplete != null) {
//                       onComplete();
//                     }
//                     if (ctrls[0].text.length == 2) {
//                       nodes[1].requestFocus();
//                     }
//                   }),

//               Text(
//                 '/',
//                 style: TextStyles.font16.copyWith(color: ConstColors.grey4),
//               ),
//               field(
//                   c: ctrls[1],
//                   n1: nodes[1],
//                   n2: nodes[2],
//                   ht: 'mm',
//                   onChanged: (v) {
//                     if (v.isEmpty) {
//                       nodes[0].requestFocus();
//                     } else if (ctrls[0].text.isNotEmpty == true &&
//                         ctrls[1].text.isNotEmpty == true &&
//                         ctrls[2].text.isNotEmpty == true &&
//                         v.length == 2) {
//                       int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//                       DateTime dt = DateTime(y, m, d);
//                       if (dt.year == y &&
//                           dt.month == m &&
//                           dt.day == d &&
//                           (lastDate != null ? dt.isBefore(lastDate) : true) &&
//                           (firstDate != null ? dt.isAfter(firstDate) : true)) {
//                         if (nodes.length > 3) {
//                           nodes[2].requestFocus();
//                         }
//                         if (onComplete != null) {
//                           onComplete();
//                         }

//                         erfc(true, date: dt);
//                       } else {
//                         erfc(false);
//                       }
//                     } else if (int.parse(v) > 1 || v.length == 2) {
//                       if (int.parse(v) > 1 && v.length == 1) {
//                         ctrls[1].text = '0${ctrls[1].text}';
//                       }
//                       nodes[2].requestFocus();
//                     }
//                   },
//                   onEditingComplete: () {
//                     int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//                     DateTime dt = DateTime(y, m, d);
//                     if (dt.year == y &&
//                         dt.month == m &&
//                         dt.day == d &&
//                         (lastDate != null ? DateTime(y, m, d).isBefore(lastDate) : true) &&
//                         (firstDate != null ? DateTime(y, m, d).isAfter(firstDate) : true) &&
//                         onComplete != null) {
//                       onComplete();
//                     }
//                     if (ctrls[1].text.length == 2) {
//                       nodes[2].requestFocus();
//                     }
//                   }),
//               Text(
//                 '/',
//                 style: TextStyles.font14.copyWith(color: ConstColors.grey4),
//               ),
//               field(
//                   c: ctrls[2],
//                   n1: nodes[2],
//                   ht: 'yyyy',
//                   onChanged: (v) {
//                     if (v.isEmpty) {
//                       nodes[1].requestFocus();
//                     } else if (v.length == 4) {
//                       int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//                       DateTime dt = DateTime(y, m, d);
//                       if (dt.year == y &&
//                           dt.month == m &&
//                           dt.day == d &&
//                           (lastDate != null ? dt.isBefore(lastDate) : true) &&
//                           (firstDate != null ? dt.isAfter(firstDate) : true)) {
//                         if (nodes.length > 3) {
//                           nodes[3].requestFocus();
//                         }
//                         if (onComplete != null) {
//                           onComplete();
//                         }

//                         erfc(true, date: dt);
//                       } else {
//                         erfc(false);
//                       }
//                     } else {
//                       erfc(true);
//                     }
//                   },
//                   onEditingComplete: () {
//                     int d = int.parse(ctrls[0].text), m = int.parse(ctrls[1].text), y = int.parse(ctrls[2].text);
//                     DateTime dt = DateTime(y, m, d);
//                     if (dt.year == y &&
//                         dt.month == m &&
//                         dt.day == d &&
//                         (lastDate != null ? DateTime(y, m, d).isBefore(lastDate) : true) &&
//                         (firstDate != null ? DateTime(y, m, d).isAfter(firstDate) : true) &&
//                         onComplete != null) {
//                       onComplete();
//                     }
//                   }),
//               Expanded(
//                 child: GestureDetector(
//                     onTap: () {
//                       nodes[ctrls[0].text.isNotEmpty && ctrls[1].text.isNotEmpty && ctrls[2].text.isNotEmpty ? 2 : 0].requestFocus();
//                     },
//                     child: Container(
//                       height: 40,
//                       color: Colors.transparent,
//                     )),
//               ),
//               GestureDetector(
//                 onTap: () async {
//                   DateTime n = DateTime.now();
//                   DateTime? selected = await showDatePicker(
//                       initialEntryMode: DatePickerEntryMode.calendarOnly,
//                       context: context,
//                       initialDate: initialDate ?? DateTime(n.year - 18, n.month, n.day),
//                       firstDate: firstDate ?? DateTime(1900),
//                       lastDate: lastDate ?? DateTime(n.year, n.month, n.day));
//                   if (selected != null) {
//                     ctrls[0].text = selected.day < 10 ? '0${selected.day}' : '${selected.day}';
//                     ctrls[1].text = selected.month < 10 ? '0${selected.month}' : '${selected.month}';
//                     ctrls[2].text = '${selected.year}';
//                     if (nodes[2].hasFocus) {
//                       nodes[2].unfocus();
//                     }
//                     if (onComplete != null) {
//                       erfc(true, date: selected);
//                       onComplete();
//                     }
//                     update();
//                   }
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: SvgPicture.asset(
//                     ImagePath.calendar,
//                     height: 20,
//                     colorFilter: ColorFilter.mode(
//                         error.isNotEmpty
//                             ? AppConfigs.der
//                             : _.isDark
//                                 ? AppConfigs.w
//                                 : AppConfigs.g4,
//                         BlendMode.srcIn),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//         Visibility(
//           visible: error.isNotEmpty,
//           child: Container(
//             margin: EdgeInsets.only(right: S.p, top: 3, left: S.p),
//             alignment: Alignment.centerRight,
//             child: Text(error, style: TS.f12.copyWith(color: AppConfigs.der, fontWeight: FontWeight.w600), textAlign: TextAlign.start),
//           ),
//         )
//       ],
//     );
//   });
// }
