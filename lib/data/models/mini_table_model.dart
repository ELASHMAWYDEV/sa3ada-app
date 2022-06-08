import 'dart:convert';

class MiniTableModel {
  String title;
  Function(dynamic)? selector;

  MiniTableModel({
    required this.title,
    required this.selector,
  });

  factory MiniTableModel.fromJson(Map<String, dynamic> parsedJson) {
    return MiniTableModel(
      title: parsedJson['title'],
      selector: parsedJson['selector'],
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
      };
}
