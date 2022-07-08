import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BooksController extends GetxController {
  final TextEditingController searchInputController = TextEditingController();

  final List<String> yearsSelectors = ["ابتدائى", "اعدادى", "ثانوى"];

  String? selectedYear;
}
