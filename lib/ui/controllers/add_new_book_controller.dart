// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/data/models/selector_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';

class AddNewBookController extends GetxController {
  final TextEditingController bookNameInputController = TextEditingController();
  final TextEditingController priceInputController = TextEditingController();

  SelectorModel? selectedSemester;
  SelectorModel? selectedStage;
  SelectorModel? selectedYear;
  String? barcode;

  Future addNewBook() async {
    try {
      // Validation
      if (bookNameInputController.text == "") {
        return AlertPromptBox.showError(error: "يجب كتابة اسم الكتاب");
      }
      if (priceInputController.text == "" || priceInputController.text == "0") {
        return AlertPromptBox.showError(error: "يجب كتابة سعر الكتاب");
      }
      if (barcode == null) {
        return AlertPromptBox.showError(error: "يجب عمل سكان للبار كود أولا");
      }

      // Check if item wasn't added before
      final foundItems = await itemsRef
          .whereBarcode(isEqualTo: barcode)
          .get(GetOptions(source: Source.serverAndCache));

      if (foundItems.docs.isNotEmpty) {
        return AlertPromptBox.showError(error: "هذا الكتاب تم اضافته من قبل");
      }

      final value = await itemsRef.add(ItemModel(
        name: bookNameInputController.text,
        coverPrice: num.parse(priceInputController.text),
        images: [],
        barcode: barcode,
        grade: selectedYear?.value ?? "",
        semester: selectedSemester?.value ?? "",
      ));

      AlertPromptBox.showSuccess(
          message: "تم اضافة كتاب ${bookNameInputController.text} بنجاح",
          onDismiss: () {
            Get.offAndToNamed("/items");
          });

      // Revoke all fields
      bookNameInputController.text = "";
      priceInputController.text = "";
      selectedStage = null;
      selectedYear = null;
      barcode = null;
    } catch (e) {
      AlertPromptBox.showError(error: "$e");
    }
  }
}
