import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sa3ada_app/data/firestore_models/account_model.dart';
part 'transaction_model.g.dart';

@Collection<TransactionModel>('transactions', name: 'transactions')
final transactionsRef = TransactionModelCollectionReference();

enum TransactionType { invoice, deposit, transfer }

enum TransactionStatus { completed, cancelled, pending }

@JsonSerializable(explicitToJson: true)
class TransactionModel {
  final String? id;
  final String type;
  final double totalAmount; //20
  final double creditAmount; //5 -->
  final String status;
  final AccountModel sourceAccount;
  final AccountModel destinationAccount;
  final String? ownerId;

  TransactionModel({
    this.id,
    required this.type,
    required this.totalAmount,
    required this.creditAmount,
    required this.status,
    required this.sourceAccount,
    required this.destinationAccount,
    required this.ownerId,
  });

  factory TransactionModel.fromJson(Map<String, Object?> json) =>
      _$TransactionModelFromJson(json);

  Map<String, Object?> toJson() => _$TransactionModelToJson(this);
}
