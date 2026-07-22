import 'package:flutter/material.dart';
import 'package:mobiremit/core/flavours/app_config.dart';

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
