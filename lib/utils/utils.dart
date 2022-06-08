// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

String numberToString(num number, {bool includeMinimals = false}) {
  final value = NumberFormat(includeMinimals ? "#,##0.00" : "#,##0", "en_US");

  return value.format(number);
}
