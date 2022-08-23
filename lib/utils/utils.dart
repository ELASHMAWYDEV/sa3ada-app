// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';

String numberToString(num number, {bool includeMinimals = false}) {
  final value = NumberFormat(includeMinimals ? "#,##0.00" : "#,##0", "en_US");

  return value.format(number);
}

String getBookFullName(ItemModel item) {
  String grade = "";
  String semester = "";

  switch (item.grade) {
    case "KG1":
      grade = "Kg1";
      break;
    case "KG2":
      grade = "Kg2";
      break;
    case "grade1":
      grade = "١ب";
      break;
    case "grade2":
      grade = "٢ب";
      break;
    case "grade3":
      grade = "٣ب";
      break;
    case "grade4":
      grade = "٤ب";
      break;
    case "grade5":
      grade = "٥ب";
      break;
    case "grade6":
      grade = "٦ب";
      break;
    case "grade7":
      grade = "١ع";
      break;
    case "grade8":
      grade = "٢ع";
      break;
    case "grade9":
      grade = "٣ع";
      break;
    case "grade10":
      grade = "١ث";
      break;
    case "grade11":
      grade = "٢ث";
      break;
    case "grade12":
      grade = "٣ث";
      break;
  }

  switch (item.semester) {
    case "seme1":
      semester = "م١";
      break;
    case "seme2":
      semester = "م٢";
      break;
  }

  return "${item.name} $grade $semester";
}
