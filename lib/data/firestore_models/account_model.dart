import 'package:json_annotation/json_annotation.dart';

part 'account_model.g.dart';

@JsonSerializable(explicitToJson: true)
class AccountModel {
  final String ownerId;
  final String type;
  final double activeBalance;
  final double creditBalance;

  AccountModel({
    required this.ownerId,
    required this.type,
    required this.activeBalance,
    required this.creditBalance,
  });

  factory AccountModel.fromJson(Map<String, Object?> json) =>
      _$AccountModelFromJson(json);

  Map<String, Object?> toJson() => _$AccountModelToJson(this);
}
