import 'dart:convert';

class SelectorModel {
  String label;
  String value;

  SelectorModel({
    required this.label,
    required this.value,
  });

  factory SelectorModel.fromJson(Map<String, dynamic> parsedJson) {
    return SelectorModel(
      label: parsedJson['label'],
      value: parsedJson['value'],
    );
  }

  static List<SelectorModel> listFromJson(List<dynamic> list) {
    List<SelectorModel> rows =
        list.map((i) => SelectorModel.fromJson(i)).toList();
    return rows;
  }

  static List<SelectorModel> listFromString(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed
        .map<SelectorModel>((json) => SelectorModel.fromJson(json))
        .toList();
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'value': value,
      };
}
