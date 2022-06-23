import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ExpensesController extends GetxController {
  List<String> fromSelectors = [
    "الخزنة",
    "حساب الشغل",
    "فرع",
  ];
  List<String> toSelectors = [
    "شراكة",
    "بيت محمد",
    "بيت محمود",
    "بيت كريم",
    "بيت مصطفي",
  ];

  Map<String, List<String>> subSelectors = {
    "branches": [
      "مكتبة السعادة",
      "مكتبة العشماوي",
    ],
  };

  String? selectedFrom;
  String? selectedSubFrom;
  String? selectedTo;

  // Input controllers
  TextEditingController amountInputController = TextEditingController();
  TextEditingController noteInputController = TextEditingController();
  TextEditingController receiptNumberInputController = TextEditingController();
}
