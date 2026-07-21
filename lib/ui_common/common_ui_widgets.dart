import 'package:flutter/material.dart';
import '../models/application_settings/settings_fz.dart';
import '../core/flavours/constants.dart';
import '../core/exports/ui_one_custom_widgets.dart' as u1;
import '../core/exports/ui_two_custom_widgets.dart' as u2;
import '../core/exports/ui_three_custom_widgets.dart' as u3;
import '../core/exports/ui_four_custom_widgets.dart' as u4;
import '../core/exports/ui_five_custom_widgets.dart' as u5;
import '../core/exports/ui_six_custom_widgets.dart' as u6;
import '../core/exports/ui_seven_custom_widgets.dart' as u7;

class CommonUI {
  static PreferredSizeWidget appBar0(String title,
      {bool? disableBack, void Function()? onTap2, Widget? action}) {
    return Box3.primaryUI.when(
      uiOne: () => u1.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
      uiTwo: () => u2.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
      uiThree: () => u3.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
      uiFour: () => u4.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
      uiFive: () => u5.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
      uiSix: () => u6.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
      uiSeven: () => u7.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
      defaultUI: () => u1.appBar0(title,
          disableBack: disableBack, onTap2: onTap2, action: action),
    );
  }

  static Widget loader() {
    return Box3.primaryUI.when(
      uiOne: () => u1.loader(),
      uiTwo: () => u2.loader(),
      uiThree: () => u3.loader(),
      uiFour: () => u4.loader(),
      uiFive: () => u5.loader(),
      uiSix: () => u6.loader(),
      uiSeven: () => u7.loader(),
      defaultUI: () => u1.loader(),
    );
  }
}
