// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/utils/services/firebase.dart';

class ExpensesController extends GetxController {
  @override
  void onInit() async {
    super.onInit();

    await createExpensesAccountsIfNotExist();
  }

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

  Future<void> createExpensesTransaction() async {
    // final ref = await transactionsRef.add(TransactionModel(
    //   ownerId: "testOwnerId",
    //   type: TransactionType.expenses,
    //   // sourceAccountId 1.2,
    //   // destinationAccountId: 3,
    // ));

    // print(ref);
  }

  Future<void> createExpensesAccountsIfNotExist() async {
    try {
      final accounts = await accountsRef
          .whereType(isEqualTo: AccountTypes.safe.toString())
          .get(GetOptions(source: Source.serverAndCache));
      accounts.docs.forEach((AccountModelQueryDocumentSnapshot snapshot) =>
          print(snapshot.data.toString()));

      print('done');
    } catch (e) {
      AlertPromptBox.showError(error: "$e");
    }
  }
}
