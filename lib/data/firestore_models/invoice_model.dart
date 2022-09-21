import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
part 'invoice_model.g.dart';

@Collection<InvoiceModel>('invoices', name: 'invoices')
@Collection<ItemModel>('invoices/*/items', name: 'items')
final invoicesRef = InvoiceModelCollectionReference();
const invoiceItemsRef = ItemModelCollectionReference;

enum InvoiceStatuses { cancelled, completed, pending }

@JsonSerializable(explicitToJson: true)
class InvoiceModel {
  final String? id;
  final AccountModel from;
  final AccountModel to;
  final double total;
  final double discountPercentage;
  final double subTotal;
  final double paidAmount;
  final double? commissionPercentage;
  final List<ItemModel>? items;
  final DateTime createdAt;
  final num? invoiceReference;
  final InvoiceCreatorModel invoiceCreator;
  final DateTime invoiceDate;
  final String? status;
  final String? cancellationReason;

  InvoiceModel({
    this.id,
    required this.from,
    required this.to,
    required this.total,
    required this.discountPercentage,
    required this.subTotal,
    required this.paidAmount,
    this.commissionPercentage,
    this.items,
    required this.createdAt,
    this.invoiceReference,
    required this.invoiceCreator,
    required this.invoiceDate,
    required this.status,
    this.cancellationReason,
  });

  factory InvoiceModel.fromJson(Map<String, Object?> json) =>
      _$InvoiceModelFromJson(json);

  Map<String, Object?> toJson() => _$InvoiceModelToJson(this);
}

class InvoiceCreatorModel {
  final String id;
  final String name;

  InvoiceCreatorModel({required this.id, required this.name});

  factory InvoiceCreatorModel.fromJson(Map<String, dynamic> parsedJson) {
    return InvoiceCreatorModel(
      id: parsedJson['id'],
      name: parsedJson['name'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };
}
