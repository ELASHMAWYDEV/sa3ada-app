import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TransferDepositController extends GetxController {
  List<String> fromSelectors = [
    "الخزنة",
    "حساب الشغل",
    "فرع",
    "تاجر",
  ];
  List<String> toSelectors = [
    "الخزنة",
    "حساب الشغل",
    "فرع",
    "تاجر",
  ];

  Map<String, List<String>> subSelectors = {
    "branches": [
      "مكتبة السعادة",
      "مكتبة العشماوي",
    ],
    "traders": [
      "الطلبة",
      "الدولية",
      "عيسي",
      "العزيزية",
    ]
  };

  String? selectedFrom;
  String? selectedSubFrom;
  String? selectedTo;
  String? selectedSubTo;

  // Input controllers
  TextEditingController amountInputController = TextEditingController();
  TextEditingController noteInputController = TextEditingController();
  TextEditingController receiptNumberInputController = TextEditingController();
}
