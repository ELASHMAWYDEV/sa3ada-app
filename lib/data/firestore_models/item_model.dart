import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'item_model.g.dart';

@Collection<ItemModel>('items', name: 'items')
final itemsRef = ItemModelCollectionReference();

enum ItemType {
  book,
  tools,
}

enum Years {
  grade1,
  grade2,
  grade3,
  grade4,
  grade5,
  grade6,
  grade7,
  grade8,
  grade9,
  grade10,
  grade11,
  grade12,
}

@JsonSerializable(explicitToJson: true)
class ItemModel {
  final String name;
  final num coverPrice;
  final List<String> images;
  final String? barcode;
  final int? customCode;
  final String? grade;
  final String? semester;

  ItemModel({
    required this.name,
    required this.coverPrice,
    required this.images,
    required this.barcode,
    this.customCode,
    required this.grade,
    required this.semester,
  });

  factory ItemModel.fromJson(Map<String, Object?> json) =>
      _$ItemModelFromJson(json);

  Map<String, Object?> toJson() => _$ItemModelToJson(this);
}
