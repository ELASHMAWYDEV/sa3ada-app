import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'transaction_model.g.dart';

@Collection<TransactionModel>('transactions', name: 'transactions')
final transactionsRef = TransactionModelCollectionReference();

@JsonSerializable(explicitToJson: true)
class TransactionModel {
  final String ownerId;
  final String type;
  final double activeBalance;
  final double creditBalance;

  TransactionModel({
    required this.ownerId,
    required this.type,
    required this.activeBalance,
    required this.creditBalance,
  });

  factory TransactionModel.fromJson(Map<String, Object?> json) =>
      _$TransactionModelFromJson(json);

  Map<String, Object?> toJson() => _$TransactionModelToJson(this);
}
