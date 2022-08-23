import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
part 'deposit_model.g.dart';

@Collection<DepositModel>('deposits', name: 'deposits')
final depositsRef = DepositModelCollectionReference();

@JsonSerializable(explicitToJson: true)
class DepositModel {
  final String? id;
  final AccountModel from;
  final AccountModel to;
  final double amount;
  final String note;
  final DateTime createdAt;
  final num? depositReference;
  final DateTime depositDate;
  final String status;

  DepositModel({
    this.id,
    required this.from,
    required this.to,
    required this.amount,
    required this.note,
    required this.createdAt,
    this.depositReference,
    required this.depositDate,
    required this.status,
  });

  factory DepositModel.fromJson(Map<String, Object?> json) =>
      _$DepositModelFromJson(json);

  Map<String, Object?> toJson() => _$DepositModelToJson(this);
}
