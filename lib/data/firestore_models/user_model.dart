import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'user_model.g.dart';

@Collection<UserModel>('users', name: 'users')
final usersRef = UserModelCollectionReference();

enum UserTypes { superAdmin, user }

enum UserPermissions { expenses }

@JsonSerializable(explicitToJson: true)
class UserModel {
  final String authUserId;
  final String name;
  final String username;
  final String? type;
  final List<String> permissions;

  UserModel({
    required this.authUserId,
    required this.name,
    required this.username,
    required this.type,
    required this.permissions,
  });

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);

  Map<String, Object?> toJson() => _$UserModelToJson(this);
}
