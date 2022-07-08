import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'transaction_model.g.dart';

@Collection<TransactionModel>('transactions', name: 'transactions')
final transactionsRef = TransactionModelCollectionReference();

enum TransactionType { invoice, expenses, transfer }

enum TransactionStatus { completed, canceled }

@JsonSerializable(explicitToJson: true)
class TransactionModel {
  final String ownerId;
  final TransactionType type;
  final double amount;
  final TransactionStatus status;
  final String sourceAccountId;
  final String destinationAccountId;
  final bool? isDeleted;

  TransactionModel(
      {required this.ownerId,
      required this.type,
      required this.amount,
      required this.status,
      required this.sourceAccountId,
      required this.destinationAccountId,
      this.isDeleted});

  factory TransactionModel.fromJson(Map<String, Object?> json) =>
      _$TransactionModelFromJson(json);

  Map<String, Object?> toJson() => _$TransactionModelToJson(this);
}
