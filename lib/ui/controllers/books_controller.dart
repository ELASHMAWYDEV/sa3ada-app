import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sa3ada_app/data/models/selector_model.dart';

class BooksController extends GetxController {
  final TextEditingController searchInputController = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    searchInputController.addListener(() {
      update();
    });
  }

  SelectorModel? selectedStage;
}
