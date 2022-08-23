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
  final String? id;
  final String name;
  final String type;
  final num coverPrice;
  final List<String> images;
  final String? barcode;
  final int? itemReference;
  final String? grade;
  final String? semester;
  final int? quantity;
  final int year;
  final DateTime createdAt;

  ItemModel(
      {this.id,
      required this.name,
      required this.type,
      required this.coverPrice,
      required this.images,
      required this.barcode,
      this.itemReference,
      required this.grade,
      this.semester,
      this.quantity,
      this.year = 2023,
      required this.createdAt});

  factory ItemModel.fromJson(Map<String, Object?> json) =>
      _$ItemModelFromJson(json);

  Map<String, Object?> toJson() => _$ItemModelToJson(this);
}
