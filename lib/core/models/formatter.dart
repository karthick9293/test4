import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CaseFormatting extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(text: newValue.text, selection: newValue.selection);
  }
}

class DateFormatter {
  static Map<int, String> months = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'June',
    7: 'July',
    8: 'Aug',
    9: 'Sept',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };

  static DateTime revert(int s) {
    return DateTime.utc(
      int.parse(s.toString().substring(0, 4)),
      int.parse(s.toString().substring(4, 6)),
      int.parse(s.toString().substring(6, 8)),
    );
  }

  static String padZero(int i) {
    return i < 10 ? '0$i' : '$i';
  }

  static String ddmmmmyyyy(DateTime? d) {
    return d != null ? '${d.day} ${months[d.month]},${d.year}' : '-';
  }

  static String format(DateTime? d, String format) {
    return d != null
        ? {
            'dd/MMM/yyyy':
                '${padZero(d.day)}/${months[d.month]}/${d.year} ${padZero(d.hour)}:${padZero(d.minute)}',
            'dd/MM/yyyy hh:mm':
                '${padZero(d.day)}/${months[d.month]}/${d.year} ${padZero(d.hour)}:${padZero(d.minute)}',
            'dd/mm/yyyy':
                '${padZero(d.toLocal().day)}/${padZero(d.toLocal().month)}/${d.toLocal().year}',
            'dd/mm/yyyy hh:mm':
                '${padZero(d.toLocal().day)}/${padZero(d.toLocal().month)}/${d.toLocal().year} ${d.toLocal().hour}:${d.toLocal().minute}',
            'yyyymmdd':
                '${d.toLocal().year}${padZero(d.toLocal().month)}${padZero(d.toLocal().day)}'
          }[format]!
        : '';
  }

  static String newFormat(DateTime? d, String format) {
    if (d != null) {
      var myDateFormat = DateFormat(format);
      var outputDate = myDateFormat.format(d);
      return outputDate;
    } else {
      return '';
    }
  }

// static String newFormat(DateTime? d, String format) {
//   if (d != null) {
//     var myDateFormat = DateFormat('dd/MMM/yyyy hh:mm aaa');
//     var outputDate = myDateFormat.format(d);
//     return outputDate;
//   } else {
//     return '';
//   }
// }
}

extension NumOptionalFixed on num {
  String toStringWithOptionalFixed(int? fractionDigits) {
    return fractionDigits == null
        ? toString()
        : toStringAsFixed(fractionDigits);
  }
}
