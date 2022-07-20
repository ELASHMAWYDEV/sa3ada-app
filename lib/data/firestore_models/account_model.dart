import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sa3ada_app/data/firestore_models/item_model.dart';
part 'account_model.g.dart';

@Collection<AccountModel>('accounts', name: 'accounts')
@Collection<ItemModel>('accounts/*/items', name: 'accountItems')
final accountsRef = AccountModelCollectionReference();

enum AccountTypes {
  trader,
  branch,
  store,
  safe,
  bankAccount,
  sa3adaAccount,
  client,
  customer
}

@JsonSerializable(explicitToJson: true)
class AccountModel {
  final String? id;
  final String name;
  final String type;
  final double activeBalance;
  final double creditBalance;

  AccountModel({
    this.id,
    required this.name,
    required this.type,
    required this.activeBalance,
    required this.creditBalance,
  });

  factory AccountModel.fromJson(Map<String, Object?> json) =>
      _$AccountModelFromJson(json);

  Map<String, Object?> toJson() => _$AccountModelToJson(this);
}
