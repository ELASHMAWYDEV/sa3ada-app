import 'dart:convert';
import 'package:flutter/material.dart';

class MiniTableModel {
  String title;
  Function(dynamic)? selector;
  Widget? Function(dynamic)? cell;

  MiniTableModel({
    required this.title,
    required this.selector,
    this.cell,
  });

  factory MiniTableModel.fromJson(Map<String, dynamic> parsedJson) {
    return MiniTableModel(
      title: parsedJson['title'],
      selector: parsedJson['selector'],
      cell: parsedJson['cell'],
    );
  }

  static List<MiniTableModel> listFromJson(List<dynamic> list) {
    List<MiniTableModel> rows =
        list.map((i) => MiniTableModel.fromJson(i)).toList();
    return rows;
  }

  static List<MiniTableModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<MiniTableModel>((json) => MiniTableModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'selector': selector,
        'cell': cell,
      };
}
