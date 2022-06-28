// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountModel _$AccountModelFromJson(Map<String, dynamic> json) => AccountModel(
      ownerId: json['ownerId'] as String,
      type: json['type'] as String,
      activeBalance: (json['activeBalance'] as num).toDouble(),
      creditBalance: (json['creditBalance'] as num).toDouble(),
    );

Map<String, dynamic> _$AccountModelToJson(AccountModel instance) =>
    <String, dynamic>{
      'ownerId': instance.ownerId,
      'type': instance.type,
      'activeBalance': instance.activeBalance,
      'creditBalance': instance.creditBalance,
    };
