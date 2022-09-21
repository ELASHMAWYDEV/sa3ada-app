import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
import 'package:sa3ada_app/data/models/selector_model.dart';

class TransferDepositController extends GetxController {
  final List<Map<SelectorModel, List<SelectorModel>>> selectors = [
    {
      SelectorModel(label: "فرع", value: "branch"): [
        SelectorModel(label: "حساب الشغل", value: "bankAccount"),
        SelectorModel(label: "فرع", value: "branch"),
        SelectorModel(label: "تاجر", value: "trader"),
        SelectorModel(label: "عميل", value: "client"),
      ]
    },
    {
      SelectorModel(label: "حساب الشغل", value: "bankAccount"): [
        SelectorModel(label: "فرع", value: "branch"),
        SelectorModel(label: "تاجر", value: "trader"),
      ]
    },
    {
      SelectorModel(label: "عميل", value: "client"): [
        SelectorModel(label: "فرع", value: "branch"),
      ]
    }
  ];

  SelectorModel? selectedFrom;
  AccountModel? selectedSubFrom;
  SelectorModel? selectedTo;
  AccountModel? selectedSubTo;

  // Input controllers
  TextEditingController amountInputController = TextEditingController();
  TextEditingController noteInputController = TextEditingController();
  TextEditingController receiptNumberInputController = TextEditingController();

  DateTime? depositDate;

  @override
  void onInit() async {
    // Check if the bankAccount exists
    final accounts =
        await accountsRef.whereType(isEqualTo: "bankAccount").get();
    if (accounts.docs.isEmpty) {
      // Create the account
      accountsRef.add(AccountModel(
          name: "حساب الشغل",
          type: "bankAccount",
          totalBalance: 0,
          creditBalance: 0));
    }
    super.onInit();
  }
}
