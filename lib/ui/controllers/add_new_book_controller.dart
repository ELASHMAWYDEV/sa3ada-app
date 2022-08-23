// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
import 'package:sa3ada_app/data/models/selector_model.dart';
import 'package:sa3ada_app/ui/components/alert_prompt_box.dart';
import 'package:sa3ada_app/utils/utils.dart';

class AddNewBookController extends GetxController {
  final TextEditingController bookNameInputController = TextEditingController();
  final TextEditingController priceInputController = TextEditingController();

  SelectorModel? selectedSemester;
  SelectorModel? selectedStage;
  SelectorModel? selectedYear;
  String? barcode;
  String withBarcodeOrNot = "withBarcode";

  Future addNewBook() async {
    try {
      // Validation
      if (bookNameInputController.text == "") {
        return AlertPromptBox.showError(error: "يجب كتابة اسم الكتاب");
      }
      if (priceInputController.text == "" || priceInputController.text == "0") {
        return AlertPromptBox.showError(error: "يجب كتابة سعر الكتاب");
      }
      if (withBarcodeOrNot == "withBarcode" && barcode == null) {
        return AlertPromptBox.showError(error: "يجب قراءة الباركود أولا");
      }

      // Check if item wasn't added before
      var foundItems = await itemsRef
          .whereBarcode(isEqualTo: barcode ?? "")
          .get(GetOptions(source: Source.serverAndCache));

      print(barcode);
      if (foundItems.docs.isNotEmpty) {
        return AlertPromptBox.showError(error: "هذا الكتاب تم اضافته من قبل");
      }

      // Check if item already existed with same name & grade & year & semester
      foundItems = await itemsRef
          .whereGrade(isEqualTo: selectedYear?.value)
          .whereName(isEqualTo: bookNameInputController.text)
          .whereYear(isEqualTo: 2023)
          .whereSemester(
              isEqualTo: selectedYear?.value == "grade12"
                  ? null
                  : selectedSemester?.value ?? "")
          .get(GetOptions(source: Source.serverAndCache));

      print(foundItems.docs.length);
      if (foundItems.docs.isNotEmpty) {
        return AlertPromptBox.showError(error: "هذا الكتاب تم اضافته من قبل");
      }

      final value = await itemsRef.add(ItemModel(
          name: bookNameInputController.text.trim(),
          type: "book",
          coverPrice: num.parse(priceInputController.text),
          images: [],
          barcode: barcode,
          grade: selectedYear?.value ?? "",
          semester: selectedYear?.value == "grade12"
              ? null
              : selectedSemester?.value ?? "",
          createdAt: DateTime.now()));

      final createdItem = await value.get();
      AlertPromptBox.showSuccess(
          message: "تم اضافة كتاب ${getBookFullName(createdItem.data!)} بنجاح",
          onDismiss: () {
            Get.back();
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
