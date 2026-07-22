import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:mobiremit/core/exports/ui_one_custom_widgets.dart';
import 'package:mobiremit/core/flavours/app_config.dart';

class DayPicker extends StatefulWidget {
  final int? selectedDay;
  final DateTime currentDate;
  final Function(int) onSelected;

  DayPicker({
    super.key,
    this.selectedDay,
    DateTime? currentDate,
    required this.onSelected,
  }) : currentDate = currentDate ?? DateTime.now();

  @override
  State<DayPicker> createState() => _DayPickerState();
}

class _DayPickerState extends State<DayPicker> {
  int? selectedDay;
  late int currentMonth;
  late int currentYear;
  late int daysInMonth;

  @override
  void initState() {
    super.initState();
    selectedDay = widget.selectedDay;
    currentMonth = widget.currentDate.month;
    currentYear = widget.currentDate.year;
    daysInMonth = DateTime(currentYear, currentMonth + 1, 0).day;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Day'.tr),
      content: SizedBox(
        width: double.maxFinite,
        height: 200,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            childAspectRatio: 1,
            crossAxisSpacing: 4,
            mainAxisSpacing: 4,
          ),
          itemCount: daysInMonth,
          itemBuilder: (context, index) {
            final day = index + 1;
            final isSelected = day == selectedDay;

            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedDay = day;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isSelected ? AppConfigs.primaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: isSelected ? AppConfigs.primaryColor : Colors.grey.shade300,
                  ),
                ),
                child: Center(
                  child: Text(
                    day.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      actions: [
        roundButton('Cancel'.tr, width: 100, isCancelButton: true, borderOnly: true, noMar: true),
        roundButton(
          'Select'.tr,
          width: 100,
          noMar: true,
          onTap: selectedDay != null
              ? () {
                  widget.onSelected(selectedDay!);
                  Navigator.of(context).pop();
                }
              : null,
        ),
      ],
    );
  }
}
