import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobiremit/core/flavours/app_config.dart';

import '../../core/flavours/constants.dart';

class DocStepper extends StatelessWidget {
  final int step;


  const DocStepper({super.key, this.step = 1});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Divider(),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: step > 1
                          ? AppConfigs.w
                          : step == 1
                          ? AppConfigs.primaryColor
                          : AppConfigs.w,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppConfigs.primaryColor)),
                  child: step > 1
                      ? Icon(Icons.check, color: AppConfigs.primaryColor)
                      : Center(
                      child: Text(
                        "1",
                        style: TextStyle(color: step == 1 ? AppConfigs.w : null, fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: step > 2
                          ? AppConfigs.w
                          : step == 2
                          ? AppConfigs.primaryColor
                          : AppConfigs.w,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: AppConfigs.primaryColor)),
                  child: step > 2
                      ? Icon(Icons.check, color: AppConfigs.primaryColor)
                      : Center(
                      child: Text(
                        "2",
                        style: TextStyle(color: step == 2 ? AppConfigs.w : null, fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: step > 3
                          ? AppConfigs.w
                          : step == 3
                          ? AppConfigs.primaryColor
                          : AppConfigs.w,
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(color: step < 3 ? AppConfigs.b : AppConfigs.primaryColor)),
                  child: step > 3
                      ? Icon(Icons.check, color: AppConfigs.primaryColor)
                      : Center(
                      child: Text(
                        "3",
                        style: TextStyle(color: step == 3 ? AppConfigs.w : null, fontWeight: FontWeight.bold, fontSize: 18),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildStepper(bool isDark,int step) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Identity Doc", style: TS.f10.copyWith(color: AppConfigs.primaryColor, fontWeight: FontWeight.w700)),
            Text("Selfie", style: TS.f10.copyWith(color: isDark ? AppConfigs.g8f : Colors.grey.shade500, fontWeight: FontWeight.w600)),
            Text("Video", style: TS.f10.copyWith(color: isDark ? AppConfigs.g8f : Colors.grey.shade500, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      const SizedBox(height: 12),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 2,
              color: Colors.grey.withOpacity(0.2),
            ),
            Positioned(
              left: 0,
              width: (MediaQuery.of(Get.context!).size.width - 100)/(step>=2?1:2),
              child: Container(height: 2, color: AppConfigs.primaryColor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _stepCircle(step>=1?true:false, step>=1?true:false),
                _stepCircle(step>=2?true:false, step>=2?true:false),
                _stepCircle(step==3?true:false, step==3?true:false),
              ],
            ),

          ],
        ),
      ),
    ],
  );
}

Widget _stepCircle(bool active, bool completed) {
  return Container(
    width: 24,
    height: 24,
    decoration: BoxDecoration(
      color: active ? AppConfigs.primaryColor : Colors.white,
      shape: BoxShape.circle,
      border: Border.all(color: active ? AppConfigs.primaryColor : Colors.grey.withOpacity(0.3), width: 1.5),
    ),
    child: completed ? const Icon(Icons.check, size: 16, color: Colors.white) : null,
  );
}